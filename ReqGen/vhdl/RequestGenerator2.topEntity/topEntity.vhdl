-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.RequestGenerator2_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk          : in RequestGenerator2_topEntity_types.clk_System;
       -- reset
       rst          : in RequestGenerator2_topEntity_types.rst_System;
       -- enable
       en           : in RequestGenerator2_topEntity_types.en_System;
       ro           : in unsigned(15 downto 0);
       bg           : in unsigned(1 downto 0);
       ba           : in unsigned(1 downto 0);
       ch           : in std_logic;
       linkedV      : in boolean;
       linkedNxt    : in std_logic_vector(10 downto 0);
       linkedNewAdr : in std_logic_vector(33 downto 0);
       result_0     : out std_logic_vector(10 downto 0);
       result_1_0   : out boolean;
       result_1_1   : out std_logic_vector(33 downto 0));
end;

architecture structural of topEntity is
  signal result_2        : std_logic_vector(10 downto 0);
  signal result_3        : std_logic_vector(10 downto 0);
  -- RequestGenerator2.hs:46:1-9
  signal ds              : RequestGenerator2_topEntity_types.Tup2;
  -- RequestGenerator2.hs:46:1-9
  signal a1              : RequestGenerator2_topEntity_types.Tup2;
  -- RequestGenerator2.hs:46:1-9
  signal \c$f2_app_arg\  : boolean;
  signal result_4        : RequestGenerator2_topEntity_types.Maybe;
  -- RequestGenerator2.hs:46:1-9
  signal en1             : boolean;
  signal result_5        : std_logic_vector(10 downto 0);
  -- RequestGenerator2.hs:46:1-9
  signal ds_0            : RequestGenerator2_topEntity_types.Tup2;
  -- RequestGenerator2.hs:46:1-9
  signal a1_0            : RequestGenerator2_topEntity_types.Tup2;
  -- RequestGenerator2.hs:46:1-9
  signal \c$t_app_arg\   : boolean;
  -- RequestGenerator2.hs:46:1-9
  signal \c$t_app_arg_0\ : signed(63 downto 0);
  signal result_6        : RequestGenerator2_topEntity_types.Maybe;
  -- RequestGenerator2.hs:46:1-9
  signal en1_0           : boolean;
  -- RequestGenerator2.hs:46:1-9
  signal wild            : RequestGenerator2_topEntity_types.Tup2;
  -- RequestGenerator2.hs:46:1-9
  signal \c$en1_app_arg\ : boolean;
  signal result_7        : unsigned(0 downto 0);
  -- RequestGenerator2.hs:46:1-9
  signal tableSel        : unsigned(0 downto 0) := to_unsigned(0,1);
  signal result_8        : unsigned(0 downto 0);
  -- RequestGenerator2.hs:46:1-9
  signal b               : boolean;
  -- RequestGenerator2.hs:46:1-9
  signal idx0            : unsigned(4 downto 0) := to_unsigned(0,5);
  signal \c$wrI\         : signed(63 downto 0);
  signal \c$wrI_0\       : signed(63 downto 0);
  signal result          : RequestGenerator2_topEntity_types.Tup2_0;
  signal result_1_2      : RequestGenerator2_topEntity_types.Tup2_1;

begin
  result <= ( Tup2_0_sel0_std_logic_vector => result_2
            , Tup2_0_sel1_Tup2_1 => ( Tup2_1_sel0_boolean => linkedV
            , Tup2_1_sel1_std_logic_vector => linkedNewAdr ) );

  result_2 <= result_5 when \c$en1_app_arg\ else
              result_3;

  \c$wrI\ <= (signed(std_logic_vector(resize(ds.Tup2_sel0_unsigned,64))));

  -- blockRam begin
  result_3_blockRam : block
    signal result_3_RAM : RequestGenerator2_topEntity_types.array_of_std_logic_vector_11(0 to 31) := RequestGenerator2_topEntity_types.array_of_std_logic_vector_11'( std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000") );
    signal rd  : integer range 0 to 32 - 1;
    signal wr  : integer range 0 to 32 - 1;
  begin
    rd <= to_integer(\c$t_app_arg_0\(31 downto 0))
    -- pragma translate_off
                  mod 32
    -- pragma translate_on
                  ;

    wr <= to_integer(\c$wrI\(31 downto 0))
    -- pragma translate_off
                  mod 32
    -- pragma translate_on
                  ;

    \c$n\ : process(clk)
    begin
      if rising_edge(clk) then
        if \c$f2_app_arg\  and en  then
          result_3_RAM(wr) <= ds.Tup2_sel1_std_logic_vector;
        end if;
        result_3 <= result_3_RAM(rd);
      end if;
    end process;
  end block;
  --end blockRam

  with (result_4(16 downto 16)) select
    ds <= RequestGenerator2_topEntity_types.Tup2'( unsigned'(0 to 4 => '-')
        , std_logic_vector'(0 to 10 => '-') ) when "0",
          a1 when others;

  a1 <= RequestGenerator2_topEntity_types.Tup2'(requestgenerator2_topentity_types.fromSLV(result_4(15 downto 0)));

  with (result_4(16 downto 16)) select
    \c$f2_app_arg\ <= false when "0",
                      true when others;

  result_4 <= std_logic_vector'("1" & ((std_logic_vector(wild.Tup2_sel0_unsigned)
               & wild.Tup2_sel1_std_logic_vector))) when en1 else
              std_logic_vector'("0" & "----------------");

  en1 <= linkedV and (tableSel = to_unsigned(1,1));

  \c$wrI_0\ <= (signed(std_logic_vector(resize(ds_0.Tup2_sel0_unsigned,64))));

  -- blockRam begin
  result_5_blockRam : block
    signal result_5_RAM : RequestGenerator2_topEntity_types.array_of_std_logic_vector_11(0 to 31) := RequestGenerator2_topEntity_types.array_of_std_logic_vector_11'( std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000")
                                                                 , std_logic_vector'("00000000000") );
    signal rd_0  : integer range 0 to 32 - 1;
    signal wr_0  : integer range 0 to 32 - 1;
  begin
    rd_0 <= to_integer(\c$t_app_arg_0\(31 downto 0))
    -- pragma translate_off
                  mod 32
    -- pragma translate_on
                  ;

    wr_0 <= to_integer(\c$wrI_0\(31 downto 0))
    -- pragma translate_off
                  mod 32
    -- pragma translate_on
                  ;

    \c$n_0\ : process(clk)
    begin
      if rising_edge(clk) then
        if \c$t_app_arg\  and en  then
          result_5_RAM(wr_0) <= ds_0.Tup2_sel1_std_logic_vector;
        end if;
        result_5 <= result_5_RAM(rd_0);
      end if;
    end process;
  end block;
  --end blockRam

  with (result_6(16 downto 16)) select
    ds_0 <= RequestGenerator2_topEntity_types.Tup2'( unsigned'(0 to 4 => '-')
          , std_logic_vector'(0 to 10 => '-') ) when "0",
            a1_0 when others;

  a1_0 <= RequestGenerator2_topEntity_types.Tup2'(requestgenerator2_topentity_types.fromSLV(result_6(15 downto 0)));

  with (result_6(16 downto 16)) select
    \c$t_app_arg\ <= false when "0",
                     true when others;

  \c$t_app_arg_0\ <= signed(std_logic_vector(resize(idx0,64)));

  result_6 <= std_logic_vector'("1" & ((std_logic_vector(wild.Tup2_sel0_unsigned)
               & wild.Tup2_sel1_std_logic_vector))) when en1_0 else
              std_logic_vector'("0" & "----------------");

  en1_0 <= linkedV and \c$en1_app_arg\;

  wild <= ( Tup2_sel0_unsigned => idx0
          , Tup2_sel1_std_logic_vector => linkedNxt );

  \c$en1_app_arg\ <= tableSel = to_unsigned(0,1);

  result_7 <= to_unsigned(0,1) when b else
              tableSel;

  -- register begin
  tableSel_register : process(clk,rst)
  begin
    if rst =  '1'  then
      tableSel <= to_unsigned(0,1);
    elsif rising_edge(clk) then
      if en then
        tableSel <= result_8;
      end if;
    end if;
  end process;
  -- register end

  result_8 <= to_unsigned(1,1) when b else
              result_7;

  b <= idx0 = to_unsigned(31,5);

  -- register begin
  idx0_register : process(clk,rst)
  begin
    if rst =  '1'  then
      idx0 <= to_unsigned(0,5);
    elsif rising_edge(clk) then
      if en then
        idx0 <= (idx0 + to_unsigned(1,5));
      end if;
    end if;
  end process;
  -- register end

  result_0 <= result.Tup2_0_sel0_std_logic_vector;

  result_1_2 <= result.Tup2_0_sel1_Tup2_1;

  result_1_0 <= result_1_2.Tup2_1_sel0_boolean;

  result_1_1 <= result_1_2.Tup2_1_sel1_std_logic_vector;


end;

