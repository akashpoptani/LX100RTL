library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package ColumnEncoder_topEntity_types is
  subtype index_128 is unsigned(6 downto 0);


  subtype Maybe is std_logic_vector(7 downto 0);
  subtype rst_System is std_logic;
  type array_of_std_logic_vector_1 is array (integer range <>) of std_logic_vector(0 downto 0);

  type array_of_std_logic is array (integer range <>) of std_logic;
  subtype en_System is boolean;
  type Tup2 is record
    Tup2_sel0_std_logic : std_logic;
    Tup2_sel1_Maybe : Maybe;
  end record;
  type array_of_Tup2 is array (integer range <>) of Tup2;
  subtype clk_System is std_logic;
  type array_of_Maybe is array (integer range <>) of Maybe;

  function toSLV (u : in unsigned) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return unsigned;
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
  function tagToEnum (s : in signed) return boolean;
  function dataToTag (b : in boolean) return signed;
  function toSLV (slv : in std_logic_vector) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic_vector;
  function toSLV (sl : in std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic;
  function toSLV (value :  array_of_std_logic_vector_1) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic_vector_1;
  function toSLV (value :  array_of_std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic;
  function toSLV (p : Tup2) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup2;
  function toSLV (value :  array_of_Tup2) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_Tup2;
  function toSLV (value :  array_of_Maybe) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_Maybe;
  function toSLV (s : in signed) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return signed;
end;

package body ColumnEncoder_topEntity_types is
  function toSLV (u : in unsigned) return std_logic_vector is
  begin
    return std_logic_vector(u);
  end;
  function fromSLV (slv : in std_logic_vector) return unsigned is
    alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return unsigned(islv);
  end;
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
  function toSLV (sl : in std_logic) return std_logic_vector is
  begin
    return std_logic_vector'(0 => sl);
  end;
  function fromSLV (slv : in std_logic_vector) return std_logic is
    alias islv : std_logic_vector (0 to slv'length - 1) is slv;
  begin
    return islv(0);
  end;
  function toSLV (value :  array_of_std_logic_vector_1) return std_logic_vector is
    alias ivalue    : array_of_std_logic_vector_1(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 1);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 1) + 1 to i*1) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic_vector_1 is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_std_logic_vector_1(0 to slv'length / 1 - 1);
  begin
    for i in result'range loop
      result(i) := islv(i * 1 to (i+1) * 1 - 1);
    end loop;
    return result;
  end;
  function toSLV (value :  array_of_std_logic) return std_logic_vector is
    alias ivalue    : array_of_std_logic(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 1);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 1) + 1 to i*1) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_std_logic(0 to slv'length / 1 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 1 to (i+1) * 1 - 1));
    end loop;
    return result;
  end;
  function toSLV (p : Tup2) return std_logic_vector is
  begin
    return (toSLV(p.Tup2_sel0_std_logic) & toSLV(p.Tup2_sel1_Maybe));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup2 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 0)),fromSLV(islv(1 to 8)));
  end;
  function toSLV (value :  array_of_Tup2) return std_logic_vector is
    alias ivalue    : array_of_Tup2(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 9);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 9) + 1 to i*9) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_Tup2 is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_Tup2(0 to slv'length / 9 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 9 to (i+1) * 9 - 1));
    end loop;
    return result;
  end;
  function toSLV (value :  array_of_Maybe) return std_logic_vector is
    alias ivalue    : array_of_Maybe(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 8);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 8) + 1 to i*8) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_Maybe is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_Maybe(0 to slv'length / 8 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 8 to (i+1) * 8 - 1));
    end loop;
    return result;
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
end;

