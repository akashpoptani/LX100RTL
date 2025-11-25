{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE NumericUnderscores #-}

module AddrGeneratorTop where

import Clash.Prelude

-- Type aliases
type Addr34 = BitVector 34
type ROField = Unsigned 16
type BAField = Unsigned 2
type BGField = Unsigned 2
type COField = BitVector 7
type CHField = Bit
type OffsetField = BitVector 6

-- | Address creation function
mkAddr34 :: ROField -> BAField -> BGField -> COField -> CHField -> Addr34
mkAddr34 ro ba bg co ch = roBV ++# baBV ++# bgBV ++# co ++# (singleton ch) ++# offset
  where
    roBV  = pack ro
    baBV  = pack ba
    bgBV  = pack bg
    offset = 0 :: BitVector 6  -- always zeros

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
topEntity clk rst en ro ba bg ch co = withClockResetEnable clk rst en $
    liftA5 mkAddr34 ro ba bg ch co
