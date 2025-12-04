-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.AddressComparator_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk    : in AddressComparator_topEntity_types.clk_System;
       -- reset
       rst    : in AddressComparator_topEntity_types.rst_System;
       -- enable
       en     : in AddressComparator_topEntity_types.en_System;
       addr1  : in std_logic_vector(33 downto 0);
       addr2  : in std_logic_vector(33 downto 0);
       result : out boolean);
end;

architecture structural of topEntity is
  signal \c$app_arg\   : std_logic_vector(33 downto 0);
  signal \c$app_arg_0\ : std_logic_vector(33 downto 0);
  signal \c$bv\        : std_logic_vector(0 downto 0);
  signal \c$bv_0\      : std_logic_vector(0 downto 0);

begin
  \c$bv\ <= ((\c$app_arg_0\(6 downto 6)));

  \c$bv_0\ <= ((\c$app_arg\(6 downto 6)));

  result <= ((unsigned(((\c$app_arg_0\(33 downto 18))))) = (unsigned(((\c$app_arg\(33 downto 18)))))) and (((unsigned(((\c$app_arg_0\(17 downto 16))))) = (unsigned(((\c$app_arg\(17 downto 16)))))) and (((unsigned(((\c$app_arg_0\(15 downto 14))))) = (unsigned(((\c$app_arg\(15 downto 14)))))) and ((\c$bv\(0)) = (\c$bv_0\(0)))));

  \c$app_arg\ <= addr2;

  \c$app_arg_0\ <= addr1;


end;

