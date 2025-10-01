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
`include "munoc_tid_control_type.vh"
`include "munoc_include_07.vh"



module MUNOC_AHB_MASTER_NETWORK_INTERFACE_MODULE_ASYNCH
(
	clk_master,
	rstnn_master,
	clk_network,
	rstnn_network,

	sfni_link,
	sfni_ready,
	sbni_link,
	sbni_ready,

	comm_disable,

	rhaddr,
	rhburst,
	rhmasterlock,
	rhprot,
	rhsize,
	rhtrans,
	rhwdata,
	rhwrite,
	rhrdata,
	rhready,
	rhresp,

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

parameter NUM_WDATA_BUFFER = 4;
parameter NUM_RDATA_BUFFER = 4;

parameter WAIT_WRITE_RESPONSE = 0; 

localparam  MUNOC_LPARA_1 = 1;
localparam  MUNOC_LPARA_0 = "AHB";

input wire clk_master, rstnn_master;
input wire clk_network, rstnn_network;

output wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] sfni_link;
input wire sfni_ready;
input wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] sbni_link;
output wire sbni_ready;

input wire comm_disable;

input wire [BW_PLATFORM_ADDR-1:0] rhaddr;
input wire [`BW_AHB_BURST-1:0] rhburst;
input wire rhmasterlock;
input wire [`BW_AHB_PROT-1:0] rhprot;
input wire [`BW_AHB_SIZE-1:0] rhsize;
input wire [`BW_AHB_TRANS-1:0] rhtrans;
input wire [BW_NODE_DATA-1:0] rhwdata;
input wire rhwrite;

output wire [BW_NODE_DATA-1:0] rhrdata;
output wire rhready;
output wire rhresp;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [BW_PLATFORM_ADDR-1:0] munoc_signal_34;
wire [`BW_AHB_BURST-1:0] munoc_signal_40;
wire munoc_signal_07;
wire [`BW_AHB_PROT-1:0] munoc_signal_50;
wire [`BW_AHB_SIZE-1:0] munoc_signal_22;
wire [`BW_AHB_TRANS-1:0] munoc_signal_03;
wire [BW_NODE_DATA-1:0] munoc_signal_05;
wire munoc_signal_35;
wire [BW_NODE_DATA-1:0] munoc_signal_59;
wire munoc_signal_26;
wire munoc_signal_38;

wire munoc_signal_19;
wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] munoc_signal_00;

wire munoc_signal_15;
wire [`BW_ARCHANNEL(MUNOC_LPARA_1,BW_PLATFORM_ADDR)-1:0] munoc_signal_30;
wire munoc_signal_25;

wire munoc_signal_37;
wire [`BW_AWCHANNEL(MUNOC_LPARA_1,BW_PLATFORM_ADDR)-1:0] munoc_signal_01;
wire munoc_signal_10;

wire munoc_signal_43;
wire [`BW_WCHANNEL(0,BW_NODE_DATA)-1:0] munoc_signal_52;
wire munoc_signal_51;

wire [MUNOC_LPARA_1-1:0] munoc_signal_32;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_46;
wire munoc_signal_21;
wire munoc_signal_08;
wire [MUNOC_LPARA_1-1:0] munoc_signal_53;
wire munoc_signal_27;

wire [MUNOC_LPARA_1-1:0] munoc_signal_02;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_39;
wire munoc_signal_41;
wire munoc_signal_13;
wire [MUNOC_LPARA_1-1:0] munoc_signal_29;
wire munoc_signal_44;

wire [MUNOC_LPARA_1-1:0] munoc_signal_18;
wire [`BW_AXI_BRESP-1:0] munoc_signal_55;
wire munoc_signal_04;
wire munoc_signal_33;

wire [MUNOC_LPARA_1-1:0] munoc_signal_42;
wire [BW_NODE_DATA-1:0] munoc_signal_60;
wire [`BW_AXI_RRESP-1:0] munoc_signal_45;
wire munoc_signal_58;
wire munoc_signal_56;
wire munoc_signal_36;

wire munoc_signal_23;
wire munoc_signal_57;
wire munoc_signal_28;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_48;
wire [MUNOC_LPARA_1-1:0] munoc_signal_61;
wire [`BW_AXI_BRESP-1:0] munoc_signal_12;

wire munoc_signal_16;
wire [`BW_AXI_RRESP-1:0] munoc_signal_49;
wire [BW_NODE_DATA-1:0] munoc_signal_09;

wire munoc_signal_24;
wire munoc_signal_62;

wire [`MUNOC_GDEF_55-1:0] munoc_signal_20;
wire [`MUNOC_GDEF_12-1:0] munoc_signal_31;
wire munoc_signal_54;
wire [`MUNOC_GDEF_71-1:0] munoc_signal_47;
wire [`MUNOC_GDEF_71-1:0] munoc_signal_11;
wire [`MUNOC_GDEF_24-1:0] munoc_signal_06;
wire munoc_signal_17;
wire munoc_signal_14;

MUNOC_MODULE_37
#(
	.MUNOC_GPARA_0(BW_NODE_DATA),
	.MUNOC_GPARA_1(BW_PLATFORM_ADDR)
)
i_munoc_instance_06
(
	.munoc_port_12(comm_disable),

	.munoc_port_06(1'b 0),
	.munoc_port_15(rhaddr),
	.munoc_port_21(rhburst),
	.munoc_port_03(rhmasterlock),
	.munoc_port_14(rhprot),
	.munoc_port_17(rhsize),
	.munoc_port_10(rhtrans),	
	.munoc_port_05(rhwrite),
	.munoc_port_04(rhwdata),	
	.munoc_port_11(rhready),
	.munoc_port_16(rhresp),
	.munoc_port_00(rhrdata),

	.munoc_port_08(),
	.munoc_port_13(munoc_signal_34),
	.munoc_port_22(munoc_signal_40),
	.munoc_port_01(munoc_signal_07),
	.munoc_port_02(munoc_signal_50),
	.munoc_port_19(munoc_signal_22),
	.munoc_port_18(munoc_signal_03),	
	.munoc_port_23(munoc_signal_35),
	.munoc_port_24(munoc_signal_05),	
	.munoc_port_09(munoc_signal_26),
	.munoc_port_20(munoc_signal_38),
	.munoc_port_07(munoc_signal_59)
);

MUNOC_MODULE_39
#(
	.MUNOC_GPARA_2(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_1(BW_NODE_DATA),
	.MUNOC_GPARA_0(MUNOC_LPARA_1),
	.MUNOC_GPARA_4(WAIT_WRITE_RESPONSE)
)
i_munoc_instance_01
(
	.munoc_port_21(clk_master),
	.munoc_port_05(rstnn_master),

	.munoc_port_15(munoc_signal_34),
	.munoc_port_01(munoc_signal_40),
	.munoc_port_29(munoc_signal_07),
	.munoc_port_12(munoc_signal_50),
	.munoc_port_04(munoc_signal_22),
	.munoc_port_24(munoc_signal_03),
	.munoc_port_16(munoc_signal_05),
	.munoc_port_06(munoc_signal_35),
	.munoc_port_19(munoc_signal_59),
	.munoc_port_20(munoc_signal_26),
	.munoc_port_23(munoc_signal_38),

	.munoc_port_31(munoc_signal_15),
	.munoc_port_30(munoc_signal_30),
	.munoc_port_25(munoc_signal_25),
	.munoc_port_03(munoc_signal_37),
	.munoc_port_26(munoc_signal_01),
	.munoc_port_07(munoc_signal_10),
	.munoc_port_02(munoc_signal_43),
	.munoc_port_18(munoc_signal_52),
	.munoc_port_22(munoc_signal_51),

	.munoc_port_10(munoc_signal_18),
	.munoc_port_28(munoc_signal_55),
	.munoc_port_11(munoc_signal_04),
	.munoc_port_27(munoc_signal_33),

	.munoc_port_17(munoc_signal_42),
	.munoc_port_13(munoc_signal_60),
	.munoc_port_14(munoc_signal_45),
	.munoc_port_00(munoc_signal_58),
	.munoc_port_09(munoc_signal_56),
	.munoc_port_08(munoc_signal_36)
);

MUNOC_MODULE_02
#(
	.MUNOC_GPARA_4(NODE_ID),
	.MUNOC_GPARA_2(BW_FNI_PHIT),
	.MUNOC_GPARA_1(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_0(BW_NODE_DATA),
	.MUNOC_GPARA_3(MUNOC_LPARA_1)
)
i_munoc_instance_09
(
	.munoc_port_06(clk_master),
	.munoc_port_21(rstnn_master),
	.munoc_port_01(munoc_signal_15),
	.munoc_port_13(munoc_signal_25),
	.munoc_port_14(munoc_signal_30),
	.munoc_port_09(munoc_signal_37),
	.munoc_port_08(munoc_signal_10),
	.munoc_port_00(munoc_signal_01),
	.munoc_port_04(munoc_signal_43),
	.munoc_port_07(munoc_signal_51),
	.munoc_port_03(munoc_signal_52),
	.munoc_port_16(munoc_signal_00),
	.munoc_port_15(munoc_signal_19),
	.munoc_port_22(munoc_signal_14),
	.munoc_port_19(munoc_signal_32),
	.munoc_port_17(munoc_signal_46),
	.munoc_port_12(munoc_signal_21),
	.munoc_port_11(munoc_signal_08),
	.munoc_port_10(munoc_signal_02),
	.munoc_port_20(munoc_signal_39),
	.munoc_port_05(munoc_signal_41),
	.munoc_port_18(munoc_signal_13),
	.munoc_port_02(munoc_signal_20)
);

MUNOC_MODULE_33
#(
	.MUNOC_GPARA_1(MUNOC_LPARA_1),
	.MUNOC_GPARA_0(`BW_SLAVE_NODE_ID),
	.MUNOC_GPARA_2(`SINGLE_TARGET_SLAVE)
)
i_munoc_instance_04
(
	.munoc_port_08(clk_master),
	.munoc_port_09(rstnn_master),
	.munoc_port_07(munoc_signal_32),
	.munoc_port_04(munoc_signal_46),
	.munoc_port_03(munoc_signal_21),
	.munoc_port_05(munoc_signal_08),
	.munoc_port_06(clk_master),
	.munoc_port_02(rstnn_master),
	.munoc_port_00(munoc_signal_53),
	.munoc_port_01(munoc_signal_27)
);

MUNOC_MODULE_33
#(
	.MUNOC_GPARA_1(MUNOC_LPARA_1),
	.MUNOC_GPARA_0(`BW_SLAVE_NODE_ID),
	.MUNOC_GPARA_2(`SINGLE_TARGET_SLAVE)
)
i_munoc_instance_08
(
	.munoc_port_08(clk_master),
	.munoc_port_09(rstnn_master),
	.munoc_port_07(munoc_signal_02),
	.munoc_port_04(munoc_signal_39),
	.munoc_port_03(munoc_signal_41),
	.munoc_port_05(munoc_signal_13),
	.munoc_port_06(clk_master),
	.munoc_port_02(rstnn_master),
	.munoc_port_00(munoc_signal_29),
	.munoc_port_01(munoc_signal_44)
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_FNI_LINK(BW_FNI_PHIT)-1),
	.DEPTH(2+NUM_WDATA_BUFFER)
)
i_munoc_instance_07
(
	.wclk(clk_master),
	.wrstnn(rstnn_master),
	.wready(munoc_signal_19),
	.wrequest(munoc_signal_00[`BW_FNI_LINK(BW_FNI_PHIT)-1]),
	.wdata(munoc_signal_00[`BW_FNI_LINK(BW_FNI_PHIT)-2:0]),
	.rclk(clk_network),
	.rrstnn(rstnn_network),
	.rready(sfni_link[`BW_FNI_LINK(BW_FNI_PHIT)-1]),
	.rrequest(sfni_ready&sfni_link[`BW_FNI_LINK(BW_FNI_PHIT)-1]),
	.rdata(sfni_link[`BW_FNI_LINK(BW_FNI_PHIT)-2:0]),
	.wfull(),
	.rempty()
);

MUNOC_MODULE_30
#(
	 .MUNOC_GPARA_4(BW_BNI_PHIT),
	 .MUNOC_GPARA_1(BW_PLATFORM_ADDR),
	 .MUNOC_GPARA_5(BW_NODE_DATA),
	 .MUNOC_GPARA_3(MUNOC_LPARA_1),
	 .MUNOC_GPARA_2(2),
	 .MUNOC_GPARA_0(NUM_RDATA_BUFFER)
)
i_munoc_instance_00
(
	.munoc_port_07(clk_master),
	.munoc_port_08(rstnn_master),
	.munoc_port_01(clk_network),
	.munoc_port_15(rstnn_network),

	.munoc_port_04(sbni_link),
	.munoc_port_11(sbni_ready),
	.munoc_port_17(munoc_signal_14),

	.munoc_port_09(munoc_signal_23),
	.munoc_port_06(munoc_signal_57),
	.munoc_port_02(munoc_signal_28),

	.munoc_port_03(munoc_signal_48),
	.munoc_port_16(munoc_signal_61),
	.munoc_port_00(munoc_signal_12),

	.munoc_port_05(munoc_signal_16),
	.munoc_port_13(munoc_signal_49),
	.munoc_port_10(munoc_signal_09),

	.munoc_port_14(munoc_signal_24),
	.munoc_port_12(munoc_signal_62)
);

MUNOC_MODULE_43
#(
	.MUNOC_GPARA_3(NODE_ID),
	.MUNOC_GPARA_1(BW_BNI_PHIT),
	.MUNOC_GPARA_2(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_4(BW_NODE_DATA),
	.MUNOC_GPARA_0(MUNOC_LPARA_1)
)
i_munoc_instance_03
(
	.munoc_port_21(clk_master),
	.munoc_port_19(rstnn_master),

	.munoc_port_03(munoc_signal_23),
	.munoc_port_00(munoc_signal_57),
	.munoc_port_22(munoc_signal_28),
	.munoc_port_14(munoc_signal_48),
	.munoc_port_26(munoc_signal_61),
	.munoc_port_25(munoc_signal_12),
	.munoc_port_23(munoc_signal_16),
	.munoc_port_09(munoc_signal_49),
	.munoc_port_15(munoc_signal_09),
	.munoc_port_12(munoc_signal_24),
	.munoc_port_01(munoc_signal_62),

	.munoc_port_24(munoc_signal_53),
	.munoc_port_02(munoc_signal_27),
	.munoc_port_17(munoc_signal_29),
	.munoc_port_13(munoc_signal_44),

	.munoc_port_16(munoc_signal_18),
	.munoc_port_18(munoc_signal_55),
	.munoc_port_28(munoc_signal_04),
	.munoc_port_07(munoc_signal_33),
	.munoc_port_05(munoc_signal_42),
	.munoc_port_08(munoc_signal_60),
	.munoc_port_06(munoc_signal_45),
	.munoc_port_10(munoc_signal_58),
	.munoc_port_04(munoc_signal_56),
	.munoc_port_20(munoc_signal_36),

	.munoc_port_27(munoc_signal_31),
	.munoc_port_11(munoc_signal_54)
);

`ifdef __MUNOC_INCLUDE_CONTROLLER

MUNOC_MODULE_09
#(
	.MUNOC_GPARA_0(1)
)
i_munoc_instance_02
(
	.munoc_port_5(clk_master),
	.munoc_port_0(rstnn_master),
	.munoc_port_1(munoc_signal_17),

	.munoc_port_7(1'b 1),
	.munoc_port_2(rhtrans),
	.munoc_port_4(rhready),

	.munoc_port_3(munoc_signal_47),
	.munoc_port_8(munoc_signal_11),
	.munoc_port_6(munoc_signal_06)
);

MUNOC_MODULE_03
#(
	.MUNOC_GPARA_0(NAME),
	.MUNOC_GPARA_2(NODE_ID),
	.MUNOC_GPARA_1(MUNOC_LPARA_0)
)
i_munoc_instance_05
(
	.munoc_port_07(clk_network),
	.munoc_port_13(rstnn_network),
	.munoc_port_06(munoc_signal_20),
	.munoc_port_09(munoc_signal_31),
	.munoc_port_14(munoc_signal_54),
	.munoc_port_11(munoc_signal_47),
	.munoc_port_02(munoc_signal_11),
	.munoc_port_10(munoc_signal_06),
	.munoc_port_08(munoc_signal_17),
	.munoc_port_12(),
	.munoc_port_05(munoc_signal_14),
	.munoc_port_03(svri_rlink),
	.munoc_port_01(svri_rack),
	.munoc_port_00(svri_slink),
	.munoc_port_04(svri_sack)
);

`else

assign munoc_signal_17 = 0;
assign munoc_signal_14 = 0;
assign svri_rack = 0;
assign svri_slink = 0;

`endif

endmodule
