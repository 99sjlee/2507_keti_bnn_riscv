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
`include "munoc_include_06.vh"



module MUNOC_APB_SLAVE_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,
	
	rfni_link,
	rfni_ready,
	rbni_link,
	rbni_ready,

	spaddr,
	spwrite,
	spsel,
	spenable,
	spwdata,
	sprdata,
	spready,
	spslverr,

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
parameter SUPPORTED_DATA_WIDTH = `BW_LONGEST_MASTER_DATA;

parameter NUM_ADDR_BUFFER = 2;
parameter NUM_WDATA_BUFFER = 2;
parameter NUM_RDATA_BUFFER = 2;

localparam  MUNOC_LPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;

input wire clk, rstnn;

input wire comm_disable;

input wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] rfni_link;
output wire rfni_ready;
output wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] rbni_link;
input wire rbni_ready;

output wire [BW_PLATFORM_ADDR-1:0] spaddr;
output wire spwrite;
output wire spsel;
output wire spenable;
output wire [BW_NODE_DATA-1:0] spwdata;
input wire [BW_NODE_DATA-1:0] sprdata;
input wire spready;
input wire spslverr;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [MUNOC_LPARA_0-1:0] munoc_signal_22;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_28;
wire [`BW_AXI_ALEN-1:0] munoc_signal_13;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_29;
wire [`BW_AXI_ABURST-1:0] munoc_signal_02;
wire munoc_signal_30;
wire munoc_signal_23;

wire [MUNOC_LPARA_0-1:0] munoc_signal_24;
wire [BW_NODE_DATA-1:0] munoc_signal_04;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_17;
wire munoc_signal_11;
wire munoc_signal_05;
wire munoc_signal_12;

wire [MUNOC_LPARA_0-1:0] munoc_signal_18;
wire [`BW_AXI_BRESP-1:0] munoc_signal_27;
wire munoc_signal_07;
wire munoc_signal_01;

wire [MUNOC_LPARA_0-1:0] munoc_signal_16;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_08;
wire [`BW_AXI_ALEN-1:0] munoc_signal_20;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_26;
wire [`BW_AXI_ABURST-1:0] munoc_signal_21;
wire munoc_signal_14;
wire munoc_signal_10;

wire [MUNOC_LPARA_0-1:0] munoc_signal_09;
wire [BW_NODE_DATA-1:0] munoc_signal_00;
wire [`BW_AXI_RRESP-1:0] munoc_signal_25;
wire munoc_signal_15;
wire munoc_signal_03;
wire munoc_signal_33;

wire munoc_signal_31;
wire [`MUNOC_GDEF_52-1:0] munoc_signal_06;
wire [`MUNOC_GDEF_03-1:0] munoc_signal_19;
wire munoc_signal_32;

MUNOC_MODULE_36
#(
	.MUNOC_GPARA_08(NODE_ID),
	.MUNOC_GPARA_10(BW_FNI_PHIT),
	.MUNOC_GPARA_14(BW_BNI_PHIT),
	.MUNOC_GPARA_05(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_12(BW_NODE_DATA),
	.MUNOC_GPARA_02(MUNOC_LPARA_0),
	.MUNOC_GPARA_09(SUPPORTED_DATA_WIDTH),
	.MUNOC_GPARA_03(BW_NODE_DATA),
	.MUNOC_GPARA_04(NUM_ADDR_BUFFER),
	.MUNOC_GPARA_13(NUM_ADDR_BUFFER),
	.MUNOC_GPARA_07(NUM_WDATA_BUFFER),
	.MUNOC_GPARA_11(NUM_RDATA_BUFFER),
	.MUNOC_GPARA_00(NUM_ADDR_BUFFER),
	.MUNOC_GPARA_01(0)
)
i_munoc_instance_0
(
	.munoc_port_27(clk),
	.munoc_port_34(rstnn),
	
	.munoc_port_05(rfni_link),
	.munoc_port_01(rfni_ready),
	.munoc_port_21(rbni_link),
	.munoc_port_31(rbni_ready),

	.munoc_port_25(munoc_signal_22),
	.munoc_port_04(munoc_signal_28),
	.munoc_port_17(munoc_signal_13),
	.munoc_port_19(munoc_signal_29),
	.munoc_port_37(munoc_signal_02),
	.munoc_port_16(munoc_signal_30),
	.munoc_port_28(munoc_signal_23),

	.munoc_port_07(munoc_signal_24),
	.munoc_port_08(munoc_signal_04),
	.munoc_port_36(munoc_signal_17),
	.munoc_port_09(munoc_signal_11),
	.munoc_port_18(munoc_signal_05),
	.munoc_port_00(munoc_signal_12),

	.munoc_port_24(munoc_signal_18),
	.munoc_port_35(munoc_signal_27),
	.munoc_port_38(munoc_signal_07),
	.munoc_port_06(munoc_signal_01),

	.munoc_port_11(munoc_signal_16),
	.munoc_port_13(munoc_signal_08),
	.munoc_port_33(munoc_signal_20),
	.munoc_port_30(munoc_signal_26),
	.munoc_port_02(munoc_signal_21),
	.munoc_port_15(munoc_signal_14),
	.munoc_port_10(munoc_signal_10),

	.munoc_port_22(munoc_signal_09),
	.munoc_port_23(munoc_signal_00),
	.munoc_port_32(munoc_signal_25),
	.munoc_port_12(munoc_signal_15),
	.munoc_port_29(munoc_signal_03),
	.munoc_port_03(munoc_signal_33),

	.munoc_port_26(munoc_signal_31),
	.munoc_port_14(munoc_signal_06),
	.munoc_port_20(munoc_signal_19),
	.munoc_port_39(munoc_signal_32)
);

MUNOC_MODULE_08
#(
	.MUNOC_GPARA_2(NAME),
	.MUNOC_GPARA_1(NODE_ID),
	.MUNOC_GPARA_0(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_3(BW_NODE_DATA),
	.MUNOC_GPARA_4(MUNOC_LPARA_0)
)
i_munoc_instance_1
(
	.munoc_port_02(clk),
	.munoc_port_45(rstnn),

	.munoc_port_46(munoc_signal_22),
	.munoc_port_05(munoc_signal_28),
	.munoc_port_32(munoc_signal_13),
	.munoc_port_38(munoc_signal_29),
	.munoc_port_12(munoc_signal_02),
	.munoc_port_14(munoc_signal_30),
	.munoc_port_08(munoc_signal_23),

	.munoc_port_48(munoc_signal_24),
	.munoc_port_26(munoc_signal_04),
	.munoc_port_07(munoc_signal_17),
	.munoc_port_16(munoc_signal_11),
	.munoc_port_22(munoc_signal_05),
	.munoc_port_41(munoc_signal_12), 

	.munoc_port_10(munoc_signal_18),
	.munoc_port_20(munoc_signal_27),
	.munoc_port_28(munoc_signal_07),
	.munoc_port_15(munoc_signal_01),

	.munoc_port_13(munoc_signal_16),
	.munoc_port_24(munoc_signal_08),
	.munoc_port_35(munoc_signal_20),
	.munoc_port_33(munoc_signal_26),
	.munoc_port_00(munoc_signal_21),
	.munoc_port_21(munoc_signal_14),
	.munoc_port_43(munoc_signal_10),

	.munoc_port_19(munoc_signal_09),
	.munoc_port_11(munoc_signal_00),
	.munoc_port_18(munoc_signal_25),
	.munoc_port_31(munoc_signal_15),
	.munoc_port_06(munoc_signal_03),
	.munoc_port_01(munoc_signal_33),

	.munoc_port_36(munoc_signal_31),
	.munoc_port_42(munoc_signal_06),
	.munoc_port_03(munoc_signal_19),
	.munoc_port_09(munoc_signal_32),

	.munoc_port_39(comm_disable),

	.munoc_port_44(spaddr),
	.munoc_port_25(spwrite),
	.munoc_port_47(spsel),
	.munoc_port_37(spenable),
	.munoc_port_27(spwdata),
	.munoc_port_30(sprdata),
	.munoc_port_29(spready),
	.munoc_port_34(spslverr),

	.munoc_port_04(svri_rlink),
	.munoc_port_40(svri_rack),
	.munoc_port_23(svri_slink),
	.munoc_port_17(svri_sack)
);

endmodule
