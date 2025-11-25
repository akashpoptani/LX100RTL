{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}

module ColumnOffsetDecoderFrequency where

import Clash.Prelude
import Clash.Explicit.Testbench

-- | Stage1 state type (holds 16-bit one-hot from lower bits)
type Stage1Reg = BitVector 16

-- | Mealy function for the pipeline
decodeOffsetT :: Stage1Reg -> Unsigned 7 -> (Stage1Reg, BitVector 128)
decodeOffsetT stage1_reg inp = (stage1_next, stage2)
  where
    -- Split input
    hiBitsBV = slice d6 d4 inp
    loBitsBV = slice d3 d0 inp

    hiBits :: Int
    hiBits = fromIntegral (bitCoerce hiBitsBV :: Unsigned 3)

    loBits :: Int
    loBits = fromIntegral (bitCoerce loBitsBV :: Unsigned 4)

    -- Stage1: lower 4-bit decoder → 16-bit one-hot
    stage1_next :: BitVector 16
    stage1_next = shiftL 1 loBits

    -- Stage2: shift block by upper bits
    stage2 :: BitVector 128
    stage2 = shiftL (resize stage1_reg) (hiBits * 16)

-- | Pipeline wrapper
decodeOffset :: HiddenClockResetEnable dom
             => Signal dom (Unsigned 7)
             -> Signal dom (BitVector 128)
decodeOffset = mealy decodeOffsetT 0

-- | Top-level entity
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System (Unsigned 7)
  -> Signal System (BitVector 128)
topEntity clk rst en inputSig = exposeClockResetEnable decodeOffset clk rst en inputSig

{-# CLASH_OPAQUE topEntity #-}

-- | Simple testbench
testBench :: Signal System Bool
testBench = done
  where
    testInput      = stimuliGenerator clk rst $(listToVecTH [0 :: Unsigned 7, 1, 2, 3])
    expectedOutput = outputVerifier' clk rst $(listToVecTH
                        [ 0 :: BitVector 128
                        , 0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 :: BitVector 128
                        , 0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010
                        , 0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100
                        , 0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000 ])
    done           = expectedOutput (topEntity clk rst (enableGen) testInput)
    clk            = tbSystemClockGen (not <$> done)
    rst            = systemResetGen
