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
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_include_01.vh"





module MUNOC_MODULE_29
(
	munoc_port_18,
	munoc_port_07,

	munoc_port_03,
	munoc_port_11,
	munoc_port_12,
	munoc_port_10,
	munoc_port_00,
	munoc_port_01,
	munoc_port_19,
	munoc_port_17,

	munoc_port_13,
	munoc_port_22,
	munoc_port_16,
	munoc_port_06,
	munoc_port_04,
	munoc_port_21,

	munoc_port_02,
	munoc_port_09,
	munoc_port_15,
	munoc_port_08,
	munoc_port_14,
	munoc_port_20,
	munoc_port_05
);





parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_1 = `BW_LONGEST_MASTER_DATA;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_88(MUNOC_GPARA_0);
localparam  MUNOC_LPARA_1 = `GET_AXI_SIZE(MUNOC_GPARA_0);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_18, munoc_port_07;

input wire [`MUNOC_GDEF_23-1:0] munoc_port_03;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_11;
input wire munoc_port_12;
input wire munoc_port_10;
input wire [MUNOC_GPARA_1-1:0] munoc_port_00;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_port_01;

input wire [`BW_ADDR_OFFSET-1:0] munoc_port_19;
input wire [`BW_AXI_ALEN-1:0] munoc_port_17;

input wire munoc_port_13;
input wire munoc_port_22;
input wire munoc_port_16;
input wire munoc_port_06;
input wire munoc_port_04;
output wire munoc_port_21;

output wire [MUNOC_GPARA_0-1:0] munoc_port_02;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_port_09;
output wire munoc_port_15;
output wire munoc_port_08;
input wire munoc_port_14;
output reg munoc_port_20;
output wire munoc_port_05;

genvar i;
integer j,k;

wire [`BW_BYTE-1:0] munoc_signal_14 [`NUM_BYTE(MUNOC_GPARA_1)-1:0];

`define MUNOC_LDEF_5 2
`define MUNOC_LDEF_4 0
`define MUNOC_LDEF_6 1
`define MUNOC_LDEF_0 2

reg [`MUNOC_LDEF_5-1:0] munoc_signal_04;
reg [`BW_AXI_ALEN-1:0] munoc_signal_18;

reg [MUNOC_GPARA_0-1:0] munoc_signal_01;
reg [`NUM_BYTE(MUNOC_GPARA_0)-1:0] munoc_signal_00;

`define MUNOC_LDEF_2 REQUIRED_BITWIDTH_INDEX(MUNOC_GPARA_1/MUNOC_GPARA_0)

reg [`MUNOC_LDEF_2-1:0] munoc_signal_21;
reg [`MUNOC_LDEF_2-1:0] munoc_signal_02, munoc_signal_05;

wire [MUNOC_GPARA_1-1:0] munoc_signal_12;
wire [MUNOC_GPARA_0-1:0] munoc_signal_19;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_09;

reg [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_03;

reg [`BW_AXI_WSTRB(128*8)-1:0] munoc_signal_15;
wire [`BW_AXI_WSTRB(`ULIMIT_OF_DATA_WIDTH)-1:0] munoc_signal_20;
reg [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_06;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_10;

`define MUNOC_LDEF_3 4
reg [`MUNOC_LDEF_3-1:0] munoc_signal_17;

wire munoc_signal_16;

`define MUNOC_LDEF_1 7
reg [`MUNOC_LDEF_1-1:0] munoc_signal_07;
reg [`MUNOC_LDEF_1-1:0] munoc_signal_11;
reg [`MUNOC_LDEF_1-1:0] munoc_signal_13, munoc_signal_08;
reg [`MUNOC_LDEF_1-1:0] munoc_signal_22;

generate
	for(i=0; i<`NUM_BYTE(MUNOC_GPARA_1); i=i+1)
	begin : i_unpack_data
		assign munoc_signal_14[i] = munoc_port_00[(i+1)*`BW_BYTE-1-:`BW_BYTE];
	end
endgenerate

always@(posedge munoc_port_18, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_04 <= `MUNOC_LDEF_4;
	else
		case(munoc_signal_04)
			`MUNOC_LDEF_4:
				if(munoc_port_04)
				begin
					if(munoc_port_16)
						munoc_signal_04 <= `MUNOC_LDEF_0;
					else
						munoc_signal_04 <= `MUNOC_LDEF_6;
				end
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_6:
				if(munoc_port_05)
					munoc_signal_04 <= `MUNOC_LDEF_4;
		endcase
end

assign munoc_port_21 = (munoc_signal_04!=`MUNOC_LDEF_4);

always@(posedge munoc_port_18, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_18 <= 0;
	else if(munoc_signal_16)
		if(munoc_port_15)
			munoc_signal_18 <= 0;
		else
			munoc_signal_18 <= munoc_signal_18 + 1'b 1;
end
assign munoc_port_15 = (munoc_signal_18==munoc_port_17);

always@(posedge munoc_port_18, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_11 <= 0;
	else if(munoc_port_06)
	begin
		if(munoc_port_11 >= MUNOC_LPARA_1)
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_85: munoc_signal_11 <= 4;
				`MUNOC_GDEF_43: munoc_signal_11 <= 8;
				`MUNOC_GDEF_00: munoc_signal_11 <= 16;
			endcase
		else
			case(munoc_port_11)
				`AXI_SIZE_001BYTE: munoc_signal_11 <= 1;
				`AXI_SIZE_002BYTE: munoc_signal_11 <= 2;
				`AXI_SIZE_004BYTE: munoc_signal_11 <= 4;
				`AXI_SIZE_008BYTE: munoc_signal_11 <= 8;
				`AXI_SIZE_016BYTE: munoc_signal_11 <= 16;
				`AXI_SIZE_032BYTE: munoc_signal_11 <= 32;
				`AXI_SIZE_064BYTE: munoc_signal_11 <= 64;
				`AXI_SIZE_128BYTE: munoc_signal_11 <= 128;
			endcase
	end
end

always@(posedge munoc_port_18, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_07 <= 0;
	else if(munoc_port_06)
		munoc_signal_07 <= 0;
	else if(munoc_signal_16)
		munoc_signal_07 <= munoc_signal_07 + munoc_signal_11;
end

always@(*)
begin
	munoc_signal_22 = 0;
	case(MUNOC_LPARA_0)
		`MUNOC_GDEF_85: munoc_signal_22 = $unsigned(munoc_signal_07[`MUNOC_LDEF_1-1:2]);
		`MUNOC_GDEF_43: munoc_signal_22 = $unsigned(munoc_signal_07[`MUNOC_LDEF_1-1:3]);
		`MUNOC_GDEF_00: munoc_signal_22 = $unsigned(munoc_signal_07[`MUNOC_LDEF_1-1:4]);
	endcase
end

always@(*)
begin
	munoc_signal_01 = 0;
	munoc_signal_00 = 0;
	for(j=0;j<`NUM_BYTE(MUNOC_GPARA_0); j=j+1)
	begin
		munoc_signal_01[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_14[j%4];
		munoc_signal_00[j] = munoc_port_01[j%4];
	end
	for(j=0;j<`NUM_BYTE(MUNOC_GPARA_0); j=j+1)
		case(munoc_port_03)
			`MUNOC_GDEF_85:
				if( (j%4) < `NUM_BYTE(MUNOC_GPARA_1))
				begin
					munoc_signal_01[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_14[j%4];
					munoc_signal_00[j] = munoc_port_01[j%4];
				end
			`MUNOC_GDEF_43:
				if( (j%8) < `NUM_BYTE(MUNOC_GPARA_1))
				begin
					munoc_signal_01[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_14[j%8];
					munoc_signal_00[j] = munoc_port_01[j%8];
				end
			`MUNOC_GDEF_00:
				if( (j%16) < `NUM_BYTE(MUNOC_GPARA_1))
				begin
					munoc_signal_01[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_14[j%16];
					munoc_signal_00[j] = munoc_port_01[j%16];
				end
	endcase
end

always@(posedge munoc_port_18, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_02 <= 0;
	else if(munoc_port_06)
		munoc_signal_02 <= munoc_signal_05;
end

always@(*)
begin
	munoc_signal_05 = 0;
	if($unsigned(munoc_port_03) <= MUNOC_LPARA_0)
		;
	else
		for(j=0; j<`MUNOC_LDEF_2; j=j+1)
			if(j<($unsigned(munoc_port_03)-MUNOC_LPARA_0))
				munoc_signal_05[j] = 1;
end

always@(*)
begin
	munoc_signal_21 = $unsigned(munoc_signal_22);
	munoc_signal_21 = munoc_signal_21 & munoc_signal_02;
end

generate
	for(i=0; i<`NUM_BYTE(MUNOC_GPARA_1); i=i+1)
	begin : i_concatenate_data
		assign munoc_signal_12[(i+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_14[i];
	end
endgenerate

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_0),
	.NUM_DATA(MUNOC_GPARA_1/MUNOC_GPARA_0)
)
i_munoc_instance_0
(
	.data_input_list(munoc_signal_12),
	.select(munoc_signal_21),
	.data_output(munoc_signal_19)
);

ERVP_MUX
#(
	.BW_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_0)),
	.NUM_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_1)/`BW_AXI_WSTRB(MUNOC_GPARA_0))
)
i_munoc_instance_1
(
	.data_input_list(munoc_port_01),
	.select(munoc_signal_21),
	.data_output(munoc_signal_09)
);

always@(posedge munoc_port_18, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_03 <= 0;
	else if(munoc_port_06)
		munoc_signal_03 <= munoc_signal_06;
	else if(munoc_signal_16)
		munoc_signal_03 <= munoc_signal_10;
end

always@(*)
begin
	munoc_signal_15 = 0;
	case(munoc_port_11)
		`AXI_SIZE_001BYTE: munoc_signal_15[1-1:0] = -1;
		`AXI_SIZE_002BYTE: munoc_signal_15[2-1:0] = -1;
		`AXI_SIZE_004BYTE: munoc_signal_15[4-1:0] = -1;
		`AXI_SIZE_008BYTE: munoc_signal_15[8-1:0] = -1;
		`AXI_SIZE_016BYTE: munoc_signal_15[16-1:0] = -1;
		`AXI_SIZE_032BYTE: munoc_signal_15[32-1:0] = -1;
		`AXI_SIZE_064BYTE: munoc_signal_15[64-1:0] = -1;
		`AXI_SIZE_128BYTE: munoc_signal_15[128-1:0] = -1;
	endcase
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`BW_AXI_WSTRB(`ULIMIT_OF_DATA_WIDTH)),
	.BW_SHIFT_AMOUNT(`BW_ADDR_OFFSET),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(1)
)
i_munoc_instance_2
(
	.data_input(munoc_signal_15[`BW_AXI_WSTRB(`ULIMIT_OF_DATA_WIDTH)-1:0]),
	.shift_amount(munoc_port_19),
	.data_output(munoc_signal_20)
);

always@(*)
begin
	munoc_signal_06 = 0;
	for(j=0; j<(`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_0); j=j+1)
	begin
		if(j==0)
			munoc_signal_06 = munoc_signal_20[(j+1)*`BW_AXI_WSTRB(MUNOC_GPARA_0)-1 -:`BW_AXI_WSTRB(MUNOC_GPARA_0)];
		else
			munoc_signal_06 = munoc_signal_06 | munoc_signal_20[(j+1)*`BW_AXI_WSTRB(MUNOC_GPARA_0)-1 -:`BW_AXI_WSTRB(MUNOC_GPARA_0)];
	end
end

always@(posedge munoc_port_18, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_17 <= 0;
	else if(munoc_port_06)
	begin
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_85:
				case(munoc_port_11)
					`AXI_SIZE_001BYTE: munoc_signal_17 <= 1;
					`AXI_SIZE_002BYTE: munoc_signal_17 <= 2;
					`AXI_SIZE_004BYTE,
					`AXI_SIZE_008BYTE,
					`AXI_SIZE_016BYTE: munoc_signal_17 <= 0;
				endcase
			`MUNOC_GDEF_43:
				case(munoc_port_11)
					`AXI_SIZE_001BYTE: munoc_signal_17 <= 1;
					`AXI_SIZE_002BYTE: munoc_signal_17 <= 2;
					`AXI_SIZE_004BYTE: munoc_signal_17 <= 4;
					`AXI_SIZE_008BYTE,
					`AXI_SIZE_016BYTE: munoc_signal_17 <= 0;
				endcase
			`MUNOC_GDEF_00:
				case(munoc_port_11)
					`AXI_SIZE_001BYTE: munoc_signal_17 <= 1;
					`AXI_SIZE_002BYTE: munoc_signal_17 <= 2;
					`AXI_SIZE_004BYTE: munoc_signal_17 <= 4;
					`AXI_SIZE_008BYTE: munoc_signal_17 <= 8;
					`AXI_SIZE_016BYTE: munoc_signal_17 <= 0; 
				endcase
		endcase
	end
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_0)),
	.BW_SHIFT_AMOUNT(`MUNOC_LDEF_3),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(1)
)
i_munoc_instance_3
(
	.data_input(munoc_signal_03),
	.shift_amount(munoc_signal_17),
	.data_output(munoc_signal_10)
);

assign munoc_port_02 = (munoc_signal_04==`MUNOC_LDEF_0)? munoc_signal_19 : munoc_signal_01;
assign munoc_port_09 = (munoc_signal_04==`MUNOC_LDEF_0)? munoc_signal_09 : (munoc_signal_03 & munoc_signal_00);

always@(posedge munoc_port_18, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_13 <= 0;
	else if(munoc_port_06)
		munoc_signal_13 <= munoc_signal_08;
end

always@(*)
begin
	munoc_signal_08 = -1;
	if(munoc_port_11 <= MUNOC_LPARA_1)
		;
	else
		for(j=0; j<`MUNOC_LDEF_1; j=j+1)
			if(j<($unsigned(munoc_port_11)-MUNOC_LPARA_1))
				munoc_signal_08[j] = 0;
end

always@(*)
begin
	munoc_port_20 = 0;
	if(munoc_signal_16)
		munoc_port_20 = ($signed((munoc_signal_22|munoc_signal_13))==(-1));
end

assign munoc_port_08 = (munoc_signal_04!=`MUNOC_LDEF_4) & munoc_port_12;

assign munoc_signal_16 = munoc_port_08 & munoc_port_14;
assign munoc_port_05 = munoc_signal_16 & munoc_port_15;

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_6
`undef MUNOC_LDEF_5
endmodule
