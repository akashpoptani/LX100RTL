-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ColumnEncoder_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk    : in ColumnEncoder_topEntity_types.clk_System;
       -- reset
       rst    : in ColumnEncoder_topEntity_types.rst_System;
       -- enable
       en     : in ColumnEncoder_topEntity_types.en_System;
       hotVec : in std_logic_vector(127 downto 0);
       result : out std_logic_vector(6 downto 0));
end;

architecture structural of topEntity is
  -- columnencoder.hs:18:1-14
  signal ws               : ColumnEncoder_topEntity_types.array_of_Maybe(0 to 128);
  signal \c$case_scrut\   : ColumnEncoder_topEntity_types.Maybe;
  -- columnencoder.hs:18:1-14
  signal i                : ColumnEncoder_topEntity_types.index_128;
  signal \c$app_arg\      : signed(63 downto 0);
  -- columnencoder.hs:18:1-14
  signal \c$ws_app_arg\   : ColumnEncoder_topEntity_types.array_of_Maybe(0 to 127);
  -- columnencoder.hs:18:1-14
  signal \c$ws_app_arg_0\ : ColumnEncoder_topEntity_types.array_of_Tup2(0 to 127);
  -- columnencoder.hs:18:1-14
  signal \c$ws_app_arg_1\ : ColumnEncoder_topEntity_types.array_of_std_logic(0 to 127);
  -- columnencoder.hs:18:1-14
  signal \c$ws_app_arg_2\ : ColumnEncoder_topEntity_types.array_of_std_logic_vector_1(0 to 127);
  signal \c$vec2\         : ColumnEncoder_topEntity_types.array_of_Maybe(0 to 127);
  signal \c$vec\          : std_logic_vector(127 downto 0);

begin
  ws <= ColumnEncoder_topEntity_types.array_of_Maybe'(ColumnEncoder_topEntity_types.array_of_Maybe'(\c$ws_app_arg\) & ColumnEncoder_topEntity_types.array_of_Maybe'(ColumnEncoder_topEntity_types.array_of_Maybe'(0 => std_logic_vector'("0" & "-------"))));

  with (\c$case_scrut\(7 downto 7)) select
    result <= std_logic_vector'("0000000") when "0",
              std_logic_vector(resize(unsigned(std_logic_vector(\c$app_arg\)),7)) when others;

  \c$case_scrut\ <=  ws(0) ;

  i <= ColumnEncoder_topEntity_types.index_128'(columnencoder_topentity_types.fromSLV(\c$case_scrut\(6 downto 0)));

  \c$app_arg\ <= signed(std_logic_vector(resize(i,64)));

  -- imap begin
  imap : block
    function max (l,r : in natural) return natural is
    begin
      if l > r then return l;
      else return r;
      end if;
    end function;
  begin
    imap_0 : for i_1 in \c$ws_app_arg\'range generate
    begin
      fun_0 : block
      -- columnencoder.hs:18:1-14
      signal x                          : std_logic;
      signal \c$case_alt\               : ColumnEncoder_topEntity_types.Maybe;
      signal \c$case_alt_selection_res\ : boolean;
    begin
      \c$ws_app_arg\(i_1) <= \c$case_alt\;

      x <= \c$ws_app_arg_0\(i_1).Tup2_sel0_std_logic;

      \c$case_alt_selection_res\ <= x = ('1');

      \c$case_alt\ <= std_logic_vector'("1" & (std_logic_vector(to_unsigned(i_1,max(1,integer(ceil(log2(real(128))))))))) when \c$case_alt_selection_res\ else
                      \c$ws_app_arg_0\(i_1).Tup2_sel1_Maybe;


    end block;
    end generate;
  end block;
  -- imap end

  \c$vec2\ <= (ws(1 to ws'high));

  -- zipWith begin
  zipWith : for i_2 in \c$ws_app_arg_0\'range generate
  begin
    \c$ws_app_arg_0\(i_2) <= ( Tup2_sel0_std_logic => \c$ws_app_arg_1\(i_2)
               , Tup2_sel1_Maybe => \c$vec2\(i_2) );


  end generate;
  -- zipWith end

  -- map begin
  r_map : for i_3 in \c$ws_app_arg_1\'range generate
  begin
    \c$ws_app_arg_1\(i_3) <= \c$ws_app_arg_2\(i_3)(0);


  end generate;
  -- map end

  \c$vec\ <= (hotVec);

  -- unconcatBitVector begin
  unconcatBitVectorIter_loop : for i_4 in \c$ws_app_arg_2\'range generate
    \c$ws_app_arg_2\(\c$ws_app_arg_2\'high - i_4) <= \c$vec\(((i_4 * 1) + 1 - 1) downto (i_4 * 1));
  end generate;
  -- unconcatBitVector end


end;

