{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}

module ColumnOffsetDecoderArea where

import Clash.Prelude
import Clash.Explicit.Testbench

-- | Convert 7-bit column offset to 128-bit one-hot vector
decodeOffset :: Unsigned 7 -> BitVector 128
decodeOffset off = bitCoerce (reverse blocksVec)
  where
    hiBits :: Index 8
    loBits :: Int
    hiBits = fromIntegral $ slice d6 d4 off
    loBits = fromIntegral $ slice d3 d0 off

    oneHotVec :: Vec 16 Bit
    oneHotVec = bitCoerce (shiftL (1 :: BitVector 16) loBits)

    blocksVec :: Vec 8 (Vec 16 Bit)
    blocksVec = replace hiBits oneHotVec (replicate d8 (replicate d16 0))

-- | Top-level combinational entity
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System (Unsigned 7)
  -> Signal System (BitVector 128)
topEntity clk rst en inputSig = exposeClockResetEnable (fmap decodeOffset inputSig) clk rst en

{-# CLASH_OPAQUE topEntity #-}

-- | Simple testbench
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
