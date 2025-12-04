{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE ScopedTypeVariables #-}

module RequestGenerator3 where

import Clash.Prelude

-- | Sizes used
type FirstPtrEntries = 32
type FirstPtrAddrWidth = 5     -- log2(32) = 5
type FirstPtrDataWidth = 11    -- 11-bit pointer stored per entry
type FirstPtrMem = Vec FirstPtrEntries (BitVector FirstPtrDataWidth)

-- | Address structure (34 bits total)
type Addr34 = BitVector 34
type ROField = Unsigned 16
type BAField = Unsigned 2
type BGField = Unsigned 2
type CHField = Bit

-- | Request output bundle
newtype MemReq = MemReq (Bool, Addr34) deriving (Generic, NFDataX)

-- | Top-level Request Generator (Combinational Logic)
-- Assumes all inputs are synchronized and memory contents are available combinatorially.
topEntity
  :: Signal System FirstPtrMem    -- ^ Current contents of Table 0 (SRAM)
  -> Signal System FirstPtrMem    -- ^ Current contents of Table 1 (SRAM)
  -> Signal System (Unsigned 1)   -- ^ tableSel (Output of a previous register)
  -> Signal System (Unsigned FirstPtrAddrWidth) -- ^ idx0 (Current index for Table 0)
  -> Signal System (Unsigned FirstPtrAddrWidth) -- ^ idx1 (Current index for Table 1)
  -> Signal System Bool            -- ^ linkedV (LinkedListTable valid bit)
  -> Signal System Addr34          -- ^ linkedNewAdr (LinkedListTable produced address)
  -> ( Signal System (BitVector FirstPtrDataWidth) -- ^ ptrEntryOut (Read data)
     , Signal System MemReq
     )
topEntity mem0 mem1 tableSel idx0 idx1 linkedV linkedNewAdr = (ptrEntryOut, memReqSignal)
  where
    -- Read ports (Combinational read from the memory signals)
    -- **FIX: Use liftA2 with the Vec indexing operator (!!)**
    ptrEntry0 = liftA2 (!!) mem0 idx0
    ptrEntry1 = liftA2 (!!) mem1 idx1

    -- Choose output according to tableSel
    ptrEntryOut = mux (tableSel .==. 0) ptrEntry0 ptrEntry1

    -- Memory request (Combinational logic)
    memReqSignal = liftA2 (\v addr -> MemReq (v, addr)) linkedV linkedNewAdr

{-# CLASH_OPAQUE topEntity #-}