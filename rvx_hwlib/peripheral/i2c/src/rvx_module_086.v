// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2025-07-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "i2c_master_defines.v"




module RVX_MODULE_086 (
	rvx_port_12, rvx_port_17, rvx_port_11, rvx_port_10, rvx_port_01, rvx_port_02, rvx_port_13, rvx_port_16, rvx_port_18, rvx_port_15,
	rvx_port_05, rvx_port_20, rvx_port_14, rvx_port_06, rvx_port_09, rvx_port_00, rvx_port_03, rvx_port_07, rvx_port_08, rvx_port_04, rvx_port_19 );




	
	
	
	input rvx_port_12;     
	input rvx_port_17;   
	input rvx_port_11;     

	input [15:0] rvx_port_10; 

	
	input       rvx_port_01;
	input       rvx_port_02;
	input       rvx_port_13;
	input       rvx_port_16;
	input       rvx_port_18;
	input [7:0] rvx_port_15;

	
	output       rvx_port_05;
	reg rvx_port_05;
	output       rvx_port_20;
	reg rvx_port_20;
	output       rvx_port_06;
	output       rvx_port_09;
	output [7:0] rvx_port_14;

	
	input  rvx_port_00;
	output rvx_port_03;
	output rvx_port_07;
	input  rvx_port_08;
	output rvx_port_04;
	output rvx_port_19;

	
	
	

	
	parameter [4:0] ST_IDLE  = 5'b0_0000;
	parameter [4:0] ST_START = 5'b0_0001;
	parameter [4:0] ST_READ  = 5'b0_0010;
	parameter [4:0] ST_WRITE = 5'b0_0100;
	parameter [4:0] ST_ACK   = 5'b0_1000;
	parameter [4:0] ST_STOP  = 5'b1_0000;

	
	reg  [3:0] rvx_signal_10;
	reg        rvx_signal_04;
	wire       rvx_signal_02, rvx_signal_09;

	
	reg [7:0] rvx_signal_00; 
	reg       rvx_signal_03, rvx_signal_05;

	
	wire       rvx_signal_01;
	reg  [2:0] rvx_signal_06;
	wire       rvx_signal_08;

	
	
	

	
	RVX_MODULE_014 i_rvx_instance_0 (
		.rvx_port_02( rvx_port_12      ),
		.rvx_port_06( rvx_port_17   ),
		.rvx_port_07( rvx_port_11      ),
		.rvx_port_05( rvx_port_10  ),
		.rvx_port_11( rvx_signal_10 ),
		.rvx_port_13( rvx_signal_02 ),
		.rvx_port_01( rvx_port_06 ),
		.rvx_port_03( rvx_port_09   ),
		.rvx_port_10( rvx_signal_04 ),
		.rvx_port_00( rvx_signal_09 ),
		.rvx_port_04( rvx_port_00    ),
		.rvx_port_08( rvx_port_03    ),
		.rvx_port_09( rvx_port_07  ),
		.rvx_port_15( rvx_port_08    ),
		.rvx_port_12( rvx_port_04    ),
		.rvx_port_14( rvx_port_19  )
	);

	
	assign rvx_signal_01 = (rvx_port_13 | rvx_port_16 | rvx_port_02) & ~rvx_port_05;

	
	assign rvx_port_14 = rvx_signal_00;

	
	always @(posedge rvx_port_12 or negedge rvx_port_17)
	  if (!rvx_port_17)
	    rvx_signal_00 <= 8'h0;
	  else if (rvx_signal_05)
	    rvx_signal_00 <= rvx_port_15;
	  else if (rvx_signal_03)
	    rvx_signal_00 <= {rvx_signal_00[6:0], rvx_signal_09};

	
	always @(posedge rvx_port_12 or negedge rvx_port_17)
	  if (!rvx_port_17)
	    rvx_signal_06 <= 3'h0;
	  else if (rvx_signal_05)
	    rvx_signal_06 <= 3'h7;
	  else if (rvx_signal_03)
	    rvx_signal_06 <= rvx_signal_06 - 3'h1;

	assign rvx_signal_08 = ~(|rvx_signal_06);

	
	
	
	reg [4:0] rvx_signal_07;

	always @(posedge rvx_port_12 or negedge rvx_port_17)
	  if (!rvx_port_17)
	    begin
	        rvx_signal_10 <= `I2C_CMD_NOP;
	        rvx_signal_04 <= 1'b0;
	        rvx_signal_03    <= 1'b0;
	        rvx_signal_05       <= 1'b0;
	        rvx_port_05  <= 1'b0;
	        rvx_signal_07  <= ST_IDLE;
	        rvx_port_20  <= 1'b0;
	    end
	  else if (rvx_port_09)
	   begin
	       rvx_signal_10 <= `I2C_CMD_NOP;
	       rvx_signal_04 <= 1'b0;
	       rvx_signal_03    <= 1'b0;
	       rvx_signal_05       <= 1'b0;
	       rvx_port_05  <= 1'b0;
	       rvx_signal_07  <= ST_IDLE;
	       rvx_port_20  <= 1'b0;
	   end
	else
	  begin
	      
	      rvx_signal_04 <= rvx_signal_00[7];
	      rvx_signal_03    <= 1'b0;
	      rvx_signal_05       <= 1'b0;
	      rvx_port_05  <= 1'b0;

	      case (rvx_signal_07) 
	        ST_IDLE:
	          if (rvx_signal_01)
	            begin
	                if (rvx_port_01)
	                  begin
	                      rvx_signal_07  <= ST_START;
	                      rvx_signal_10 <= `I2C_CMD_START;
	                  end
	                else if (rvx_port_13)
	                  begin
	                      rvx_signal_07  <= ST_READ;
	                      rvx_signal_10 <= `I2C_CMD_READ;
	                  end
	                else if (rvx_port_16)
	                  begin
	                      rvx_signal_07  <= ST_WRITE;
	                      rvx_signal_10 <= `I2C_CMD_WRITE;
	                  end
	                else 
	                  begin
	                      rvx_signal_07  <= ST_STOP;
	                      rvx_signal_10 <= `I2C_CMD_STOP;
	                  end

	                rvx_signal_05 <= 1'b1;
	            end

	        ST_START:
	          if (rvx_signal_02)
	            begin
	                if (rvx_port_13)
	                  begin
	                      rvx_signal_07  <= ST_READ;
	                      rvx_signal_10 <= `I2C_CMD_READ;
	                  end
	                else
	                  begin
	                      rvx_signal_07  <= ST_WRITE;
	                      rvx_signal_10 <= `I2C_CMD_WRITE;
	                  end

	                rvx_signal_05 <= 1'b1;
	            end

	        ST_WRITE:
	          if (rvx_signal_02)
	            if (rvx_signal_08)
	              begin
	                  rvx_signal_07  <= ST_ACK;
	                  rvx_signal_10 <= `I2C_CMD_READ;
	              end
	            else
	              begin
	                  rvx_signal_07  <= ST_WRITE;       
	                  rvx_signal_10 <= `I2C_CMD_WRITE; 
	                  rvx_signal_03    <= 1'b1;
	              end

	        ST_READ:
	          if (rvx_signal_02)
	            begin
	                if (rvx_signal_08)
	                  begin
	                      rvx_signal_07  <= ST_ACK;
	                      rvx_signal_10 <= `I2C_CMD_WRITE;
	                  end
	                else
	                  begin
	                      rvx_signal_07  <= ST_READ;       
	                      rvx_signal_10 <= `I2C_CMD_READ; 
	                  end

	                rvx_signal_03    <= 1'b1;
	                rvx_signal_04 <= rvx_port_18;
	            end

	        ST_ACK:
	          if (rvx_signal_02)
	            begin
	               if (rvx_port_02)
	                 begin
	                     rvx_signal_07  <= ST_STOP;
	                     rvx_signal_10 <= `I2C_CMD_STOP;
	                 end
	               else
	                 begin
	                     rvx_signal_07  <= ST_IDLE;
	                     rvx_signal_10 <= `I2C_CMD_NOP;

	                     
	                     rvx_port_05  <= 1'b1;
	                 end

	                 
	                 rvx_port_20 <= rvx_signal_09;

	                 rvx_signal_04 <= 1'b1;
	             end
	           else
	             rvx_signal_04 <= rvx_port_18;

	        ST_STOP:
	          if (rvx_signal_02)
	            begin
	                rvx_signal_07  <= ST_IDLE;
	                rvx_signal_10 <= `I2C_CMD_NOP;

	                
	                rvx_port_05  <= 1'b1;
	            end

	      endcase
	  end
endmodule
