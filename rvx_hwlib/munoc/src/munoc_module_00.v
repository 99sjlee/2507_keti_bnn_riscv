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
`include "munoc_include_06.vh"





module MUNOC_MODULE_00
(
	munoc_port_00,
	munoc_port_13,
	munoc_port_03,
	munoc_port_05,
	munoc_port_10,
	munoc_port_04,
	munoc_port_06,
	munoc_port_08,
	munoc_port_01,
	munoc_port_02,
	munoc_port_12,
	munoc_port_11,
	munoc_port_15,
	munoc_port_14,
	munoc_port_09,
	munoc_port_07
);





parameter MUNOC_GPARA_0 = -1;
parameter MUNOC_GPARA_1 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_5 = 8;
parameter MUNOC_GPARA_4 = `BW_LONGEST_MASTER_DATA;

parameter MUNOC_GPARA_2 = 1;

input wire munoc_port_00, munoc_port_13;

input wire munoc_port_03;
output wire munoc_port_05;
input wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_port_10;

input wire munoc_port_04;
output wire munoc_port_06;
input wire [`MUNOC_GDEF_56-1:0] munoc_port_08;

input wire munoc_port_01;
output wire [`MUNOC_GDEF_23-1:0] munoc_port_02;
output wire munoc_port_12;
input wire [`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_4)-1:0] munoc_port_11;

output wire [`BW_BNI_LINK(MUNOC_GPARA_3)-1:0] munoc_port_15;
input wire munoc_port_14;
input wire munoc_port_09;

output reg [`MUNOC_GDEF_03-1:0] munoc_port_07;

genvar i;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_00;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_01;
wire [`BW_AXI_BRESP-1:0] munoc_signal_17;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_06;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_28;
wire [`MUNOC_GDEF_23-1:0] munoc_signal_31;

wire [MUNOC_GPARA_1-1:0] munoc_signal_21;
wire munoc_signal_26;
wire [`BW_AXI_RRESP-1:0] munoc_signal_08;
wire [MUNOC_GPARA_4-1:0] munoc_signal_18;
wire [MUNOC_GPARA_4-1:0] munoc_signal_05;

reg munoc_signal_07, munoc_signal_23;
wire [`MUNOC_GDEF_87(MUNOC_GPARA_4,MUNOC_GPARA_3)-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_87(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_3)-1:0] munoc_signal_10;

`define MUNOC_LDEF_2 0
`define MUNOC_LDEF_0 1
`define MUNOC_LDEF_1 2
`define MUNOC_LDEF_3 3

wire munoc_signal_03;
wire munoc_signal_13;
wire munoc_signal_30;
wire munoc_signal_19;
wire munoc_signal_16;
wire munoc_signal_11;
reg munoc_signal_24;
reg munoc_signal_27;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_22;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_25;
wire [`MUNOC_GDEF_61-1:0] munoc_signal_15;
reg [`MUNOC_GDEF_58(MUNOC_GPARA_4,MUNOC_GPARA_3)-1:0] munoc_signal_29;
wire [`MUNOC_GDEF_87(MUNOC_GPARA_4,MUNOC_GPARA_3)-1:0] munoc_signal_12;

reg munoc_signal_04;
reg munoc_signal_20;
reg munoc_signal_09;
wire [MUNOC_GPARA_3-1:0] munoc_signal_14;

assign {munoc_signal_00,munoc_signal_01,munoc_signal_17} = munoc_port_10;
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
assign {munoc_signal_06,munoc_signal_28} = munoc_port_08;
assign munoc_signal_31 = `MUNOC_GDEF_85;
`else
assign {munoc_signal_06,munoc_signal_28,munoc_signal_31} = munoc_port_08;
`endif
assign {munoc_signal_21,munoc_signal_26,munoc_signal_08,munoc_signal_18} = munoc_port_11;

assign {munoc_signal_22,munoc_signal_25} = (MUNOC_GPARA_2==1)? {munoc_signal_06,munoc_signal_28} : munoc_signal_21;

generate
	for(i=0; i<MUNOC_GPARA_4/`LLIMIT_OF_DATA_WIDTH; i=i+1)
	begin : i_reverse_rdata
		assign munoc_signal_05[MUNOC_GPARA_4-1-i*`LLIMIT_OF_DATA_WIDTH-:`LLIMIT_OF_DATA_WIDTH] = munoc_signal_18[(i+1)*`LLIMIT_OF_DATA_WIDTH-1-:`LLIMIT_OF_DATA_WIDTH];
	end
endgenerate

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(`MUNOC_GDEF_87(MUNOC_GPARA_4,MUNOC_GPARA_3))
)
i_munoc_instance_1
(
	.clk(munoc_port_00),
	.rstnn(munoc_port_13),
	.enable(1'b 1),
	.init(munoc_signal_07),
	.count(munoc_signal_23),
	.value(munoc_signal_02),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_10 = $unsigned(munoc_signal_02);

always@(posedge munoc_port_00, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_port_07 <= `MUNOC_LDEF_2;
	else
		case(munoc_port_07)
			`MUNOC_LDEF_2:
				if(munoc_signal_03)
					munoc_port_07 <= `MUNOC_LDEF_0;
				else if(munoc_signal_13)
					munoc_port_07 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_0:
				if(munoc_signal_19)
					munoc_port_07 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_1:
				if(munoc_signal_19)
					munoc_port_07 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_3:
				if(munoc_signal_11)
					munoc_port_07 <= `MUNOC_LDEF_2;
		endcase
end

assign munoc_signal_30 = munoc_port_14 & munoc_signal_04;
assign munoc_signal_03 = munoc_port_03;
assign munoc_signal_13 = munoc_port_04 & munoc_port_01;

always@(*)
begin
	munoc_signal_24 = 0;
	case(munoc_port_07)
		`MUNOC_LDEF_0,
		`MUNOC_LDEF_1:
			if(`MUNOC_GDEF_47(MUNOC_GPARA_3)==1)
				munoc_signal_24 = 1;
			else if(munoc_signal_02[`MUNOC_GDEF_47(MUNOC_GPARA_3)-1])
				munoc_signal_24 = 1;
	endcase
end

assign munoc_signal_19 = munoc_signal_30 & munoc_signal_24;

always@(*)
begin
	munoc_signal_27 = 0;
	if(munoc_port_07==`MUNOC_LDEF_3)
	begin
		case(munoc_signal_31)
			`MUNOC_GDEF_85:
				munoc_signal_27 = munoc_signal_10[`MUNOC_GDEF_06(32,MUNOC_GPARA_3)-1];
			`MUNOC_GDEF_43:
				munoc_signal_27 = munoc_signal_10[`MUNOC_GDEF_06(64,MUNOC_GPARA_3)-1];
			`MUNOC_GDEF_00:
				munoc_signal_27 = munoc_signal_10[`MUNOC_GDEF_06(128,MUNOC_GPARA_3)-1];
		endcase
	end
end

assign munoc_signal_16 = munoc_signal_30 & munoc_signal_27;
assign munoc_signal_11 = munoc_signal_16 & munoc_signal_26;

always@(*)
begin
	munoc_signal_07 = 0;
	munoc_signal_23 = 0;
	if(munoc_signal_30)
	begin
		case(munoc_port_07)
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_1:
				if(`MUNOC_GDEF_47(MUNOC_GPARA_3)==1)
					;
				else if(munoc_signal_24)
					munoc_signal_07 = 1;
				else
					munoc_signal_23 = 1;
			`MUNOC_LDEF_3:
				if(munoc_signal_27)
					munoc_signal_07 = 1;
				else
					munoc_signal_23 = 1;
		endcase
	end
end

assign munoc_port_05 = (munoc_port_07==`MUNOC_LDEF_0) & munoc_signal_19;
assign munoc_port_06 = munoc_signal_11;
assign munoc_port_02 = munoc_signal_31;
assign munoc_port_12 = munoc_signal_16;

assign munoc_signal_15 = (munoc_port_07==`MUNOC_LDEF_0)? `MUNOC_GDEF_08 : `MUNOC_GDEF_49;

always@(*)
begin
	munoc_signal_29 = 0;
	case(munoc_port_07)
		`MUNOC_LDEF_0:
			munoc_signal_29[`MUNOC_GDEF_58(MUNOC_GPARA_4,MUNOC_GPARA_3)-1-:`MUNOC_GDEF_95] = `MUNOC_GDEF_89(munoc_signal_00,munoc_signal_15,munoc_signal_01,munoc_signal_17);
		`MUNOC_LDEF_1:
			munoc_signal_29[`MUNOC_GDEF_58(MUNOC_GPARA_4,MUNOC_GPARA_3)-1-:`MUNOC_GDEF_29] = `MUNOC_GDEF_69(munoc_signal_22,munoc_signal_15,munoc_signal_25,munoc_signal_31);
		`MUNOC_LDEF_3:
			munoc_signal_29[`MUNOC_GDEF_58(MUNOC_GPARA_4,MUNOC_GPARA_3)-1-:`MUNOC_GDEF_14(MUNOC_GPARA_4)] = `MUNOC_GDEF_18(munoc_signal_26,munoc_signal_08,munoc_signal_05);
	endcase
end

generate
	for(i=0; i<`MUNOC_GDEF_87(MUNOC_GPARA_4,MUNOC_GPARA_3); i=i+1)
	begin : i_gen_mux_select
		assign munoc_signal_12[i] = munoc_signal_02[`MUNOC_GDEF_87(MUNOC_GPARA_4,MUNOC_GPARA_3)-1-i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_3),
	.NUM_DATA(`MUNOC_GDEF_87(MUNOC_GPARA_4,MUNOC_GPARA_3))
)
i_munoc_instance_0
(
	.data_input_list(munoc_signal_29),
	.select(munoc_signal_12),
	.data_output(munoc_signal_14)
);

always@(*)
begin
	munoc_signal_04 = 0;
	munoc_signal_20 = 0;
	munoc_signal_09 = 0;
	if(munoc_port_09)
		munoc_signal_04 = 0;
	else
		case(munoc_port_07)
			`MUNOC_LDEF_0:
			begin
				munoc_signal_04 = 1;
				if(munoc_signal_24)
				begin
					munoc_signal_09 = 1;
					munoc_signal_20 = 1;
				end
			end
			`MUNOC_LDEF_1:
			begin
				munoc_signal_04 = munoc_port_01;
				if(munoc_signal_24)
					munoc_signal_09 = 1;
			end
			`MUNOC_LDEF_3:
			begin
				munoc_signal_04 = munoc_port_01;
				if(munoc_signal_27)
				begin
					munoc_signal_09 = 1;
					if(munoc_signal_26)
						munoc_signal_20 = 1;
				end
			end
		endcase
end

assign munoc_port_15 = {munoc_signal_04, munoc_signal_20, munoc_signal_09, munoc_signal_14};

`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_3
endmodule
