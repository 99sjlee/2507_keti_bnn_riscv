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
`include "ervp_ahb_define.vh"
`include "munoc_network_link.vh"
`include "munoc_control.vh"
`include "munoc_include_10.vh"
`include "munoc_include_03.vh"
`include "munoc_include_06.vh"



module MUNOC_AHB_SLAVE_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,
	
	rfni_link,
	rfni_ready,
	rbni_link,
	rbni_ready,

	shsel,
	shaddr,
	shburst,
	shmasterlock,
	shprot,
	shsize,
	shtrans,	
	shwrite,
	shwdata,
	shready,
	shreadyout,
	shresp,
	shrdata,

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
parameter NUM_WDATA_BUFFER = 4;
parameter NUM_RDATA_BUFFER = 4;

localparam  MUNOC_LPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;

input wire clk, rstnn;

input wire comm_disable;

input wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] rfni_link;
output wire rfni_ready;
output wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] rbni_link;
input wire rbni_ready;

output wire shsel;
output wire [BW_PLATFORM_ADDR-1:0] shaddr;
output wire [`BW_AHB_BURST-1:0] shburst;
output wire shmasterlock;
output wire [`BW_AHB_PROT-1:0] shprot;
output wire [`BW_AHB_SIZE-1:0] shsize;
output wire [`BW_AHB_TRANS-1:0] shtrans;
output wire shwrite;
output wire [BW_NODE_DATA-1:0] shwdata;
output wire shready;

input wire shreadyout;
input wire shresp;
input wire [BW_NODE_DATA-1:0] shrdata;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [MUNOC_LPARA_0-1:0] munoc_signal_03;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_01;
wire [`BW_AXI_ALEN-1:0] munoc_signal_32;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_05;
wire [`BW_AXI_ABURST-1:0] munoc_signal_21;
wire munoc_signal_17;
wire munoc_signal_06;

wire [MUNOC_LPARA_0-1:0] munoc_signal_16;
wire [BW_NODE_DATA-1:0] munoc_signal_18;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_12;
wire munoc_signal_29;
wire munoc_signal_27;
wire munoc_signal_33;

wire [MUNOC_LPARA_0-1:0] munoc_signal_13;
wire [`BW_AXI_BRESP-1:0] munoc_signal_24;
wire munoc_signal_22;
wire munoc_signal_11;

wire [MUNOC_LPARA_0-1:0] munoc_signal_04;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_10;
wire [`BW_AXI_ALEN-1:0] munoc_signal_23;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_15;
wire [`BW_AXI_ABURST-1:0] munoc_signal_09;
wire munoc_signal_31;
wire munoc_signal_30;

wire [MUNOC_LPARA_0-1:0] munoc_signal_14;
wire [BW_NODE_DATA-1:0] munoc_signal_08;
wire [`BW_AXI_RRESP-1:0] munoc_signal_02;
wire munoc_signal_19;
wire munoc_signal_28;
wire munoc_signal_20;

wire munoc_signal_26;
wire [`MUNOC_GDEF_52-1:0] munoc_signal_25;
wire [`MUNOC_GDEF_03-1:0] munoc_signal_07;
wire munoc_signal_00;

MUNOC_MODULE_36
#(
	.MUNOC_GPARA_08(NODE_ID),
	.MUNOC_GPARA_10(BW_FNI_PHIT),
	.MUNOC_GPARA_14(BW_BNI_PHIT),
	.MUNOC_GPARA_05(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_12(BW_NODE_DATA),
	.MUNOC_GPARA_02(MUNOC_LPARA_0),
	.MUNOC_GPARA_09(SUPPORTED_DATA_WIDTH),
	.MUNOC_GPARA_04(NUM_ADDR_BUFFER),
	.MUNOC_GPARA_13(NUM_ADDR_BUFFER),
	.MUNOC_GPARA_07(NUM_WDATA_BUFFER),
	.MUNOC_GPARA_11(NUM_RDATA_BUFFER),
	.MUNOC_GPARA_00(NUM_ADDR_BUFFER),
	.MUNOC_GPARA_01(0),
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

	.munoc_port_25(munoc_signal_03),
	.munoc_port_04(munoc_signal_01),
	.munoc_port_17(munoc_signal_32),
	.munoc_port_19(munoc_signal_05),
	.munoc_port_37(munoc_signal_21),
	.munoc_port_16(munoc_signal_17),
	.munoc_port_28(munoc_signal_06),

	.munoc_port_07(munoc_signal_16),
	.munoc_port_08(munoc_signal_18),
	.munoc_port_36(munoc_signal_12),
	.munoc_port_09(munoc_signal_29),
	.munoc_port_18(munoc_signal_27),
	.munoc_port_00(munoc_signal_33),

	.munoc_port_24(munoc_signal_13),
	.munoc_port_35(munoc_signal_24),
	.munoc_port_38(munoc_signal_22),
	.munoc_port_06(munoc_signal_11),

	.munoc_port_11(munoc_signal_04),
	.munoc_port_13(munoc_signal_10),
	.munoc_port_33(munoc_signal_23),
	.munoc_port_30(munoc_signal_15),
	.munoc_port_02(munoc_signal_09),
	.munoc_port_15(munoc_signal_31),
	.munoc_port_10(munoc_signal_30),

	.munoc_port_22(munoc_signal_14),
	.munoc_port_23(munoc_signal_08),
	.munoc_port_32(munoc_signal_02),
	.munoc_port_12(munoc_signal_19),
	.munoc_port_29(munoc_signal_28),
	.munoc_port_03(munoc_signal_20),

	.munoc_port_26(munoc_signal_26),
	.munoc_port_14(munoc_signal_25),
	.munoc_port_20(munoc_signal_07),
	.munoc_port_39(munoc_signal_00)
);

MUNOC_MODULE_42
#(
	.MUNOC_GPARA_4(NAME),
	.MUNOC_GPARA_3(NODE_ID),
	.MUNOC_GPARA_1(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_2(BW_NODE_DATA),
	.MUNOC_GPARA_0(MUNOC_LPARA_0)
)
i_munoc_instance_1
(
	.munoc_port_10(clk),
	.munoc_port_11(rstnn),

	.munoc_port_08(munoc_signal_03),
	.munoc_port_30(munoc_signal_01),
	.munoc_port_37(munoc_signal_32),
	.munoc_port_38(munoc_signal_05),
	.munoc_port_17(munoc_signal_21),
	.munoc_port_22(munoc_signal_17),
	.munoc_port_43(munoc_signal_06),

	.munoc_port_06(munoc_signal_16),
	.munoc_port_27(munoc_signal_18),
	.munoc_port_15(munoc_signal_12),
	.munoc_port_28(munoc_signal_29),
	.munoc_port_42(munoc_signal_27),
	.munoc_port_51(munoc_signal_33), 

	.munoc_port_13(munoc_signal_13),
	.munoc_port_52(munoc_signal_24),
	.munoc_port_31(munoc_signal_22),
	.munoc_port_49(munoc_signal_11),

	.munoc_port_19(munoc_signal_04),
	.munoc_port_23(munoc_signal_10),
	.munoc_port_04(munoc_signal_23),
	.munoc_port_14(munoc_signal_15),
	.munoc_port_07(munoc_signal_09),
	.munoc_port_41(munoc_signal_31),
	.munoc_port_36(munoc_signal_30),

	.munoc_port_44(munoc_signal_14),
	.munoc_port_50(munoc_signal_08),
	.munoc_port_34(munoc_signal_02),
	.munoc_port_20(munoc_signal_19),
	.munoc_port_00(munoc_signal_28),
	.munoc_port_03(munoc_signal_20),

	.munoc_port_33(munoc_signal_26),
	.munoc_port_18(munoc_signal_25),
	.munoc_port_25(munoc_signal_07),
	.munoc_port_45(munoc_signal_00),

	.munoc_port_32(comm_disable),

	.munoc_port_29(shsel),
	.munoc_port_05(shaddr),
	.munoc_port_12(shburst),
	.munoc_port_35(shmasterlock),
	.munoc_port_40(shprot),
	.munoc_port_01(shsize),
	.munoc_port_02(shtrans),
	.munoc_port_21(shwrite),
	.munoc_port_53(shwdata),
	.munoc_port_09(shready),
	.munoc_port_47(shreadyout),
	.munoc_port_16(shresp),
	.munoc_port_39(shrdata),

	.munoc_port_24(svri_rlink),
	.munoc_port_46(svri_rack),
	.munoc_port_48(svri_slink),
	.munoc_port_26(svri_sack)
);

endmodule
