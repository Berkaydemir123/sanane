/* Generated by Yosys 0.27+20 (git sha1 23826e515, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module Disp_Cmp #(parameter WIDTH_SR = 93)(i_data_C1, i_data_D1, i_data_C2, i_data_D2, o_data_C, o_data_D, i_CLK_x, i_RST_x, i_TFEn, i_EN_SR, i_SI, o_CLK_x, o_RST_x, o_TFEn, o_EN_SR, o_SI);
  input i_SI;
  input i_EN_SR;
  input i_TFEn;
  input i_CLK_x;
  input i_RST_x;
  output o_SI;
  output o_EN_SR;
  output o_TFEn;
  output o_CLK_x;
  output o_RST_x;
  wire [WIDTH_SR-1:0] o_SR;
  assign o_CLK_x = i_CLK_x;
  assign o_RST_x = i_RST_x;
  assign o_TFEn = i_TFEn;
  assign o_EN_SR = i_EN_SR;
  assign o_SI = o_SR[0];
  wire temp__000_;
  wire temp__001_;
  wire temp__002_;
  wire temp__003_;
  wire temp__004_;
  wire temp__005_;
  wire temp__006_;
  wire temp__007_;
  wire temp__008_;
  wire temp__009_;
  wire temp__010_;
  wire temp__011_;
  wire temp__012_;
  wire temp__013_;
  wire temp__014_;
  wire temp__015_;
  wire temp__016_;
  wire temp__017_;
  wire temp__018_;
  wire temp__019_;
  wire temp__020_;
  wire temp__021_;
  wire temp__022_;
  wire temp__023_;
  wire temp__024_;
  wire temp__025_;
  wire temp__026_;
  wire temp__027_;
  wire temp__028_;
  wire temp__029_;
  wire temp__030_;
  wire temp__031_;
  wire temp__032_;
  wire temp__033_;
  wire temp__034_;
  wire temp__035_;
  wire temp__036_;
  wire temp__037_;
  wire temp__038_;
  wire temp__039_;
  wire temp__040_;
  wire temp__041_;
  wire temp__042_;
  wire temp__043_;
  wire temp__044_;
  wire temp__045_;
  wire temp__046_;
  wire temp__047_;
  wire temp__048_;
  wire temp__049_;
  wire temp__050_;
  wire temp__051_;
  wire temp__052_;
  wire temp__053_;
  wire temp__054_;
  wire temp__055_;
  wire temp__056_;
  wire temp__057_;
  wire temp__058_;
  wire temp__059_;
  wire temp__060_;
  wire temp__061_;
  wire temp__062_;
  wire temp__063_;
  wire temp__064_;
  wire temp__065_;
  wire temp__066_;
  wire temp__067_;
  wire temp__068_;
  wire temp__069_;
  wire temp__070_;
  wire temp__071_;
  wire [11:0] temp_i_data_C1;
  wire [11:0] temp_i_data_C2;
  wire [6:0] temp_i_data_D1;
  wire [6:0] temp_i_data_D2;
  wire [11:0] temp_o_data_C;
  wire [6:0] temp_o_data_D;
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  input [11:0] i_data_C1;
  wire [11:0] i_data_C1;
  input [11:0] i_data_C2;
  wire [11:0] i_data_C2;
  input [6:0] i_data_D1;
  wire [6:0] i_data_D1;
  input [6:0] i_data_D2;
  wire [6:0] i_data_D2;
  output [11:0] o_data_C;
  wire [11:0] o_data_C;
  output [6:0] o_data_D;
  wire [6:0] o_data_D;
  assign temp__000_ = _027_ & _030_;
  assign temp__006_ = _000_ & _001_;
  assign temp__009_ = _006_ & _007_;
  assign temp__052_ = _009_ & _008_;
  assign temp_o_data_C[0] = _053_ ? i_data_C1[0] : i_data_C2[0];
  assign temp_o_data_C[1] = _053_ ? i_data_C1[1] : i_data_C2[1];
  assign temp_o_data_C[2] = _053_ ? i_data_C1[2] : i_data_C2[2];
  assign temp_o_data_C[3] = _053_ ? i_data_C1[3] : i_data_C2[3];
  assign temp_o_data_C[4] = _053_ ? i_data_C1[4] : i_data_C2[4];
  assign temp_o_data_C[5] = _053_ ? i_data_C1[5] : i_data_C2[5];
  assign temp_o_data_C[6] = _053_ ? i_data_C1[6] : i_data_C2[6];
  assign temp_o_data_C[7] = _053_ ? i_data_C1[7] : i_data_C2[7];
  assign temp_o_data_C[8] = _053_ ? i_data_C1[8] : i_data_C2[8];
  assign temp_o_data_C[9] = _053_ ? i_data_C1[9] : i_data_C2[9];
  assign temp_o_data_C[10] = _053_ ? i_data_C1[10] : i_data_C2[10];
  assign temp_o_data_C[11] = _053_ ? i_data_C1[11] : i_data_C2[11];
  assign temp_o_data_D[0] = _053_ ? i_data_D1[0] : i_data_D2[0];
  assign temp_o_data_D[1] = _053_ ? i_data_D1[1] : i_data_D2[1];
  assign temp_o_data_D[2] = _053_ ? i_data_D1[2] : i_data_D2[2];
  assign temp_o_data_D[3] = _053_ ? i_data_D1[3] : i_data_D2[3];
  assign temp_o_data_D[4] = _053_ ? i_data_D1[4] : i_data_D2[4];
  assign temp_o_data_D[5] = _053_ ? i_data_D1[5] : i_data_D2[5];
  assign temp_o_data_D[6] = _053_ ? i_data_D1[6] : i_data_D2[6];
  assign temp__051_ = ~_023_;
  assign temp__010_ = ~i_data_C2[0];
  assign temp__013_ = ~i_data_C2[1];
  assign temp__014_ = ~i_data_C2[2];
  assign temp__015_ = ~i_data_C2[3];
  assign temp__016_ = ~i_data_C2[4];
  assign temp__017_ = ~i_data_C2[5];
  assign temp__018_ = ~i_data_C2[6];
  assign temp__019_ = ~i_data_C2[7];
  assign temp__020_ = ~i_data_C2[8];
  assign temp__021_ = ~i_data_C2[9];
  assign temp__011_ = ~i_data_C2[10];
  assign temp__012_ = ~i_data_C2[11];
  assign temp__053_ = _051_ | _052_;
  assign temp__027_ = i_data_C1[0] ^ _010_;
  assign temp__030_ = i_data_C1[1] ^ _013_;
  assign temp__031_ = i_data_C1[2] ^ _014_;
  assign temp__032_ = i_data_C1[3] ^ _015_;
  assign temp__033_ = i_data_C1[4] ^ _016_;
  assign temp__034_ = i_data_C1[5] ^ _017_;
  assign temp__035_ = i_data_C1[6] ^ _018_;
  assign temp__036_ = i_data_C1[7] ^ _019_;
  assign temp__037_ = i_data_C1[8] ^ _020_;
  assign temp__038_ = i_data_C1[9] ^ _021_;
  assign temp__028_ = i_data_C1[10] ^ _011_;
  assign temp__029_ = i_data_C1[11] ^ _012_;
  assign temp__039_ = i_data_C1[0] & _010_;
  assign temp__042_ = i_data_C1[1] & _013_;
  assign temp__043_ = i_data_C1[2] & _014_;
  assign temp__044_ = i_data_C1[3] & _015_;
  assign temp__045_ = i_data_C1[4] & _016_;
  assign temp__046_ = i_data_C1[5] & _017_;
  assign temp__047_ = i_data_C1[6] & _018_;
  assign temp__048_ = i_data_C1[7] & _019_;
  assign temp__049_ = i_data_C1[8] & _020_;
  assign temp__050_ = i_data_C1[9] & _021_;
  assign temp__040_ = i_data_C1[10] & _011_;
  assign temp__041_ = i_data_C1[11] & _012_;
  assign temp__054_ = _030_ & _022_;
  assign temp__055_ = _032_ & _043_;
  assign temp__056_ = _034_ & _045_;
  assign temp__057_ = _036_ & _047_;
  assign temp__058_ = _038_ & _049_;
  assign temp__059_ = _029_ & _040_;
  assign temp__060_ = _001_ & _024_;
  assign temp__061_ = _003_ & _066_;
  assign temp__062_ = _005_ & _068_;
  assign temp__063_ = _007_ & _025_;
  assign temp__001_ = _032_ & _031_;
  assign temp__002_ = _034_ & _033_;
  assign temp__003_ = _036_ & _035_;
  assign temp__004_ = _038_ & _037_;
  assign temp__005_ = _029_ & _028_;
  assign temp__007_ = _003_ & _002_;
  assign temp__008_ = _005_ & _004_;
  assign temp__064_ = _008_ & _026_;
  assign temp__022_ = _039_ | _027_;
  assign temp__024_ = _042_ | _054_;
  assign temp__065_ = _044_ | _055_;
  assign temp__066_ = _046_ | _056_;
  assign temp__067_ = _048_ | _057_;
  assign temp__068_ = _050_ | _058_;
  assign temp__069_ = _041_ | _059_;
  assign temp__025_ = _065_ | _060_;
  assign temp__070_ = _067_ | _061_;
  assign temp__071_ = _069_ | _062_;
  assign temp__026_ = _070_ | _063_;
  assign temp__023_ = _071_ | _064_;
super_sabouter #(.WIDTH(12)) SS0(
                  .i_sig(temp_i_data_C1),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[11:0]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(i_data_C1)
                  );
super_sabouter #(.WIDTH(12)) SS1(
                  .i_sig(temp_i_data_C2),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[23:12]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(i_data_C2)
                  );
super_sabouter #(.WIDTH(7)) SS2(
                  .i_sig(temp_i_data_D1),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[30:24]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(i_data_D1)
                  );
super_sabouter #(.WIDTH(7)) SS3(
                  .i_sig(temp_i_data_D2),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[37:31]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(i_data_D2)
                  );
shift_register #(.WIDTH(WIDTH_SR)) SR(
                    .i_CLK(i_CLK_x),
                    .i_RST(i_RST_x),
                    .i_EN(i_EN_SR),
                    .i_SI(i_SI),
                    .o_DATA(o_SR)
                    );
super_sabouter #(.WIDTH(1)) SS0(
                  .i_sig(temp__000_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[0:0]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_000_)
                  );
super_sabouter #(.WIDTH(1)) SS1(
                  .i_sig(temp__001_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[1:1]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_001_)
                  );
super_sabouter #(.WIDTH(1)) SS2(
                  .i_sig(temp__002_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[2:2]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_002_)
                  );
super_sabouter #(.WIDTH(1)) SS3(
                  .i_sig(temp__003_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[3:3]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_003_)
                  );
super_sabouter #(.WIDTH(1)) SS4(
                  .i_sig(temp__004_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[4:4]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_004_)
                  );
super_sabouter #(.WIDTH(1)) SS5(
                  .i_sig(temp__005_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[5:5]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_005_)
                  );
super_sabouter #(.WIDTH(1)) SS6(
                  .i_sig(temp__006_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[6:6]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_006_)
                  );
super_sabouter #(.WIDTH(1)) SS7(
                  .i_sig(temp__007_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[7:7]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_007_)
                  );
super_sabouter #(.WIDTH(1)) SS8(
                  .i_sig(temp__008_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[8:8]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_008_)
                  );
super_sabouter #(.WIDTH(1)) SS9(
                  .i_sig(temp__009_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[9:9]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_009_)
                  );
super_sabouter #(.WIDTH(1)) SS10(
                  .i_sig(temp__010_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[10:10]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_010_)
                  );
super_sabouter #(.WIDTH(1)) SS11(
                  .i_sig(temp__011_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[11:11]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_011_)
                  );
super_sabouter #(.WIDTH(1)) SS12(
                  .i_sig(temp__012_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[12:12]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_012_)
                  );
super_sabouter #(.WIDTH(1)) SS13(
                  .i_sig(temp__013_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[13:13]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_013_)
                  );
super_sabouter #(.WIDTH(1)) SS14(
                  .i_sig(temp__014_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[14:14]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_014_)
                  );
super_sabouter #(.WIDTH(1)) SS15(
                  .i_sig(temp__015_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[15:15]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_015_)
                  );
super_sabouter #(.WIDTH(1)) SS16(
                  .i_sig(temp__016_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[16:16]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_016_)
                  );
super_sabouter #(.WIDTH(1)) SS17(
                  .i_sig(temp__017_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[17:17]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_017_)
                  );
super_sabouter #(.WIDTH(1)) SS18(
                  .i_sig(temp__018_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[18:18]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_018_)
                  );
super_sabouter #(.WIDTH(1)) SS19(
                  .i_sig(temp__019_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[19:19]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_019_)
                  );
super_sabouter #(.WIDTH(1)) SS20(
                  .i_sig(temp__020_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[20:20]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_020_)
                  );
super_sabouter #(.WIDTH(1)) SS21(
                  .i_sig(temp__021_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[21:21]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_021_)
                  );
super_sabouter #(.WIDTH(1)) SS22(
                  .i_sig(temp__022_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[22:22]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_022_)
                  );
super_sabouter #(.WIDTH(1)) SS23(
                  .i_sig(temp__023_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[23:23]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_023_)
                  );
super_sabouter #(.WIDTH(1)) SS24(
                  .i_sig(temp__024_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[24:24]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_024_)
                  );
super_sabouter #(.WIDTH(1)) SS25(
                  .i_sig(temp__025_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[25:25]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_025_)
                  );
super_sabouter #(.WIDTH(1)) SS26(
                  .i_sig(temp__026_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[26:26]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_026_)
                  );
super_sabouter #(.WIDTH(1)) SS27(
                  .i_sig(temp__027_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[27:27]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_027_)
                  );
super_sabouter #(.WIDTH(1)) SS28(
                  .i_sig(temp__028_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[28:28]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_028_)
                  );
super_sabouter #(.WIDTH(1)) SS29(
                  .i_sig(temp__029_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[29:29]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_029_)
                  );
super_sabouter #(.WIDTH(1)) SS30(
                  .i_sig(temp__030_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[30:30]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_030_)
                  );
super_sabouter #(.WIDTH(1)) SS31(
                  .i_sig(temp__031_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[31:31]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_031_)
                  );
super_sabouter #(.WIDTH(1)) SS32(
                  .i_sig(temp__032_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[32:32]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_032_)
                  );
super_sabouter #(.WIDTH(1)) SS33(
                  .i_sig(temp__033_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[33:33]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_033_)
                  );
super_sabouter #(.WIDTH(1)) SS34(
                  .i_sig(temp__034_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[34:34]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_034_)
                  );
super_sabouter #(.WIDTH(1)) SS35(
                  .i_sig(temp__035_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[35:35]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_035_)
                  );
super_sabouter #(.WIDTH(1)) SS36(
                  .i_sig(temp__036_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[36:36]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_036_)
                  );
super_sabouter #(.WIDTH(1)) SS37(
                  .i_sig(temp__037_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[37:37]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_037_)
                  );
super_sabouter #(.WIDTH(1)) SS38(
                  .i_sig(temp__038_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[38:38]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_038_)
                  );
super_sabouter #(.WIDTH(1)) SS39(
                  .i_sig(temp__039_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[39:39]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_039_)
                  );
super_sabouter #(.WIDTH(1)) SS40(
                  .i_sig(temp__040_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[40:40]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_040_)
                  );
super_sabouter #(.WIDTH(1)) SS41(
                  .i_sig(temp__041_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[41:41]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_041_)
                  );
super_sabouter #(.WIDTH(1)) SS42(
                  .i_sig(temp__042_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[42:42]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_042_)
                  );
super_sabouter #(.WIDTH(1)) SS43(
                  .i_sig(temp__043_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[43:43]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_043_)
                  );
super_sabouter #(.WIDTH(1)) SS44(
                  .i_sig(temp__044_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[44:44]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_044_)
                  );
super_sabouter #(.WIDTH(1)) SS45(
                  .i_sig(temp__045_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[45:45]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_045_)
                  );
super_sabouter #(.WIDTH(1)) SS46(
                  .i_sig(temp__046_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[46:46]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_046_)
                  );
super_sabouter #(.WIDTH(1)) SS47(
                  .i_sig(temp__047_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[47:47]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_047_)
                  );
super_sabouter #(.WIDTH(1)) SS48(
                  .i_sig(temp__048_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[48:48]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_048_)
                  );
super_sabouter #(.WIDTH(1)) SS49(
                  .i_sig(temp__049_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[49:49]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_049_)
                  );
super_sabouter #(.WIDTH(1)) SS50(
                  .i_sig(temp__050_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[50:50]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_050_)
                  );
super_sabouter #(.WIDTH(1)) SS51(
                  .i_sig(temp__051_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[51:51]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_051_)
                  );
super_sabouter #(.WIDTH(1)) SS52(
                  .i_sig(temp__052_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[52:52]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_052_)
                  );
super_sabouter #(.WIDTH(1)) SS53(
                  .i_sig(temp__053_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[53:53]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_053_)
                  );
super_sabouter #(.WIDTH(1)) SS54(
                  .i_sig(temp__054_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[54:54]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_054_)
                  );
super_sabouter #(.WIDTH(1)) SS55(
                  .i_sig(temp__055_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[55:55]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_055_)
                  );
super_sabouter #(.WIDTH(1)) SS56(
                  .i_sig(temp__056_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[56:56]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_056_)
                  );
super_sabouter #(.WIDTH(1)) SS57(
                  .i_sig(temp__057_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[57:57]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_057_)
                  );
super_sabouter #(.WIDTH(1)) SS58(
                  .i_sig(temp__058_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[58:58]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_058_)
                  );
super_sabouter #(.WIDTH(1)) SS59(
                  .i_sig(temp__059_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[59:59]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_059_)
                  );
super_sabouter #(.WIDTH(1)) SS60(
                  .i_sig(temp__060_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[60:60]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_060_)
                  );
super_sabouter #(.WIDTH(1)) SS61(
                  .i_sig(temp__061_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[61:61]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_061_)
                  );
super_sabouter #(.WIDTH(1)) SS62(
                  .i_sig(temp__062_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[62:62]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_062_)
                  );
super_sabouter #(.WIDTH(1)) SS63(
                  .i_sig(temp__063_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[63:63]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_063_)
                  );
super_sabouter #(.WIDTH(1)) SS64(
                  .i_sig(temp__064_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[64:64]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_064_)
                  );
super_sabouter #(.WIDTH(1)) SS65(
                  .i_sig(temp__065_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[65:65]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_065_)
                  );
super_sabouter #(.WIDTH(1)) SS66(
                  .i_sig(temp__066_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[66:66]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_066_)
                  );
super_sabouter #(.WIDTH(1)) SS67(
                  .i_sig(temp__067_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[67:67]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_067_)
                  );
super_sabouter #(.WIDTH(1)) SS68(
                  .i_sig(temp__068_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[68:68]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_068_)
                  );
super_sabouter #(.WIDTH(1)) SS69(
                  .i_sig(temp__069_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[69:69]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_069_)
                  );
super_sabouter #(.WIDTH(1)) SS70(
                  .i_sig(temp__070_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[70:70]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_070_)
                  );
super_sabouter #(.WIDTH(1)) SS71(
                  .i_sig(temp__071_),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[71:71]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(_071_)
                  );
super_sabouter #(.WIDTH(12)) SS72(
                  .i_sig(temp_o_data_C),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[83:72]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(o_data_C)
                  );
super_sabouter #(.WIDTH(7)) SS73(
                  .i_sig(temp_o_data_D),
                  .i_en_super_sabouter(i_TFEn),
                  .i_en_basic_sabouter(o_SR[90:84]),
                  .i_ctrl(o_SR[92:91]),
                  .o_sig(o_data_D)
                  );
shift_register #(.WIDTH(WIDTH_SR)) SR(
                    .i_CLK(i_CLK_x),
                    .i_RST(i_RST_x),
                    .i_EN(i_EN_SR),
                    .i_SI(i_SI),
                    .o_DATA(o_SR)
                    );
endmodule
