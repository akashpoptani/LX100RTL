{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}

module RequestGenerator2 where

import Clash.Prelude
import Clash.Explicit.Testbench (tbSystemClockGen)

-- Sizes (Defined as type-level Nats)
type FirstPtrEntries = 32
type FirstPtrAddrWidth = 5     -- log2(32) = 5
type FirstPtrDataWidth = 11    -- 11-bit pointer stored per entry

-- Value-level Constant
firstPtrEntries :: Int
firstPtrEntries = 32

-- 34-bit address structure
type Addr34 = BitVector 34
type ROField = Unsigned 16
type BAField = Unsigned 2
type BGField = Unsigned 2
type CHField = Bit

-- **Change MemReq from a type alias to a newtype declaration**
newtype MemReq = MemReq (Bool, Addr34) deriving (Generic, NFDataX)

-- | Two-table Request Generator
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System ROField
  -> Signal System BGField
  -> Signal System BAField
  -> Signal System CHField
  -> Signal System Bool            -- linkedV (write enable)
  -> Signal System (BitVector FirstPtrDataWidth) -- linkedNxt (write data)
  -> Signal System Addr34          -- linkedNewAdr
  -> ( Signal System (BitVector FirstPtrDataWidth)
     , Signal System MemReq
     )
topEntity clk rst en _ro _bg _ba _ch linkedV linkedNxt linkedNewAdr =
  withClockResetEnable clk rst en $ (do
    -- All intermediate signals defined here using one 'let' block for mutual recursion

    let
      -- free-running indices for both tables
      idx0 = register 0 (idx0 + 1)
      idx1 = register 0 (idx1 + 1)

      -- Table selector definitions
      maxIndex = pure (fromIntegral (firstPtrEntries - 1) :: Unsigned FirstPtrAddrWidth)

      -- tableNext uses tableSel
      tableNext = mux (idx0 .==. maxIndex) 1 $
                  mux (idx1 .==. maxIndex) 0 tableSel

      -- tableSel uses tableNext
      tableSel :: Signal System (Unsigned 1)
      tableSel = register 0 tableNext

    -- initial memories
    let initMem0 = replicate d32 0 :: Vec FirstPtrEntries (BitVector FirstPtrDataWidth)
    let initMem1 = replicate d32 0 :: Vec FirstPtrEntries (BitVector FirstPtrDataWidth)

    -- Write enable signals
    let writeEn0 :: Signal System Bool
        writeEn0 = linkedV .&&. (tableSel .==. 0)

    let writeEn1 :: Signal System Bool
        writeEn1 = linkedV .&&. (tableSel .==. 1)

    -- Write ports
    let writePort0 = liftA2 (\en (addr, val) -> if en then Just (addr, val) else Nothing)
                          writeEn0
                          (bundle (idx0, linkedNxt))

    let writePort1 = liftA2 (\en (addr, val) -> if en then Just (addr, val) else Nothing)
                          writeEn1
                          (bundle (idx1, linkedNxt))

    -- RAM reads
    let ptrEntry0 = blockRamPow2 initMem0 idx0 writePort0
    let ptrEntry1 = blockRamPow2 initMem1 idx1 writePort1

    -- choose output according to tableSel
    let ptrEntryOut = mux (tableSel .==. 0) ptrEntry0 ptrEntry1

    -- memory request
    let memReqSignal = liftA2 (\v addr -> MemReq (v, addr)) linkedV linkedNewAdr

    -- **FIX: Return the expression directly instead of using 'return' inside the do block**
    (ptrEntryOut, memReqSignal)
  )

{-# CLASH_OPAQUE topEntity #-}