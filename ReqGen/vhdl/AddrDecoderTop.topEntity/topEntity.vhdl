-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.AddrDecoderTop_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk      : in AddrDecoderTop_topEntity_types.clk_System;
       -- reset
       rst      : in AddrDecoderTop_topEntity_types.rst_System;
       -- enable
       en       : in AddrDecoderTop_topEntity_types.en_System;
       addr     : in std_logic_vector(33 downto 0);
       result_0 : out unsigned(15 downto 0);
       result_1 : out unsigned(1 downto 0);
       result_2 : out unsigned(1 downto 0);
       result_3 : out std_logic_vector(6 downto 0);
       result_4 : out std_logic;
       result_5 : out std_logic_vector(5 downto 0));
end;

architecture structural of topEntity is
  signal \c$app_arg\   : std_logic;
  signal \c$app_arg_0\ : std_logic_vector(33 downto 0);
  signal result        : AddrDecoderTop_topEntity_types.Tup6;

begin
  result <= ( Tup6_sel0_unsigned_0 => unsigned((\c$app_arg_0\(33 downto 18)))
            , Tup6_sel1_unsigned_1 => unsigned((\c$app_arg_0\(17 downto 16)))
            , Tup6_sel2_unsigned_2 => unsigned((\c$app_arg_0\(15 downto 14)))
            , Tup6_sel3_std_logic_vector_0 => \c$app_arg_0\(13 downto 7)
            , Tup6_sel4_std_logic => \c$app_arg\
            , Tup6_sel5_std_logic_vector_1 => \c$app_arg_0\(5 downto 0) );

  -- indexBitVector begin
  indexBitVector : block
    signal vec_index : integer range 0 to 34-1;
  begin
    vec_index <= to_integer(to_signed(6,64))
    -- pragma translate_off
                 mod 34
    -- pragma translate_on
                 ;

    \c$app_arg\ <= \c$app_arg_0\(vec_index);
  end block;
  -- indexBitVector end

  \c$app_arg_0\ <= addr;

  result_0 <= result.Tup6_sel0_unsigned_0;

  result_1 <= result.Tup6_sel1_unsigned_1;

  result_2 <= result.Tup6_sel2_unsigned_2;

  result_3 <= result.Tup6_sel3_std_logic_vector_0;

  result_4 <= result.Tup6_sel4_std_logic;

  result_5 <= result.Tup6_sel5_std_logic_vector_1;


end;

