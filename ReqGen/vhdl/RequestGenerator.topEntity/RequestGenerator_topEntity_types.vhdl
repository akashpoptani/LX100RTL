library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package RequestGenerator_topEntity_types is


  subtype rst_System is std_logic;


  subtype en_System is boolean;
  type MemReq is record
    MemReq_sel0_memValid : boolean;
    MemReq_sel1_memAddr : std_logic_vector(33 downto 0);
  end record;
  subtype clk_System is std_logic;

  type Tup2_0 is record
    Tup2_0_sel0_std_logic_vector : std_logic_vector(10 downto 0);
    Tup2_0_sel1_MemReq : MemReq;
  end record;
  type array_of_std_logic_vector_11 is array (integer range <>) of std_logic_vector(10 downto 0);
  type Tup2 is record
    Tup2_sel0_unsigned : unsigned(4 downto 0);
    Tup2_sel1_std_logic_vector : std_logic_vector(10 downto 0);
  end record;
  subtype Maybe is std_logic_vector(16 downto 0);
  function toSLV (u : in unsigned) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return unsigned;
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
  function tagToEnum (s : in signed) return boolean;
  function dataToTag (b : in boolean) return signed;
  function toSLV (sl : in std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic;
  function toSLV (slv : in std_logic_vector) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic_vector;
  function toSLV (p : MemReq) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return MemReq;
  function toSLV (s : in signed) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return signed;
  function toSLV (p : Tup2_0) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup2_0;
  function toSLV (value :  array_of_std_logic_vector_11) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic_vector_11;
  function toSLV (p : Tup2) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup2;
end;

package body RequestGenerator_topEntity_types is
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
  function toSLV (sl : in std_logic) return std_logic_vector is
  begin
    return std_logic_vector'(0 => sl);
  end;
  function fromSLV (slv : in std_logic_vector) return std_logic is
    alias islv : std_logic_vector (0 to slv'length - 1) is slv;
  begin
    return islv(0);
  end;
  function toSLV (slv : in std_logic_vector) return std_logic_vector is
  begin
    return slv;
  end;
  function fromSLV (slv : in std_logic_vector) return std_logic_vector is
  begin
    return slv;
  end;
  function toSLV (p : MemReq) return std_logic_vector is
  begin
    return (toSLV(p.MemReq_sel0_memValid) & toSLV(p.MemReq_sel1_memAddr));
  end;
  function fromSLV (slv : in std_logic_vector) return MemReq is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 0)),fromSLV(islv(1 to 34)));
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
  function toSLV (p : Tup2_0) return std_logic_vector is
  begin
    return (toSLV(p.Tup2_0_sel0_std_logic_vector) & toSLV(p.Tup2_0_sel1_MemReq));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup2_0 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 10)),fromSLV(islv(11 to 45)));
  end;
  function toSLV (value :  array_of_std_logic_vector_11) return std_logic_vector is
    alias ivalue    : array_of_std_logic_vector_11(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 11);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 11) + 1 to i*11) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic_vector_11 is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_std_logic_vector_11(0 to slv'length / 11 - 1);
  begin
    for i in result'range loop
      result(i) := islv(i * 11 to (i+1) * 11 - 1);
    end loop;
    return result;
  end;
  function toSLV (p : Tup2) return std_logic_vector is
  begin
    return (toSLV(p.Tup2_sel0_unsigned) & toSLV(p.Tup2_sel1_std_logic_vector));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup2 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 4)),fromSLV(islv(5 to 15)));
  end;
end;

