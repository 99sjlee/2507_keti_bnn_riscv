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





module RVX_MODULE_108 (
	rvx_port_06, 
	rvx_port_08, 
	rvx_port_04, 
	rvx_port_07,
	rvx_port_02, 
	rvx_port_05,   
	rvx_port_00,
	rvx_port_03,
	rvx_port_01,
	rvx_port_10,
	rvx_port_09
);





`include "rvx_include_22.vh"

parameter RVX_GPARA_0 		= `UART_FIFO_WIDTH;

input wire rvx_port_08;
input wire rvx_port_06;
input wire rvx_port_02;
input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_04;
input wire rvx_port_10;
input wire rvx_port_09;

output wire [RVX_GPARA_0-1:0] rvx_port_07;
output reg rvx_port_00;
output reg [FIFO_COUNTER_W-1:0] rvx_port_03;
output wire rvx_port_01;

wire [7:0] rvx_signal_04;
reg	[2:0]	rvx_signal_07[FIFO_DEPTH-1:0];

reg	[FIFO_POINTER_W-1:0]	rvx_signal_17;
reg	[FIFO_POINTER_W-1:0]	rvx_signal_15;

wire [FIFO_POINTER_W-1:0] top_plus_1 = rvx_signal_17 + 1'b1;

RVX_MODULE_120 #(FIFO_POINTER_W,8,FIFO_DEPTH) i_rvx_instance_0(
	.rvx_port_4(rvx_port_08), 
	.rvx_port_2(rvx_port_02), 
	.rvx_port_3(rvx_signal_17), 
	.rvx_port_1(rvx_signal_15), 
	.rvx_port_5(rvx_port_04[RVX_GPARA_0-1:RVX_GPARA_0-8]), 
	.rvx_port_0(rvx_signal_04)
); 

always @(posedge rvx_port_08 or posedge rvx_port_06) 
begin
	if (rvx_port_06)
	begin
		rvx_signal_17		<=  0;
		rvx_signal_15		<=  1'b0;
		rvx_port_03		<=  0;
		rvx_signal_07[0] <=  0;
		rvx_signal_07[1] <=  0;
		rvx_signal_07[2] <=  0;
		rvx_signal_07[3] <=  0;
		rvx_signal_07[4] <=  0;
		rvx_signal_07[5] <=  0;
		rvx_signal_07[6] <=  0;
		rvx_signal_07[7] <=  0;
		rvx_signal_07[8] <=  0;
		rvx_signal_07[9] <=  0;
		rvx_signal_07[10] <=  0;
		rvx_signal_07[11] <=  0;
		rvx_signal_07[12] <=  0;
		rvx_signal_07[13] <=  0;
		rvx_signal_07[14] <=  0;
		rvx_signal_07[15] <=  0;
	end
	else
	if (rvx_port_10) begin
		rvx_signal_17		<=  0;
		rvx_signal_15		<=  1'b0;
		rvx_port_03		<=  0;
		rvx_signal_07[0] <=  0;
		rvx_signal_07[1] <=  0;
		rvx_signal_07[2] <=  0;
		rvx_signal_07[3] <=  0;
		rvx_signal_07[4] <=  0;
		rvx_signal_07[5] <=  0;
		rvx_signal_07[6] <=  0;
		rvx_signal_07[7] <=  0;
		rvx_signal_07[8] <=  0;
		rvx_signal_07[9] <=  0;
		rvx_signal_07[10] <=  0;
		rvx_signal_07[11] <=  0;
		rvx_signal_07[12] <=  0;
		rvx_signal_07[13] <=  0;
		rvx_signal_07[14] <=  0;
		rvx_signal_07[15] <=  0;
	end
  else
	begin
		case ({rvx_port_02, rvx_port_05})
		2'b10 : if (rvx_port_03<FIFO_DEPTH)  
			begin
				rvx_signal_17       <=  top_plus_1;
				rvx_signal_07[rvx_signal_17] <=  rvx_port_04[2:0];
				rvx_port_03     <=  rvx_port_03 + 1'b1;
			end
		2'b01 : if(rvx_port_03>0)
			begin
        rvx_signal_07[rvx_signal_15] <=  0;
				rvx_signal_15   <=  rvx_signal_15 + 1'b1;
				rvx_port_03	 <=  rvx_port_03 - 1'b1;
			end
		2'b11 : begin
				rvx_signal_15   <=  rvx_signal_15 + 1'b1;
				rvx_signal_17       <=  top_plus_1;
				rvx_signal_07[rvx_signal_17] <=  rvx_port_04[2:0];
		        end
    default: ;
		endcase
	end
end   

always @(posedge rvx_port_08 or posedge rvx_port_06) 
begin
  if (rvx_port_06)
    rvx_port_00   <=  1'b0;
  else
  if(rvx_port_10 | rvx_port_09) 
    rvx_port_00   <=  1'b0;
  else
  if(rvx_port_02 & ~rvx_port_05 & (rvx_port_03==FIFO_DEPTH))
    rvx_port_00   <=  1'b1;
end   

assign rvx_port_07 = {rvx_signal_04,rvx_signal_07[rvx_signal_15]};

wire	[2:0]	word0 = rvx_signal_07[0];
wire	[2:0]	word1 = rvx_signal_07[1];
wire	[2:0]	word2 = rvx_signal_07[2];
wire	[2:0]	word3 = rvx_signal_07[3];
wire	[2:0]	word4 = rvx_signal_07[4];
wire	[2:0]	word5 = rvx_signal_07[5];
wire	[2:0]	word6 = rvx_signal_07[6];
wire	[2:0]	word7 = rvx_signal_07[7];

wire	[2:0]	word8 = rvx_signal_07[8];
wire	[2:0]	word9 = rvx_signal_07[9];
wire	[2:0]	word10 = rvx_signal_07[10];
wire	[2:0]	word11 = rvx_signal_07[11];
wire	[2:0]	word12 = rvx_signal_07[12];
wire	[2:0]	word13 = rvx_signal_07[13];
wire	[2:0]	word14 = rvx_signal_07[14];
wire	[2:0]	word15 = rvx_signal_07[15];

assign	rvx_port_01 = |(word0[2:0]  | word1[2:0]  | word2[2:0]  | word3[2:0]  |
            		      word4[2:0]  | word5[2:0]  | word6[2:0]  | word7[2:0]  |
            		      word8[2:0]  | word9[2:0]  | word10[2:0] | word11[2:0] |
            		      word12[2:0] | word13[2:0] | word14[2:0] | word15[2:0] );

endmodule

