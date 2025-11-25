{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE NumericUnderscores #-}

module RequestGenerator where

-- Clash imports
import Clash.Prelude
import Clash.Explicit.Testbench (tbSystemClockGen)

-- | Sizes used
type FirstPtrEntries = 32
type FirstPtrAddrWidth = 5    -- log2(32) = 5
type FirstPtrDataWidth = 11   -- 11-bit pointer stored per entry

-- | Address structure (34 bits total)
-- [33:18] RO (16)
-- [17:16] BA (2)
-- [15:14] BG (2)
-- [13:7]  CO (7)
-- [6]     CH (1)
-- [5:0]   offset (6)
type Addr34 = BitVector 34
type ROField = Unsigned 16
type BAField = Unsigned 2
type BGField = Unsigned 2
type CHField = Bit

-- | Request output bundle
data MemReq = MemReq
  { memValid :: Bool
  , memAddr  :: Addr34
  } deriving (Generic, Show, Eq, NFDataX)

-- | Top-level Request Generator (clocked)
-- Inputs:
--   ro,bg,ba,ch  : fields that would be fed to LinkedListTable (kept as inputs for completeness)
--   linkedV      : LinkedListTable valid bit for the current ptrEntry
--   linkedNxt    : LinkedListTable next pointer (11 bits)
--   linkedNewAdr : LinkedListTable produced address (34 bits) to be sent to memory when linkedV==1
--
-- Outputs:
--   (ptrEntryOut) : the value read from FirstPointerTable at the current index (for debug/monitoring)
--   MemReq        : (valid, addr) pair; valid indicates a request to memory in this cycle
--
-- NOTE: blockRamPow2 has synchronous read semantics. The 'ptrEntryOut' reflects the RAM read
--       according to the RAM's read latency. Make sure external LinkedListTable signals are
--       aligned with the SRAM read latency in your system-level wiring.
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System ROField
  -> Signal System BGField
  -> Signal System BAField
  -> Signal System CHField
  -> Signal System Bool
  -> Signal System (BitVector FirstPtrDataWidth)
  -> Signal System Addr34
  -> ( Signal System (BitVector FirstPtrDataWidth)
     , Signal System MemReq
     )
topEntity clk rst en _ro _bg _ba _ch linkedV linkedNxt linkedNewAdr =
    withClockResetEnable clk rst en $ do
        -- free-running 5-bit index
        let idx :: Signal System (Unsigned FirstPtrAddrWidth)
            idx = register 0 (idx + 1)

        -- initial memory
        let initMem :: Vec FirstPtrEntries (BitVector FirstPtrDataWidth)
            initMem = replicate d32 0

        -- write port
        let writePort :: Signal System (Maybe (Unsigned FirstPtrAddrWidth, BitVector FirstPtrDataWidth))
            writePort = liftA2 (\v nd -> if v then Nothing else Just nd) linkedV (bundle (idx, linkedNxt))

        -- read from RAM
        let ptrEntryOut :: Signal System (BitVector FirstPtrDataWidth)
            ptrEntryOut = blockRamPow2 initMem idx writePort

        -- mem request
        let memReqSignal :: Signal System MemReq
            memReqSignal = liftA2 MemReq linkedV linkedNewAdr

        (ptrEntryOut, memReqSignal)

-- Keep topEntity marked opaque for Clash as before if needed
{-# CLASH_OPAQUE topEntity #-}

