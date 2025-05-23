/* Generated by Yosys 0.47+61 (git sha1 81011ad92, clang++ 18.1.8 -fPIC -O3) */

module \$paramod$1bac373892e36610c5170080d2d7c9af8c4094ae\DSR_right_N_S (a, b, c);
  input [50:0] a;
  wire [50:0] a;
  input [3:0] b;
  wire [3:0] b;
  output [50:0] c;
  wire [50:0] c;
  wire [50:0] \tmp[0] ;
  wire [50:0] \tmp[1] ;
  wire [50:0] \tmp[2] ;
  assign \tmp[0]  = b[0] ? { 1'h0, a[50:1] } : a;
  assign \tmp[1]  = b[1] ? { 2'h0, \tmp[0] [50:2] } : \tmp[0] ;
  assign \tmp[2]  = b[2] ? { 4'h0, \tmp[1] [50:4] } : \tmp[1] ;
  assign c = b[3] ? { 8'h00, \tmp[2] [50:8] } : \tmp[2] ;
endmodule

module \$paramod$3252fe89cd119cf7c3ef25b9a50779b2d8d95ba3\DSR_left_N_S (a, b, c);
  input [15:0] a;
  wire [15:0] a;
  input [3:0] b;
  wire [3:0] b;
  output [15:0] c;
  wire [15:0] c;
  wire [15:0] \tmp[0] ;
  wire [15:0] \tmp[1] ;
  wire [15:0] \tmp[2] ;
  assign \tmp[0]  = b[0] ? { a[14:0], 1'h0 } : a;
  assign \tmp[1]  = b[1] ? { \tmp[0] [13:0], 2'h0 } : \tmp[0] ;
  assign \tmp[2]  = b[2] ? { \tmp[1] [11:0], 4'h0 } : \tmp[1] ;
  assign c = b[3] ? { \tmp[2] [7:0], 8'h00 } : \tmp[2] ;
endmodule

module \$paramod$3252fe89cd119cf7c3ef25b9a50779b2d8d95ba3\DSR_right_N_S (a, b, c);
  input [15:0] a;
  wire [15:0] a;
  input [3:0] b;
  wire [3:0] b;
  output [15:0] c;
  wire [15:0] c;
  wire [15:0] \tmp[0] ;
  wire [15:0] \tmp[1] ;
  wire [15:0] \tmp[2] ;
  assign \tmp[0]  = b[0] ? { 1'h0, a[15:1] } : a;
  assign \tmp[1]  = b[1] ? { 2'h0, \tmp[0] [15:2] } : \tmp[0] ;
  assign \tmp[2]  = b[2] ? { 4'h0, \tmp[1] [15:4] } : \tmp[1] ;
  assign c = b[3] ? { 8'h00, \tmp[2] [15:8] } : \tmp[2] ;
endmodule

module \$paramod$3577d9ae3c9b73f357e25bd84ec5a3070f934580\data_extract_v1 (in, rc, regime, exp, mant);
  wire [15:0] rtil_signal_0_;
  wire [31:0] rtil_signal_1_;
  wire [31:0] rtil_signal_2_;
  output exp;
  wire exp;
  input [15:0] in;
  wire [15:0] in;
  wire [3:0] k;
  output [14:0] mant;
  wire [14:0] mant;
  output rc;
  wire rc;
  output [3:0] regime;
  wire [3:0] regime;
  wire [15:0] xin_r;
  wire [15:0] xin_tmp;
  assign rtil_signal_0_ = ~ in;
  assign rtil_signal_1_ = k - 32'd1;
  assign xin_r = in[14] ? rtil_signal_0_ : { in[15], 1'h0, in[13:0] };
  assign { rtil_signal_2_[31:4], regime } = in[14] ? rtil_signal_1_ : { 28'h0000000, k };
  \$paramod$3252fe89cd119cf7c3ef25b9a50779b2d8d95ba3\DSR_left_N_S  ls (
    .a({ in[13:0], 2'h0 }),
    .b(k),
    .c(xin_tmp)
  );
  \$paramod\LOD_N\N=s32'00000000000000000000000000010000  xinst_k (
    .in({ xin_r[14:0], in[14] }),
    .out(k)
  );
  assign rtil_signal_2_[3:0] = regime;
  assign exp = xin_tmp[15];
  assign mant = xin_tmp[14:0];
  assign rc = in[14];
endmodule

module \$paramod$8a03d5600bc84ccbf7897e324a5dce49161bfbab\reg_exp_op (exp_o, e_o, r_o);
  wire [31:0] rtil_signal_00_;
  wire rtil_signal_01_;
  wire [5:0] rtil_signal_02_;
  wire rtil_signal_03_;
  wire [31:0] rtil_signal_04_;
  output e_o;
  wire e_o;
  input [5:0] exp_o;
  wire [5:0] exp_o;
  wire [5:0] exp_oN;
  wire [5:0] exp_oN_tmp;
  output [3:0] r_o;
  wire [3:0] r_o;
  assign rtil_signal_00_ = exp_oN[4:1] + 32'd1;
  assign rtil_signal_01_ = rtil_signal_03_ || exp_oN[0];
  assign rtil_signal_02_ = ~ exp_o;
  assign rtil_signal_03_ = ~ exp_o[5];
  assign exp_oN = exp_o[5] ? exp_oN_tmp : { 1'h0, exp_o[4:0] };
  assign { rtil_signal_04_[31:4], r_o } = rtil_signal_01_ ? rtil_signal_00_ : { 28'h0000000, exp_oN[4:1] };
  \$paramod\conv_2c\N=32'00000000000000000000000000000101  uut_conv_2c1 (
    .a(rtil_signal_02_),
    .c(exp_oN_tmp)
  );
  assign rtil_signal_04_[3:0] = r_o;
  assign e_o = exp_o[0];
endmodule

module \$paramod\LOD\N=s32'00000000000000000000000000000010 (in, out, vld);
  wire rtil_signal_0_;
  input [1:0] in;
  wire [1:0] in;
  output out;
  wire out;
  output vld;
  wire vld;
  assign out = rtil_signal_0_ & in[0];
  assign rtil_signal_0_ = ~ in[1];
  assign vld = | in;
endmodule

module \$paramod\LOD\N=s32'00000000000000000000000000000100 (in, out, vld);
  wire \genblk1.genblk1.out_h ;
  wire \genblk1.genblk1.out_l ;
  wire \genblk1.genblk1.out_vh ;
  wire \genblk1.genblk1.out_vl ;
  input [3:0] in;
  wire [3:0] in;
  output [1:0] out;
  wire [1:0] out;
  output vld;
  wire vld;
  assign vld = \genblk1.genblk1.out_vl  | \genblk1.genblk1.out_vh ;
  assign out = \genblk1.genblk1.out_vh  ? { 1'h0, \genblk1.genblk1.out_h  } : { \genblk1.genblk1.out_vl , \genblk1.genblk1.out_l  };
  \$paramod\LOD\N=s32'00000000000000000000000000000010  \genblk1.genblk1.h  (
    .in(in[3:2]),
    .out(\genblk1.genblk1.out_h ),
    .vld(\genblk1.genblk1.out_vh )
  );
  \$paramod\LOD\N=s32'00000000000000000000000000000010  \genblk1.genblk1.l  (
    .in(in[1:0]),
    .out(\genblk1.genblk1.out_l ),
    .vld(\genblk1.genblk1.out_vl )
  );
endmodule

module \$paramod\LOD\N=s32'00000000000000000000000000001000 (in, out, vld);
  wire [1:0] \genblk1.genblk1.out_h ;
  wire [1:0] \genblk1.genblk1.out_l ;
  wire \genblk1.genblk1.out_vh ;
  wire \genblk1.genblk1.out_vl ;
  input [7:0] in;
  wire [7:0] in;
  output [2:0] out;
  wire [2:0] out;
  output vld;
  wire vld;
  assign vld = \genblk1.genblk1.out_vl  | \genblk1.genblk1.out_vh ;
  assign out = \genblk1.genblk1.out_vh  ? { 1'h0, \genblk1.genblk1.out_h  } : { \genblk1.genblk1.out_vl , \genblk1.genblk1.out_l  };
  \$paramod\LOD\N=s32'00000000000000000000000000000100  \genblk1.genblk1.h  (
    .in(in[7:4]),
    .out(\genblk1.genblk1.out_h ),
    .vld(\genblk1.genblk1.out_vh )
  );
  \$paramod\LOD\N=s32'00000000000000000000000000000100  \genblk1.genblk1.l  (
    .in(in[3:0]),
    .out(\genblk1.genblk1.out_l ),
    .vld(\genblk1.genblk1.out_vl )
  );
endmodule

module \$paramod\LOD\N=s32'00000000000000000000000000010000 (in, out, vld);
  wire [2:0] \genblk1.genblk1.out_h ;
  wire [2:0] \genblk1.genblk1.out_l ;
  wire \genblk1.genblk1.out_vh ;
  wire \genblk1.genblk1.out_vl ;
  input [15:0] in;
  wire [15:0] in;
  output [3:0] out;
  wire [3:0] out;
  output vld;
  wire vld;
  assign vld = \genblk1.genblk1.out_vl  | \genblk1.genblk1.out_vh ;
  assign out = \genblk1.genblk1.out_vh  ? { 1'h0, \genblk1.genblk1.out_h  } : { \genblk1.genblk1.out_vl , \genblk1.genblk1.out_l  };
  \$paramod\LOD\N=s32'00000000000000000000000000001000  \genblk1.genblk1.h  (
    .in(in[15:8]),
    .out(\genblk1.genblk1.out_h ),
    .vld(\genblk1.genblk1.out_vh )
  );
  \$paramod\LOD\N=s32'00000000000000000000000000001000  \genblk1.genblk1.l  (
    .in(in[7:0]),
    .out(\genblk1.genblk1.out_l ),
    .vld(\genblk1.genblk1.out_vl )
  );
endmodule

module \$paramod\LOD_N\N=s32'00000000000000000000000000010000 (in, out);
  input [15:0] in;
  wire [15:0] in;
  output [3:0] out;
  wire [3:0] out;
  wire vld;
  \$paramod\LOD\N=s32'00000000000000000000000000010000  l1 (
    .in(in),
    .out(out),
    .vld(vld)
  );
endmodule

module \$paramod\abs_regime\N=32'00000000000000000000000000000100 (rc, regime, regime_N);
  wire [4:0] rtil_signal_0_;
  input rc;
  wire rc;
  input [3:0] regime;
  wire [3:0] regime;
  output [4:0] regime_N;
  wire [4:0] regime_N;
  assign rtil_signal_0_ = - { 1'h0, regime };
  assign regime_N = rc ? { 1'h0, regime } : rtil_signal_0_;
endmodule

module \$paramod\add_1\N=32'00000000000000000000000000000110 (a, mant_ovf, c);
  input [6:0] a;
  wire [6:0] a;
  output [6:0] c;
  wire [6:0] c;
  input mant_ovf;
  wire mant_ovf;
  assign c = a + mant_ovf;
endmodule

module \$paramod\add_N\N=s32'00000000000000000000000000010000 (a, b, c);
  input [15:0] a;
  wire [15:0] a;
  input [15:0] b;
  wire [15:0] b;
  output [16:0] c;
  wire [16:0] c;
  \$paramod\add_N_in\N=s32'00000000000000000000000000010000  a1 (
    .a({ 1'h0, a }),
    .b({ 1'h0, b }),
    .c(c)
  );
endmodule

module \$paramod\add_N_in\N=s32'00000000000000000000000000010000 (a, b, c);
  input [16:0] a;
  wire [16:0] a;
  input [16:0] b;
  wire [16:0] b;
  output [16:0] c;
  wire [16:0] c;
  assign c = a + b;
endmodule

module \$paramod\add_sub_N\N=s32'00000000000000000000000000010000 (op, a, b, c);
  input [15:0] a;
  wire [15:0] a;
  input [15:0] b;
  wire [15:0] b;
  output [16:0] c;
  wire [16:0] c;
  wire [16:0] c_add;
  wire [16:0] c_sub;
  input op;
  wire op;
  assign c = op ? c_add : c_sub;
  \$paramod\add_N\N=s32'00000000000000000000000000010000  a11 (
    .a(a),
    .b(b),
    .c(c_add)
  );
  \$paramod\sub_N\N=s32'00000000000000000000000000010000  s11 (
    .a(a),
    .b(b),
    .c(c_sub)
  );
endmodule

module \$paramod\conv_2c\N=32'00000000000000000000000000000101 (a, c);
  input [5:0] a;
  wire [5:0] a;
  output [5:0] c;
  wire [5:0] c;
  assign c = a + 1'h1;
endmodule

module \$paramod\sub_N\N=32'00000000000000000000000000000110 (a, b, c);
  input [5:0] a;
  wire [5:0] a;
  input [5:0] b;
  wire [5:0] b;
  output [6:0] c;
  wire [6:0] c;
  \$paramod\sub_N_in\N=32'00000000000000000000000000000110  s1 (
    .a({ 1'h0, a }),
    .b({ 1'h0, b }),
    .c(c)
  );
endmodule

module \$paramod\sub_N\N=s32'00000000000000000000000000010000 (a, b, c);
  input [15:0] a;
  wire [15:0] a;
  input [15:0] b;
  wire [15:0] b;
  output [16:0] c;
  wire [16:0] c;
  \$paramod\sub_N_in\N=s32'00000000000000000000000000010000  s1 (
    .a({ 1'h0, a }),
    .b({ 1'h0, b }),
    .c(c)
  );
endmodule

module \$paramod\sub_N_in\N=32'00000000000000000000000000000110 (a, b, c);
  input [6:0] a;
  wire [6:0] a;
  input [6:0] b;
  wire [6:0] b;
  output [6:0] c;
  wire [6:0] c;
  assign c = a - b;
endmodule

module \$paramod\sub_N_in\N=s32'00000000000000000000000000010000 (a, b, c);
  input [16:0] a;
  wire [16:0] a;
  input [16:0] b;
  wire [16:0] b;
  output [16:0] c;
  wire [16:0] c;
  assign c = a - b;
endmodule


module posit_add (in1, in2, start, out, inf, zero, done, i_FI_CONTROL_PORT, i_SI, o_SI);

  input [3:0] i_FI_CONTROL_PORT;
  wire [3:0] i_FI_CONTROL_PORT;
  input i_SI;
  wire [2:0] SIwire;
  output o_SI;
  wire o_SI;

  wire rtil_signal_00_;
  wire rtil_signal_01_;
  wire rtil_signal_02_;
  wire rtil_signal_03_;
  wire rtil_signal_04_;
  wire [15:0] rtil_signal_05_;
  wire [15:0] rtil_signal_06_;
  wire [15:0] rtil_signal_07_;
  wire rtil_signal_08_;
  wire rtil_signal_09_;
  wire rtil_signal_10_;
  wire rtil_signal_11_;
  wire rtil_signal_12_;
  wire rtil_signal_13_;
  wire rtil_signal_14_;
  wire rtil_signal_15_;
  wire rtil_signal_16_;
  wire rtil_signal_17_;
  wire [3:0] DSR_e_diff;
  wire [15:0] DSR_left_out;
  wire [15:0] DSR_left_out_t;
  wire [15:0] DSR_right_in;
  wire [15:0] DSR_right_out;
  wire [15:0] LOD_in;
  wire St;
  wire [16:0] add_m;
  wire [15:0] add_m_in1;
  wire [6:0] diff;
  output done;
  wire done;
  wire e1;
  wire e2;
  wire e_o;
  input [15:0] in1;
  wire [15:0] in1;
  wire in1_gt_in2;
  input [15:0] in2;
  wire [15:0] in2;
  output inf;
  wire inf;
  wire inf1;
  wire inf2;
  wire le;
  wire [6:0] le_o;
  wire [6:0] le_o_tmp;
  wire [3:0] left_shift;
  wire [3:0] lr;
  wire [4:0] lr_N;
  wire lrc;
  wire ls;
  wire [14:0] mant1;
  wire [14:0] mant2;
  wire op;
  output [15:0] out;
  wire [15:0] out;
  wire [3:0] r_o;
  wire rc1;
  wire rc2;
  wire [3:0] regime1;
  wire [3:0] regime2;
  wire se;
  wire [3:0] sr;
  wire [4:0] sr_N;
  wire src;
  input start;
  wire start;
  wire [50:0] tmp1_o;
  wire [15:0] tmp1_oN;
  wire [15:0] tmp1_o_rnd;
  wire [16:0] tmp1_o_rnd_ulp;
  wire [34:0] tmp_o;
  wire ulp;
  wire [15:0] xin1;
  wire [15:0] xin2;
  output zero;
  wire zero;
  wire zero1;
  wire zero2;
  wire zero_tmp1;
  wire zero_tmp2;
  assign rtil_signal_00_ = tmp1_o[19] & rtil_signal_12_;
  assign rtil_signal_01_ = tmp1_o[20] & tmp1_o[19];
  assign rtil_signal_02_ = rtil_signal_01_ & rtil_signal_08_;
  assign inf1 = in1[15] & rtil_signal_10_;
  assign inf2 = in2[15] & rtil_signal_11_;
  assign zero = zero1 & zero2;
  assign rtil_signal_03_ = xin1[14:0] >= xin2[14:0];
  assign rtil_signal_04_ = r_o < 32'd13;
  assign rtil_signal_05_ = - tmp1_o_rnd;
  assign rtil_signal_06_ = - in1;
  assign rtil_signal_07_ = - in2;
  assign tmp_o[34] = ~ le_o[5];
  assign rtil_signal_08_ = ~ rtil_signal_12_;
  assign rtil_signal_09_ = ~ DSR_left_out[15];
  assign rtil_signal_10_ = ~ zero_tmp1;
  assign rtil_signal_11_ = ~ zero_tmp2;
  assign zero1 = ~ rtil_signal_15_;
  assign zero2 = ~ rtil_signal_16_;
  assign LOD_in[15] = add_m[16] | add_m[15];
  assign rtil_signal_12_ = tmp1_o[18] | St;
  assign ulp = rtil_signal_00_ | rtil_signal_02_;
  assign rtil_signal_13_ = inf | zero;
  assign rtil_signal_14_ = rtil_signal_13_ | rtil_signal_09_;
  assign rtil_signal_15_ = in1[15] | zero_tmp1;
  assign rtil_signal_16_ = in2[15] | zero_tmp2;
  assign inf = inf1 | inf2;
  assign St = | tmp1_o[17:0];
  assign zero_tmp1 = | in1[14:0];
  assign zero_tmp2 = | in2[14:0];
  assign rtil_signal_17_ = | diff[5:4];
  assign DSR_left_out = DSR_left_out_t[15] ? { 1'h1, DSR_left_out_t[14:0] } : { DSR_left_out_t[14:0], 1'h0 };
  assign tmp1_o_rnd = rtil_signal_04_ ? tmp1_o_rnd_ulp[15:0] : tmp1_o[34:19];
  assign tmp1_oN = ls ? rtil_signal_05_ : tmp1_o_rnd;
  assign out = rtil_signal_14_ ? { inf, 15'h0000 } : { ls, tmp1_oN[15:1] };
  assign xin1 = in1[15] ? rtil_signal_06_ : { 1'h0, in1[14:0] };
  assign xin2 = in2[15] ? rtil_signal_07_ : { 1'h0, in2[14:0] };
  assign in1_gt_in2 = rtil_signal_03_ ? 1'h1 : 1'h0;
  assign ls = in1_gt_in2 ? in1[15] : in2[15];
  assign lrc = in1_gt_in2 ? rc1 : rc2;
  assign src = in1_gt_in2 ? rc2 : rc1;
  assign lr = in1_gt_in2 ? regime1 : regime2;
  assign sr = in1_gt_in2 ? regime2 : regime1;
  assign le = in1_gt_in2 ? e1 : e2;
  assign se = in1_gt_in2 ? e2 : e1;
  assign add_m_in1 = in1_gt_in2 ? { zero_tmp1, mant1 } : { zero_tmp2, mant2 };
  assign DSR_right_in = in1_gt_in2 ? { zero_tmp2, mant2 } : { zero_tmp1, mant1 };
  assign DSR_e_diff = rtil_signal_17_ ? 4'hf : diff[3:0];
  assign op = in1[15] ~^ in2[15];
  
                    \$paramod$3252fe89cd119cf7c3ef25b9a50779b2d8d95ba3\DSR_left_N_S_sbtr dsl1  (
                        .a(add_m[16:1]),
    .b(left_shift),
    .c(DSR_left_out_t)
  , .i_FI_CONTROL_PORT(i_FI_CONTROL_PORT), .i_SI(i_SI), .o_SI(SIwire[0])
                    );
  \$paramod$3252fe89cd119cf7c3ef25b9a50779b2d8d95ba3\DSR_right_N_S  dsr1 (
    .a(DSR_right_in),
    .b(DSR_e_diff),
    .c(DSR_right_out)
  );
  
                    \$paramod$1bac373892e36610c5170080d2d7c9af8c4094ae\DSR_right_N_S_sbtr dsr2  (
                        .a({ tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], le_o[5], e_o, DSR_left_out[14:0], 18'h00000 }),
    .b(r_o),
    .c(tmp1_o)
  , .i_FI_CONTROL_PORT(i_FI_CONTROL_PORT), .i_SI(SIwire[0]), .o_SI(SIwire[1])
                    );
  \$paramod\LOD_N\N=s32'00000000000000000000000000010000  l2 (
    .in({ LOD_in[15], add_m[14:0] }),
    .out(left_shift)
  );
  \$paramod\sub_N\N=32'00000000000000000000000000000110  sub3 (
    .a({ lr_N, le }),
    .b({ 2'h0, left_shift }),
    .c(le_o_tmp)
  );
  \$paramod\abs_regime\N=32'00000000000000000000000000000100  uut_abs_regime1 (
    .rc(lrc),
    .regime(lr),
    .regime_N(lr_N)
  );
  \$paramod\abs_regime\N=32'00000000000000000000000000000100  uut_abs_regime2 (
    .rc(src),
    .regime(sr),
    .regime_N(sr_N)
  );
  \$paramod\add_1\N=32'00000000000000000000000000000110  uut_add_mantovf (
    .a(le_o_tmp),
    .c(le_o),
    .mant_ovf(add_m[16])
  );
  \$paramod\add_sub_N\N=s32'00000000000000000000000000010000  uut_add_sub_N (
    .a(add_m_in1),
    .b(DSR_right_out),
    .c(add_m),
    .op(op)
  );
  \$paramod\add_N\N=s32'00000000000000000000000000010000  uut_add_ulp (
    .a(tmp1_o[34:19]),
    .b({ 15'h0000, ulp }),
    .c(tmp1_o_rnd_ulp)
  );
  
                    \$paramod$3577d9ae3c9b73f357e25bd84ec5a3070f934580\data_extract_v1_2 uut_de1  (
                        .exp(e1),
    .in(xin1),
    .mant(mant1),
    .rc(rc1),
    .regime(regime1)
  , .i_FI_CONTROL_PORT(i_FI_CONTROL_PORT), .i_SI(SIwire[1]), .o_SI(o_SI)
                    );
  \$paramod$3577d9ae3c9b73f357e25bd84ec5a3070f934580\data_extract_v1  uut_de2 (
    .exp(e2),
    .in(xin2),
    .mant(mant2),
    .rc(rc2),
    .regime(regime2)
  );
  \$paramod\sub_N\N=32'00000000000000000000000000000110  uut_ediff (
    .a({ lr_N, le }),
    .b({ sr_N, se }),
    .c(diff)
  );
  \$paramod$8a03d5600bc84ccbf7897e324a5dce49161bfbab\reg_exp_op  uut_reg_ro (
    .e_o(e_o),
    .exp_o(le_o[5:0]),
    .r_o(r_o)
  );
  assign LOD_in[14:0] = add_m[14:0];
  assign done = start;
  assign tmp_o[33:0] = { tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], tmp_o[34], le_o[5], e_o, DSR_left_out[14:0], 2'h0 };

endmodule


module \$paramod$3577d9ae3c9b73f357e25bd84ec5a3070f934580\data_extract_v1_2 (in, rc, regime, exp, mant, i_FI_CONTROL_PORT, i_SI, o_SI);
  input [3:0] i_FI_CONTROL_PORT;
  wire [3:0] i_FI_CONTROL_PORT;
  input i_SI;
  wire [1:0] SIwire;
  output o_SI;
  wire o_SI;

  wire [15:0] rtil_signal_0_;
  wire [31:0] rtil_signal_1_;
  wire [31:0] rtil_signal_2_;
  output exp;
  wire exp;
  input [15:0] in;
  wire [15:0] in;
  wire [3:0] k;
  output [14:0] mant;
  wire [14:0] mant;
  output rc;
  wire rc;
  output [3:0] regime;
  wire [3:0] regime;
  wire [15:0] xin_r;
  wire [15:0] xin_tmp;
  assign rtil_signal_0_ = ~ in;
  assign rtil_signal_1_ = k - 32'd1;
  assign xin_r = in[14] ? rtil_signal_0_ : { in[15], 1'h0, in[13:0] };
  assign { rtil_signal_2_[31:4], regime } = in[14] ? rtil_signal_1_ : { 28'h0000000, k };
  \$paramod$3252fe89cd119cf7c3ef25b9a50779b2d8d95ba3\DSR_left_N_S_sbtr ls (
    .a({ in[13:0], 2'h0 }),
    .b(k),
    .c(xin_tmp)
  , .i_FI_CONTROL_PORT(i_FI_CONTROL_PORT), .i_SI(i_SI), .o_SI(SIwire[0]));
  \$paramod\LOD_N\N=s32'00000000000000000000000000010000_sbtr xinst_k (
    .in({ xin_r[14:0], in[14] }),
    .out(k)
  , .i_FI_CONTROL_PORT(i_FI_CONTROL_PORT), .i_SI(SIwire[0]), .o_SI(o_SI));
  assign rtil_signal_2_[3:0] = regime;
  assign exp = xin_tmp[15];
  assign mant = xin_tmp[14:0];
  assign rc = in[14];
endmodule