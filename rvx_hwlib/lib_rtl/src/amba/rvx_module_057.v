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

`include "ervp_global.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_057
(
	rvx_port_10,
	rvx_port_07,

	rvx_port_02,
	rvx_port_11,
	rvx_port_00,
	rvx_port_06,
	rvx_port_01,
	rvx_port_08,
	rvx_port_09,
	rvx_port_03,
	rvx_port_04,
	rvx_port_05
);





parameter RVX_GPARA_0 = 1;

input wire rvx_port_10;
input wire rvx_port_07;

input wire [RVX_GPARA_0-1:0] rvx_port_02;
input wire [`BW_AXI_ALEN-1:0] rvx_port_11;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_00;
input wire [`BW_AXI_ABURST-1:0] rvx_port_06;
input wire rvx_port_01;
input wire rvx_port_08;

output reg rvx_port_03;
output reg [RVX_GPARA_0-1:0] rvx_port_09;
output reg rvx_port_04;
output wire rvx_port_05;

reg rvx_signal_05;

reg [`BW_AXI_ALEN-1:0] rvx_signal_06;

reg [RVX_GPARA_0-1:0] rvx_signal_03;
reg [RVX_GPARA_0-1:0] rvx_signal_02;
wire [RVX_GPARA_0-1:0] rvx_signal_01;
wire [RVX_GPARA_0-1:0] rvx_signal_07, rvx_signal_08;
reg [RVX_GPARA_0-1:0] rvx_signal_00;

reg [RVX_GPARA_0-1:0] rvx_signal_09, rvx_signal_04;

always@(*)
begin
	rvx_signal_05 = 0;
	if(rvx_port_03==0)
		rvx_signal_05 = rvx_port_01;
	else if(rvx_port_08 & rvx_port_05)
		rvx_signal_05 = rvx_port_01;
end

always@(posedge rvx_port_10, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
	begin
		rvx_port_03 <= 0;
		rvx_port_09 <= 0;
		rvx_signal_06 <= 0;
	end
	else if(rvx_signal_05==1)
	begin
		rvx_port_03 <= 1;
		rvx_port_09 <= $unsigned(rvx_port_02);
		case(rvx_port_06)
			`AXI_BURST_FIXED:
				rvx_signal_06 <= 0;
			`AXI_BURST_INCR,
			`AXI_BURST_WRAP:
				rvx_signal_06 <= rvx_port_11;		
		endcase
	end
	else
		if(rvx_port_08)
		begin
			if(rvx_port_05)
			begin
				rvx_port_03 <= 0;
				rvx_port_09 <= rvx_signal_00;
				rvx_signal_06 <= rvx_signal_06 - 1;
			end
			else
			begin
				rvx_port_09 <= rvx_signal_00;
				rvx_signal_06 <= rvx_signal_06 - 1;
			end
		end
end

always@(posedge rvx_port_10, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_03 <= 0;
	else if(rvx_signal_05)
		case(rvx_port_00)
			`AXI_SIZE_001BYTE: rvx_signal_03 <= 1;
			`AXI_SIZE_002BYTE: rvx_signal_03 <= 2;
			`AXI_SIZE_004BYTE: rvx_signal_03 <= 4;
			`AXI_SIZE_008BYTE: rvx_signal_03 <= 8;
			`AXI_SIZE_016BYTE: rvx_signal_03 <= 16;
			`AXI_SIZE_032BYTE: rvx_signal_03 <= 32;
			`AXI_SIZE_064BYTE: rvx_signal_03 <= 64;
			`AXI_SIZE_128BYTE: rvx_signal_03 <= 128;
		endcase
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(RVX_GPARA_0),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_rvx_instance_0
(
	.data_input(rvx_signal_07),
	.shift_amount(rvx_port_00),
	.data_output(rvx_signal_08)
);

assign rvx_signal_07 = $unsigned(rvx_port_11);
assign rvx_signal_01 = (rvx_port_06==`AXI_BURST_WRAP)? rvx_signal_08 : $signed(-1);

always@(posedge rvx_port_10, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_02 <= $signed(-1);
	else if(rvx_signal_05)
		rvx_signal_02 <= rvx_signal_01;
end

always@(posedge rvx_port_10, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_09 <= 0;
	else if(rvx_signal_05)
		rvx_signal_09 <= rvx_signal_04;
end

always@(*)
begin
	rvx_signal_04 = -1;
	case(rvx_port_00)
		`AXI_SIZE_001BYTE: ;
		`AXI_SIZE_002BYTE: rvx_signal_04[0] = 0;
		`AXI_SIZE_004BYTE: rvx_signal_04[1:0] = 0;
		`AXI_SIZE_008BYTE: rvx_signal_04[2:0] = 0;
		`AXI_SIZE_016BYTE: rvx_signal_04[3:0] = 0;
		`AXI_SIZE_032BYTE: rvx_signal_04[4:0] = 0;
		`AXI_SIZE_064BYTE: rvx_signal_04[5:0] = 0;
		`AXI_SIZE_128BYTE: rvx_signal_04[6:0] = 0;
	endcase
end

always@(*)
begin
	rvx_signal_00 = rvx_port_09 + rvx_signal_03;
	rvx_signal_00 = (rvx_port_09 & (~rvx_signal_02) ) | (rvx_signal_00 & rvx_signal_02);
	rvx_signal_00 = rvx_signal_00 & rvx_signal_09;
end

always@(posedge rvx_port_10, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_port_04 <= 0;
	else if(rvx_signal_05)
		rvx_port_04 <= 1;
	else if(rvx_port_04&&rvx_port_08)
		rvx_port_04 <= 0;
end

assign rvx_port_05 = (rvx_signal_06==0);

endmodule
