/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP5
// Date      : Tue Dec  2 17:14:45 2025
/////////////////////////////////////////////////////////////


module topEntity ( clk, rst, en, ro, ba, bg, ch, co, result );
  input [15:0] ro;
  input [1:0] ba;
  input [1:0] bg;
  input [0:0] ch;
  input [6:0] co;
  output [33:0] result;
  input clk, rst, en;
  wire   n7;

  INVD2BWP30P140 U3 ( .I(n7), .ZN(result[5]) );
  INVD2BWP30P140 U4 ( .I(n7), .ZN(result[4]) );
  INVD2BWP30P140 U5 ( .I(n7), .ZN(result[3]) );
  INVD2BWP30P140 U6 ( .I(n7), .ZN(result[2]) );
  INVD2BWP30P140 U7 ( .I(n7), .ZN(result[1]) );
  INVD2BWP30P140 U8 ( .I(n7), .ZN(result[0]) );
  TIEHBWP30P140 U9 ( .Z(n7) );
  BUFFD3BWP30P140 U10 ( .I(ch[0]), .Z(result[6]) );
  BUFFD3BWP30P140 U11 ( .I(ro[1]), .Z(result[19]) );
  BUFFD3BWP30P140 U12 ( .I(ro[15]), .Z(result[33]) );
  BUFFD3BWP30P140 U13 ( .I(ro[14]), .Z(result[32]) );
  BUFFD3BWP30P140 U14 ( .I(ro[13]), .Z(result[31]) );
  BUFFD3BWP30P140 U15 ( .I(ro[12]), .Z(result[30]) );
  BUFFD3BWP30P140 U16 ( .I(ro[11]), .Z(result[29]) );
  BUFFD3BWP30P140 U17 ( .I(ro[10]), .Z(result[28]) );
  BUFFD3BWP30P140 U18 ( .I(ro[9]), .Z(result[27]) );
  BUFFD3BWP30P140 U19 ( .I(ro[8]), .Z(result[26]) );
  BUFFD3BWP30P140 U20 ( .I(ro[7]), .Z(result[25]) );
  BUFFD3BWP30P140 U21 ( .I(ro[6]), .Z(result[24]) );
  BUFFD3BWP30P140 U22 ( .I(ro[5]), .Z(result[23]) );
  BUFFD3BWP30P140 U23 ( .I(ro[4]), .Z(result[22]) );
  BUFFD3BWP30P140 U24 ( .I(ro[3]), .Z(result[21]) );
  BUFFD3BWP30P140 U25 ( .I(ro[2]), .Z(result[20]) );
  BUFFD3BWP30P140 U26 ( .I(ro[0]), .Z(result[18]) );
  BUFFD3BWP30P140 U27 ( .I(ba[1]), .Z(result[17]) );
  BUFFD3BWP30P140 U28 ( .I(ba[0]), .Z(result[16]) );
  BUFFD3BWP30P140 U29 ( .I(bg[1]), .Z(result[15]) );
  BUFFD3BWP30P140 U30 ( .I(bg[0]), .Z(result[14]) );
  BUFFD3BWP30P140 U31 ( .I(co[6]), .Z(result[13]) );
  BUFFD3BWP30P140 U32 ( .I(co[5]), .Z(result[12]) );
  BUFFD3BWP30P140 U33 ( .I(co[4]), .Z(result[11]) );
  BUFFD3BWP30P140 U34 ( .I(co[0]), .Z(result[7]) );
  BUFFD3BWP30P140 U35 ( .I(co[1]), .Z(result[8]) );
  BUFFD3BWP30P140 U36 ( .I(co[2]), .Z(result[9]) );
  BUFFD3BWP30P140 U37 ( .I(co[3]), .Z(result[10]) );
endmodule

