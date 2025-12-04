/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP5
// Date      : Tue Dec  2 17:14:16 2025
/////////////////////////////////////////////////////////////


module topEntity ( clk, rst, en, addr, result_0, result_1, result_2, result_3, 
        result_4, result_5 );
  input [33:0] addr;
  output [15:0] result_0;
  output [1:0] result_1;
  output [1:0] result_2;
  output [6:0] result_3;
  output [5:0] result_5;
  input clk, rst, en;
  output result_4;


  BUFFD3BWP30P140 U3 ( .I(addr[0]), .Z(result_5[0]) );
  BUFFD3BWP30P140 U4 ( .I(addr[4]), .Z(result_5[4]) );
  BUFFD3BWP30P140 U5 ( .I(addr[19]), .Z(result_0[1]) );
  BUFFD3BWP30P140 U6 ( .I(addr[6]), .Z(result_4) );
  BUFFD3BWP30P140 U7 ( .I(addr[33]), .Z(result_0[15]) );
  BUFFD3BWP30P140 U8 ( .I(addr[32]), .Z(result_0[14]) );
  BUFFD3BWP30P140 U9 ( .I(addr[31]), .Z(result_0[13]) );
  BUFFD3BWP30P140 U10 ( .I(addr[30]), .Z(result_0[12]) );
  BUFFD3BWP30P140 U11 ( .I(addr[29]), .Z(result_0[11]) );
  BUFFD3BWP30P140 U12 ( .I(addr[28]), .Z(result_0[10]) );
  BUFFD3BWP30P140 U13 ( .I(addr[27]), .Z(result_0[9]) );
  BUFFD3BWP30P140 U14 ( .I(addr[26]), .Z(result_0[8]) );
  BUFFD3BWP30P140 U15 ( .I(addr[25]), .Z(result_0[7]) );
  BUFFD3BWP30P140 U16 ( .I(addr[24]), .Z(result_0[6]) );
  BUFFD3BWP30P140 U17 ( .I(addr[23]), .Z(result_0[5]) );
  BUFFD3BWP30P140 U18 ( .I(addr[22]), .Z(result_0[4]) );
  BUFFD3BWP30P140 U19 ( .I(addr[21]), .Z(result_0[3]) );
  BUFFD3BWP30P140 U20 ( .I(addr[20]), .Z(result_0[2]) );
  BUFFD3BWP30P140 U21 ( .I(addr[18]), .Z(result_0[0]) );
  BUFFD3BWP30P140 U22 ( .I(addr[17]), .Z(result_1[1]) );
  BUFFD3BWP30P140 U23 ( .I(addr[16]), .Z(result_1[0]) );
  BUFFD3BWP30P140 U24 ( .I(addr[15]), .Z(result_2[1]) );
  BUFFD3BWP30P140 U25 ( .I(addr[14]), .Z(result_2[0]) );
  BUFFD3BWP30P140 U26 ( .I(addr[13]), .Z(result_3[6]) );
  BUFFD3BWP30P140 U27 ( .I(addr[12]), .Z(result_3[5]) );
  BUFFD3BWP30P140 U28 ( .I(addr[1]), .Z(result_5[1]) );
  BUFFD3BWP30P140 U29 ( .I(addr[2]), .Z(result_5[2]) );
  BUFFD3BWP30P140 U30 ( .I(addr[3]), .Z(result_5[3]) );
  BUFFD3BWP30P140 U31 ( .I(addr[5]), .Z(result_5[5]) );
  BUFFD3BWP30P140 U32 ( .I(addr[7]), .Z(result_3[0]) );
  BUFFD3BWP30P140 U33 ( .I(addr[8]), .Z(result_3[1]) );
  BUFFD3BWP30P140 U34 ( .I(addr[9]), .Z(result_3[2]) );
  BUFFD3BWP30P140 U35 ( .I(addr[10]), .Z(result_3[3]) );
  BUFFD3BWP30P140 U36 ( .I(addr[11]), .Z(result_3[4]) );
endmodule

