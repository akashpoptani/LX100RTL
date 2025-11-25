-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ColumnOffsetDecoderBaseline_testBench_types.all;
use testBench_slv2string_FD7FE0FDE5409B5E.all;

entity testBench is
  port(result : out boolean);
end;

architecture structural of testBench is
  -- ColumnOffsetDecoderBaseline.hs:11:1-12
  signal \c$wild_app_arg\                                  : signed(63 downto 0);
  signal \c$ds_app_arg\                                    : ColumnOffsetDecoderBaseline_testBench_types.index_4;
  signal \c$ds_app_arg_0\                                  : unsigned(6 downto 0);
  signal s                                                 : ColumnOffsetDecoderBaseline_testBench_types.index_4 := to_unsigned(0,2);
  -- ColumnOffsetDecoderBaseline.hs:37:5-7
  signal \ColumnOffsetDecoderBaseline.testBench_clk\       : ColumnOffsetDecoderBaseline_testBench_types.clk_System;
  signal z                                                 : ColumnOffsetDecoderBaseline_testBench_types.index_7;
  signal result_1                                          : ColumnOffsetDecoderBaseline_testBench_types.index_4;
  signal \c$ds_app_arg_1\                                  : std_logic_vector(127 downto 0);
  signal \c$result_rec\                                    : boolean;
  signal s_0                                               : ColumnOffsetDecoderBaseline_testBench_types.index_4 := to_unsigned(0,2);
  signal f2                                                : boolean;
  signal \f'\                                              : boolean := false;
  signal result_2                                          : std_logic_vector(127 downto 0);
  -- ColumnOffsetDecoderBaseline.hs:11:1-12
  signal wild                                              : signed(63 downto 0);
  -- ColumnOffsetDecoderBaseline.hs:28:1-9
  signal \c$ColumnOffsetDecoderBaseline.testBench_app_arg\ : ColumnOffsetDecoderBaseline_testBench_types.rst_System;
  signal \c$ds_app_arg_selection_res\                      : boolean;
  signal \c$vec\                                           : ColumnOffsetDecoderBaseline_testBench_types.array_of_unsigned_7(0 to 3);
  signal result_selection_res                              : boolean;
  signal \c$vec_0\                                         : ColumnOffsetDecoderBaseline_testBench_types.array_of_std_logic_vector_128(0 to 3);
  signal \c$shI\                                           : signed(63 downto 0);

begin
  \c$wild_app_arg\ <= signed(std_logic_vector(resize(\c$ds_app_arg_0\,64)));

  \c$ds_app_arg_selection_res\ <= s < to_unsigned(3,2);

  \c$ds_app_arg\ <= s + to_unsigned(1,2) when \c$ds_app_arg_selection_res\ else
                    s;

  \c$vec\ <= ColumnOffsetDecoderBaseline_testBench_types.array_of_unsigned_7'( to_unsigned(0,7)
                                                                             , to_unsigned(1,7)
                                                                             , to_unsigned(2,7)
                                                                             , to_unsigned(3,7) );

  -- index begin
  indexVec : block
    signal vec_index : integer range 0 to 4-1;
  begin
    vec_index <= to_integer((signed(std_logic_vector(resize(s,64)))))
    -- pragma translate_off
                 mod 4
    -- pragma translate_on
                 ;
    \c$ds_app_arg_0\ <= \c$vec\(vec_index);
  end block;
  -- index end

  -- register begin
  s_register : process(\ColumnOffsetDecoderBaseline.testBench_clk\,\c$ColumnOffsetDecoderBaseline.testBench_app_arg\)
  begin
    if \c$ColumnOffsetDecoderBaseline.testBench_app_arg\ =  '1'  then
      s <= to_unsigned(0,2);
    elsif rising_edge(\ColumnOffsetDecoderBaseline.testBench_clk\) then
      s <= \c$ds_app_arg\;
    end if;
  end process;
  -- register end

  -- tbClockGen begin
  -- pragma translate_off
  clkGen : process is
    constant half_periodH : time := 10000000 fs / 2;
    constant half_periodL : time := 10000000 fs - half_periodH;
  begin
    \ColumnOffsetDecoderBaseline.testBench_clk\ <= '0';
    wait for 10000 ps;
    while (not \c$result_rec\) loop
      \ColumnOffsetDecoderBaseline.testBench_clk\ <= not \ColumnOffsetDecoderBaseline.testBench_clk\;
      wait for half_periodH;
      \ColumnOffsetDecoderBaseline.testBench_clk\ <= not \ColumnOffsetDecoderBaseline.testBench_clk\;
      wait for half_periodL;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  -- tbClockGen end

  z <= resize(s_0,3) + resize(to_unsigned(1,2),3);

  result_selection_res <= z > to_unsigned(3,3);

  result_1 <= to_unsigned(3,2) when result_selection_res else
              resize(z,2);

  \c$vec_0\ <= ColumnOffsetDecoderBaseline_testBench_types.array_of_std_logic_vector_128'( std_logic_vector'(x"00000000000000000000000000000001")
                                                                                         , std_logic_vector'(x"00000000000000000000000000000002")
                                                                                         , std_logic_vector'(x"00000000000000000000000000000004")
                                                                                         , std_logic_vector'(x"00000000000000000000000000000008") );

  -- index begin
  indexVec_0 : block
    signal vec_index_0 : integer range 0 to 4-1;
  begin
    vec_index_0 <= to_integer((signed(std_logic_vector(resize(s_0,64)))))
    -- pragma translate_off
                 mod 4
    -- pragma translate_on
                 ;
    \c$ds_app_arg_1\ <= \c$vec_0\(vec_index_0);
  end block;
  -- index end

  \c$result_rec\ <= \f'\ when \f'\ else
                    f2;

  -- register begin
  s_0_register : process(\ColumnOffsetDecoderBaseline.testBench_clk\,\c$ColumnOffsetDecoderBaseline.testBench_app_arg\)
  begin
    if \c$ColumnOffsetDecoderBaseline.testBench_app_arg\ =  '1'  then
      s_0 <= to_unsigned(0,2);
    elsif rising_edge(\ColumnOffsetDecoderBaseline.testBench_clk\) then
      s_0 <= result_1;
    end if;
  end process;
  -- register end

  -- assert begin
  r_assert : block
    -- pragma translate_off
    signal actual : std_logic_vector(127 downto 0);
    signal expected : std_logic_vector(127 downto 0);
    -- pragma translate_on
  begin
    -- pragma translate_off
    actual <= result_2;
    expected <= \c$ds_app_arg_1\;
    process(\ColumnOffsetDecoderBaseline.testBench_clk\) is
    begin
      if (rising_edge(\ColumnOffsetDecoderBaseline.testBench_clk\)) then
        assert (toSLV(actual) = toSLV(expected)) report (("outputVerifier") & ", expected: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(expected)) & ", actual: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(actual))) severity error;
      end if;
    end process;
    -- pragma translate_on
    f2 <= \f'\;
  end block;
  -- assert end

  -- register begin
  f_register : process(\ColumnOffsetDecoderBaseline.testBench_clk\,\c$ColumnOffsetDecoderBaseline.testBench_app_arg\)
  begin
    if \c$ColumnOffsetDecoderBaseline.testBench_app_arg\ =  '1'  then
      \f'\ <= false;
    elsif rising_edge(\ColumnOffsetDecoderBaseline.testBench_clk\) then
      \f'\ <= (s_0 = to_unsigned(3,2));
    end if;
  end process;
  -- register end

  \c$shI\ <= wild;

  result_2_shiftL : block
    signal sh : natural;
  begin
    sh <=
        -- pragma translate_off
        natural'high when (\c$shI\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI\);
    result_2 <= std_logic_vector(shift_left(unsigned(std_logic_vector'(x"00000000000000000000000000000001")),sh))
        -- pragma translate_off
        when (wild >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  wild <= \c$wild_app_arg\;

  -- resetGen begin
  resetGen : block
    constant reset_delay : time := 10000 ps - 1 ps + (integer'(1) * 10000 ps);
  begin
  -- pragma translate_off
  \c$ColumnOffsetDecoderBaseline.testBench_app_arg\
    <= '1',
       '0' after reset_delay;
  -- pragma translate_on
  end block;
  -- resetGen end

  result <= \c$result_rec\;


end;

