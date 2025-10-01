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



module MUNOC_XMI_SLAVE_NETWORK_INTERFACE_MODULE_ASYNCH
(
	clk_slave,
	rstnn_slave,
	clk_network,
	rstnn_network,

	comm_disable,

	rfni_link,
	rfni_ready,
	rbni_link,
	rbni_ready,

	slxqdready,
  slxqvalid,
  slxqlast,
  slxqwrite,
  slxqlen,
  slxqsize,
  slxqburst,
  slxqwstrb,
  slxqwdata,
  slxqaddr,
  slxqburden,
  slxydready,
  slxyvalid,
  slxylast,
  slxywreply,
  slxyresp,
  slxyrdata,
  slxyburden,

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

localparam  MUNOC_LPARA_7 = BW_PLATFORM_ADDR;
localparam  MUNOC_LPARA_1 = BW_NODE_DATA;
localparam  MUNOC_LPARA_0 = BW_AXI_SLAVE_TID;

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = MUNOC_LPARA_7;
localparam  BW_LPIXM_DATA = MUNOC_LPARA_1;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXM_BURDEN(MUNOC_LPARA_0);

`include "lpixm_lpara.vb"

localparam  MUNOC_LPARA_3 = 2;
localparam  MUNOC_LPARA_6 = 2;
localparam  MUNOC_LPARA_5 = 2;
localparam  MUNOC_LPARA_2 = 2;
localparam  MUNOC_LPARA_4 = 2;

input wire clk_slave, rstnn_slave;
input wire clk_network, rstnn_network;

input wire comm_disable;

input wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] rfni_link;
output wire rfni_ready;
output wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] rbni_link;
input wire rbni_ready;

input wire [(2)-1:0] slxqdready;
output wire slxqvalid;
output wire slxqlast;
output wire slxqwrite;
output wire [`BW_AXI_ALEN-1:0] slxqlen;
output wire [`BW_AXI_ASIZE-1:0] slxqsize;
output wire [`BW_AXI_ABURST-1:0] slxqburst;
output wire [`BW_AXI_WSTRB(MUNOC_LPARA_1)-1:0] slxqwstrb;
output wire [MUNOC_LPARA_1-1:0] slxqwdata;
output wire [MUNOC_LPARA_7-1:0] slxqaddr;
output wire [BW_LPI_BURDEN-1:0] slxqburden;
output wire [(2)-1:0] slxydready;
input wire slxyvalid;
input wire slxylast;
input wire slxywreply;
input wire [`BW_AXI_RESP-1:0] slxyresp;
input wire [MUNOC_LPARA_1-1:0] slxyrdata;
input wire [BW_LPI_BURDEN-1:0] slxyburden;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [MUNOC_LPARA_0-1:0] munoc_signal_21;
wire [MUNOC_LPARA_7-1:0] munoc_signal_34;
wire [`BW_AXI_ALEN-1:0] munoc_signal_08;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_23;
wire [`BW_AXI_ABURST-1:0] munoc_signal_12;
wire munoc_signal_04;
wire munoc_signal_02;

wire [MUNOC_LPARA_0-1:0] x4_wid = -1;
wire [MUNOC_LPARA_1-1:0] munoc_signal_06;
wire [`BW_AXI_WSTRB(MUNOC_LPARA_1)-1:0] munoc_signal_14;
wire munoc_signal_11;
wire munoc_signal_26;
wire munoc_signal_28;

wire [MUNOC_LPARA_0-1:0] munoc_signal_30;
wire [`BW_AXI_BRESP-1:0] munoc_signal_24;
wire munoc_signal_00;
wire munoc_signal_13;

wire [MUNOC_LPARA_0-1:0] munoc_signal_40;
wire [MUNOC_LPARA_7-1:0] munoc_signal_32;
wire [`BW_AXI_ALEN-1:0] munoc_signal_25;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_29;
wire [`BW_AXI_ABURST-1:0] munoc_signal_31;
wire munoc_signal_07;
wire munoc_signal_27;

wire [MUNOC_LPARA_0-1:0] munoc_signal_01;
wire [MUNOC_LPARA_1-1:0] munoc_signal_38;
wire [`BW_AXI_RRESP-1:0] munoc_signal_35;
wire munoc_signal_36;
wire munoc_signal_09;
wire munoc_signal_37;

wire [2-1:0] munoc_signal_16;
wire munoc_signal_39;
wire munoc_signal_15;
wire munoc_signal_19;
wire munoc_signal_18;
wire [BW_LPI_QDATA-1:0] munoc_signal_17;

wire [2-1:0] munoc_signal_22;
wire munoc_signal_05;
wire munoc_signal_33;
wire munoc_signal_03;
wire [BW_LPI_YDATA-1:0] munoc_signal_10;

MUNOC_AXI4_SLAVE_NETWORK_INTERFACE_MODULE_ASYNCH
#(
  .NAME(NAME),
  .NODE_ID(NODE_ID),
  .BW_FNI_PHIT(BW_FNI_PHIT),
  .BW_BNI_PHIT(BW_BNI_PHIT),
  .BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
  .BW_NODE_DATA(BW_NODE_DATA),
  .BW_AXI_SLAVE_TID(BW_AXI_SLAVE_TID),
  .SUPPORTED_DATA_WIDTH(SUPPORTED_DATA_WIDTH),
  .PARTIAL_READ_WIDTH(PARTIAL_READ_WIDTH),
  .NUM_AXIAR_BUFFER(MUNOC_LPARA_3),
  .NUM_AXIAW_BUFFER(MUNOC_LPARA_6),
  .NUM_AXIW_BUFFER(MUNOC_LPARA_5),
  .NUM_AXIR_BUFFER(MUNOC_LPARA_2),
  .NUM_AXIB_BUFFER(MUNOC_LPARA_4)
)
i_munoc_instance_0
(
	.clk_slave(clk_slave),
	.rstnn_slave(rstnn_slave),
	.clk_network(clk_network),
	.rstnn_network(rstnn_network),

	.comm_disable(comm_disable),

	.rfni_link(rfni_link),
	.rfni_ready(rfni_ready),
	.rbni_link(rbni_link),
	.rbni_ready(rbni_ready),

	.sx4awid(munoc_signal_21),
	.sx4awaddr(munoc_signal_34),
	.sx4awlen(munoc_signal_08),
	.sx4awsize(munoc_signal_23),
	.sx4awburst(munoc_signal_12),
	.sx4awvalid(munoc_signal_04),
	.sx4awready(munoc_signal_02),

	.sx4wdata(munoc_signal_06),
	.sx4wstrb(munoc_signal_14),
	.sx4wlast(munoc_signal_11),
	.sx4wvalid(munoc_signal_26),
	.sx4wready(munoc_signal_28), 

	.sx4bid(munoc_signal_30),
	.sx4bresp(munoc_signal_24),
	.sx4bvalid(munoc_signal_00),
	.sx4bready(munoc_signal_13),

	.sx4arid(munoc_signal_40),
	.sx4araddr(munoc_signal_32),
	.sx4arlen(munoc_signal_25),
	.sx4arsize(munoc_signal_29),
	.sx4arburst(munoc_signal_31),
	.sx4arvalid(munoc_signal_07),
	.sx4arready(munoc_signal_27),

	.sx4rid(munoc_signal_01),
	.sx4rdata(munoc_signal_38),
	.sx4rresp(munoc_signal_35),
	.sx4rlast(munoc_signal_36),
	.sx4rvalid(munoc_signal_09),
	.sx4rready(munoc_signal_37),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

RVX_MODULE_024
#(
  .RVX_GPARA_2(MUNOC_LPARA_7),
  .RVX_GPARA_0(MUNOC_LPARA_1),
  .RVX_GPARA_1(MUNOC_LPARA_0),
  .MEMORY_OPERATION_TYPE(3)
)
i_munoc_instance_1
(
	.rvx_port_29(clk_slave),
	.rvx_port_43(rstnn_slave),
  .rvx_port_00(1'b 0),
  .rvx_port_21(1'b 1),

  .rvx_port_30(munoc_signal_40),
	.rvx_port_14(munoc_signal_32),
	.rvx_port_35(munoc_signal_25),
	.rvx_port_33(munoc_signal_29),
	.rvx_port_34(munoc_signal_31),
	.rvx_port_40(munoc_signal_07),
	.rvx_port_19(munoc_signal_27),

	.rvx_port_24(munoc_signal_01),
	.rvx_port_02(munoc_signal_38),
	.rvx_port_32(munoc_signal_35),
	.rvx_port_08(munoc_signal_36),
	.rvx_port_26(munoc_signal_09),
	.rvx_port_11(munoc_signal_37),

	.rvx_port_12(munoc_signal_21),
  .rvx_port_07(munoc_signal_34),
  .rvx_port_13(munoc_signal_08),
  .rvx_port_01(munoc_signal_23),
  .rvx_port_38(munoc_signal_12),
  .rvx_port_10(munoc_signal_04),
  .rvx_port_20(munoc_signal_02),

  .rvx_port_04(x4_wid),
  .rvx_port_18(munoc_signal_06),
  .rvx_port_09(munoc_signal_14),
  .rvx_port_42(munoc_signal_11),
  .rvx_port_16(munoc_signal_26),
  .rvx_port_37(munoc_signal_28),

  .rvx_port_28(munoc_signal_30),
  .rvx_port_27(munoc_signal_24),
  .rvx_port_39(munoc_signal_00),
  .rvx_port_31(munoc_signal_13),

  .rvx_port_36(munoc_signal_16),
  .rvx_port_41(munoc_signal_39),
  .rvx_port_23(munoc_signal_15),
  .rvx_port_44(munoc_signal_19),
  .rvx_port_25(munoc_signal_18),
  .rvx_port_05(munoc_signal_17),

  .rvx_port_22(munoc_signal_22),
  .rvx_port_03(munoc_signal_05),
  .rvx_port_06(munoc_signal_33),
  .rvx_port_15(munoc_signal_03),
  .rvx_port_17(munoc_signal_10)
);

assign munoc_signal_16 = slxqdready;
assign slxqvalid = munoc_signal_39;
assign slxqlast = munoc_signal_19;
assign {slxqburden,slxqwrite,slxqlen,slxqsize,slxqburst,slxqwstrb,slxqwdata,slxqaddr} = munoc_signal_17;

assign slxydready = munoc_signal_22;
assign munoc_signal_05 = slxyvalid;
assign munoc_signal_03 = slxylast;
assign munoc_signal_10 = {slxyburden,slxywreply,slxyresp,slxyrdata};

endmodule
