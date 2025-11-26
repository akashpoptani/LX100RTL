{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NumericUnderscores #-}

module ColumnEncoder where

import Clash.Prelude

type HotVector128 = BitVector 128
type COField = BitVector 7  -- output index

-- | Convert BitVector 128 to Vec 128 Bit
bvToVec :: BitVector 128 -> Vec 128 Bit
bvToVec = bitCoerce

-- | Priority encoder (first set bit, LSB=0)
priorityEncode :: HotVector128 -> COField
priorityEncode bv = fromIntegral idx
  where
    v = bvToVec bv
    idx = case findIndex (\b -> b == high) v of
            Just i  -> i
            Nothing -> 0  -- default if no bits set

-- | TopEntity for Clash
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System HotVector128
  -> Signal System COField
topEntity clk rst en hotVec = withClockResetEnable clk rst en $
    fmap priorityEncode hotVec