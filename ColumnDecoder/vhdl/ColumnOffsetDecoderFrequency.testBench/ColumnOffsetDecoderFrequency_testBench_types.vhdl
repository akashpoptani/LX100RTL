library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package ColumnOffsetDecoderFrequency_testBench_types is



  type array_of_unsigned_7 is array (integer range <>) of unsigned(6 downto 0);
  subtype rst_System is std_logic;
  subtype index_5 is unsigned(2 downto 0);
  type Tup2 is record
    Tup2_sel0_std_logic_vector_0 : std_logic_vector(15 downto 0);
    Tup2_sel1_std_logic_vector_1 : std_logic_vector(127 downto 0);
  end record;
  subtype index_4 is unsigned(1 downto 0);
  subtype index_9 is unsigned(3 downto 0);
  subtype clk_System is std_logic;

  type array_of_std_logic_vector_128 is array (integer range <>) of std_logic_vector(127 downto 0);
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
  function tagToEnum (s : in signed) return boolean;
  function dataToTag (b : in boolean) return signed;
  function toSLV (slv : in std_logic_vector) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic_vector;
  function toSLV (u : in unsigned) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return unsigned;
  function toSLV (value :  array_of_unsigned_7) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_unsigned_7;
  function toSLV (sl : in std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic;
  function toSLV (p : Tup2) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup2;
  function toSLV (s : in signed) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return signed;
  function toSLV (value :  array_of_std_logic_vector_128) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic_vector_128;
end;

package body ColumnOffsetDecoderFrequency_testBench_types is
  function toSLV (b : in boolean) return std_logic_vector is
  begin
    if b then
      return "1";
    else
      return "0";
    end if;
  end;
  function fromSLV (sl : in std_logic_vector) return boolean is
  begin
    if sl = "1" then
      return true;
    else
      return false;
    end if;
  end;
  function tagToEnum (s : in signed) return boolean is
  begin
    if s = to_signed(0,64) then
      return false;
    else
      return true;
    end if;
  end;
  function dataToTag (b : in boolean) return signed is
  begin
    if b then
      return to_signed(1,64);
    else
      return to_signed(0,64);
    end if;
  end;
  function toSLV (slv : in std_logic_vector) return std_logic_vector is
  begin
    return slv;
  end;
  function fromSLV (slv : in std_logic_vector) return std_logic_vector is
  begin
    return slv;
  end;
  function toSLV (u : in unsigned) return std_logic_vector is
  begin
    return std_logic_vector(u);
  end;
  function fromSLV (slv : in std_logic_vector) return unsigned is
    alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return unsigned(islv);
  end;
  function toSLV (value :  array_of_unsigned_7) return std_logic_vector is
    alias ivalue    : array_of_unsigned_7(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 7);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 7) + 1 to i*7) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_unsigned_7 is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_unsigned_7(0 to slv'length / 7 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 7 to (i+1) * 7 - 1));
    end loop;
    return result;
  end;
  function toSLV (sl : in std_logic) return std_logic_vector is
  begin
    return std_logic_vector'(0 => sl);
  end;
  function fromSLV (slv : in std_logic_vector) return std_logic is
    alias islv : std_logic_vector (0 to slv'length - 1) is slv;
  begin
    return islv(0);
  end;
  function toSLV (p : Tup2) return std_logic_vector is
  begin
    return (toSLV(p.Tup2_sel0_std_logic_vector_0) & toSLV(p.Tup2_sel1_std_logic_vector_1));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup2 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 15)),fromSLV(islv(16 to 143)));
  end;
  function toSLV (s : in signed) return std_logic_vector is
  begin
    return std_logic_vector(s);
  end;
  function fromSLV (slv : in std_logic_vector) return signed is
    alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return signed(islv);
  end;
  function toSLV (value :  array_of_std_logic_vector_128) return std_logic_vector is
    alias ivalue    : array_of_std_logic_vector_128(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 128);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 128) + 1 to i*128) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic_vector_128 is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_std_logic_vector_128(0 to slv'length / 128 - 1);
  begin
    for i in result'range loop
      result(i) := islv(i * 128 to (i+1) * 128 - 1);
    end loop;
    return result;
  end;
end;

