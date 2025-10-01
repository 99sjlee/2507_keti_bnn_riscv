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
// 2024-05-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_04.vh"
`include "ervp_axi_define.vh"





module MUNOC_MODULE_48
(
	munoc_port_11,
	munoc_port_10,

	munoc_port_01,
	munoc_port_07,
	munoc_port_02,
	munoc_port_09,
	munoc_port_00,
	munoc_port_04,
	munoc_port_06,
	munoc_port_03,
	munoc_port_05,
	munoc_port_08
);





parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_11;
input wire munoc_port_10;

input wire [MUNOC_GPARA_0-1:0] munoc_port_01;
input wire [`BW_AXI_ALEN-1:0] munoc_port_07;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_02;
input wire [`BW_AXI_ABURST-1:0] munoc_port_09;
input wire munoc_port_00;
input wire munoc_port_04;

output reg munoc_port_03;
output reg [MUNOC_GPARA_0-1:0] munoc_port_06;
output reg munoc_port_05;
output wire munoc_port_08;

reg munoc_signal_05;

reg [`BW_AXI_ALEN-1:0] munoc_signal_02;

reg [MUNOC_GPARA_0-1:0] munoc_signal_01;
reg [MUNOC_GPARA_0-1:0] munoc_signal_07;
wire [MUNOC_GPARA_0-1:0] munoc_signal_09;
wire [MUNOC_GPARA_0-1:0] munoc_signal_03, munoc_signal_00;
reg [MUNOC_GPARA_0-1:0] munoc_signal_04;

reg [MUNOC_GPARA_0-1:0] munoc_signal_06, munoc_signal_08;

always@(*)
begin
	munoc_signal_05 = 0;
	if(munoc_port_03==0)
		munoc_signal_05 = munoc_port_00;
	else if(munoc_port_04 & munoc_port_08)
		munoc_signal_05 = munoc_port_00;
end

always@(posedge munoc_port_11, negedge munoc_port_10)
begin
	if(munoc_port_10==0)
	begin
		munoc_port_03 <= 0;
		munoc_port_06 <= 0;
		munoc_signal_02 <= 0;
	end
	else if(munoc_signal_05==1)
	begin
		munoc_port_03 <= 1;
		munoc_port_06 <= $unsigned(munoc_port_01);
		case(munoc_port_09)
			`AXI_BURST_FIXED:
				munoc_signal_02 <= 0;
			`AXI_BURST_INCR,
			`AXI_BURST_WRAP:
				munoc_signal_02 <= munoc_port_07;		
		endcase
	end
	else
		if(munoc_port_04)
		begin
			if(munoc_port_08)
			begin
				munoc_port_03 <= 0;
				munoc_port_06 <= munoc_signal_04;
				munoc_signal_02 <= munoc_signal_02 - 1;
			end
			else
			begin
				munoc_port_06 <= munoc_signal_04;
				munoc_signal_02 <= munoc_signal_02 - 1;
			end
		end
end

always@(posedge munoc_port_11, negedge munoc_port_10)
begin
	if(munoc_port_10==0)
		munoc_signal_01 <= 0;
	else if(munoc_signal_05)
		case(munoc_port_02)
			`AXI_SIZE_001BYTE: munoc_signal_01 <= 1;
			`AXI_SIZE_002BYTE: munoc_signal_01 <= 2;
			`AXI_SIZE_004BYTE: munoc_signal_01 <= 4;
			`AXI_SIZE_008BYTE: munoc_signal_01 <= 8;
			`AXI_SIZE_016BYTE: munoc_signal_01 <= 16;
			`AXI_SIZE_032BYTE: munoc_signal_01 <= 32;
			`AXI_SIZE_064BYTE: munoc_signal_01 <= 64;
			`AXI_SIZE_128BYTE: munoc_signal_01 <= 128;
		endcase
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(MUNOC_GPARA_0),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_0
(
	.data_input(munoc_signal_03),
	.shift_amount(munoc_port_02),
	.data_output(munoc_signal_00)
);

assign munoc_signal_03 = $unsigned(munoc_port_07);
assign munoc_signal_09 = (munoc_port_09==`AXI_BURST_WRAP)? munoc_signal_00 : $signed(-1);

always@(posedge munoc_port_11, negedge munoc_port_10)
begin
	if(munoc_port_10==0)
		munoc_signal_07 <= $signed(-1);
	else if(munoc_signal_05)
		munoc_signal_07 <= munoc_signal_09;
end

always@(posedge munoc_port_11, negedge munoc_port_10)
begin
	if(munoc_port_10==0)
		munoc_signal_06 <= 0;
	else if(munoc_signal_05)
		munoc_signal_06 <= munoc_signal_08;
end

always@(*)
begin
	munoc_signal_08 = -1;
	case(munoc_port_02)
		`AXI_SIZE_001BYTE: ;
		`AXI_SIZE_002BYTE: munoc_signal_08[0] = 0;
		`AXI_SIZE_004BYTE: munoc_signal_08[1:0] = 0;
		`AXI_SIZE_008BYTE: munoc_signal_08[2:0] = 0;
		`AXI_SIZE_016BYTE: munoc_signal_08[3:0] = 0;
		`AXI_SIZE_032BYTE: munoc_signal_08[4:0] = 0;
		`AXI_SIZE_064BYTE: munoc_signal_08[5:0] = 0;
		`AXI_SIZE_128BYTE: munoc_signal_08[6:0] = 0;
	endcase
end

always@(*)
begin
	munoc_signal_04 = munoc_port_06 + munoc_signal_01;
	munoc_signal_04 = (munoc_port_06 & (~munoc_signal_07) ) | (munoc_signal_04 & munoc_signal_07);
	munoc_signal_04 = munoc_signal_04 & munoc_signal_06;
end

always@(posedge munoc_port_11, negedge munoc_port_10)
begin
	if(munoc_port_10==0)
		munoc_port_05 <= 0;
	else if(munoc_signal_05)
		munoc_port_05 <= 1;
	else if(munoc_port_05&&munoc_port_04)
		munoc_port_05 <= 0;
end

assign munoc_port_08 = (munoc_signal_02==0);

endmodule
