`timescale 1ns / 1ps

module CONTROLLER (
	input i_CLK_SYS,
	input i_RST_SYS,

	input [31:0] i_ADDR,	// CPU INTERFACE
	input i_WREn,           // CPU INTERFACE
	input i_RDEn,           // CPU INTERFACE
	input [31:0] i_WRDATA,   // CPU INTERFACE
	output [31:0] o_RDATA,   // CPU INTERFACE
	
	output reg o_SERIAL_OUT,	// TO SHIFT REGISTER		
	output reg o_EN_SR,			// TO SHIFT REGISTER
	output reg o_TFEn,			// TO SHIFT REGISTER
	output reg o_RST			// TO SHIFT REGISTER
);
// Address mapping
    localparam ADDR_DATA        = 2'b00;
    localparam ADDR_STATUS      = 2'b01;
    localparam ADDR_COUNTER     = 2'b10;
    localparam ADDR_COMPARATOR  = 2'b11;
	
/*	REGISTERS:
	0 - DATA: STORE ENABLE VALUES FOR SHIFT REGISTER (modified by cpu)
	1 - STATUS: STORE information about length of the shift register, operation status. check the powerpoint. (modified by cpu and controller)
	2 - COUNTER: normal counter register. internally incremented. it should be reseted before transient fault injection. (reset by cpu)
	3 - COMPARATOR: for transient fault. sets the start of transient fault injection time.
*/
	reg [31:0] REG_DATA, REG_STATUS, REG_COUNTER, REG_COMPARATOR;						// Memory-Mapped Registers
	reg [31:0] REG_DATA_NEXT, REG_STATUS_NEXT, REG_COUNTER_NEXT, REG_COMPARATOR_NEXT;
	reg [31:0] temp_RDATA;																// temporary signal to hold read output

	reg [3:0] REG_FLAG, REG_FLAG_NEXT;	// corresponding bit is set when a register is written:
										// 0-data, 1-status, 2-counter, 3-comparator

	parameter S_IDLE=4'd0, S_SHIFT_DATA=4'd1, S_OPERATION=4'd2, S_SEND_CTRL=4'd3, S_TF=4'd4;
	reg [3:0] state_reg, state_next;
	reg [15:0] CNT_BIT;	// counter for counting number of bits that will be shifted for one register read.
	reg [15:0] CNT_SR;	// counter for counting number of bits that total amount of bits to be shifted.
	reg [1:0]  CNT_CTRL;
	reg [1:0]  temp_ctrl;
//	reg temp_o_RST;

	reg [15:0] num_length;

// 	START:				Reading/Writing Memory-Mapped Registers
	always @(posedge i_CLK_SYS)
	begin
		REG_DATA		<=	i_RST_SYS ? 32'd0 :	REG_DATA_NEXT;
		REG_STATUS      <=	i_RST_SYS ? 32'd0 :	REG_STATUS_NEXT;      
		REG_COUNTER     <=	i_RST_SYS ? 32'd0 :	REG_COUNTER_NEXT;     
		REG_COMPARATOR  <=	i_RST_SYS ? 32'd0 :	REG_COMPARATOR_NEXT;  
		
		REG_FLAG 		<=  i_RST_SYS ? 32'd0 : REG_FLAG_NEXT;
	end
	
	always @*
	begin
		// write (cant write while reading and not busy)
		case(i_ADDR)
			ADDR_DATA       : begin REG_DATA_NEXT       	= (i_WREn && !i_RDEn && !REG_STATUS[31]) ? i_WRDATA : REG_DATA;        			REG_FLAG_NEXT[0] = i_WREn ? 1'b1 : REG_FLAG[0]; end
			ADDR_STATUS     : begin REG_STATUS_NEXT[30:0]   = (i_WREn && !i_RDEn && !REG_STATUS[31]) ? i_WRDATA[30:0] : REG_STATUS[30:0];	REG_FLAG_NEXT[1] = i_WREn ? 1'b1 : REG_FLAG[1]; end
			ADDR_COUNTER    : begin REG_COUNTER_NEXT   	 	= (i_WREn && !i_RDEn && !REG_STATUS[31]) ? i_WRDATA : REG_COUNTER;     			REG_FLAG_NEXT[2] = i_WREn ? 1'b1 : REG_FLAG[2]; end
			ADDR_COMPARATOR : begin REG_COMPARATOR_NEXT 	= (i_WREn && !i_RDEn && !REG_STATUS[31]) ? i_WRDATA : REG_COMPARATOR;  			REG_FLAG_NEXT[3] = i_WREn ? 1'b1 : REG_FLAG[3]; end
		endcase
		// read (cant read while writing and not busy)
		case(i_ADDR)
			ADDR_DATA       : temp_RDATA = (i_RDEn && !i_WREn && !REG_STATUS[31]) ? REG_DATA 	   : 32'd0;
			ADDR_STATUS     : temp_RDATA = (i_RDEn && !i_WREn && !REG_STATUS[31]) ? REG_STATUS 	   : 32'd0;
			ADDR_COUNTER    : temp_RDATA = (i_RDEn && !i_WREn && !REG_STATUS[31]) ? REG_COUNTER    : 32'd0;
			ADDR_COMPARATOR : temp_RDATA = (i_RDEn && !i_WREn && !REG_STATUS[31]) ? REG_COMPARATOR : 32'd0;
		endcase
	end
	assign o_RDATA = temp_RDATA;
// END

// FSM
	always @(posedge i_CLK_SYS)
	begin
		if(i_RST_SYS) begin
			state_reg <= S_IDLE;
		// reset counters
			CNT_SR 	 <= 0;
			CNT_BIT  <= 0;
			CNT_CTRL <= 0;
			num_length <= 0;
		// reset registers
			REG_FLAG_NEXT 		<= 0;
			REG_DATA_NEXT       <= 0;
			REG_STATUS_NEXT     <= 0;
			REG_COUNTER_NEXT    <= 0;
			REG_COMPARATOR_NEXT <= 0;
		// reset outputs
			o_RST 	   	 <= 1;
			o_SERIAL_OUT <= 0;
			o_EN_SR      <= 0;
			o_TFEn       <= 0;
		end
		else begin
			state_reg <= state_next;
			CNT_SR <= CNT_SR;		
			o_RST 	   	 <= 0;
		end
	end

	always @*
	begin
		case(state_reg)
			S_IDLE: begin
				REG_STATUS_NEXT[31] <= 1'b0;
				
				if(REG_STATUS[2] && REG_FLAG[0] && REG_FLAG[1]) begin	// setup && data written && status written
					state_next <= S_SHIFT_DATA;
					num_length <= REG_STATUS[19:4];
					temp_ctrl  <= REG_STATUS[1:0];
				end
				else if (!REG_STATUS[2] && REG_STATUS[3] && REG_FLAG[1])	begin				// !setup && start && status written
					state_next <= S_OPERATION;
					CNT_SR <= 0;
				end
				else begin
					state_next <= S_IDLE;
					if(REG_STATUS[2])
						CNT_SR <= CNT_SR;
					else
						CNT_SR <= 0;
				end
				
				CNT_BIT <= 0;		
				CNT_CTRL <= 0;
			end		
			
			S_OPERATION: begin		// output TFEn signal
				
				if(REG_STATUS[1] == 1'b1) begin	// transient fault				
					if(REG_FLAG[2] && REG_FLAG[3] && REG_STATUS[3])	begin// if these 2 register are written and CPU starts the operation
						REG_STATUS_NEXT[31] <= 1'b1;
						if(REG_COUNTER != REG_COMPARATOR) begin							
							state_next <= S_OPERATION;
						end
						else begin
							state_next <= S_TF;		// for 1cc high TFEn output
							REG_FLAG_NEXT[0] <= 1'b0;	// operation done
							REG_FLAG_NEXT[1] <= 1'b0;	// operation done
							REG_FLAG_NEXT[2] <= 1'b0;    // operation done
							REG_FLAG_NEXT[3] <= 1'b0;	// operation done
						end
					end
					else begin
						REG_STATUS_NEXT[31] <= 1'b0;
						state_next <= S_OPERATION;
					end
				end
				else begin			// stuck-at-fault
					REG_STATUS_NEXT[31] <= 1'b1;
					REG_STATUS_NEXT[30] <= 1'b1;
					state_next <= S_IDLE;	// just assign the output and return idle state.
					REG_FLAG_NEXT[0] <= 1'b0;	// operation done
					REG_FLAG_NEXT[1] <= 1'b0;	// operation done
					REG_FLAG_NEXT[2] <= 1'b0;   // operation done
					REG_FLAG_NEXT[3] <= 1'b0;	// operation done
				end
			end
			
			S_SHIFT_DATA: begin
				REG_STATUS_NEXT[31] <= 1'b1;	
				
				if(CNT_SR == num_length-1) begin
					state_next <= S_SEND_CTRL;
				end
				else if(CNT_BIT == 16'd31) begin
					REG_FLAG_NEXT[0] <= 0;
					state_next <= S_IDLE;
				end
				else
					state_next <= S_SHIFT_DATA;
			end
			
			S_SEND_CTRL: begin
				REG_STATUS_NEXT[31] <= 1'b1;
				if(CNT_CTRL < 1) begin
					REG_FLAG_NEXT[0] <= 1;
					state_next <= S_SEND_CTRL;
				end
				else begin
					REG_FLAG_NEXT[0] <= 0;
					state_next <= S_IDLE;
					REG_FLAG_NEXT[1] <= 1'b0;	// operation done
				end	
			end
			
			S_TF: begin
				REG_STATUS_NEXT[31] <= 1'b1;
				REG_STATUS_NEXT[30] <= 1'b1;
				state_next <= S_IDLE;
			end
			
			default: begin
				REG_STATUS_NEXT[31] <= 1'b0;
				REG_STATUS_NEXT[30] <= 1'b0;
			end
		endcase
	end

// counters management
	always @(posedge i_CLK_SYS)
	begin
		if(state_reg == S_SHIFT_DATA) begin
			CNT_BIT <= CNT_BIT + 1;
			CNT_SR <= CNT_SR + 1;
			
			REG_DATA_NEXT <= REG_DATA_NEXT >> 1;
		end
		else begin
			CNT_BIT <= CNT_BIT;
			CNT_SR <= CNT_SR;
			
			//REG_DATA <= REG_DATA;
		end	
	
		if(state_reg == S_SEND_CTRL) begin
			CNT_CTRL <= CNT_CTRL + 1;
			temp_ctrl <= temp_ctrl << 1;
		end
		else
			CNT_CTRL <= 0;
			
		if(state_reg == S_OPERATION && REG_STATUS[1] == 1'b1) 	// transient fault
			REG_COUNTER_NEXT <= REG_COUNTER_NEXT + 1;
		else
			REG_COUNTER_NEXT <= REG_COUNTER_NEXT;
			
	end
// output logic
	always @*
	begin
	//	o_RST <= temp_o_RST;
		case(state_reg)
			S_IDLE: begin				
				o_EN_SR <= 1'b0;
				o_SERIAL_OUT <= 1'b0;
			end
			
			S_SHIFT_DATA: begin			// fill the shift register
				o_TFEn <= 1'b0;
				o_EN_SR <= 1'b1;				// enable the shift register
				o_SERIAL_OUT <= REG_DATA_NEXT[0];	// send the data bit by bit
			end
			
			S_SEND_CTRL: begin
				o_EN_SR <= 1'b1;
				o_SERIAL_OUT <= temp_ctrl;
			end
			
			S_OPERATION: begin
				
				o_EN_SR <= 1'b0;
				if(REG_STATUS[1]) begin// transient fault
					if(REG_COUNTER == REG_COMPARATOR)
						o_TFEn <= 1'b1;
					else
						o_TFEn <= 1'b0;
				end
				else	// sa fault
					o_TFEn <= 1'b1;	
			end
			
			S_TF: begin
				o_TFEn <= 1'b0;
			end
			
			default: begin
				o_RST 	   	 <= 0;
				o_SERIAL_OUT <= 0;
				o_EN_SR      <= 0;
				o_TFEn       <= 0;
			end
			
		endcase
	end

endmodule