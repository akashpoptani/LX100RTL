{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}

module ColumnOffsetDecoderBaseline where

import Clash.Prelude
import Clash.Explicit.Testbench

-- | Convert 7-bit column offset to 128-bit one-hot vector (Left Shift Operation)
decodeOffset :: Unsigned 7 -> BitVector 128
decodeOffset off = shiftL (1 :: BitVector 128) (fromIntegral off)

-- | Combinational top-level entity
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System (Unsigned 7)
  -> Signal System (BitVector 128)
topEntity clk rst en inputSig = exposeClockResetEnable decoder clk rst en inputSig
  where
    decoder = fmap decodeOffset

{-# CLASH_OPAQUE topEntity #-}

-- | Simple testbench for verification
testBench :: Signal System Bool
testBench = done
  where
    testInput      = stimuliGenerator clk rst $(listToVecTH [0 :: Unsigned 7, 1, 2, 3])
    expectedOutput = outputVerifier' clk rst $(listToVecTH
                        [ 0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 :: BitVector 128
                        , 0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010
                        , 0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100
                        , 0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000 ])
    done           = expectedOutput (topEntity clk rst (enableGen) testInput)
    clk            = tbSystemClockGen (not <$> done)
    rst            = systemResetGen
