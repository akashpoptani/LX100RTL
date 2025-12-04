{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE NumericUnderscores #-}

module AddressComparator where

import Clash.Prelude

-- | Address structure (34 bits total)
type Addr34 = BitVector 34
type ROField = Unsigned 16 -- Row/Rank field width (16 bits)
type BAField = Unsigned 2  -- Bank field width (2 bits)
type BGField = Unsigned 2  -- Bank Group field width (2 bits)
type CHField = Bit         -- Channel field width (1 bit)

-- | Field Masks (Based on the structure provided in previous context)
-- These constants define where the relevant fields are located in the 34-bit address.
-- NOTE: We assume the following bit layout from previous context:
-- [33:18] RO (16 bits)
-- [17:16] BA (2 bits)
-- [15:14] BG (2 bits)
-- [6]     CH (1 bit)

-- Function to extract the ROField (Bits 33 down to 18)
extractRO :: Addr34 -> ROField
-- FIX: Using bitCoerce for conversion from BitVector to Unsigned
extractRO addr = bitCoerce (slice d33 d18 addr)

-- Function to extract the BAField (Bits 17 down to 16)
extractBA :: Addr34 -> BAField
-- FIX: Using bitCoerce for conversion from BitVector to Unsigned
extractBA addr = bitCoerce (slice d17 d16 addr)

-- Function to extract the BGField (Bits 15 down to 14)
extractBG :: Addr34 -> BGField
-- FIX: Using bitCoerce for conversion from BitVector to Unsigned
extractBG addr = bitCoerce (slice d15 d14 addr)

-- Function to extract the CHField (Bit 6)
extractCH :: Addr34 -> CHField
-- FIX: Use slice to get BitVector 1, then bitCoerce to Bit.
extractCH addr = bitCoerce (slice d6 d6 addr)

-- | Top-level combinational entity to compare two addresses.
-- It outputs True if all specified fields (Channel, Bank Group, Bank, Row/Rank) are identical.
topEntity
  :: Signal System Addr34 -- ^ Address 1
  -> Signal System Addr34 -- ^ Address 2
  -> Signal System Bool   -- ^ Result: True if fields match
topEntity addr1 addr2 = allMatch
  where
    -- Extract all relevant fields from Address 1
    ro1 = fmap extractRO addr1
    ba1 = fmap extractBA addr1
    bg1 = fmap extractBG addr1
    ch1 = fmap extractCH addr1

    -- Extract all relevant fields from Address 2
    ro2 = fmap extractRO addr2
    ba2 = fmap extractBA addr2
    bg2 = fmap extractBG addr2
    ch2 = fmap extractCH addr2

    -- Compare fields using signal equality (.==.)
    roMatch = ro1 .==. ro2
    baMatch = ba1 .==. ba2
    bgMatch = bg1 .==. bg2
    chMatch = ch1 .==. ch2

    -- Combine all match results using signal logical AND (.&&.)
    allMatch = roMatch .&&. baMatch .&&. bgMatch .&&. chMatch

{-# CLASH_OPAQUE topEntity #-}