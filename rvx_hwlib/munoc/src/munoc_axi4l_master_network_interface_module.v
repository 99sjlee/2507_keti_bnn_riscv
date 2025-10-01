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
`include "munoc_tid_control_type.vh"



module MUNOC_AXI4L_MASTER_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,

	sfni_link,
	sfni_ready,
	sbni_link,
	sbni_ready,

	rx4lawaddr,
	rx4lawvalid,
	rx4lawready,

	rx4lwdata,
	rx4lwstrb,
	rx4lwvalid,
	rx4lwready, 

	rx4lbresp,
	rx4lbvalid,
	rx4lbready,

	rx4laraddr,
	rx4larvalid,
	rx4larready,

	rx4lrdata,
	rx4lrresp,
	rx4lrvalid,
	rx4lrready,

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

parameter TID_CONTROL_TYPE = `SINGLE_TARGET_SLAVE;

parameter NUM_AXIAR_BUFFER = 4;
parameter NUM_AXIAW_BUFFER = 2;
parameter NUM_AXIW_BUFFER = 4;
parameter NUM_AXIR_BUFFER = 4;
parameter NUM_AXIB_BUFFER = 2;

localparam  MUNOC_LPARA_0 = 1;
localparam  MUNOC_LPARA_2 = 0;
localparam  MUNOC_LPARA_1 = 0;

input wire clk, rstnn;

input wire comm_disable;

output wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] sfni_link;
input wire sfni_ready;
input wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] sbni_link;
output wire sbni_ready;

input wire [BW_PLATFORM_ADDR-1:0] rx4lawaddr;
input wire rx4lawvalid;
output wire rx4lawready;

input wire [BW_NODE_DATA-1:0] rx4lwdata;
input wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] rx4lwstrb;
input wire rx4lwvalid;
output wire rx4lwready;

output wire [`BW_AXI_BRESP-1:0] rx4lbresp;
output wire rx4lbvalid;
input wire rx4lbready;

input wire [BW_PLATFORM_ADDR-1:0] rx4laraddr;
input wire rx4larvalid;
output wire rx4larready;

output wire [BW_NODE_DATA-1:0] rx4lrdata;
output wire [`BW_AXI_RRESP-1:0] rx4lrresp;
output wire rx4lrvalid;
input wire rx4lrready;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [`BW_AXI_ALEN-1:0] rx4lawlen = `AXI_LENGTH_01;
wire [`BW_AXI_ASIZE-1:0] rx4lawsize = `GET_AXI_SIZE(BW_NODE_DATA);
wire [`BW_AXI_ABURST-1:0] rx4lawburst = `AXI_BURST_FIXED;

wire rx4lwlast = 1;

wire [`BW_AXI_ALEN-1:0] rx4larlen = `AXI_LENGTH_01;
wire [`BW_AXI_ASIZE-1:0] rx4larsize = `GET_AXI_SIZE(BW_NODE_DATA);
wire [`BW_AXI_ABURST-1:0] rx4larburst = `AXI_BURST_FIXED;

wire munoc_signal_09;

wire [MUNOC_LPARA_0-1:0] rx4lawid = 0;
wire [MUNOC_LPARA_0-1:0] munoc_signal_18;
wire [MUNOC_LPARA_0-1:0] rx4larid = 0;
wire [MUNOC_LPARA_0-1:0] munoc_signal_04;

wire [BW_PLATFORM_ADDR-1:0] munoc_signal_17;
wire munoc_signal_15;
wire munoc_signal_19;
wire munoc_signal_07;
wire [BW_NODE_DATA-1:0] munoc_signal_03;
wire [BW_NODE_DATA-1:0] local_sprdata = 0;
wire local_spready = 0;
wire local_spslverr = 0;
wire munoc_signal_20;

MUNOC_AXI4_MASTER_NETWORK_INTERFACE_MODULE
#(
  .NAME(NAME),
  .NODE_ID(NODE_ID),
  .BW_FNI_PHIT(BW_FNI_PHIT),
  .BW_BNI_PHIT(BW_BNI_PHIT),
  .BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
  .BW_NODE_DATA(BW_NODE_DATA),
  .BW_AXI_MASTER_TID(MUNOC_LPARA_0),
  .LOCAL_ENABLE(MUNOC_LPARA_2),
  .LOCAL_UPPER_ADDR(MUNOC_LPARA_1),
  .TID_CONTROL_TYPE(TID_CONTROL_TYPE),
  .NUM_AXIAR_BUFFER(NUM_AXIAR_BUFFER),
  .NUM_AXIAW_BUFFER(NUM_AXIAW_BUFFER),
  .NUM_AXIW_BUFFER(NUM_AXIW_BUFFER),
  .NUM_AXIR_BUFFER(NUM_AXIR_BUFFER),
  .NUM_AXIB_BUFFER(NUM_AXIB_BUFFER)
)
i_munoc_instance_0
(
	.clk(clk),
	.rstnn(rstnn),

	.comm_disable(comm_disable),

	.sfni_link(sfni_link),
	.sfni_ready(sfni_ready),
	.sbni_link(sbni_link),
	.sbni_ready(sbni_ready),

	.rx4awid(rx4lawid),
	.rx4awaddr(rx4lawaddr),
	.rx4awlen(rx4lawlen),
	.rx4awsize(rx4lawsize),
	.rx4awburst(rx4lawburst),
	.rx4awvalid(rx4lawvalid),
	.rx4awready(rx4lawready),

	.rx4wdata(rx4lwdata),
	.rx4wstrb(rx4lwstrb),
	.rx4wlast(rx4lwlast),
	.rx4wvalid(rx4lwvalid),
	.rx4wready(rx4lwready), 

	.rx4bid(munoc_signal_18),
	.rx4bresp(rx4lbresp),
	.rx4bvalid(rx4lbvalid),
	.rx4bready(rx4lbready),

	.rx4arid(rx4larid),
	.rx4araddr(rx4laraddr),
	.rx4arlen(rx4larlen),
	.rx4arsize(rx4larsize),
	.rx4arburst(rx4larburst),
	.rx4arvalid(rx4larvalid),
	.rx4arready(rx4larready),

	.rx4rid(munoc_signal_04),
	.rx4rdata(rx4lrdata),
	.rx4rresp(rx4lrresp),
	.rx4rlast(munoc_signal_09),
	.rx4rvalid(rx4lrvalid),
	.rx4rready(rx4lrready),

	.local_spaddr(munoc_signal_17),
	.local_spwrite(munoc_signal_15),
	.local_spsel(munoc_signal_19),
	.local_spenable(munoc_signal_07),
	.local_spwdata(munoc_signal_03),
	.local_sprdata(local_sprdata),
	.local_spready(local_spready),
	.local_spslverr(local_spslverr),

	.local_allows_holds(munoc_signal_20),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

endmodule
