-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.RequestGenerator3_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk          : in RequestGenerator3_topEntity_types.clk_System;
       -- reset
       rst          : in RequestGenerator3_topEntity_types.rst_System;
       -- enable
       en           : in RequestGenerator3_topEntity_types.en_System;
       mem0_0       : in std_logic_vector(10 downto 0);
       mem0_1       : in std_logic_vector(10 downto 0);
       mem0_2       : in std_logic_vector(10 downto 0);
       mem0_3       : in std_logic_vector(10 downto 0);
       mem0_4       : in std_logic_vector(10 downto 0);
       mem0_5       : in std_logic_vector(10 downto 0);
       mem0_6       : in std_logic_vector(10 downto 0);
       mem0_7       : in std_logic_vector(10 downto 0);
       mem0_8       : in std_logic_vector(10 downto 0);
       mem0_9       : in std_logic_vector(10 downto 0);
       mem0_10      : in std_logic_vector(10 downto 0);
       mem0_11      : in std_logic_vector(10 downto 0);
       mem0_12      : in std_logic_vector(10 downto 0);
       mem0_13      : in std_logic_vector(10 downto 0);
       mem0_14      : in std_logic_vector(10 downto 0);
       mem0_15      : in std_logic_vector(10 downto 0);
       mem0_16      : in std_logic_vector(10 downto 0);
       mem0_17      : in std_logic_vector(10 downto 0);
       mem0_18      : in std_logic_vector(10 downto 0);
       mem0_19      : in std_logic_vector(10 downto 0);
       mem0_20      : in std_logic_vector(10 downto 0);
       mem0_21      : in std_logic_vector(10 downto 0);
       mem0_22      : in std_logic_vector(10 downto 0);
       mem0_23      : in std_logic_vector(10 downto 0);
       mem0_24      : in std_logic_vector(10 downto 0);
       mem0_25      : in std_logic_vector(10 downto 0);
       mem0_26      : in std_logic_vector(10 downto 0);
       mem0_27      : in std_logic_vector(10 downto 0);
       mem0_28      : in std_logic_vector(10 downto 0);
       mem0_29      : in std_logic_vector(10 downto 0);
       mem0_30      : in std_logic_vector(10 downto 0);
       mem0_31      : in std_logic_vector(10 downto 0);
       mem1_0       : in std_logic_vector(10 downto 0);
       mem1_1       : in std_logic_vector(10 downto 0);
       mem1_2       : in std_logic_vector(10 downto 0);
       mem1_3       : in std_logic_vector(10 downto 0);
       mem1_4       : in std_logic_vector(10 downto 0);
       mem1_5       : in std_logic_vector(10 downto 0);
       mem1_6       : in std_logic_vector(10 downto 0);
       mem1_7       : in std_logic_vector(10 downto 0);
       mem1_8       : in std_logic_vector(10 downto 0);
       mem1_9       : in std_logic_vector(10 downto 0);
       mem1_10      : in std_logic_vector(10 downto 0);
       mem1_11      : in std_logic_vector(10 downto 0);
       mem1_12      : in std_logic_vector(10 downto 0);
       mem1_13      : in std_logic_vector(10 downto 0);
       mem1_14      : in std_logic_vector(10 downto 0);
       mem1_15      : in std_logic_vector(10 downto 0);
       mem1_16      : in std_logic_vector(10 downto 0);
       mem1_17      : in std_logic_vector(10 downto 0);
       mem1_18      : in std_logic_vector(10 downto 0);
       mem1_19      : in std_logic_vector(10 downto 0);
       mem1_20      : in std_logic_vector(10 downto 0);
       mem1_21      : in std_logic_vector(10 downto 0);
       mem1_22      : in std_logic_vector(10 downto 0);
       mem1_23      : in std_logic_vector(10 downto 0);
       mem1_24      : in std_logic_vector(10 downto 0);
       mem1_25      : in std_logic_vector(10 downto 0);
       mem1_26      : in std_logic_vector(10 downto 0);
       mem1_27      : in std_logic_vector(10 downto 0);
       mem1_28      : in std_logic_vector(10 downto 0);
       mem1_29      : in std_logic_vector(10 downto 0);
       mem1_30      : in std_logic_vector(10 downto 0);
       mem1_31      : in std_logic_vector(10 downto 0);
       tableSel     : in unsigned(0 downto 0);
       idx0         : in unsigned(4 downto 0);
       idx1         : in unsigned(4 downto 0);
       linkedV      : in boolean;
       linkedNewAdr : in std_logic_vector(33 downto 0);
       result_0     : out std_logic_vector(10 downto 0);
       result_1_0   : out boolean;
       result_1_1   : out std_logic_vector(33 downto 0));
end;

architecture structural of topEntity is
  -- RequestGenerator3.hs:43:1-9
  signal b          : boolean;
  -- RequestGenerator3.hs:43:1-9
  signal t          : std_logic_vector(10 downto 0);
  -- RequestGenerator3.hs:43:1-9
  signal f2         : std_logic_vector(10 downto 0);
  signal result_2   : std_logic_vector(10 downto 0);
  signal mem0       : RequestGenerator3_topEntity_types.array_of_std_logic_vector_11(0 to 31);
  signal mem1       : RequestGenerator3_topEntity_types.array_of_std_logic_vector_11(0 to 31);
  signal result     : RequestGenerator3_topEntity_types.Tup2;
  signal result_1_2 : RequestGenerator3_topEntity_types.Tup2_0;

begin
  mem0 <= RequestGenerator3_topEntity_types.array_of_std_logic_vector_11'( mem0_0
                                                                         , mem0_1
                                                                         , mem0_2
                                                                         , mem0_3
                                                                         , mem0_4
                                                                         , mem0_5
                                                                         , mem0_6
                                                                         , mem0_7
                                                                         , mem0_8
                                                                         , mem0_9
                                                                         , mem0_10
                                                                         , mem0_11
                                                                         , mem0_12
                                                                         , mem0_13
                                                                         , mem0_14
                                                                         , mem0_15
                                                                         , mem0_16
                                                                         , mem0_17
                                                                         , mem0_18
                                                                         , mem0_19
                                                                         , mem0_20
                                                                         , mem0_21
                                                                         , mem0_22
                                                                         , mem0_23
                                                                         , mem0_24
                                                                         , mem0_25
                                                                         , mem0_26
                                                                         , mem0_27
                                                                         , mem0_28
                                                                         , mem0_29
                                                                         , mem0_30
                                                                         , mem0_31 );

  mem1 <= RequestGenerator3_topEntity_types.array_of_std_logic_vector_11'( mem1_0
                                                                         , mem1_1
                                                                         , mem1_2
                                                                         , mem1_3
                                                                         , mem1_4
                                                                         , mem1_5
                                                                         , mem1_6
                                                                         , mem1_7
                                                                         , mem1_8
                                                                         , mem1_9
                                                                         , mem1_10
                                                                         , mem1_11
                                                                         , mem1_12
                                                                         , mem1_13
                                                                         , mem1_14
                                                                         , mem1_15
                                                                         , mem1_16
                                                                         , mem1_17
                                                                         , mem1_18
                                                                         , mem1_19
                                                                         , mem1_20
                                                                         , mem1_21
                                                                         , mem1_22
                                                                         , mem1_23
                                                                         , mem1_24
                                                                         , mem1_25
                                                                         , mem1_26
                                                                         , mem1_27
                                                                         , mem1_28
                                                                         , mem1_29
                                                                         , mem1_30
                                                                         , mem1_31 );

  b <= tableSel = to_unsigned(0,1);

  -- index begin
  indexVec : block
    signal vec_index : integer range 0 to 32-1;
  begin
    vec_index <= to_integer((signed(std_logic_vector(resize(idx0,64)))))
    -- pragma translate_off
                 mod 32
    -- pragma translate_on
                 ;
    t <= mem0(vec_index);
  end block;
  -- index end

  -- index begin
  indexVec_0 : block
    signal vec_index_0 : integer range 0 to 32-1;
  begin
    vec_index_0 <= to_integer((signed(std_logic_vector(resize(idx1,64)))))
    -- pragma translate_off
                 mod 32
    -- pragma translate_on
                 ;
    f2 <= mem1(vec_index_0);
  end block;
  -- index end

  result_2 <= t when b else
              f2;

  result <= ( Tup2_sel0_std_logic_vector => result_2
            , Tup2_sel1_Tup2_0 => ( Tup2_0_sel0_boolean => linkedV
            , Tup2_0_sel1_std_logic_vector => linkedNewAdr ) );

  result_0 <= result.Tup2_sel0_std_logic_vector;

  result_1_2 <= result.Tup2_sel1_Tup2_0;

  result_1_0 <= result_1_2.Tup2_0_sel0_boolean;

  result_1_1 <= result_1_2.Tup2_0_sel1_std_logic_vector;


end;

