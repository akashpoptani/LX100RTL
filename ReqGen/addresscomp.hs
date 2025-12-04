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
extractRO addr = bitCoerce (slice d33 d18 addr)

-- Function to extract the BAField (Bits 17 down to 16)
extractBA :: Addr34 -> BAField
extractBA addr = bitCoerce (slice d17 d16 addr)

-- Function to extract the BGField (Bits 15 down to 14)
extractBG :: Addr34 -> BGField
extractBG addr = bitCoerce (slice d15 d14 addr)

-- Function to extract the CHField (Bit 6)
extractCH :: Addr34 -> CHField
extractCH addr = bitCoerce (slice d6 d6 addr)

-- | Top-level combinational entity to compare two addresses.
-- It outputs True if all specified fields (Channel, Bank Group, Bank, Row/Rank) are identical.
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System Addr34 -- ^ Address 1
  -> Signal System Addr34 -- ^ Address 2
  -> Signal System Bool   -- ^ Result: True if fields match
topEntity clk rst en addr1 addr2 =
  -- Wrapping the combinational logic in the sequential domain.
  withClockResetEnable clk rst en $ (do
    -- Extract all relevant fields from Address 1
    let ro1 = fmap extractRO addr1
    let ba1 = fmap extractBA addr1
    let bg1 = fmap extractBG addr1
    let ch1 = fmap extractCH addr1

    -- Extract all relevant fields from Address 2
    let ro2 = fmap extractRO addr2
    let ba2 = fmap extractBA addr2
    let bg2 = fmap extractBG addr2
    let ch2 = fmap extractCH addr2

    -- Compare fields using signal equality (.==.)
    let roMatch = ro1 .==. ro2
    let baMatch = ba1 .==. ba2
    let bgMatch = bg1 .==. bg2
    let chMatch = ch1 .==. ch2

    -- Combine all match results using signal logical AND (.&&.)
    let allMatch = roMatch .&&. baMatch .&&. bgMatch .&&. chMatch

    -- Return the result signal (FIX: Output expression directly instead of using 'return')
    allMatch
  )

{-# CLASH_OPAQUE topEntity #-}