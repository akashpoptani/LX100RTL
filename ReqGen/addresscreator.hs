{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE NumericUnderscores #-}

module AddrGeneratorTop where

import Clash.Prelude
import Control.Applicative (liftA2)

-- Type aliases
type Addr34 = BitVector 34
type ROField = Unsigned 16
type BAField = Unsigned 2
type BGField = Unsigned 2
type COField = BitVector 7
type CHField = BitVector 1
type OffsetField = BitVector 6

-- | Address creation function
mkAddr34 :: ROField -> BAField -> BGField -> COField -> CHField -> Addr34
mkAddr34 ro ba bg co ch = roBV ++# baBV ++# bgBV ++# co ++# ch ++# offset
  where
    roBV  = pack ro
    baBV  = pack ba
    bgBV  = pack bg
    offset = 0 :: BitVector 6  -- always zeros

-- | Lifted version over signals (5 arguments)
liftA5 :: (a -> b -> c -> d -> e -> f)
       -> Signal System a
       -> Signal System b
       -> Signal System c
       -> Signal System d
       -> Signal System e
       -> Signal System f
liftA5 f sa sb sc sd se = f <$> sa <*> sb <*> sc <*> sd <*> se

-- | TopEntity for Clash
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System ROField  -- ^ RO
  -> Signal System BAField  -- ^ BA
  -> Signal System BGField  -- ^ BG
  -> Signal System CHField  -- ^ CH
  -> Signal System COField  -- ^ CO (7-bit from hotvector)
  -> Signal System Addr34   -- ^ 34-bit output address
topEntity clk rst en ro ba bg ch co =
    withClockResetEnable clk rst en $ liftA5 mkAddr34 ro ba bg co ch
