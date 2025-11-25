{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE RecordWildCards #-}

module AddrDecoderTop where

import Clash.Prelude

-- Type aliases
type Addr34 = BitVector 34
type ROField = Unsigned 16
type BAField = Unsigned 2
type BGField = Unsigned 2
type COField = BitVector 7
type CHField = Bit
type OffsetField = BitVector 6

-- | Decode a 34-bit address into its fields
decodeAddr34
  :: Addr34
  -> (ROField, BAField, BGField, COField, CHField, OffsetField)
decodeAddr34 addr = (ro, ba, bg, co, ch, offset)
  where
    ro     = unpack $ slice d33 d18 addr   -- bits [33:18]
    ba     = unpack $ slice d17 d16 addr   -- bits [17:16]
    bg     = unpack $ slice d15 d14 addr   -- bits [15:14]
    co     = slice d13 d7 addr             -- bits [13:7]
    ch     = addr ! 6                      -- bit [6]
    offset = slice d5 d0 addr              -- bits [5:0]

-- | TopEntity for Clash
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System Addr34
  -> ( Signal System ROField
     , Signal System BAField
     , Signal System BGField
     , Signal System COField
     , Signal System CHField
     , Signal System OffsetField
     )
topEntity _clk _rst _en addr =
    ( fmap (\a -> unpack $ slice d33 d18 a) addr
    , fmap (\a -> unpack $ slice d17 d16 a) addr
    , fmap (\a -> unpack $ slice d15 d14 a) addr
    , fmap (\a -> slice d13 d7 a) addr
    , fmap (\a -> a ! 6) addr
    , fmap (\a -> slice d5 d0 a) addr
    )
