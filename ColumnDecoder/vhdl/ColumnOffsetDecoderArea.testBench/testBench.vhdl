-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ColumnOffsetDecoderArea_testBench_types.all;
use testBench_slv2string_FD7FE0FDE5409B5E.all;

entity testBench is
  port(result : out boolean);
end;

architecture structural of testBench is
  signal \c$ds_app_arg\                                : ColumnOffsetDecoderArea_testBench_types.index_4;
  signal \c$ds_app_arg_0\                              : unsigned(6 downto 0);
  signal s                                             : ColumnOffsetDecoderArea_testBench_types.index_4 := to_unsigned(0,2);
  -- ColumnOffsetDecoderArea.hs:46:5-7
  signal \ColumnOffsetDecoderArea.testBench_clk\       : ColumnOffsetDecoderArea_testBench_types.clk_System;
  signal z                                             : ColumnOffsetDecoderArea_testBench_types.index_7;
  signal result_1                                      : ColumnOffsetDecoderArea_testBench_types.index_4;
  signal \c$ds_app_arg_1\                              : std_logic_vector(127 downto 0);
  signal \c$result_rec\                                : boolean;
  signal s_0                                           : ColumnOffsetDecoderArea_testBench_types.index_4 := to_unsigned(0,2);
  signal f2                                            : boolean;
  signal \f'\                                          : boolean := false;
  signal result_2                                      : std_logic_vector(127 downto 0);
  signal \c$app_arg\                                   : std_logic_vector(127 downto 0);
  signal \c$app_arg_0\                                 : ColumnOffsetDecoderArea_testBench_types.array_of_std_logic_vector_16(0 to 7);
  signal \c$app_arg_1\                                 : ColumnOffsetDecoderArea_testBench_types.array_of_array_of_16_std_logic(0 to 7);
  signal \c$app_arg_2\                                 : ColumnOffsetDecoderArea_testBench_types.array_of_array_of_16_std_logic(0 to 7);
  signal \c$app_arg_3\                                 : ColumnOffsetDecoderArea_testBench_types.array_of_std_logic(0 to 15);
  signal \c$app_arg_4\                                 : ColumnOffsetDecoderArea_testBench_types.array_of_std_logic_vector_1(0 to 15);
  signal \c$app_arg_5\                                 : std_logic_vector(15 downto 0);
  signal wild                                          : signed(63 downto 0);
  signal \c$wild_app_arg\                              : signed(63 downto 0);
  signal \c$app_arg_6\                                 : signed(63 downto 0);
  signal \c$app_arg_7\                                 : std_logic_vector(6 downto 0);
  -- ColumnOffsetDecoderArea.hs:37:1-9
  signal \c$ColumnOffsetDecoderArea.testBench_app_arg\ : ColumnOffsetDecoderArea_testBench_types.rst_System;
  signal \c$ds_app_arg_selection_res\                  : boolean;
  signal \c$vec\                                       : ColumnOffsetDecoderArea_testBench_types.array_of_unsigned_7(0 to 3);
  signal result_selection_res                          : boolean;
  signal \c$vec_0\                                     : ColumnOffsetDecoderArea_testBench_types.array_of_std_logic_vector_128(0 to 3);
  signal \c$vec_1\                                     : std_logic_vector(15 downto 0);
  signal \c$shI\                                       : signed(63 downto 0);

begin
  \c$ds_app_arg_selection_res\ <= s < to_unsigned(3,2);

  \c$ds_app_arg\ <= s + to_unsigned(1,2) when \c$ds_app_arg_selection_res\ else
                    s;

  \c$vec\ <= ColumnOffsetDecoderArea_testBench_types.array_of_unsigned_7'( to_unsigned(0,7)
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
  s_register : process(\ColumnOffsetDecoderArea.testBench_clk\,\c$ColumnOffsetDecoderArea.testBench_app_arg\)
  begin
    if \c$ColumnOffsetDecoderArea.testBench_app_arg\ =  '1'  then
      s <= to_unsigned(0,2);
    elsif rising_edge(\ColumnOffsetDecoderArea.testBench_clk\) then
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
    \ColumnOffsetDecoderArea.testBench_clk\ <= '0';
    wait for 10000 ps;
    while (not \c$result_rec\) loop
      \ColumnOffsetDecoderArea.testBench_clk\ <= not \ColumnOffsetDecoderArea.testBench_clk\;
      wait for half_periodH;
      \ColumnOffsetDecoderArea.testBench_clk\ <= not \ColumnOffsetDecoderArea.testBench_clk\;
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

  \c$vec_0\ <= ColumnOffsetDecoderArea_testBench_types.array_of_std_logic_vector_128'( std_logic_vector'(x"00000000000000000000000000000001")
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
  s_0_register : process(\ColumnOffsetDecoderArea.testBench_clk\,\c$ColumnOffsetDecoderArea.testBench_app_arg\)
  begin
    if \c$ColumnOffsetDecoderArea.testBench_app_arg\ =  '1'  then
      s_0 <= to_unsigned(0,2);
    elsif rising_edge(\ColumnOffsetDecoderArea.testBench_clk\) then
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
    process(\ColumnOffsetDecoderArea.testBench_clk\) is
    begin
      if (rising_edge(\ColumnOffsetDecoderArea.testBench_clk\)) then
        assert (toSLV(actual) = toSLV(expected)) report (("outputVerifier") & ", expected: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(expected)) & ", actual: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(actual))) severity error;
      end if;
    end process;
    -- pragma translate_on
    f2 <= \f'\;
  end block;
  -- assert end

  -- register begin
  f_register : process(\ColumnOffsetDecoderArea.testBench_clk\,\c$ColumnOffsetDecoderArea.testBench_app_arg\)
  begin
    if \c$ColumnOffsetDecoderArea.testBench_app_arg\ =  '1'  then
      \f'\ <= false;
    elsif rising_edge(\ColumnOffsetDecoderArea.testBench_clk\) then
      \f'\ <= (s_0 = to_unsigned(3,2));
    end if;
  end process;
  -- register end

  result_2 <= \c$app_arg\;

  -- concatBitVector begin
  concatBitVectorIter_loop : for i in 0 to (8 - 1) generate
    \c$app_arg\(((i * 16) + 16 - 1) downto (i * 16)) <= std_logic_vector'(\c$app_arg_0\(\c$app_arg_0\'high - i));
  end generate;
  -- concatBitVector end

  -- map begin
  r_map_0 : for i_2 in \c$app_arg_0\'range generate
  begin
    fun_0 : block
      signal \c$app_arg_8\ : std_logic_vector(15 downto 0);
      signal \c$app_arg_9\ : ColumnOffsetDecoderArea_testBench_types.array_of_std_logic_vector_1(0 to 15);
      signal result_3      : std_logic_vector(15 downto 0);
    begin
      \c$app_arg_0\(i_2) <= result_3;

      -- concatBitVector begin
      concatBitVectorIter_loop_0 : for i_0 in 0 to (16 - 1) generate
        \c$app_arg_8\(((i_0 * 1) + 1 - 1) downto (i_0 * 1)) <= std_logic_vector'(\c$app_arg_9\(\c$app_arg_9\'high - i_0));
      end generate;
      -- concatBitVector end

      -- map begin
      r_map : for i_1 in \c$app_arg_9\'range generate
      begin
        \c$app_arg_9\(i_1) <= (std_logic_vector'(0 => \c$app_arg_1\(i_2)(i_1)));


      end generate;
      -- map end

      result_3 <= \c$app_arg_8\;


    end block;
  end generate;
  -- map end

  -- reverse begin
  reverse_loop : for i_3 in 0 to (8 - 1) generate
    \c$app_arg_1\(\c$app_arg_2\'high - i_3) <= \c$app_arg_2\(i_3);
  end generate;
  -- reverse end

  -- replace begin
  replaceVec : block
    signal vec_index_1 : integer range 0 to 8-1;
  begin
    vec_index_1 <= to_integer((signed(std_logic_vector(resize((resize(unsigned(std_logic_vector(\c$app_arg_6\)),3)),64)))))
    -- pragma translate_off
                 mod 8
    -- pragma translate_on
                 ;

    process(vec_index_1,\c$app_arg_3\)
      variable ivec : ColumnOffsetDecoderArea_testBench_types.array_of_array_of_16_std_logic(0 to 7);
    begin
      ivec := ColumnOffsetDecoderArea_testBench_types.array_of_array_of_16_std_logic'( ColumnOffsetDecoderArea_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                         , ColumnOffsetDecoderArea_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                         , ColumnOffsetDecoderArea_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                         , ColumnOffsetDecoderArea_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                         , ColumnOffsetDecoderArea_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                         , ColumnOffsetDecoderArea_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                         , ColumnOffsetDecoderArea_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                         , ColumnOffsetDecoderArea_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' ) );
      ivec(vec_index_1) := \c$app_arg_3\;
      \c$app_arg_2\ <= ivec;
    end process;
  end block;
  -- replace end

  -- map begin
  r_map_1 : for i_4 in \c$app_arg_3\'range generate
  begin
    \c$app_arg_3\(i_4) <= \c$app_arg_4\(i_4)(0);


  end generate;
  -- map end

  \c$vec_1\ <= (\c$app_arg_5\);

  -- unconcatBitVector begin
  unconcatBitVectorIter_loop : for i_5 in \c$app_arg_4\'range generate
    \c$app_arg_4\(\c$app_arg_4\'high - i_5) <= \c$vec_1\(((i_5 * 1) + 1 - 1) downto (i_5 * 1));
  end generate;
  -- unconcatBitVector end

  \c$shI\ <= wild;

  capp_arg_5_shiftL : block
    signal sh : natural;
  begin
    sh <=
        -- pragma translate_off
        natural'high when (\c$shI\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI\);
    \c$app_arg_5\ <= std_logic_vector(shift_left(unsigned(std_logic_vector'(x"0001")),sh))
        -- pragma translate_off
        when (wild >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  wild <= \c$wild_app_arg\;

  \c$wild_app_arg\ <= signed(std_logic_vector(resize(unsigned((\c$app_arg_7\(3 downto 0))),64)));

  \c$app_arg_6\ <= signed(std_logic_vector(resize(unsigned((\c$app_arg_7\(6 downto 4))),64)));

  \c$app_arg_7\ <= (std_logic_vector(\c$ds_app_arg_0\));

  -- resetGen begin
  resetGen : block
    constant reset_delay : time := 10000 ps - 1 ps + (integer'(1) * 10000 ps);
  begin
  -- pragma translate_off
  \c$ColumnOffsetDecoderArea.testBench_app_arg\
    <= '1',
       '0' after reset_delay;
  -- pragma translate_on
  end block;
  -- resetGen end

  result <= \c$result_rec\;


end;

