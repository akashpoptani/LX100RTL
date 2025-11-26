-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.AddrGeneratorTop_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk    : in AddrGeneratorTop_topEntity_types.clk_System;
       -- reset
       rst    : in AddrGeneratorTop_topEntity_types.rst_System;
       -- enable
       en     : in AddrGeneratorTop_topEntity_types.en_System;
       ro     : in unsigned(15 downto 0);
       ba     : in unsigned(1 downto 0);
       bg     : in unsigned(1 downto 0);
       ch     : in std_logic_vector(0 downto 0);
       co     : in std_logic_vector(6 downto 0);
       result : out std_logic_vector(33 downto 0));
end;

architecture structural of topEntity is


begin
  result <= std_logic_vector'(std_logic_vector'((std_logic_vector'(std_logic_vector'((std_logic_vector'(std_logic_vector'((std_logic_vector'(std_logic_vector'((std_logic_vector'(std_logic_vector'(((std_logic_vector(ro)))) & std_logic_vector'(((std_logic_vector(ba))))))) & std_logic_vector'(((std_logic_vector(bg))))))) & std_logic_vector'(co)))) & std_logic_vector'(ch)))) & std_logic_vector'(std_logic_vector'("000000")));


end;

