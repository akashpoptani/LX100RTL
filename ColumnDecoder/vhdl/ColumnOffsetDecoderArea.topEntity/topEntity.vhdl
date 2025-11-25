-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ColumnOffsetDecoderArea_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk      : in ColumnOffsetDecoderArea_topEntity_types.clk_System;
       -- reset
       rst      : in ColumnOffsetDecoderArea_topEntity_types.rst_System;
       -- enable
       en       : in ColumnOffsetDecoderArea_topEntity_types.en_System;
       inputSig : in unsigned(6 downto 0);
       result   : out std_logic_vector(127 downto 0));
end;

architecture structural of topEntity is
  signal \c$app_arg\      : std_logic_vector(127 downto 0);
  signal \c$app_arg_0\    : ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic_vector_16(0 to 7);
  signal \c$app_arg_1\    : ColumnOffsetDecoderArea_topEntity_types.array_of_array_of_16_std_logic(0 to 7);
  signal \c$app_arg_2\    : ColumnOffsetDecoderArea_topEntity_types.array_of_array_of_16_std_logic(0 to 7);
  signal \c$app_arg_3\    : ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic(0 to 15);
  signal \c$app_arg_4\    : ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic_vector_1(0 to 15);
  signal \c$app_arg_5\    : std_logic_vector(15 downto 0);
  signal wild             : signed(63 downto 0);
  signal \c$wild_app_arg\ : signed(63 downto 0);
  signal \c$app_arg_6\    : signed(63 downto 0);
  signal \c$app_arg_7\    : std_logic_vector(6 downto 0);
  signal \c$vec\          : std_logic_vector(15 downto 0);
  signal \c$shI\          : signed(63 downto 0);

begin
  result <= \c$app_arg\;

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
      signal \c$app_arg_9\ : ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic_vector_1(0 to 15);
      signal result_1      : std_logic_vector(15 downto 0);
    begin
      \c$app_arg_0\(i_2) <= result_1;

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

      result_1 <= \c$app_arg_8\;


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
    signal vec_index : integer range 0 to 8-1;
  begin
    vec_index <= to_integer((signed(std_logic_vector(resize((resize(unsigned(std_logic_vector(\c$app_arg_6\)),3)),64)))))
    -- pragma translate_off
                 mod 8
    -- pragma translate_on
                 ;

    process(vec_index,\c$app_arg_3\)
      variable ivec : ColumnOffsetDecoderArea_topEntity_types.array_of_array_of_16_std_logic(0 to 7);
    begin
      ivec := ColumnOffsetDecoderArea_topEntity_types.array_of_array_of_16_std_logic'( ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic'( '0'
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
                                                                         , ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic'( '0'
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
                                                                         , ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic'( '0'
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
                                                                         , ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic'( '0'
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
                                                                         , ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic'( '0'
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
                                                                         , ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic'( '0'
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
                                                                         , ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic'( '0'
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
                                                                         , ColumnOffsetDecoderArea_topEntity_types.array_of_std_logic'( '0'
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
      ivec(vec_index) := \c$app_arg_3\;
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

  \c$vec\ <= (\c$app_arg_5\);

  -- unconcatBitVector begin
  unconcatBitVectorIter_loop : for i_5 in \c$app_arg_4\'range generate
    \c$app_arg_4\(\c$app_arg_4\'high - i_5) <= \c$vec\(((i_5 * 1) + 1 - 1) downto (i_5 * 1));
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

  \c$app_arg_7\ <= (std_logic_vector(inputSig));


end;

