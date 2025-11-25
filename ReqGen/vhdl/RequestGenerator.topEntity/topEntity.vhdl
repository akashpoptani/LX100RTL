-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.RequestGenerator_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk          : in RequestGenerator_topEntity_types.clk_System;
       -- reset
       rst          : in RequestGenerator_topEntity_types.rst_System;
       -- enable
       en           : in RequestGenerator_topEntity_types.en_System;
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
  signal \c$app_arg\ : boolean;
  signal result_2    : std_logic_vector(10 downto 0);
  -- RequestGenerator1.hs:64:1-9
  signal a1          : RequestGenerator_topEntity_types.Tup2;
  -- RequestGenerator1.hs:64:1-9
  signal idx         : unsigned(4 downto 0) := to_unsigned(0,5);
  -- RequestGenerator1.hs:64:1-9
  signal ds          : RequestGenerator_topEntity_types.Tup2;
  -- RequestGenerator1.hs:64:1-9
  signal wrM         : RequestGenerator_topEntity_types.Maybe;
  signal \c$rdI\     : signed(63 downto 0);
  signal \c$wrI\     : signed(63 downto 0);
  signal result      : RequestGenerator_topEntity_types.Tup2_0;
  signal result_1_2  : RequestGenerator_topEntity_types.MemReq;

begin
  with (wrM(16 downto 16)) select
    \c$app_arg\ <= false when "0",
                   true when others;

  \c$rdI\ <= (signed(std_logic_vector(resize(idx,64))));

  \c$wrI\ <= (signed(std_logic_vector(resize(ds.Tup2_sel0_unsigned,64))));

  -- blockRam begin
  result_2_blockRam : block
    signal result_2_RAM : RequestGenerator_topEntity_types.array_of_std_logic_vector_11(0 to 31) := RequestGenerator_topEntity_types.array_of_std_logic_vector_11'( std_logic_vector'("00000000000")
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
    rd <= to_integer(\c$rdI\(31 downto 0))
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
        if \c$app_arg\  and en  then
          result_2_RAM(wr) <= ds.Tup2_sel1_std_logic_vector;
        end if;
        result_2 <= result_2_RAM(rd);
      end if;
    end process;
  end block;
  --end blockRam

  a1 <= RequestGenerator_topEntity_types.Tup2'(requestgenerator_topentity_types.fromSLV(wrM(15 downto 0)));

  -- register begin
  idx_register : process(clk,rst)
  begin
    if rst =  '1'  then
      idx <= to_unsigned(0,5);
    elsif rising_edge(clk) then
      if en then
        idx <= (idx + to_unsigned(1,5));
      end if;
    end if;
  end process;
  -- register end

  with (wrM(16 downto 16)) select
    ds <= RequestGenerator_topEntity_types.Tup2'( unsigned'(0 to 4 => '-')
        , std_logic_vector'(0 to 10 => '-') ) when "0",
          a1 when others;

  wrM <= std_logic_vector'("0" & "----------------") when linkedV else
         std_logic_vector'("1" & ((std_logic_vector(idx)
          & linkedNxt)));

  result <= ( Tup2_0_sel0_std_logic_vector => result_2
            , Tup2_0_sel1_MemReq => ( MemReq_sel0_memValid => linkedV
            , MemReq_sel1_memAddr => linkedNewAdr ) );

  result_0 <= result.Tup2_0_sel0_std_logic_vector;

  result_1_2 <= result.Tup2_0_sel1_MemReq;

  result_1_0 <= result_1_2.MemReq_sel0_memValid;

  result_1_1 <= result_1_2.MemReq_sel1_memAddr;


end;

