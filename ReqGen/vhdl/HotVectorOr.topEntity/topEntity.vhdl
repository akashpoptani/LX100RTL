-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.HotVectorOr_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk    : in HotVectorOr_topEntity_types.clk_System;
       -- reset
       rst    : in HotVectorOr_topEntity_types.rst_System;
       -- enable
       en     : in HotVectorOr_topEntity_types.en_System;
       old    : in std_logic_vector(127 downto 0);
       r_new  : in std_logic_vector(127 downto 0);
       result : out std_logic_vector(127 downto 0));
end;

architecture structural of topEntity is


begin
  result <= old or r_new;


end;

