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





module RVX_MODULE_011 (
	rvx_port_06, 
	rvx_port_08, 
	rvx_port_01, 
	rvx_port_05,
	rvx_port_02, 
	rvx_port_07,   
	rvx_port_00,
	rvx_port_03,
	rvx_port_09,
	rvx_port_04
);





`include "rvx_include_22.vh"

parameter RVX_GPARA_0 = `UART_FIFO_WIDTH;

input wire rvx_port_06;
input wire rvx_port_08;
input wire rvx_port_02;
input wire rvx_port_07;
input wire [RVX_GPARA_0-1:0] rvx_port_01;
input wire rvx_port_09;
input wire rvx_port_04;

output wire [RVX_GPARA_0-1:0] rvx_port_05;
output reg rvx_port_00;
output reg [FIFO_COUNTER_W-1:0] rvx_port_03;

reg	[FIFO_POINTER_W-1:0]		rvx_signal_2;
reg	[FIFO_POINTER_W-1:0]		rvx_signal_0;

wire [FIFO_POINTER_W-1:0] 		top_plus_1 = rvx_signal_2 + 1'b1;

RVX_MODULE_120 #(FIFO_POINTER_W,RVX_GPARA_0,FIFO_DEPTH) i_rvx_instance_0 (
	.rvx_port_4(rvx_port_06), 
	.rvx_port_2(rvx_port_02), 
	.rvx_port_3(rvx_signal_2), 
	.rvx_port_1(rvx_signal_0), 
	.rvx_port_5(rvx_port_01), 
	.rvx_port_0(rvx_port_05)
); 

always @(posedge rvx_port_06 or posedge rvx_port_08) 
begin
	if (rvx_port_08)
	begin
		rvx_signal_2		<=  0;
		rvx_signal_0		<=  1'b0;
		rvx_port_03		<=  0;
	end
	else
	if (rvx_port_09) begin
		rvx_signal_2		<=  0;
		rvx_signal_0		<=  1'b0;
		rvx_port_03		<=  0;
	end
  else
	begin
		case ({rvx_port_02, rvx_port_07})
		2'b10 : if (rvx_port_03<FIFO_DEPTH)  
			begin
				rvx_signal_2       <=  top_plus_1;
				rvx_port_03     <=  rvx_port_03 + 1'b1;
			end
		2'b01 : if(rvx_port_03>0)
			begin
				rvx_signal_0   <=  rvx_signal_0 + 1'b1;
				rvx_port_03	 <=  rvx_port_03 - 1'b1;
			end
		2'b11 : 
			begin
				rvx_signal_0   <=  rvx_signal_0 + 1'b1;
				rvx_signal_2       <=  top_plus_1;
			end
    default: ;
		endcase
	end
end   

always @(posedge rvx_port_06 or posedge rvx_port_08) 
begin
  if (rvx_port_08)
    rvx_port_00   <=  1'b0;
  else
  if(rvx_port_09 | rvx_port_04) 
    rvx_port_00   <=  1'b0;
  else
  if(rvx_port_02 & (rvx_port_03==FIFO_DEPTH))
    rvx_port_00   <=  1'b1;
end   

endmodule
