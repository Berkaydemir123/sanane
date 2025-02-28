 module system_top(
    input i_CLK_SYS, i_RST_SYS,
    input [7:0] i_data_l, i_data_r,
    input i_dval,
    input [6:0] i_tresh_lrcc,
    input [31:0] i_ADDR, i_WRDATA,
    input i_WREn, i_RDEn,
    output [31:0] o_RDATA,
    output o_dval,
    output [6:0] o_data,
    output injector_o_SI
);

  // Controller Outputs (Connected to Fault Injection Signals)
  wire o_SERIAL_OUT, o_EN_SR, o_TFEn, o_RST;

  // Instantiate CONTROLLER
  CONTROLLER u_controller (
      .i_CLK_SYS(i_CLK_SYS),
      .i_RST_SYS(i_RST_SYS),
      .i_ADDR(i_ADDR),
      .i_WREn(i_WREn),
      .i_RDEn(i_RDEn),
      .i_WRDATA(i_WRDATA),
      .o_RDATA(o_RDATA),
      .o_SERIAL_OUT(o_SERIAL_OUT),
      .o_EN_SR(o_EN_SR),
      .o_TFEn(o_TFEn),
      .o_RST(o_RST)
  );

  // Instantiate stereo_match
  stereo_match u_stereo_match (
      .i_clk(i_CLK_SYS),
      .i_rstn(i_RST_SYS),
      .i_data_l(i_data_l),
      .i_data_r(i_data_r),
      .i_dval(i_dval),
      .i_tresh_lrcc(i_tresh_lrcc),
      .o_dval(o_dval),
      .o_data(o_data),
      .injector_i_TFEn(o_TFEn),
      .injector_i_CLK(i_CLK_SYS),
      .injector_i_RST(o_RST),
      .injector_i_EN(o_EN_SR),      
      .injector_i_SI(o_SERIAL_OUT),
      .injector_o_SI(injector_o_SI)
  );

endmodule