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


`include "ervp_uart_defines.vh"





module RVX_MODULE_036 (
	rvx_port_05, 
	rvx_port_08, 
	rvx_port_09, 
	rvx_port_02, 
	rvx_port_04, 
	rvx_port_06,	
	rvx_port_00, 
	rvx_port_10, 
	rvx_port_07, 
	rvx_port_01, 
	rvx_port_03
);





`include "rvx_include_22.vh"

input wire rvx_port_08;
input wire rvx_port_05;
input wire [7:0] rvx_port_09;
input wire rvx_port_02;
input wire [7:0] rvx_port_04;
input wire rvx_port_06;
input wire rvx_port_01;
input wire rvx_port_03; 
output wire rvx_port_00;
output reg [2:0] rvx_port_10;
output wire [FIFO_COUNTER_W-1:0] rvx_port_07;

reg [4:0] 									rvx_signal_03;
reg [2:0] 									rvx_signal_02;   
reg [6:0] 									rvx_signal_06;	
reg 											rvx_signal_09;
reg 											rvx_signal_04;  
reg 											rvx_signal_05;
reg 											rvx_signal_07;

wire [`UART_FIFO_WIDTH-1:0] 			rvx_signal_00;
wire [`UART_FIFO_WIDTH-1:0] 			rvx_signal_08;
wire 											rvx_signal_01;

assign 										rvx_signal_00 = rvx_port_04;

RVX_MODULE_011 i_rvx_instance_0(	
	.rvx_port_08(rvx_port_05),
	.rvx_port_06(rvx_port_08), 
	.rvx_port_01(rvx_signal_00),
	.rvx_port_05(rvx_signal_08),
	.rvx_port_02(rvx_port_02),
	.rvx_port_07(rvx_signal_05),
	.rvx_port_00(rvx_signal_01),
	.rvx_port_03(rvx_port_07),
	.rvx_port_09(rvx_port_01),
	.rvx_port_04(rvx_port_03)
);

parameter RVX_GPARA_0        = 3'd0;
parameter RVX_GPARA_2  = 3'd1;
parameter RVX_GPARA_3   = 3'd2;
parameter RVX_GPARA_5 = 3'd3;
parameter RVX_GPARA_1   = 3'd4;
parameter RVX_GPARA_4    = 3'd5;

always @(posedge rvx_port_08 or posedge rvx_port_05)
begin
  if (rvx_port_05)
  begin
	rvx_port_10       <=  RVX_GPARA_0;
	rvx_signal_09       <=  1'b1;
	rvx_signal_03   <=  5'b0;
	rvx_signal_06   <=  7'b0;
	rvx_signal_07     <=  1'b0;
	rvx_signal_04  <=  1'b0;
	rvx_signal_05      <=  1'b0;
	rvx_signal_02 <=  3'b0;
  end
  else
  if (rvx_port_06)
  begin
	case (rvx_port_10)
	RVX_GPARA_0	 :	if (~|rvx_port_07) 
			begin
				rvx_port_10 <=  RVX_GPARA_0;
				rvx_signal_09 <=  1'b1;
			end
			else
			begin
				rvx_signal_05 <=  1'b0;
				rvx_signal_09  <=  1'b1;
				rvx_port_10  <=  RVX_GPARA_4;
			end
	RVX_GPARA_4 :	begin
				rvx_signal_05 <=  1'b1;
				case (rvx_port_09[1:0])  
				2'b00 : begin
					rvx_signal_02 <=  3'b100;
					rvx_signal_04  <=  ^rvx_signal_08[4:0];
				     end
				2'b01 : begin
					rvx_signal_02 <=  3'b101;
					rvx_signal_04  <=  ^rvx_signal_08[5:0];
				     end
				2'b10 : begin
					rvx_signal_02 <=  3'b110;
					rvx_signal_04  <=  ^rvx_signal_08[6:0];
				     end
				2'b11 : begin
					rvx_signal_02 <=  3'b111;
					rvx_signal_04  <=  ^rvx_signal_08[7:0];
				     end
				endcase
				{rvx_signal_06[6:0], rvx_signal_07} <=  rvx_signal_08;
				rvx_port_10 <=  RVX_GPARA_2;
			end
	RVX_GPARA_2 :	begin
				rvx_signal_05 <=  1'b0;
				if (~|rvx_signal_03)
					rvx_signal_03 <=  5'b01111;
				else
				if (rvx_signal_03 == 5'b00001)
				begin
					rvx_signal_03 <=  0;
					rvx_port_10 <=  RVX_GPARA_3;
				end
				else
					rvx_signal_03 <=  rvx_signal_03 - 1'b1;
				rvx_signal_09 <=  1'b0;
			end
	RVX_GPARA_3 :	begin
				if (~|rvx_signal_03)
					rvx_signal_03 <=  5'b01111;
				else
				if (rvx_signal_03 == 5'b00001)
				begin
					if (rvx_signal_02 > 3'b0)
					begin
						rvx_signal_02 <=  rvx_signal_02 - 1'b1;
						{rvx_signal_06[5:0],rvx_signal_07  } <=  {rvx_signal_06[6:1], rvx_signal_06[0]};
						rvx_port_10 <=  RVX_GPARA_3;
					end
					else   
					if (~rvx_port_09[`UART_LC_PE])
					begin
						rvx_port_10 <=  RVX_GPARA_1;
					end
					else
					begin
						case ({rvx_port_09[`UART_LC_EP],rvx_port_09[`UART_LC_SP]})
						2'b00:	rvx_signal_07 <=  ~rvx_signal_04;
						2'b01:	rvx_signal_07 <=  1'b1;
						2'b10:	rvx_signal_07 <=  rvx_signal_04;
						2'b11:	rvx_signal_07 <=  1'b0;
						endcase
						rvx_port_10 <=  RVX_GPARA_5;
					end
					rvx_signal_03 <=  0;
				end
				else
					rvx_signal_03 <=  rvx_signal_03 - 1'b1;
				rvx_signal_09 <=  rvx_signal_07; 
			end
	RVX_GPARA_5 :	begin
				if (~|rvx_signal_03)
					rvx_signal_03 <=  5'b01111;
				else
				if (rvx_signal_03 == 5'b00001)
				begin
					rvx_signal_03 <=  4'b0;
					rvx_port_10 <=  RVX_GPARA_1;
				end
				else
					rvx_signal_03 <=  rvx_signal_03 - 1'b1;
				rvx_signal_09 <=  rvx_signal_07;
			end
	RVX_GPARA_1 :  begin
				if (~|rvx_signal_03)
				  begin
						casex ({rvx_port_09[`UART_LC_SB],rvx_port_09[`UART_LC_BITS]})
  						3'b0xx:	  rvx_signal_03 <=  5'b01101;     
  						3'b100:	  rvx_signal_03 <=  5'b10101;     
  						default:	  rvx_signal_03 <=  5'b11101;     
						endcase
					end
				else
				if (rvx_signal_03 == 5'b00001)
				begin
					rvx_signal_03 <=  0;
					rvx_port_10 <=  RVX_GPARA_0;
				end
				else
					rvx_signal_03 <=  rvx_signal_03 - 1'b1;
				rvx_signal_09 <=  1'b1;
			end

		default : 
			rvx_port_10 <=  RVX_GPARA_0;
	endcase
  end 
  else
    rvx_signal_05 <=  1'b0;  
end 

assign rvx_port_00 = rvx_port_09[`UART_LC_BC] ? 1'b0 : rvx_signal_09;    
	
endmodule

