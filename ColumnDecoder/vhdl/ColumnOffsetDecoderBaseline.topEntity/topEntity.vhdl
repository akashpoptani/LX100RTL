-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ColumnOffsetDecoderBaseline_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk      : in ColumnOffsetDecoderBaseline_topEntity_types.clk_System;
       -- reset
       rst      : in ColumnOffsetDecoderBaseline_topEntity_types.rst_System;
       -- enable
       en       : in ColumnOffsetDecoderBaseline_topEntity_types.en_System;
       inputSig : in unsigned(6 downto 0);
       result   : out std_logic_vector(127 downto 0));
end;

architecture structural of topEntity is
  -- ColumnOffsetDecoderBaseline.hs:11:1-12
  signal wild             : signed(63 downto 0);
  -- ColumnOffsetDecoderBaseline.hs:11:1-12
  signal \c$wild_app_arg\ : signed(63 downto 0);
  signal \c$shI\          : signed(63 downto 0);

begin
  wild <= \c$wild_app_arg\;

  \c$wild_app_arg\ <= signed(std_logic_vector(resize(inputSig,64)));

  \c$shI\ <= wild;

  result_shiftL : block
    signal sh : natural;
  begin
    sh <=
        -- pragma translate_off
        natural'high when (\c$shI\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI\);
    result <= std_logic_vector(shift_left(unsigned(std_logic_vector'(x"00000000000000000000000000000001")),sh))
        -- pragma translate_off
        when (wild >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;


end;

