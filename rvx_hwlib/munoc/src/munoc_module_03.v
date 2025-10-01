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
`include "munoc_include_10.vh"
`include "munoc_control.vh"
`include "munoc_include_07.vh"
`include "munoc_memorymap_offset.vh"
`include "munoc_include_09.vh"
`include "munoc_include_05.vh"





module MUNOC_MODULE_03
(
	munoc_port_07,
	munoc_port_13,
	munoc_port_06,
	munoc_port_09,
	munoc_port_14,
	munoc_port_11,
	munoc_port_02,
	munoc_port_10,
	munoc_port_12,
	munoc_port_08,
	munoc_port_05,
	munoc_port_03,
	munoc_port_01,
	munoc_port_00,
	munoc_port_04
);





parameter MUNOC_GPARA_0 = "";
parameter MUNOC_GPARA_2 = -1;
parameter MUNOC_GPARA_1 = "NA";

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_0 = (`MUNOC_GDEF_77) + (MUNOC_GPARA_2<<`MUNOC_GDEF_15);

input wire munoc_port_07;
input wire munoc_port_13;
input wire [`MUNOC_GDEF_55-1:0] munoc_port_06;
input wire [`MUNOC_GDEF_12-1:0] munoc_port_09;
input wire munoc_port_14;
input wire [`MUNOC_GDEF_71-1:0] munoc_port_11;
input wire [`MUNOC_GDEF_71-1:0] munoc_port_02;
input wire [`MUNOC_GDEF_24-1:0] munoc_port_10;
input wire [`MUNOC_GDEF_80-1:0] munoc_port_12;
output reg munoc_port_08;
output reg munoc_port_05;

input wire [`BW_SVRING_LINK-1:0] munoc_port_03;
output wire munoc_port_01;
output wire [`BW_SVRING_LINK-1:0] munoc_port_00;
input wire munoc_port_04;

wire munoc_signal_12;
wire [`MUNOC_GDEF_16-1:0] munoc_signal_15;
wire munoc_signal_04;
wire [`MUNOC_GDEF_65-1:0] munoc_signal_13;
reg [`MUNOC_GDEF_65-1:0] munoc_signal_08;

wire [`MUNOC_GDEF_26-1:0] munoc_signal_06;
wire [`MUNOC_GDEF_32-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_07-1:0] munoc_signal_03;

`define MUNOC_LDEF_1 2
`define MUNOC_LDEF_0 0
`define MUNOC_LDEF_2 1
`define MUNOC_LDEF_5 2
`define MUNOC_LDEF_4 3

reg [`MUNOC_LDEF_1-1:0] munoc_signal_10;
wire munoc_signal_07;
wire munoc_signal_09;
wire munoc_signal_01;

`define MUNOC_LDEF_3 REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_46/`MUNOC_GDEF_65)

wire [`MUNOC_GDEF_46-1:0 ] munoc_signal_05;
wire [`MUNOC_GDEF_65-1:0] munoc_signal_00;
wire [`MUNOC_LDEF_3-1:0] munoc_signal_11;

wire [`MUNOC_GDEF_65-1:0] munoc_signal_14;

always@(posedge munoc_port_07, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_signal_10 <= `MUNOC_LDEF_0;
	else
	begin
		case(munoc_signal_10)
			`MUNOC_LDEF_0:
				if(munoc_signal_07)
				begin
					if(munoc_signal_06==`MUNOC_GDEF_11)
						munoc_signal_10 <= `MUNOC_LDEF_4;
					else if(munoc_signal_06==`MUNOC_GDEF_50)
						munoc_signal_10 <= `MUNOC_LDEF_2;
				end
			`MUNOC_LDEF_2:
				munoc_signal_10 <= `MUNOC_LDEF_5;
			`MUNOC_LDEF_5:
				munoc_signal_10 <= `MUNOC_LDEF_4;
			`MUNOC_LDEF_4:
				if(munoc_signal_09)
					munoc_signal_10 <= `MUNOC_LDEF_0;
		endcase
	end
end

assign munoc_signal_07 = (munoc_signal_10==`MUNOC_LDEF_0) & munoc_signal_12;
assign munoc_signal_09 = (munoc_signal_10==`MUNOC_LDEF_4);
assign munoc_signal_01 = munoc_signal_09 & (munoc_signal_06==`MUNOC_GDEF_11);

RVX_MODULE_019
#(
	.RVX_GPARA_2(MUNOC_LPARA_0),
	.RVX_GPARA_1(`MUNOC_GDEF_30),
	.RVX_GPARA_4(`BW_SVRING_LINK),
	.RVX_GPARA_3(`MUNOC_GDEF_84),
	.RVX_GPARA_5(`MUNOC_GDEF_16),
	.RVX_GPARA_0(`MUNOC_GDEF_65)
)
i_munoc_instance_1
(
	.rvx_port_06(munoc_port_07),
	.rvx_port_09(munoc_port_13),
	.rvx_port_02(munoc_port_03),
	.rvx_port_04(munoc_port_01),
	.rvx_port_03(munoc_port_00),
	.rvx_port_00(munoc_port_04),	
	.rvx_port_05(munoc_signal_12),
	.rvx_port_07(munoc_signal_15),
	.rvx_port_01(munoc_signal_04),
	.rvx_port_08(munoc_signal_13)
);

assign {munoc_signal_06,munoc_signal_02,munoc_signal_03} = munoc_signal_15;
assign munoc_signal_04 = munoc_signal_09;

always@(*)
begin
	munoc_signal_08 = -1;
	case({munoc_signal_02,2'b 00})
		`MMAP_SUBOFFSET_CONTROLLER_IP_TIMEOUT:
			munoc_signal_08 = $unsigned(munoc_port_11);
		`MMAP_SUBOFFSET_CONTROLLER_NOC_TIMEOUT:
			munoc_signal_08 = $unsigned(munoc_port_02);
		`MMAP_SUBOFFSET_CONTROLLER_FNI_STATE:
			munoc_signal_08 = $unsigned(munoc_port_06);
		`MMAP_SUBOFFSET_CONTROLLER_BNI_STATE:
			munoc_signal_08 = $unsigned(munoc_port_09);
		`MMAP_SUBOFFSET_CONTROLLER_ROUTING_ERROR:
			munoc_signal_08 = $unsigned(munoc_port_14);
		`MMAP_SUBOFFSET_CONTROLLER_BANDWIDTH:
			munoc_signal_08 = $unsigned(munoc_port_10);
		`MMAP_SUBOFFSET_CONTROLLER_NAME0,
		`MMAP_SUBOFFSET_CONTROLLER_NAME1,
		`MMAP_SUBOFFSET_CONTROLLER_NAME2,
		`MMAP_SUBOFFSET_CONTROLLER_NAME3,
		`MMAP_SUBOFFSET_CONTROLLER_NAME4,
		`MMAP_SUBOFFSET_CONTROLLER_NAME5,
		`MMAP_SUBOFFSET_CONTROLLER_NAME6,
		`MMAP_SUBOFFSET_CONTROLLER_NAME7:
			munoc_signal_08 = $unsigned(`CHANGE_ENDIAN32(munoc_signal_00));
		`MMAP_SUBOFFSET_CONTROLLER_NODEID:
			munoc_signal_08 = MUNOC_GPARA_2;
		`MMAP_SUBOFFSET_CONTROLLER_MONITOR_ENABLE:
			munoc_signal_08 = $unsigned(munoc_port_08);
		`MMAP_SUBOFFSET_CONTROLLER_EXCLUDE:
			munoc_signal_08 = $unsigned(munoc_port_05);
		`MMAP_SUBOFFSET_CONTROLLER_TYPE0,
		`MMAP_SUBOFFSET_CONTROLLER_TYPE1:
			munoc_signal_08 = $unsigned(`CHANGE_ENDIAN32(munoc_signal_14));
		`MMAP_SUBOFFSET_CONTROLLER_PROTOCOL_VIOLATION:
			if(MUNOC_GPARA_1=="AXI")
				munoc_signal_08 = $unsigned(munoc_port_12);
			else
				munoc_signal_08 = 0;
	endcase
end

ERVP_SYNCHRONIZER
#(
	.BW_DATA(`MUNOC_GDEF_65)
)
i_munoc_instance_0
(
	.clk(munoc_port_07),
	.rstnn(munoc_port_13),
	.enable(1'b 1),
	.asynch_value(munoc_signal_08),
	.synch_value(munoc_signal_13)
);

assign munoc_signal_05 = `FORMAT_STRING(MUNOC_GPARA_0);

ERVP_MUX
#(
	.BW_DATA(`MUNOC_GDEF_65),
	.NUM_DATA(`DIVIDERU(`MUNOC_GDEF_46,`MUNOC_GDEF_65)),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_2
(
	.data_input_list(munoc_signal_05),
	.select(munoc_signal_11),
	.data_output(munoc_signal_00)
);

assign munoc_signal_11 = $unsigned(munoc_signal_02);

assign munoc_signal_14 = `FORMAT_STRING(MUNOC_GPARA_1);

always@(posedge munoc_port_07, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
	begin
		munoc_port_08 <= 1;
	end
	else if(munoc_signal_01)
		case({munoc_signal_02,2'b 00})
			`MMAP_SUBOFFSET_CONTROLLER_MONITOR_ENABLE:
				munoc_port_08 <= 0;
		endcase
end

always@(posedge munoc_port_07, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_port_05 <= 0;
	else if(munoc_signal_01)
		case({munoc_signal_02,2'b 00})
			`MMAP_SUBOFFSET_CONTROLLER_EXCLUDE:
				munoc_port_05 <= munoc_signal_03;
		endcase
end

`ifdef SIM_ENV

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
always@(*)
begin
	if(munoc_port_14!=0)
		$display("\n\n[ERROR@NoC] %s: Routing Error %d", MUNOC_GPARA_0, $time);
end
`endif

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR
always@(*)
begin
	if(munoc_port_11!=0)
		$display("\n\n[Warning@NoC] %s: IP Timeout %x %d", MUNOC_GPARA_0, munoc_port_11, $time);
	if(munoc_port_02!=0)
		$display("\n\n[Warning@NoC] %s: NoC Timeout %x %d", MUNOC_GPARA_0, munoc_port_02, $time);
end
`endif

`ifdef __MUNOC_INCLUDE_AXI_CHECKER
always@(*)
begin
	if(munoc_port_12!=0)
		$display("\n\n[ERROR@NoC] %s: AXI violation %x %d", MUNOC_GPARA_0, munoc_port_12, $time);
end
`endif

`endif

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_5
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_0
endmodule
