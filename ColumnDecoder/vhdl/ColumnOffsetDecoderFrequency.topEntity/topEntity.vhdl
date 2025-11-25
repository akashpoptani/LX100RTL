-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ColumnOffsetDecoderFrequency_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk      : in ColumnOffsetDecoderFrequency_topEntity_types.clk_System;
       -- reset
       rst      : in ColumnOffsetDecoderFrequency_topEntity_types.rst_System;
       -- enable
       en       : in ColumnOffsetDecoderFrequency_topEntity_types.en_System;
       inputSig : in unsigned(6 downto 0);
       result   : out std_logic_vector(127 downto 0));
end;

architecture structural of topEntity is
  -- ColumnOffsetDecoderFrequency.hs:(35,1)-(37,42)
  signal \c$ds_app_arg\     : std_logic_vector(15 downto 0) := std_logic_vector'(x"0000");
  signal result_1           : ColumnOffsetDecoderFrequency_topEntity_types.Tup2;
  signal \c$app_arg\        : std_logic_vector(127 downto 0);
  -- ColumnOffsetDecoderFrequency.hs:14:1-13
  signal wild               : signed(63 downto 0);
  -- ColumnOffsetDecoderFrequency.hs:14:1-13
  signal \c$wild_app_arg\   : signed(63 downto 0);
  signal \c$app_arg_0\      : std_logic_vector(15 downto 0);
  -- ColumnOffsetDecoderFrequency.hs:14:1-13
  signal wild_0             : signed(63 downto 0);
  -- ColumnOffsetDecoderFrequency.hs:14:1-13
  signal \c$wild_app_arg_0\ : signed(63 downto 0);
  -- ColumnOffsetDecoderFrequency.hs:14:1-13
  signal \c$wild_app_arg_1\ : std_logic_vector(6 downto 0);
  signal \c$shI\            : signed(63 downto 0);
  signal \c$shI_0\          : signed(63 downto 0);

begin
  -- register begin
  cds_app_arg_register : process(clk,rst)
  begin
    if rst =  '1'  then
      \c$ds_app_arg\ <= std_logic_vector'(x"0000");
    elsif rising_edge(clk) then
      if en then
        \c$ds_app_arg\ <= result_1.Tup2_sel0_std_logic_vector_0;
      end if;
    end if;
  end process;
  -- register end

  result <= result_1.Tup2_sel1_std_logic_vector_1;

  result_1 <= ( Tup2_sel0_std_logic_vector_0 => \c$app_arg_0\
              , Tup2_sel1_std_logic_vector_1 => \c$app_arg\ );

  \c$shI\ <= resize(wild * to_signed(16,64),64);

  capp_arg_shiftL : block
    signal sh : natural;
  begin
    sh <=
        -- pragma translate_off
        natural'high when (\c$shI\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI\);
    \c$app_arg\ <= std_logic_vector(shift_left(unsigned((std_logic_vector'(std_logic_vector'(std_logic_vector'(x"0000000000000000000000000000")) & std_logic_vector'(\c$ds_app_arg\)))),sh))
        -- pragma translate_off
        when ((resize(wild * to_signed(16,64),64)) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  wild <= \c$wild_app_arg\;

  \c$wild_app_arg\ <= signed(std_logic_vector(resize((unsigned(((\c$wild_app_arg_1\(6 downto 4))))),64)));

  \c$shI_0\ <= wild_0;

  capp_arg_0_shiftL : block
    signal sh_0 : natural;
  begin
    sh_0 <=
        -- pragma translate_off
        natural'high when (\c$shI_0\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_0\);
    \c$app_arg_0\ <= std_logic_vector(shift_left(unsigned(std_logic_vector'(x"0001")),sh_0))
        -- pragma translate_off
        when (wild_0 >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  wild_0 <= \c$wild_app_arg_0\;

  \c$wild_app_arg_0\ <= signed(std_logic_vector(resize((unsigned(((\c$wild_app_arg_1\(3 downto 0))))),64)));

  \c$wild_app_arg_1\ <= (std_logic_vector(inputSig));


end;

