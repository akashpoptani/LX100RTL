{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NumericUnderscores #-}

module HotVectorOr where

import Clash.Prelude

-- | Type alias for 128-bit hotvector
type HotVector128 = BitVector 128

-- | OR two hotvectors
orHotVectors :: HotVector128 -> HotVector128 -> HotVector128
orHotVectors old new = old .|. new

-- | TopEntity for Clash
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System HotVector128  -- ^ old hotvector
  -> Signal System HotVector128  -- ^ new hotvector
  -> Signal System HotVector128  -- ^ output (OR)
topEntity clk rst en old new = withClockResetEnable clk rst en $
    liftA2 orHotVectors old new
