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
`include "munoc_control.vh"
`include "munoc_include_10.vh"
`include "munoc_include_03.vh"
`include "munoc_include_00.vh"
`include "munoc_include_07.vh"



module MUNOC_AXI_SLAVE_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,

	rfni_link,
	rfni_ready,
	rbni_link,
	rbni_ready,

	sxawid,
	sxawaddr,
	sxawlen,
	sxawsize,
	sxawburst,
	sxawvalid,
	sxawready,

	sxwid,
	sxwdata,
	sxwstrb,
	sxwlast,
	sxwvalid,
	sxwready, 

	sxbid,
	sxbresp,
	sxbvalid,
	sxbready,

	sxarid,
	sxaraddr,
	sxarlen,
	sxarsize,
	sxarburst,
	sxarvalid,
	sxarready,

	sxrid,
	sxrdata,
	sxrresp,
	sxrlast,
	sxrvalid,
	sxrready,

	svri_rlink,
	svri_rack,
	svri_slink,
	svri_sack
);



parameter NAME = "";
parameter NODE_ID = -1;
parameter BW_FNI_PHIT = 8;
parameter BW_BNI_PHIT = 8;
parameter BW_PLATFORM_ADDR = 32;
parameter BW_NODE_DATA = 32;
parameter BW_AXI_SLAVE_TID = `DEFAULT_BW_AXI_TID;
parameter SUPPORTED_DATA_WIDTH = `BW_LONGEST_MASTER_DATA;
parameter PARTIAL_READ_WIDTH = `LLIMIT_OF_DATA_WIDTH;

parameter NUM_AXIAR_BUFFER = 4;
parameter NUM_AXIAW_BUFFER = 2;
parameter NUM_AXIW_BUFFER = 4;
parameter NUM_AXIR_BUFFER = 4;
parameter NUM_AXIB_BUFFER = 2;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_1 = (BW_AXI_SLAVE_TID>=`REQUIRED_BW_OF_SLAVE_TID)? 0 : 1;
localparam  MUNOC_LPARA_0 = "AXI";

input wire clk, rstnn;

input wire comm_disable;

input wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] rfni_link;
output wire rfni_ready;
output wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] rbni_link;
input wire rbni_ready;

output wire [BW_AXI_SLAVE_TID-1:0] sxawid;
output wire [BW_PLATFORM_ADDR-1:0] sxawaddr;
output wire [`BW_AXI_ALEN-1:0] sxawlen;
output wire [`BW_AXI_ASIZE-1:0] sxawsize;
output wire [`BW_AXI_ABURST-1:0] sxawburst;
output wire sxawvalid;
input wire sxawready;

output wire [BW_AXI_SLAVE_TID-1:0] sxwid;
output wire [BW_NODE_DATA-1:0] sxwdata;
output wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] sxwstrb;
output wire sxwlast;
output wire sxwvalid;
input wire sxwready;

input wire [BW_AXI_SLAVE_TID-1:0] sxbid;
input wire [`BW_AXI_BRESP-1:0] sxbresp;
input wire sxbvalid;
output wire sxbready;

output wire [BW_AXI_SLAVE_TID-1:0] sxarid;
output wire [BW_PLATFORM_ADDR-1:0] sxaraddr;
output wire [`BW_AXI_ALEN-1:0] sxarlen;
output wire [`BW_AXI_ASIZE-1:0] sxarsize;
output wire [`BW_AXI_ABURST-1:0] sxarburst;
output wire sxarvalid;
input wire sxarready;

input wire [BW_AXI_SLAVE_TID-1:0] sxrid;
input wire [BW_NODE_DATA-1:0] sxrdata;
input wire [`BW_AXI_RRESP-1:0] sxrresp;
input wire sxrlast;
input wire sxrvalid;
output wire sxrready;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_35;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_25;
wire [`BW_AXI_ALEN-1:0] munoc_signal_00;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_34;
wire [`BW_AXI_ABURST-1:0] munoc_signal_11;
wire munoc_signal_24;
wire munoc_signal_06;
wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_03;
wire [BW_NODE_DATA-1:0] munoc_signal_31;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_23;
wire munoc_signal_27;
wire munoc_signal_10;
wire munoc_signal_01;
wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_04;
wire [`BW_AXI_BRESP-1:0] munoc_signal_18;
wire munoc_signal_29;
wire munoc_signal_21;
wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_20;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_33;
wire [`BW_AXI_ALEN-1:0] munoc_signal_02;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_36;
wire [`BW_AXI_ABURST-1:0] munoc_signal_26;
wire munoc_signal_16;
wire munoc_signal_30;
wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_32;
wire [BW_NODE_DATA-1:0] munoc_signal_13;
wire [`BW_AXI_RRESP-1:0] munoc_signal_28;
wire munoc_signal_17;
wire munoc_signal_05;
wire munoc_signal_15;

wire munoc_signal_08;
wire [`MUNOC_GDEF_52-1:0] munoc_signal_14;
wire [`MUNOC_GDEF_03-1:0] munoc_signal_09;
wire munoc_signal_12;

wire [`MUNOC_GDEF_71-1:0] munoc_signal_38;
wire [`MUNOC_GDEF_71-1:0] munoc_signal_37;
wire [`MUNOC_GDEF_24-1:0] munoc_signal_07;
wire [`MUNOC_GDEF_80-1:0] munoc_signal_22;
wire munoc_signal_19;

MUNOC_MODULE_14
#(
	.MUNOC_GPARA_0(BW_AXI_SLAVE_TID),
	.MUNOC_GPARA_2(BW_NODE_DATA),
	.MUNOC_GPARA_1(BW_PLATFORM_ADDR)
)
i_munoc_instance_1
(
	.munoc_port_36(comm_disable),

	.munoc_port_55(munoc_signal_35),
	.munoc_port_34(munoc_signal_25),
	.munoc_port_21(munoc_signal_00),
	.munoc_port_31(munoc_signal_34),
	.munoc_port_20(munoc_signal_11),
	.munoc_port_03(munoc_signal_24),
	.munoc_port_18(munoc_signal_06),

	.munoc_port_09(munoc_signal_03),
	.munoc_port_53(munoc_signal_31),
	.munoc_port_57(munoc_signal_23),
	.munoc_port_02(munoc_signal_27),
	.munoc_port_00(munoc_signal_10),
	.munoc_port_24(munoc_signal_01), 

	.munoc_port_44(munoc_signal_04),
	.munoc_port_01(munoc_signal_18),
	.munoc_port_41(munoc_signal_29),
	.munoc_port_26(munoc_signal_21),

	.munoc_port_19(munoc_signal_20),
	.munoc_port_15(munoc_signal_33),
	.munoc_port_29(munoc_signal_02),
	.munoc_port_33(munoc_signal_36),
	.munoc_port_60(munoc_signal_26),
	.munoc_port_52(munoc_signal_16),
	.munoc_port_28(munoc_signal_30),

	.munoc_port_39(munoc_signal_32),
	.munoc_port_54(munoc_signal_13),
	.munoc_port_05(munoc_signal_28),
	.munoc_port_45(munoc_signal_17),
	.munoc_port_22(munoc_signal_05),
	.munoc_port_16(munoc_signal_15),

	.munoc_port_56(sxawid),
	.munoc_port_38(sxawaddr),
	.munoc_port_13(sxawlen),
	.munoc_port_17(sxawsize),
	.munoc_port_43(sxawburst),
	.munoc_port_48(sxawvalid),
	.munoc_port_10(sxawready),

	.munoc_port_25(sxwid),
	.munoc_port_04(sxwdata),
	.munoc_port_51(sxwstrb),
	.munoc_port_11(sxwlast),
	.munoc_port_32(sxwvalid),
	.munoc_port_30(sxwready), 

	.munoc_port_14(sxbid),
	.munoc_port_49(sxbresp),
	.munoc_port_12(sxbvalid),
	.munoc_port_46(sxbready),

	.munoc_port_27(sxarid),
	.munoc_port_59(sxaraddr),
	.munoc_port_40(sxarlen),
	.munoc_port_47(sxarsize),
	.munoc_port_42(sxarburst),
	.munoc_port_35(sxarvalid),
	.munoc_port_07(sxarready),

	.munoc_port_37(sxrid),
	.munoc_port_08(sxrdata),
	.munoc_port_58(sxrresp),
	.munoc_port_50(sxrlast),
	.munoc_port_23(sxrvalid),
	.munoc_port_06(sxrready)
);

MUNOC_MODULE_36
#(
	.MUNOC_GPARA_08(NODE_ID),
	.MUNOC_GPARA_10(BW_FNI_PHIT),
	.MUNOC_GPARA_14(BW_BNI_PHIT),
	.MUNOC_GPARA_05(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_12(BW_NODE_DATA),
	.MUNOC_GPARA_02(BW_AXI_SLAVE_TID),
	.MUNOC_GPARA_09(SUPPORTED_DATA_WIDTH),
	.MUNOC_GPARA_03(BW_NODE_DATA),
	.MUNOC_GPARA_04(NUM_AXIAR_BUFFER),
	.MUNOC_GPARA_13(NUM_AXIAW_BUFFER),
	.MUNOC_GPARA_07(NUM_AXIW_BUFFER),
	.MUNOC_GPARA_11(NUM_AXIR_BUFFER),
	.MUNOC_GPARA_00(NUM_AXIB_BUFFER),
	.MUNOC_GPARA_01(MUNOC_LPARA_1),
	.MUNOC_GPARA_06(0)
)
i_munoc_instance_0
(
	.munoc_port_27(clk),
	.munoc_port_34(rstnn),
	
	.munoc_port_05(rfni_link),
	.munoc_port_01(rfni_ready),
	.munoc_port_21(rbni_link),
	.munoc_port_31(rbni_ready),

	.munoc_port_25(munoc_signal_35),
	.munoc_port_04(munoc_signal_25),
	.munoc_port_17(munoc_signal_00),
	.munoc_port_19(munoc_signal_34),
	.munoc_port_37(munoc_signal_11),
	.munoc_port_16(munoc_signal_24),
	.munoc_port_28(munoc_signal_06),

	.munoc_port_07(munoc_signal_03),
	.munoc_port_08(munoc_signal_31),
	.munoc_port_36(munoc_signal_23),
	.munoc_port_09(munoc_signal_27),
	.munoc_port_18(munoc_signal_10),
	.munoc_port_00(munoc_signal_01),

	.munoc_port_24(munoc_signal_04),
	.munoc_port_35(munoc_signal_18),
	.munoc_port_38(munoc_signal_29),
	.munoc_port_06(munoc_signal_21),

	.munoc_port_11(munoc_signal_20),
	.munoc_port_13(munoc_signal_33),
	.munoc_port_33(munoc_signal_02),
	.munoc_port_30(munoc_signal_36),
	.munoc_port_02(munoc_signal_26),
	.munoc_port_15(munoc_signal_16),
	.munoc_port_10(munoc_signal_30),

	.munoc_port_22(munoc_signal_32),
	.munoc_port_23(munoc_signal_13),
	.munoc_port_32(munoc_signal_28),
	.munoc_port_12(munoc_signal_17),
	.munoc_port_29(munoc_signal_05),
	.munoc_port_03(munoc_signal_15),

	.munoc_port_26(munoc_signal_08),
	.munoc_port_14(munoc_signal_14),
	.munoc_port_20(munoc_signal_09),
	.munoc_port_39(munoc_signal_12)
);

`ifdef __MUNOC_INCLUDE_CONTROLLER

MUNOC_MODULE_26
#(
	.MUNOC_GPARA_6(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_7(BW_NODE_DATA),
	.MUNOC_GPARA_5(BW_AXI_SLAVE_TID),
	.MUNOC_GPARA_1(0)
)
i_munoc_instance_2
(
	.munoc_port_01(clk),
	.munoc_port_35(rstnn),
	.munoc_port_14(munoc_signal_19),

	.munoc_port_20(sxawid),
	.munoc_port_33(sxawaddr),
	.munoc_port_21(sxawlen),
	.munoc_port_32(sxawsize),
	.munoc_port_04(sxawburst),
	.munoc_port_22(sxawvalid),
	.munoc_port_30(sxawready),

	.munoc_port_13(sxwid),
	.munoc_port_31(sxwdata),
	.munoc_port_08(sxwstrb),
	.munoc_port_12(sxwlast),
	.munoc_port_27(sxwvalid),
	.munoc_port_18(sxwready), 

	.munoc_port_26(sxbid),
	.munoc_port_25(sxbresp),
	.munoc_port_29(sxbvalid),
	.munoc_port_02(sxbready),

	.munoc_port_28(sxarid),
	.munoc_port_34(sxaraddr),
	.munoc_port_05(sxarlen),
	.munoc_port_11(sxarsize),
	.munoc_port_36(sxarburst),
	.munoc_port_16(sxarvalid),
	.munoc_port_06(sxarready),

	.munoc_port_23(sxrid),
	.munoc_port_10(sxrdata),
	.munoc_port_03(sxrresp),
	.munoc_port_09(sxrlast),
	.munoc_port_07(sxrvalid),
	.munoc_port_19(sxrready),

	.munoc_port_24(munoc_signal_38),
	.munoc_port_00(munoc_signal_37),
	.munoc_port_15(munoc_signal_07),
	.munoc_port_17(munoc_signal_22)
);

MUNOC_MODULE_13
#(
	.MUNOC_GPARA_2(NAME),
	.MUNOC_GPARA_1(NODE_ID),
	.MUNOC_GPARA_0(MUNOC_LPARA_0)
)
i_munoc_instance_3
(
	.munoc_port_04(clk),
	.munoc_port_12(rstnn),
	.munoc_port_11(munoc_signal_14),
	.munoc_port_03(munoc_signal_09),
	.munoc_port_05(munoc_signal_12),
	.munoc_port_13(munoc_signal_38),
	.munoc_port_14(munoc_signal_37),
	.munoc_port_08(munoc_signal_07),
	.munoc_port_02(munoc_signal_22),
	.munoc_port_01(munoc_signal_19),
	.munoc_port_09(munoc_signal_08),
	.munoc_port_10(svri_rlink),
	.munoc_port_07(svri_rack),
	.munoc_port_00(svri_slink),
	.munoc_port_06(svri_sack)
);

`else

assign munoc_signal_19 = 0;
assign munoc_signal_08 = 0;
assign svri_rack = 0;
assign svri_slink = 0;

`endif

endmodule
