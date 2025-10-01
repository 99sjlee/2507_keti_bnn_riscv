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
`include "munoc_network_link.vh"
`include "munoc_include_10.vh"
`include "munoc_include_03.vh"
`include "munoc_include_00.vh"





module MUNOC_MODULE_40
(
	munoc_port_10,
	munoc_port_17,

	munoc_port_13,
	munoc_port_04,
	munoc_port_19,
	munoc_port_12,
	munoc_port_11,
	munoc_port_02,
  munoc_port_00,

	munoc_port_14,
	munoc_port_07,
	
	munoc_port_21,
	munoc_port_16,
	munoc_port_08,
	munoc_port_20,
	munoc_port_01,
	munoc_port_09,

  munoc_port_18,
	munoc_port_03,
  munoc_port_05,

	munoc_port_06,
  munoc_port_15
);





parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_2 = 1;

localparam  MUNOC_LPARA_2 = `MUNOC_GDEF_88(MUNOC_GPARA_0);
localparam  MUNOC_LPARA_0 = `GET_AXI_SIZE(MUNOC_GPARA_0);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_10, munoc_port_17;

input wire munoc_port_13;
input wire [`MUNOC_GDEF_23-1:0] munoc_port_04;
input wire [MUNOC_GPARA_1-1:0] munoc_port_19;
input wire [`BW_AXI_ALEN-1:0] munoc_port_12;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_11;
input wire [`BW_AXI_ABURST-1:0] munoc_port_02;
output wire munoc_port_00;

input wire munoc_port_14;
input wire munoc_port_07;

output reg [`MUNOC_GDEF_75-1:0] munoc_port_21; 
output reg [`MUNOC_GDEF_97(MUNOC_GPARA_0)-1:0] munoc_port_16;
output reg [MUNOC_GPARA_1-1:0] munoc_port_08;
output reg [`BW_AXI_ALEN-1:0] munoc_port_20;
output reg [`BW_AXI_ASIZE-1:0] munoc_port_01;
output reg [`BW_AXI_ABURST-1:0] munoc_port_09;

output wire munoc_port_18;
output wire munoc_port_03;
input wire munoc_port_05;

output wire munoc_port_06;
output reg [`MUNOC_GDEF_52-1:0] munoc_port_15;

genvar i;
integer j,k;

localparam  MUNOC_LPARA_3 = 0;
localparam  MUNOC_LPARA_1 = 1;

wire munoc_signal_22;
wire munoc_signal_28;
wire munoc_signal_12;

reg munoc_signal_27;
reg [`BW_AXI_ABURST-1:0] munoc_signal_15;
reg [`BW_AXI_ALEN-1:0] munoc_signal_18;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_02, munoc_signal_17;

wire [`BW_AXI_ASIZE-1:0] munoc_signal_09;
wire munoc_signal_23;

wire [`MUNOC_GDEF_75-1:0] munoc_signal_11;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_21;
wire [`MUNOC_GDEF_75-1:0] munoc_signal_00;

reg [`MUNOC_GDEF_75-1:0] munoc_signal_25; 
reg [`MUNOC_GDEF_75-1:0] munoc_signal_19;
wire [`MUNOC_GDEF_75-1:0] munoc_signal_16;
reg [`MUNOC_GDEF_97(MUNOC_GPARA_0)-1:0] munoc_signal_06, munoc_signal_05;
wire munoc_signal_26;

reg [MUNOC_GPARA_1-1:0] munoc_signal_03;
reg [MUNOC_GPARA_1-1:0] munoc_signal_13;
wire [MUNOC_GPARA_1-1:0] munoc_signal_29;
wire [MUNOC_GPARA_1-1:0] munoc_signal_01, munoc_signal_14;
reg [MUNOC_GPARA_1-1:0] munoc_signal_08;

reg [MUNOC_GPARA_1-1:0] munoc_signal_04;

wire [MUNOC_GPARA_1-1:0] munoc_signal_10;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_20;
wire [MUNOC_GPARA_1-1:0] munoc_signal_07;
wire [MUNOC_GPARA_1-1:0] munoc_signal_24;

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_port_15 <= 0;
	else
		case(munoc_port_15)
			MUNOC_LPARA_3:
				if(munoc_port_18)
					munoc_port_15 <= MUNOC_LPARA_1;
			MUNOC_LPARA_1:
				if(munoc_signal_12)
					munoc_port_15 <= MUNOC_LPARA_3;
		endcase
end

assign munoc_port_18 = (munoc_port_15==MUNOC_LPARA_3) & munoc_port_13 & munoc_port_07;
assign munoc_port_03 = (munoc_port_15==MUNOC_LPARA_1);
assign munoc_port_06 = munoc_port_03 & munoc_port_05;
assign munoc_signal_12 = munoc_port_06 & munoc_signal_22;

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_port_21 <= 0;
	else if(munoc_port_18)
		munoc_port_21 <= munoc_signal_25;
end

assign munoc_signal_09 = $unsigned(munoc_port_11) - MUNOC_LPARA_0;
assign munoc_signal_23 = ($signed(munoc_signal_09) < 0);

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`MUNOC_GDEF_75),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_0
(
	.data_input(munoc_signal_11),
	.shift_amount(munoc_signal_21),
	.data_output(munoc_signal_00)
);

assign munoc_signal_11 = $unsigned(munoc_port_12);
assign munoc_signal_21 = $unsigned(munoc_signal_09[`BW_AXI_ASIZE-2:0]);

always@(*)
begin
	munoc_signal_25 = munoc_port_12;
  if(munoc_signal_23)
		munoc_signal_25 = munoc_port_12;
	else
		munoc_signal_25 = munoc_signal_00;
end

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_port_01 <= 0;
	else if(munoc_port_18)
		munoc_port_01 <= munoc_signal_02;
end

RVX_MODULE_112
#(
	.RVX_GPARA_1(`BW_AXI_ASIZE),
	.RVX_GPARA_0(1),
	.SIGNED(0)
)
i_munoc_instance_1
(
	.rvx_port_1(munoc_port_11),
	.rvx_port_2(munoc_signal_17),
	.rvx_port_0(munoc_signal_02)
);

assign munoc_signal_17 = MUNOC_LPARA_0;

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_port_09 <= 0;
	else if(munoc_port_18)
		munoc_port_09 <= munoc_signal_15;
end

always@(*)
begin
	munoc_signal_15 = munoc_port_02;
	if(munoc_signal_27)
	begin
		munoc_signal_15 = `AXI_BURST_INCR;
	end
	else if(munoc_port_14&&(munoc_port_02==`AXI_BURST_FIXED))
		munoc_signal_15 = `AXI_BURST_INCR;
end

assign munoc_signal_26 = ($unsigned(munoc_signal_25) > (`MAX_BURST_LENGTH-1));

always@(*)
begin
	munoc_signal_27 = 0;
	if(munoc_port_02==`AXI_BURST_WRAP)
	begin
		if(munoc_signal_26)
			munoc_signal_27 = 1;
	end
end

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_port_20 <= 0;
	else if(munoc_port_18||munoc_port_06)
		munoc_port_20 <= munoc_signal_18;
end

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_port_16 <= 0;
	else if(munoc_port_18)
		munoc_port_16 <= munoc_signal_05;
end

always@(*)
begin
	munoc_signal_05 = 0;
	if(munoc_port_18)
	begin
		if(munoc_signal_27)
			munoc_signal_05 = $unsigned(munoc_signal_25[`MUNOC_GDEF_75-1:1]);
		else
			munoc_signal_05 = $unsigned(munoc_signal_25>>(LOG2RU(`MAX_BURST_LENGTH)));
	end
end

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_signal_06 <= 0;
	else if(munoc_port_18)
		munoc_signal_06 <= munoc_signal_05;
	else if(munoc_port_06)
	begin
		if(!munoc_signal_22)
			munoc_signal_06 <= munoc_signal_06-1;
	end
end

assign munoc_signal_22 = (munoc_signal_06==0);
assign munoc_signal_28 = (munoc_signal_06==1);

always@(*)
begin
	munoc_signal_18 = `MAX_BURST_LENGTH-1;
	if(munoc_signal_27)
	begin
		munoc_signal_18 = 2-1;
	end
	else if(munoc_port_18)
	begin
		if(munoc_signal_26)
			munoc_signal_18 = `MAX_BURST_LENGTH-1;
		else
			munoc_signal_18 = munoc_signal_25;
	end
	else
	begin
		if(munoc_signal_28)
			munoc_signal_18 = munoc_signal_16[LOG2RU(`MAX_BURST_LENGTH)-1:0];
		else
			munoc_signal_18 = `MAX_BURST_LENGTH-1;
	end
end

assign munoc_signal_16 = $unsigned(munoc_port_21) - $unsigned(munoc_signal_19); 

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_signal_19 <= 0;
	else if(munoc_port_06)
	begin
		if(munoc_signal_22)
			munoc_signal_19 <= 0;
		else
			munoc_signal_19 <= munoc_signal_19 + (munoc_port_20+1);
	end
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(MUNOC_GPARA_1),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_2
(
	.data_input(munoc_signal_01),
	.shift_amount(munoc_port_11),
	.data_output(munoc_signal_14)
);

assign munoc_signal_01 = $unsigned(munoc_port_12);
assign munoc_signal_29 = (munoc_port_02==`AXI_BURST_WRAP)? munoc_signal_14 : $signed(-1);

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
		munoc_signal_13 <= $signed(-1);
	else if(munoc_port_18)
		munoc_signal_13 <= munoc_signal_29;
end

always@(*)
begin
	munoc_signal_04 = $unsigned(munoc_port_19);
	case(munoc_port_11)
		`AXI_SIZE_001BYTE: ;
		`AXI_SIZE_002BYTE: munoc_signal_04[0] = 0;
		`AXI_SIZE_004BYTE: munoc_signal_04[1:0] = 0;
		`AXI_SIZE_008BYTE: munoc_signal_04[2:0] = 0;
		`AXI_SIZE_016BYTE: munoc_signal_04[3:0] = 0;
		`AXI_SIZE_032BYTE: munoc_signal_04[4:0] = 0;
		`AXI_SIZE_064BYTE: munoc_signal_04[5:0] = 0;
		`AXI_SIZE_128BYTE: munoc_signal_04[6:0] = 0;
	endcase
end

always@(*)
begin
	munoc_signal_08 = munoc_port_08 + munoc_signal_03;
	munoc_signal_08 = (munoc_port_08 & (~munoc_signal_13) ) | (munoc_signal_08 & munoc_signal_13);
end

always@(posedge munoc_port_10, negedge munoc_port_17)
begin
	if(munoc_port_17==0)
	begin
		munoc_port_08 <= 0;
		munoc_signal_03 <= 0;
	end
	else if(munoc_port_18)
	begin
		munoc_port_08 <= munoc_signal_04;
		if(munoc_signal_27)
		begin
			case(MUNOC_LPARA_2)
				`MUNOC_GDEF_85: munoc_signal_03 <= 2*4;
				`MUNOC_GDEF_43: munoc_signal_03 <= 2*8;
				`MUNOC_GDEF_00: munoc_signal_03 <= 2*16;
			endcase
		end
		else
			munoc_signal_03 <= munoc_signal_24;
	end
	else if(munoc_port_06)
		if(!munoc_signal_22)
			munoc_port_08 <= munoc_signal_08;
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(MUNOC_GPARA_1),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(1),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(0)
)
i_munoc_instance_3
(
	.data_input(munoc_signal_10),
	.shift_amount(munoc_signal_20),
	.data_output(munoc_signal_07)
);

assign munoc_signal_10 = $unsigned(`NUM_BYTE(MUNOC_GPARA_0)*`MAX_BURST_LENGTH);
assign munoc_signal_20 = $signed(munoc_signal_09);
assign munoc_signal_24 = munoc_signal_23? munoc_signal_07 : munoc_signal_10;

assign munoc_port_00 = munoc_signal_12;

endmodule
