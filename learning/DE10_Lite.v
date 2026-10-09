// This file was automatically created by py4hw Verilog generator
module DE10_Lite (
	input MAX10_CLK1_50,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5);
wire [31:0] w_q;
wire [3:0] w_bcd_4;
wire [6:0] w_HEXn3;
wire [3:0] w_bcd_1;
wire [6:0] w_HEXn0;
wire [15:0] w_seconds;
wire [6:0] w_HEXn5;
wire [3:0] w_bcd_5;
wire [3:0] w_bcd_2;
wire [6:0] w_HEXn1;
wire w_one;
wire w_reset;
wire [3:0] w_bcd_3;
wire [6:0] w_HEXn4;
wire w_second_tick;
wire [3:0] w_bcd_0;
wire [6:0] w_HEXn2;

assign HEX0 = ~w_HEXn0;
assign HEX1 = ~w_HEXn1;
assign HEX2 = ~w_HEXn2;
assign HEX3 = ~w_HEXn3;
assign HEX4 = ~w_HEXn4;
assign HEX5 = ~w_HEXn5;
assign w_one = 1;
assign w_reset = 0;
ModuloCounter_1d593e117f0 i_mod(.MAX10_CLK1_50(MAX10_CLK1_50),.reset(w_reset),.inc(w_one),.q(w_q),.carryout(w_second_tick));
Counter_1d593e12660 i_counter(.MAX10_CLK1_50(MAX10_CLK1_50),.reset(w_reset),.inc(w_second_tick),.q(w_seconds));
BinaryToBCDDigits_1d593e127b0 i_bin2bcd(.a(w_seconds),.r0(w_bcd_0),.r1(w_bcd_1),.r2(w_bcd_2),.r3(w_bcd_3),.r4(w_bcd_4),.r5(w_bcd_5));
Digit7Segment_1d593e12900 i_ss0(.v(w_bcd_0),.led(w_HEXn0));
Digit7Segment_1d593eb9590 i_ss1(.v(w_bcd_1),.led(w_HEXn1));
Digit7Segment_1d593eb9810 i_ss2(.v(w_bcd_2),.led(w_HEXn2));
Digit7Segment_1d593dbfa80 i_ss3(.v(w_bcd_3),.led(w_HEXn3));
Digit7Segment_1d593dbfce0 i_ss4(.v(w_bcd_4),.led(w_HEXn4));
Digit7Segment_1d593f30290 i_ss5(.v(w_bcd_5),.led(w_HEXn5));
endmodule

// This file was automatically created by py4hw Verilog generator
module ModuloCounter_1d593e117f0 (
	input MAX10_CLK1_50,
	input  reset,
	input  inc,
	output [31:0] q,
	output  carryout);
wire [31:0] w_d1;
wire [31:0] w_one;
wire w_e_add;
wire w_anyreset;
wire [31:0] w_zero;
wire [31:0] w_d;
wire [31:0] w_add;

assign w_one[31:0] = 1;
assign w_zero[31:0] = 0;
assign w_anyreset = reset | carryout;
assign w_d1 = (inc)? w_add : q;
assign w_d = (w_anyreset)? w_zero : w_d1;
assign w_e_add = reset | inc;
Add32 i_add(.a(q),.b(w_one),.r(w_add));
Reg32E i_reg(.MAX10_CLK1_50(MAX10_CLK1_50),.d(w_d),.e(w_e_add),.q(q));
assign carryout = (q == 49999999)? 1 : 0;
endmodule

// This file was automatically created by py4hw Verilog generator
module Add32 (
	input [31:0] a,
	input [31:0] b,
	output [31:0] r);
wire w_ci;

assign w_ci = 0;
assign r = a + b + w_ci;
endmodule

// This file was automatically created by py4hw Verilog generator
module Reg32E (
	input MAX10_CLK1_50,
	input [31:0] d,
	input  e,
	output [31:0] q);
reg [31:0] rq = 0;
always @(posedge MAX10_CLK1_50)
if (e == 1)
begin
   rq <= d;
end
assign q = rq;
endmodule

// This file was automatically created by py4hw Verilog generator
module Counter_1d593e12660 (
	input MAX10_CLK1_50,
	input  reset,
	input  inc,
	output [15:0] q);
wire [15:0] w_add;
wire [15:0] w_d;
wire [15:0] w_d1;
wire [15:0] w_one;
wire [15:0] w_zero;
wire w_e_add;

assign w_one[15:0] = 1;
assign w_zero[15:0] = 0;
assign w_d1 = (inc)? w_add : q;
assign w_d = (reset)? w_zero : w_d1;
assign w_e_add = reset | inc;
Add16 i_add(.a(q),.b(w_one),.r(w_add));
Reg16E i_reg(.MAX10_CLK1_50(MAX10_CLK1_50),.d(w_d),.e(w_e_add),.q(q));
endmodule

// This file was automatically created by py4hw Verilog generator
module Add16 (
	input [15:0] a,
	input [15:0] b,
	output [15:0] r);
wire w_ci;

assign w_ci = 0;
assign r = a + b + w_ci;
endmodule

// This file was automatically created by py4hw Verilog generator
module Reg16E (
	input MAX10_CLK1_50,
	input [15:0] d,
	input  e,
	output [15:0] q);
reg [15:0] rq = 0;
always @(posedge MAX10_CLK1_50)
if (e == 1)
begin
   rq <= d;
end
assign q = rq;
endmodule

// This file was automatically created by py4hw Verilog generator
module BinaryToBCDDigits_1d593e127b0 (
	input [15:0] a,
	output [3:0] r0,
	output [3:0] r1,
	output [3:0] r2,
	output [3:0] r3,
	output [3:0] r4,
	output [3:0] r5);
wire [15:0] w_div4;
wire [15:0] w_div1;
wire [15:0] w_div2;
wire [15:0] w_div5;
wire [3:0] w_i0;
wire [15:0] w_div3;
wire [15:0] w_div0;

assign w_i0[3:0] = 10;
assign r0 = a % w_i0;
assign w_div0 = a / w_i0;
assign r1 = w_div0 % w_i0;
assign w_div1 = w_div0 / w_i0;
assign r2 = w_div1 % w_i0;
assign w_div2 = w_div1 / w_i0;
assign r3 = w_div2 % w_i0;
assign w_div3 = w_div2 / w_i0;
assign r4 = w_div3 % w_i0;
assign w_div4 = w_div3 / w_i0;
assign r5 = w_div4 % w_i0;
assign w_div5 = w_div4 / w_i0;
endmodule

// This file was automatically created by py4hw Verilog generator
module Digit7Segment_1d593e12900 (
	input [3:0] v,
	output [6:0] led);
wire w_c;
wire w_f;
wire w_g;
wire w_d;
wire w_e;
wire w_a;
wire w_b;

assign led ={w_g,w_f,w_e,w_d,w_c,w_b,w_a};
SumOfMinterms_1d593e12e40 i_a(.a(v),.r(w_a));
SumOfMinterms_1d593eb8f50 i_b(.a(v),.r(w_b));
SumOfMinterms_1d593eb9310 i_c(.a(v),.r(w_c));
SumOfMinterms_1d593dbf490 i_d(.a(v),.r(w_d));
SumOfMinterms_1d593dbf820 i_e(.a(v),.r(w_e));
SumOfMinterms_1d593f30050 i_f(.a(v),.r(w_f));
SumOfMinterms_1d593e1bf00 i_g(.a(v),.r(w_g));
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593e12e40 (
	input [3:0] a,
	output  r);
wire w_bits_0;
wire w_s0;
wire w_s6;
wire w_s9;
wire w_s11;
wire w_s1;
wire w_bits_1;
wire w_s2;
wire w_s8;
wire w_s3;
wire w_bits_2;
wire w_s4;
wire w_s5;
wire w_s10;
wire w_s7;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593eb8a50 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593eb8cd0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593dbc640 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593dbc180 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593de3ad0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593e1b570 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593e1b9b0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593e74e50 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593e75350 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593de64e0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d593de66c0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d593e0dc50 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593eb8a50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593eb8cd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593dbc640 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593dbc180 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593de3ad0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593e1b570 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593e1b9b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593e74e50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593e75350 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593de64e0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593de66c0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593e0dc50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593eb8f50 (
	input [3:0] a,
	output  r);
wire w_bits_0;
wire w_s9;
wire w_s0;
wire w_s1;
wire w_s4;
wire w_s8;
wire w_bits_1;
wire w_bits_2;
wire w_s2;
wire w_s3;
wire w_s5;
wire w_s7;
wire w_s6;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593e0e5f0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593ea42c0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593ec5fd0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593ec6390 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593e662b0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593e66620 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593d9f110 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593d9f250 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593d9f1b0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593d9f2f0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593e0e5f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593ea42c0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593ec5fd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593ec6390 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593e662b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593e66620 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f110 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f250 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f1b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f2f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593eb9310 (
	input [3:0] a,
	output  r);
wire w_s10;
wire w_s0;
wire w_bits_3;
wire w_s5;
wire w_s11;
wire w_s1;
wire w_s2;
wire w_s9;
wire w_bits_0;
wire w_bits_1;
wire w_s4;
wire w_s6;
wire w_s3;
wire w_s8;
wire w_bits_2;
wire w_s7;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593d9f430 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593d9f390 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593d9f4d0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593d9f570 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593d9f610 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593d9f6b0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593d9f750 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593d9f7f0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593d9f890 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593d9f930 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d593d9f9d0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d593d9fa70 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f430 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f390 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f4d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f570 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f610 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f6b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f750 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f7f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f890 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f930 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9f9d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9fa70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593dbf490 (
	input [3:0] a,
	output  r);
wire w_bits_3;
wire w_bits_0;
wire w_s2;
wire w_s4;
wire w_s8;
wire w_s0;
wire w_s1;
wire w_s6;
wire w_bits_1;
wire w_s3;
wire w_s5;
wire w_s7;
wire w_s9;
wire w_bits_2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593d9fb10 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593d9fbb0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593d9fc50 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593d9fcf0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593d9fd90 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593d9fe30 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593d9fed0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593d9ff70 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f04050 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f040f0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9fb10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9fbb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9fc50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9fcf0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9fd90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9fe30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9fed0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593d9ff70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04050 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f040f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593dbf820 (
	input [3:0] a,
	output  r);
wire w_s5;
wire w_s0;
wire w_s6;
wire w_s8;
wire w_bits_1;
wire w_bits_0;
wire w_s2;
wire w_s9;
wire w_bits_2;
wire w_s3;
wire w_s4;
wire w_s1;
wire w_s7;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f04190 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f04230 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f042d0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f04370 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f04410 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f044b0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f04550 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f045f0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f04690 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f04730 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04190 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n1;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04230 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f042d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04370 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n1;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04410 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f044b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04550 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f045f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04690 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04730 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593f30050 (
	input [3:0] a,
	output  r);
wire w_s6;
wire w_bits_3;
wire w_bits_0;
wire w_s0;
wire w_s1;
wire w_s3;
wire w_s4;
wire w_s5;
wire w_s7;
wire w_s9;
wire w_bits_1;
wire w_s8;
wire w_s10;
wire w_s2;
wire w_bits_2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f047d0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f04870 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f04910 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f049b0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f04a50 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f04af0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f04b90 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f04c30 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f04cd0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f04d70 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d593f04e10 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f047d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04870 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04910 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f049b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04a50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04af0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04b90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04c30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04cd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04d70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04e10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593e1bf00 (
	input [3:0] a,
	output  r);
wire w_bits_1;
wire w_bits_0;
wire w_s4;
wire w_s6;
wire w_s8;
wire w_s11;
wire w_bits_2;
wire w_s5;
wire w_s10;
wire w_bits_3;
wire w_s1;
wire w_s3;
wire w_s2;
wire w_s7;
wire w_s9;
wire w_s0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f04eb0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f04f50 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f04ff0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f05090 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f05130 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f051d0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f05270 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f05310 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f053b0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f05450 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d593f054f0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d593f05590 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04eb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04f50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f04ff0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05090 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05130 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f051d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05270 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05310 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f053b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05450 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f054f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05590 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Digit7Segment_1d593eb9590 (
	input [3:0] v,
	output [6:0] led);
wire w_c;
wire w_g;
wire w_d;
wire w_a;
wire w_e;
wire w_f;
wire w_b;

assign led ={w_g,w_f,w_e,w_d,w_c,w_b,w_a};
SumOfMinterms_1d593f58270 i_a(.a(v),.r(w_a));
SumOfMinterms_1d593e75850 i_b(.a(v),.r(w_b));
SumOfMinterms_1d593e75b50 i_c(.a(v),.r(w_c));
SumOfMinterms_1d593de6b70 i_d(.a(v),.r(w_d));
SumOfMinterms_1d593de6e40 i_e(.a(v),.r(w_e));
SumOfMinterms_1d593e0e970 i_f(.a(v),.r(w_f));
SumOfMinterms_1d593e0ec10 i_g(.a(v),.r(w_g));
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593f58270 (
	input [3:0] a,
	output  r);
wire w_s4;
wire w_bits_0;
wire w_s5;
wire w_s7;
wire w_s10;
wire w_bits_1;
wire w_s0;
wire w_s1;
wire w_s3;
wire w_s6;
wire w_s11;
wire w_bits_2;
wire w_s8;
wire w_s9;
wire w_bits_3;
wire w_s2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f05630 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f056d0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f05770 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f05810 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f058b0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f05950 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f059f0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f05a90 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f05b30 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f05bd0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d593f05c70 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d593f05d10 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05630 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f056d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05770 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05810 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f058b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05950 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f059f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05a90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05b30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05bd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05c70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05d10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593e75850 (
	input [3:0] a,
	output  r);
wire w_bits_2;
wire w_s2;
wire w_s3;
wire w_s6;
wire w_s5;
wire w_bits_3;
wire w_bits_0;
wire w_s4;
wire w_s7;
wire w_s9;
wire w_s0;
wire w_s1;
wire w_s8;
wire w_bits_1;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f05db0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f05e50 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f05ef0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f05f90 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f06030 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f060d0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f06170 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f06210 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f062b0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f06350 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05db0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05e50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05ef0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f05f90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06030 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f060d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06170 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06210 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f062b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06350 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593e75b50 (
	input [3:0] a,
	output  r);
wire w_bits_2;
wire w_bits_0;
wire w_s2;
wire w_s6;
wire w_s8;
wire w_s9;
wire w_bits_3;
wire w_s4;
wire w_s7;
wire w_s11;
wire w_s0;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s10;
wire w_bits_1;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f063f0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f06490 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f06530 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f065d0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f06670 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f06710 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f067b0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f06850 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f068f0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f06990 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d593f06a30 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d593f06ad0 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f063f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06490 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06530 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f065d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06670 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06710 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f067b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06850 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f068f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06990 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06a30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06ad0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593de6b70 (
	input [3:0] a,
	output  r);
wire w_bits_2;
wire w_s2;
wire w_s4;
wire w_s6;
wire w_s8;
wire w_bits_3;
wire w_s5;
wire w_s0;
wire w_s1;
wire w_s3;
wire w_s7;
wire w_s9;
wire w_bits_0;
wire w_bits_1;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f06b70 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f06c10 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f06cb0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f06d50 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f06df0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f06e90 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f06f30 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f06fd0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f07070 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f07110 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06b70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06c10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06cb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06d50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06df0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06e90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06f30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f06fd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07070 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07110 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593de6e40 (
	input [3:0] a,
	output  r);
wire w_bits_1;
wire w_s2;
wire w_bits_2;
wire w_bits_0;
wire w_s4;
wire w_s6;
wire w_s7;
wire w_s8;
wire w_s9;
wire w_bits_3;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f071b0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f07250 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f072f0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f07390 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f07430 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f074d0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f07570 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f07610 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f076b0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f07750 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f071b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07250 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f072f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07390 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07430 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f074d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07570 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07610 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f076b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07750 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593e0e970 (
	input [3:0] a,
	output  r);
wire w_s0;
wire w_bits_0;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s7;
wire w_bits_1;
wire w_s8;
wire w_s9;
wire w_bits_2;
wire w_s2;
wire w_s4;
wire w_s6;
wire w_s10;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f077f0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f07890 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d593f07930 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d593f079d0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d593f07a70 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d593f07b10 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d593f07bb0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d593f07c50 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d593f07cf0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d593f07d90 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d593f07e30 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f077f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07890 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07930 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f079d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07a70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07b10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07bb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07c50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07cf0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07d90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07e30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593e0ec10 (
	input [3:0] a,
	output  r);
wire w_bits_2;
wire w_bits_0;
wire w_s4;
wire w_s5;
wire w_s11;
wire w_s6;
wire w_bits_3;
wire w_s1;
wire w_s3;
wire w_s7;
wire w_s8;
wire w_s0;
wire w_s2;
wire w_s9;
wire w_s10;
wire w_bits_1;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d593f07ed0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d593f07f70 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403c050 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403c0f0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403c190 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403c230 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403c2d0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403c370 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403c410 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403c4b0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59403c550 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59403c5f0 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07ed0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d593f07f70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c050 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c0f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c190 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c230 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c2d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c370 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c410 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c4b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c550 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c5f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Digit7Segment_1d593eb9810 (
	input [3:0] v,
	output [6:0] led);
wire w_d;
wire w_e;
wire w_a;
wire w_b;
wire w_f;
wire w_c;
wire w_g;

assign led ={w_g,w_f,w_e,w_d,w_c,w_b,w_a};
SumOfMinterms_1d593ea5230 i_a(.a(v),.r(w_a));
SumOfMinterms_1d594062390 i_b(.a(v),.r(w_b));
SumOfMinterms_1d594098350 i_c(.a(v),.r(w_c));
SumOfMinterms_1d5940a1390 i_d(.a(v),.r(w_d));
SumOfMinterms_1d5940a2af0 i_e(.a(v),.r(w_e));
SumOfMinterms_1d59403e850 i_f(.a(v),.r(w_f));
SumOfMinterms_1d59403efd0 i_g(.a(v),.r(w_g));
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d593ea5230 (
	input [3:0] a,
	output  r);
wire w_bits_1;
wire w_s0;
wire w_s1;
wire w_s3;
wire w_s7;
wire w_s11;
wire w_s10;
wire w_bits_2;
wire w_s6;
wire w_s5;
wire w_s9;
wire w_bits_3;
wire w_s2;
wire w_s4;
wire w_s8;
wire w_bits_0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59403c690 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59403c730 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403c7d0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403c870 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403c910 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403c9b0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403ca50 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403caf0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403cb90 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403cc30 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59403ccd0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59403cd70 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c690 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c730 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c7d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c870 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c910 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403c9b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ca50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403caf0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403cb90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403cc30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ccd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403cd70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594062390 (
	input [3:0] a,
	output  r);
wire w_bits_3;
wire w_bits_0;
wire w_s4;
wire w_s6;
wire w_s9;
wire w_s2;
wire w_s0;
wire w_s1;
wire w_s8;
wire w_s5;
wire w_bits_1;
wire w_s3;
wire w_s7;
wire w_bits_2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59403ce10 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59403ceb0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403cf50 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403cff0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403d090 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403d130 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403d1d0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403d270 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403d310 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403d3b0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ce10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ceb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403cf50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403cff0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d090 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d130 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d1d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d270 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d310 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d3b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594098350 (
	input [3:0] a,
	output  r);
wire w_bits_2;
wire w_bits_3;
wire w_s4;
wire w_s6;
wire w_s8;
wire w_s2;
wire w_s0;
wire w_s1;
wire w_s3;
wire w_s7;
wire w_s10;
wire w_s9;
wire w_bits_1;
wire w_s5;
wire w_s11;
wire w_bits_0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59403d450 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59403d4f0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403d590 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403d630 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403d6d0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403d770 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403d810 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403d8b0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403d950 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403d9f0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59403da90 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59403db30 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d450 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d4f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d590 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d630 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d6d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d770 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d810 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d8b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d950 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403d9f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403da90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403db30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d5940a1390 (
	input [3:0] a,
	output  r);
wire w_s8;
wire w_bits_3;
wire w_s4;
wire w_s6;
wire w_s0;
wire w_s1;
wire w_s2;
wire w_s3;
wire w_s5;
wire w_s7;
wire w_s9;
wire w_bits_1;
wire w_bits_0;
wire w_bits_2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59403dbd0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59403dc70 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403dd10 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403ddb0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403de50 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403def0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403df90 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403e030 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403e0d0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403e170 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403dbd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403dc70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403dd10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ddb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403de50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403def0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403df90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e030 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e0d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e170 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d5940a2af0 (
	input [3:0] a,
	output  r);
wire w_bits_0;
wire w_bits_2;
wire w_s9;
wire w_s2;
wire w_bits_3;
wire w_s1;
wire w_s3;
wire w_s4;
wire w_s7;
wire w_s0;
wire w_s5;
wire w_s6;
wire w_s8;
wire w_bits_1;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59403e210 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59403e2b0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403e350 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403e3f0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403e490 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403e530 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403e5d0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403e670 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403e710 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403e7b0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e210 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e2b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e350 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e3f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e490 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e530 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e5d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e670 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e710 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e7b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59403e850 (
	input [3:0] a,
	output  r);
wire w_bits_1;
wire w_s5;
wire w_s1;
wire w_s7;
wire w_s9;
wire w_s3;
wire w_bits_2;
wire w_s2;
wire w_s4;
wire w_s8;
wire w_s10;
wire w_bits_3;
wire w_s6;
wire w_s0;
wire w_bits_0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59403e8f0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59403e990 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403ea30 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403ead0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403eb70 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403ec10 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403ecb0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403ed50 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403edf0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403ee90 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59403ef30 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e8f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403e990 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ea30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ead0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403eb70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ec10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ecb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ed50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403edf0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ee90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ef30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59403efd0 (
	input [3:0] a,
	output  r);
wire w_s11;
wire w_bits_2;
wire w_bits_3;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s0;
wire w_s2;
wire w_s7;
wire w_s9;
wire w_s6;
wire w_bits_1;
wire w_s4;
wire w_s10;
wire w_s8;
wire w_bits_0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59403f070 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59403f110 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403f1b0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403f250 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403f2f0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403f390 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403f430 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403f4d0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403f570 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403f610 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59403f6b0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59403f750 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f070 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f110 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f1b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f250 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f2f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f390 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f430 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f4d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f570 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f610 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f6b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f750 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Digit7Segment_1d593dbfa80 (
	input [3:0] v,
	output [6:0] led);
wire w_e;
wire w_a;
wire w_b;
wire w_f;
wire w_c;
wire w_g;
wire w_d;

assign led ={w_g,w_f,w_e,w_d,w_c,w_b,w_a};
SumOfMinterms_1d59403f7f0 i_a(.a(v),.r(w_a));
SumOfMinterms_1d594160050 i_b(.a(v),.r(w_b));
SumOfMinterms_1d594160730 i_c(.a(v),.r(w_c));
SumOfMinterms_1d594160f50 i_d(.a(v),.r(w_d));
SumOfMinterms_1d594161630 i_e(.a(v),.r(w_e));
SumOfMinterms_1d594161d10 i_f(.a(v),.r(w_f));
SumOfMinterms_1d594162490 i_g(.a(v),.r(w_g));
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59403f7f0 (
	input [3:0] a,
	output  r);
wire w_s7;
wire w_bits_2;
wire w_s3;
wire w_s6;
wire w_s9;
wire w_s11;
wire w_bits_1;
wire w_bits_3;
wire w_s1;
wire w_s2;
wire w_s8;
wire w_bits_0;
wire w_s4;
wire w_s10;
wire w_s5;
wire w_s0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59403f890 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59403f930 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59403f9d0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59403fa70 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59403fb10 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59403fbb0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59403fc50 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59403fcf0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59403fd90 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59403fe30 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59403fed0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59403ff70 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f890 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f930 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403f9d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403fa70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403fb10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403fbb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403fc50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403fcf0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403fd90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403fe30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403fed0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59403ff70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594160050 (
	input [3:0] a,
	output  r);
wire w_bits_0;
wire w_s0;
wire w_s4;
wire w_s8;
wire w_s9;
wire w_bits_1;
wire w_s1;
wire w_s2;
wire w_bits_2;
wire w_s3;
wire w_s5;
wire w_s7;
wire w_bits_3;
wire w_s6;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d5941600f0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594160190 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594160230 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d5941602d0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d594160370 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594160410 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d5941604b0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d594160550 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d5941605f0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594160690 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941600f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160190 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160230 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941602d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160370 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160410 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941604b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160550 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941605f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160690 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594160730 (
	input [3:0] a,
	output  r);
wire w_s8;
wire w_s0;
wire w_s1;
wire w_s4;
wire w_s7;
wire w_s10;
wire w_bits_1;
wire w_s3;
wire w_s5;
wire w_s11;
wire w_s2;
wire w_s6;
wire w_bits_0;
wire w_bits_2;
wire w_s9;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d5941607d0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594160870 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594160910 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d5941609b0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d594160a50 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594160af0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d594160b90 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d594160c30 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d594160cd0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594160d70 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d594160e10 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d594160eb0 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941607d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160870 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160910 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941609b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160a50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160af0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160b90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160c30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160cd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160d70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160e10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160eb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594160f50 (
	input [3:0] a,
	output  r);
wire w_s6;
wire w_bits_3;
wire w_s5;
wire w_s7;
wire w_s9;
wire w_bits_1;
wire w_s0;
wire w_bits_0;
wire w_s1;
wire w_s3;
wire w_bits_2;
wire w_s8;
wire w_s4;
wire w_s2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594160ff0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594161090 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594161130 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d5941611d0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d594161270 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594161310 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d5941613b0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d594161450 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d5941614f0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594161590 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594160ff0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161090 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161130 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941611d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161270 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161310 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941613b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161450 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941614f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161590 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594161630 (
	input [3:0] a,
	output  r);
wire w_bits_3;
wire w_s4;
wire w_s7;
wire w_s9;
wire w_s0;
wire w_s1;
wire w_bits_2;
wire w_s3;
wire w_s5;
wire w_s8;
wire w_bits_1;
wire w_s2;
wire w_s6;
wire w_bits_0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d5941616d0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594161770 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594161810 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d5941618b0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d594161950 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d5941619f0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d594161a90 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d594161b30 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d594161bd0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594161c70 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941616d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161770 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161810 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941618b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161950 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941619f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161a90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161b30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161bd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161c70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594161d10 (
	input [3:0] a,
	output  r);
wire w_bits_2;
wire w_s8;
wire w_s9;
wire w_s10;
wire w_bits_3;
wire w_s2;
wire w_s4;
wire w_s6;
wire w_s0;
wire w_bits_0;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_bits_1;
wire w_s7;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594161db0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594161e50 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594161ef0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d594161f90 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d594162030 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d5941620d0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d594162170 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d594162210 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d5941622b0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594162350 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d5941623f0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161db0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n1;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161e50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161ef0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594161f90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162030 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941620d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162170 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162210 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941622b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162350 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941623f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594162490 (
	input [3:0] a,
	output  r);
wire w_s0;
wire w_s3;
wire w_s7;
wire w_s9;
wire w_bits_1;
wire w_s2;
wire w_s10;
wire w_s1;
wire w_bits_0;
wire w_bits_2;
wire w_s4;
wire w_s6;
wire w_s8;
wire w_s5;
wire w_s11;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594162530 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d5941625d0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594162670 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d594162710 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d5941627b0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594162850 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d5941628f0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d594162990 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d594162a30 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594162ad0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d594162b70 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d594162c10 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162530 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941625d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162670 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162710 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941627b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162850 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941628f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162990 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162a30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162ad0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162b70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162c10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Digit7Segment_1d593dbfce0 (
	input [3:0] v,
	output [6:0] led);
wire w_b;
wire w_a;
wire w_f;
wire w_c;
wire w_g;
wire w_d;
wire w_e;

assign led ={w_g,w_f,w_e,w_d,w_c,w_b,w_a};
SumOfMinterms_1d594162cb0 i_a(.a(v),.r(w_a));
SumOfMinterms_1d5941634d0 i_b(.a(v),.r(w_b));
SumOfMinterms_1d594163bb0 i_c(.a(v),.r(w_c));
SumOfMinterms_1d59426c410 i_d(.a(v),.r(w_d));
SumOfMinterms_1d59426caf0 i_e(.a(v),.r(w_e));
SumOfMinterms_1d59426d1d0 i_f(.a(v),.r(w_f));
SumOfMinterms_1d59426d950 i_g(.a(v),.r(w_g));
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594162cb0 (
	input [3:0] a,
	output  r);
wire w_s6;
wire w_bits_2;
wire w_s8;
wire w_s9;
wire w_bits_3;
wire w_s2;
wire w_s4;
wire w_s10;
wire w_bits_1;
wire w_bits_0;
wire w_s5;
wire w_s1;
wire w_s7;
wire w_s11;
wire w_s3;
wire w_s0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594162d50 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594162df0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594162e90 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d594162f30 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d594162fd0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594163070 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d594163110 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d5941631b0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d594163250 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d5941632f0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d594163390 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d594163430 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162d50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n2;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162df0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162e90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162f30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594162fd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163070 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163110 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941631b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163250 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941632f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163390 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163430 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d5941634d0 (
	input [3:0] a,
	output  r);
wire w_s4;
wire w_s0;
wire w_s1;
wire w_s8;
wire w_bits_1;
wire w_s3;
wire w_s5;
wire w_s7;
wire w_bits_2;
wire w_bits_0;
wire w_s2;
wire w_s6;
wire w_s9;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594163570 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594163610 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d5941636b0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d594163750 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d5941637f0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594163890 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d594163930 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d5941639d0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d594163a70 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594163b10 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163570 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163610 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941636b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163750 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941637f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163890 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163930 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5941639d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163a70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163b10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594163bb0 (
	input [3:0] a,
	output  r);
wire w_s4;
wire w_s0;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s7;
wire w_s10;
wire w_bits_0;
wire w_bits_1;
wire w_s9;
wire w_s11;
wire w_bits_2;
wire w_s2;
wire w_s6;
wire w_s8;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594163c50 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594163cf0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594163d90 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d594163e30 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d594163ed0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594163f70 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426c050 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426c0f0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426c190 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426c230 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59426c2d0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59426c370 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163c50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163cf0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163d90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163e30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163ed0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594163f70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c050 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c0f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c190 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c230 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c2d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c370 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426c410 (
	input [3:0] a,
	output  r);
wire w_s0;
wire w_bits_0;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s9;
wire w_s7;
wire w_bits_1;
wire w_s8;
wire w_bits_2;
wire w_s2;
wire w_s4;
wire w_s6;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59426c4b0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59426c550 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59426c5f0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59426c690 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59426c730 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59426c7d0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426c870 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426c910 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426c9b0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426ca50 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c4b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c550 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c5f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c690 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c730 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c7d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c870 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c910 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426c9b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ca50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426caf0 (
	input [3:0] a,
	output  r);
wire w_s4;
wire w_bits_3;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s8;
wire w_s7;
wire w_s0;
wire w_s6;
wire w_bits_0;
wire w_bits_1;
wire w_s2;
wire w_s9;
wire w_bits_2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59426cb90 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59426cc30 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59426ccd0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59426cd70 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59426ce10 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59426ceb0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426cf50 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426cff0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426d090 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426d130 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426cb90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426cc30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ccd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426cd70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ce10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ceb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426cf50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426cff0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d090 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d130 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426d1d0 (
	input [3:0] a,
	output  r);
wire w_bits_2;
wire w_s2;
wire w_s4;
wire w_s6;
wire w_s8;
wire w_bits_0;
wire w_bits_3;
wire w_s10;
wire w_s0;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s7;
wire w_s9;
wire w_bits_1;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59426d270 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59426d310 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59426d3b0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59426d450 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59426d4f0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59426d590 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426d630 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426d6d0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426d770 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426d810 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59426d8b0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d270 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d310 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d3b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d450 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d4f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d590 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d630 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d6d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d770 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d810 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d8b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426d950 (
	input [3:0] a,
	output  r);
wire w_s0;
wire w_s2;
wire w_s10;
wire w_s7;
wire w_bits_0;
wire w_bits_1;
wire w_s4;
wire w_s6;
wire w_s8;
wire w_s9;
wire w_bits_2;
wire w_s5;
wire w_s11;
wire w_s1;
wire w_bits_3;
wire w_s3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59426d9f0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59426da90 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59426db30 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59426dbd0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59426dc70 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59426dd10 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426ddb0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426de50 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426def0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426df90 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59426e030 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59426e0d0 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426d9f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426da90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426db30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426dbd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426dc70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426dd10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ddb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426de50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426def0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426df90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e030 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e0d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Digit7Segment_1d593f30290 (
	input [3:0] v,
	output [6:0] led);
wire w_b;
wire w_f;
wire w_c;
wire w_g;
wire w_d;
wire w_a;
wire w_e;

assign led ={w_g,w_f,w_e,w_d,w_c,w_b,w_a};
SumOfMinterms_1d59426e170 i_a(.a(v),.r(w_a));
SumOfMinterms_1d59426e990 i_b(.a(v),.r(w_b));
SumOfMinterms_1d59426f070 i_c(.a(v),.r(w_c));
SumOfMinterms_1d59426f890 i_d(.a(v),.r(w_d));
SumOfMinterms_1d59426ff70 i_e(.a(v),.r(w_e));
SumOfMinterms_1d594380690 i_f(.a(v),.r(w_f));
SumOfMinterms_1d594380e10 i_g(.a(v),.r(w_g));
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426e170 (
	input [3:0] a,
	output  r);
wire w_bits_3;
wire w_s2;
wire w_s4;
wire w_s8;
wire w_bits_0;
wire w_s5;
wire w_s7;
wire w_s10;
wire w_s0;
wire w_bits_1;
wire w_s1;
wire w_s3;
wire w_s6;
wire w_s9;
wire w_s11;
wire w_bits_2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59426e210 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59426e2b0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59426e350 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59426e3f0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59426e490 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59426e530 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426e5d0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426e670 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426e710 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426e7b0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59426e850 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59426e8f0 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e210 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e2b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e350 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e3f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e490 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e530 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e5d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e670 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e710 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e7b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e850 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426e8f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426e990 (
	input [3:0] a,
	output  r);
wire w_s1;
wire w_bits_1;
wire w_s3;
wire w_s5;
wire w_bits_2;
wire w_s2;
wire w_s6;
wire w_s7;
wire w_bits_3;
wire w_bits_0;
wire w_s4;
wire w_s8;
wire w_s9;
wire w_s0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59426ea30 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59426ead0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59426eb70 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59426ec10 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59426ecb0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59426ed50 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426edf0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426ee90 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426ef30 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426efd0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ea30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ead0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426eb70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ec10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ecb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ed50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426edf0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ee90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426ef30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426efd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426f070 (
	input [3:0] a,
	output  r);
wire w_s1;
wire w_bits_1;
wire w_s11;
wire w_s3;
wire w_s5;
wire w_bits_2;
wire w_bits_0;
wire w_s2;
wire w_s6;
wire w_s9;
wire w_bits_3;
wire w_s4;
wire w_s7;
wire w_s8;
wire w_s10;
wire w_s0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59426f110 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59426f1b0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59426f250 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59426f2f0 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59426f390 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59426f430 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426f4d0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426f570 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426f610 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426f6b0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d59426f750 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d59426f7f0 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f110 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f1b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f250 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f2f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f390 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f430 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f4d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;

assign w_n3 = ~b3;
assign r = b0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f570 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f610 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f6b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f750 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f7f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426f890 (
	input [3:0] a,
	output  r);
wire w_bits_1;
wire w_bits_0;
wire w_s1;
wire w_s3;
wire w_bits_2;
wire w_s2;
wire w_s4;
wire w_s8;
wire w_bits_3;
wire w_s5;
wire w_s6;
wire w_s7;
wire w_s9;
wire w_s0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d59426f930 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d59426f9d0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d59426fa70 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d59426fb10 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d59426fbb0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d59426fc50 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d59426fcf0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d59426fd90 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d59426fe30 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d59426fed0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f930 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426f9d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426fa70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426fb10 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426fbb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426fc50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426fcf0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426fd90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426fe30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d59426fed0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d59426ff70 (
	input [3:0] a,
	output  r);
wire w_s1;
wire w_s0;
wire w_s6;
wire w_s8;
wire w_s3;
wire w_bits_1;
wire w_s2;
wire w_s5;
wire w_s7;
wire w_bits_2;
wire w_bits_0;
wire w_s4;
wire w_s9;
wire w_bits_3;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594380050 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d5943800f0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594380190 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d594380230 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d5943802d0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594380370 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d594380410 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d5943804b0 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d594380550 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d5943805f0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380050 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943800f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n3;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380190 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380230 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943802d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380370 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380410 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943804b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380550 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943805f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594380690 (
	input [3:0] a,
	output  r);
wire w_s2;
wire w_bits_3;
wire w_s4;
wire w_s0;
wire w_bits_0;
wire w_s1;
wire w_s3;
wire w_s5;
wire w_s6;
wire w_s7;
wire w_s8;
wire w_bits_1;
wire w_s9;
wire w_s10;
wire w_bits_2;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594380730 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d5943807d0 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594380870 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d594380910 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d5943809b0 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d594380a50 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d594380af0 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d594380b90 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d594380c30 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594380cd0 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d594380d70 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380730 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943807d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380870 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n3;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380910 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943809b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;
wire w_n0;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380a50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;
wire w_n2;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380af0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n2;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380b90 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380c30 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign r = w_n0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380cd0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380d70 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module SumOfMinterms_1d594380e10 (
	input [3:0] a,
	output  r);
wire w_s2;
wire w_bits_1;
wire w_s4;
wire w_s6;
wire w_s9;
wire w_s10;
wire w_bits_2;
wire w_bits_0;
wire w_s5;
wire w_s8;
wire w_s11;
wire w_bits_3;
wire w_s1;
wire w_s3;
wire w_s7;
wire w_s0;

assign w_bits_0 = a[0];
assign w_bits_1 = a[1];
assign w_bits_2 = a[2];
assign w_bits_3 = a[3];
Minterm_1d594380eb0 i_minterm0(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s0));
Minterm_1d594380f50 i_minterm1(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s1));
Minterm_1d594380ff0 i_minterm2(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s2));
Minterm_1d594381090 i_minterm3(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s3));
Minterm_1d594381130 i_minterm4(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s4));
Minterm_1d5943811d0 i_minterm5(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s5));
Minterm_1d594381270 i_minterm6(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s6));
Minterm_1d594381310 i_minterm7(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s7));
Minterm_1d5943813b0 i_minterm8(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s8));
Minterm_1d594381450 i_minterm9(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s9));
Minterm_1d5943814f0 i_minterm10(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s10));
Minterm_1d594381590 i_minterm11(.b0(w_bits_0),.b1(w_bits_1),.b2(w_bits_2),.b3(w_bits_3),.r(w_s11));
assign r = w_s0 | w_s1 | w_s2 | w_s3 | w_s4 | w_s5 | w_s6 | w_s7 | w_s8 | w_s9 | w_s10 | w_s11 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380eb0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380f50 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n2;

assign w_n2 = ~b2;
assign w_n3 = ~b3;
assign r = b0 & b1 & w_n2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594380ff0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;
wire w_n3;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = w_n0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594381090 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n1;

assign w_n1 = ~b1;
assign w_n3 = ~b3;
assign r = b0 & w_n1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594381130 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n3;
wire w_n0;

assign w_n0 = ~b0;
assign w_n3 = ~b3;
assign r = w_n0 & b1 & b2 & w_n3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943811d0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;
wire w_n1;

assign w_n0 = ~b0;
assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = w_n0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594381270 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n1;

assign w_n1 = ~b1;
assign w_n2 = ~b2;
assign r = b0 & w_n1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594381310 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;
wire w_n0;

assign w_n0 = ~b0;
assign w_n2 = ~b2;
assign r = w_n0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943813b0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n2;

assign w_n2 = ~b2;
assign r = b0 & b1 & w_n2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594381450 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n1;

assign w_n1 = ~b1;
assign r = b0 & w_n1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d5943814f0 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);
wire w_n0;

assign w_n0 = ~b0;
assign r = w_n0 & b1 & b2 & b3 ;
endmodule

// This file was automatically created by py4hw Verilog generator
module Minterm_1d594381590 (
	input  b0,
	input  b1,
	input  b2,
	input  b3,
	output  r);

assign r = b0 & b1 & b2 & b3 ;
endmodule
