`timescale 1ns / 1ps

module tb_controller;
	reg CLK;
	reg RST;
	reg [31:0] ADDR;
	reg WR_EN;
	reg RD_EN;
	reg [31:0] WR_DATA;

	wire [31:0] o_RDATA;
	wire o_serial;
	wire o_en_sr;
	wire o_tfen;
	wire o_rst;
	
	CONTROLLER UUT(
		.i_CLK_SYS(CLK),
	    .i_RST_SYS(RST),
		.i_ADDR(ADDR),
		.i_WREn(WR_EN),
		.i_RDEn(RD_EN),
		.i_WRDATA(WR_DATA),
		.o_RDATA(o_RDATA),
		.o_SERIAL_OUT(o_serial),
	    .o_EN_SR(o_en_sr),		
	    .o_TFEn(o_tfen),
		.o_RST(o_rst)
	);
		
	always begin
		#5 CLK = ~CLK; 
	end

	initial
	begin
		CLK = 1;
		RST = 1;
		RD_EN = 0;
		WR_EN = 0;
		#50;
		RST = 0;
		
//  STATUS REGISTER:
//	{0s(31:20), length(19:4), start_bit(3), setup_bit(2), control(1:0)}		
		

// sa-1 fault:
	// set data
		WR_EN = 1;	ADDR = 0;	WR_DATA = 11;
		#10;
	// set status
		WR_EN = 1;  ADDR = 1;	WR_DATA = {12'b0, 16'd16, 1'b0, 1'b1, 2'b01};	// data length 16, ctrl = 01
		#10;
		WR_EN = 0;
		#180;	// wait till the end of shift operation
	// read status
		#10;
		RD_EN = 1; ADDR = 1; 
		#10;
		RD_EN = 0;
		#10;
		if(o_RDATA[31] == 1'b0) begin
	// start the operation
			#10;
			WR_EN = 1;  ADDR = 1;   WR_DATA = {12'b0, 16'd0, 1'b1, 1'b0, 2'b00};
			#10;
			WR_EN = 0;
			#50;
		end else
		
	//  RESET
		RST =1;
		#60;
		RST =0;
// sa-0 fault:
	// set data
		WR_EN = 1;	ADDR = 0;	WR_DATA = 169723;
		#10;
	// set status
		WR_EN = 1;  ADDR = 1;	WR_DATA = {12'b0, 16'd32, 1'b0, 1'b1, 2'b00};	// data length 32, ctrl = 00
		#10;
		WR_EN = 0;
		#340;
	// start the operation
		#10;
		WR_EN = 1;  ADDR = 1;   WR_DATA = {12'b0, 16'd0, 1'b1, 1'b0, 2'b00};
		#10;
		WR_EN = 0;
		#50;	
	
	//  RESET
		RST =1;
		#60;	
		RST =0;
// sa-0 fault:
	// set data
		WR_EN = 1;	ADDR = 0;	WR_DATA = 32'b10100000000000000000000100100000;	// 32-bit length
		#10;
	// set status
		WR_EN = 1;  ADDR = 1;	WR_DATA = {12'b0, 16'd54, 1'b0, 1'b1, 2'b00};	// data length 54, ctrl = 00
		#10;
		WR_EN = 0;
		#330;
	// set data
		WR_EN = 1;	ADDR = 0;	WR_DATA = 32'b1100000000000100000001;			// 22-bit length
		#10;
		WR_EN = 0;
		#240;		// 22-bit + 2-bit control
	// start the operation
		#10;
		WR_EN = 1;  ADDR = 1;   WR_DATA = {12'b0, 16'd0, 1'b1, 1'b0, 2'b00};
		#10;
		WR_EN = 0;
		#50;	
	
	//  RESET
		RST =1;
		#60;	

		
		
		$stop;
		
	end
endmodule