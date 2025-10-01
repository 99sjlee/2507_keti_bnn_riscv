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



module MUNOC_AXI4L_SLAVE_NETWORK_INTERFACE_MODULE_ASYNCH
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

	sx4lawaddr,
	sx4lawvalid,
	sx4lawready,

	sx4lwdata,
	sx4lwstrb,
	sx4lwvalid,
	sx4lwready, 

	sx4lbresp,
	sx4lbvalid,
	sx4lbready,

	sx4laraddr,
	sx4larvalid,
	sx4larready,

	sx4lrdata,
	sx4lrresp,
	sx4lrvalid,
	sx4lrready,

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

input wire clk_slave, rstnn_slave;
input wire clk_network, rstnn_network;

input wire comm_disable;

input wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] rfni_link;
output wire rfni_ready;
output wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] rbni_link;
input wire rbni_ready;

output wire [BW_PLATFORM_ADDR-1:0] sx4lawaddr;
output wire sx4lawvalid;
input wire sx4lawready;

output wire [BW_NODE_DATA-1:0] sx4lwdata;
output wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] sx4lwstrb;
output wire sx4lwvalid;
input wire sx4lwready;

input wire [`BW_AXI_BRESP-1:0] sx4lbresp;
input wire sx4lbvalid;
output wire sx4lbready;

output wire [BW_PLATFORM_ADDR-1:0] sx4laraddr;
output wire sx4larvalid;
input wire sx4larready;

input wire [BW_NODE_DATA-1:0] sx4lrdata;
input wire [`BW_AXI_RRESP-1:0] sx4lrresp;
input wire sx4lrvalid;
output wire sx4lrready;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_06;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_18;
wire [`BW_AXI_ALEN-1:0] munoc_signal_13;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_29;
wire [`BW_AXI_ABURST-1:0] munoc_signal_17;
wire munoc_signal_07;
wire munoc_signal_26;

wire [BW_NODE_DATA-1:0] munoc_signal_11;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_12;
wire munoc_signal_08;
wire munoc_signal_19;
wire munoc_signal_09;

wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_14;
wire [`BW_AXI_BRESP-1:0] munoc_signal_00;
wire munoc_signal_27;
wire munoc_signal_05;

wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_03;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_21;
wire [`BW_AXI_ALEN-1:0] munoc_signal_28;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_23;
wire [`BW_AXI_ABURST-1:0] munoc_signal_20;
wire munoc_signal_02;
wire munoc_signal_10;

wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_16;
wire [BW_NODE_DATA-1:0] munoc_signal_04;
wire [`BW_AXI_RRESP-1:0] munoc_signal_01;
wire munoc_signal_15;
wire munoc_signal_22;
wire munoc_signal_25;

wire [BW_AXI_SLAVE_TID-1:0] x4_wid =0;

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
  .NUM_AXIAR_BUFFER(NUM_AXIAR_BUFFER),
  .NUM_AXIAW_BUFFER(NUM_AXIAW_BUFFER),
  .NUM_AXIW_BUFFER(NUM_AXIW_BUFFER),
  .NUM_AXIR_BUFFER(NUM_AXIR_BUFFER),
  .NUM_AXIB_BUFFER(NUM_AXIB_BUFFER)
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

	.sx4awid(munoc_signal_06),
	.sx4awaddr(munoc_signal_18),
	.sx4awlen(munoc_signal_13),
	.sx4awsize(munoc_signal_29),
	.sx4awburst(munoc_signal_17),
	.sx4awvalid(munoc_signal_07),
	.sx4awready(munoc_signal_26),

	.sx4wdata(munoc_signal_11),
	.sx4wstrb(munoc_signal_12),
	.sx4wlast(munoc_signal_08),
	.sx4wvalid(munoc_signal_19),
	.sx4wready(munoc_signal_09), 

	.sx4bid(munoc_signal_14),
	.sx4bresp(munoc_signal_00),
	.sx4bvalid(munoc_signal_27),
	.sx4bready(munoc_signal_05),

	.sx4arid(munoc_signal_03),
	.sx4araddr(munoc_signal_21),
	.sx4arlen(munoc_signal_28),
	.sx4arsize(munoc_signal_23),
	.sx4arburst(munoc_signal_20),
	.sx4arvalid(munoc_signal_02),
	.sx4arready(munoc_signal_10),

	.sx4rid(munoc_signal_16),
	.sx4rdata(munoc_signal_04),
	.sx4rresp(munoc_signal_01),
	.sx4rlast(munoc_signal_15),
	.sx4rvalid(munoc_signal_22),
	.sx4rready(munoc_signal_25),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

RVX_MODULE_077
#(
  .RVX_GPARA_1(BW_PLATFORM_ADDR),
  .RVX_GPARA_2(BW_NODE_DATA),
  .RVX_GPARA_3(BW_AXI_SLAVE_TID)
)
i_munoc_instance_1
(
	.rvx_port_36(clk_slave),
	.rvx_port_05(rstnn_slave),
  .rvx_port_16(1'b 0),
  .rvx_port_10(1'b 1),

  .rvx_port_28(munoc_signal_03),
	.rvx_port_17(munoc_signal_21),
	.rvx_port_22(munoc_signal_28),
	.rvx_port_19(munoc_signal_23),
	.rvx_port_40(munoc_signal_20),
	.rvx_port_20(munoc_signal_02),
	.rvx_port_13(munoc_signal_10),

	.rvx_port_21(munoc_signal_16),
	.rvx_port_43(munoc_signal_04),
	.rvx_port_35(munoc_signal_01),
	.rvx_port_14(munoc_signal_15),
	.rvx_port_33(munoc_signal_22),
	.rvx_port_41(munoc_signal_25),

	.rvx_port_23(munoc_signal_06),
  .rvx_port_31(munoc_signal_18),
  .rvx_port_44(munoc_signal_13),
  .rvx_port_30(munoc_signal_29),
  .rvx_port_38(munoc_signal_17),
  .rvx_port_06(munoc_signal_07),
  .rvx_port_37(munoc_signal_26),

  .rvx_port_47(x4_wid),
  .rvx_port_50(munoc_signal_11),
  .rvx_port_26(munoc_signal_12),
  .rvx_port_18(munoc_signal_08),
  .rvx_port_03(munoc_signal_19),
  .rvx_port_39(munoc_signal_09),

  .rvx_port_34(munoc_signal_14),
  .rvx_port_32(munoc_signal_00),
  .rvx_port_07(munoc_signal_27),
  .rvx_port_11(munoc_signal_05),

  .rvx_port_27(sx4lawaddr),
	.rvx_port_24(sx4lawvalid),
	.rvx_port_46(sx4lawready),

	.rvx_port_15(sx4lwdata),
	.rvx_port_00(sx4lwstrb),
	.rvx_port_42(sx4lwvalid),
	.rvx_port_04(sx4lwready), 

	.rvx_port_01(sx4lbresp),
	.rvx_port_12(sx4lbvalid),
	.rvx_port_25(sx4lbready),

	.rvx_port_45(sx4laraddr),
	.rvx_port_09(sx4larvalid),
	.rvx_port_48(sx4larready),

	.rvx_port_49(sx4lrdata),
	.rvx_port_02(sx4lrresp),
	.rvx_port_29(sx4lrvalid),
	.rvx_port_08(sx4lrready)
);

endmodule
