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



module MUNOC_AXI4_MASTER_NETWORK_INTERFACE_MODULE_ASYNCH
(
	clk_master,
	rstnn_master,
	clk_network,
	rstnn_network,

	comm_disable,
	
	sfni_link,
	sfni_ready,
	sbni_link,
	sbni_ready,

	rx4awid,
	rx4awaddr,
	rx4awlen,
	rx4awsize,
	rx4awburst,
	rx4awvalid,
	rx4awready,

	rx4wdata,
	rx4wstrb,
	rx4wlast,
	rx4wvalid,
	rx4wready, 

	rx4bid,
	rx4bresp,
	rx4bvalid,
	rx4bready,

	rx4arid,
	rx4araddr,
	rx4arlen,
	rx4arsize,
	rx4arburst,
	rx4arvalid,
	rx4arready,

	rx4rid,
	rx4rdata,
	rx4rresp,
	rx4rlast,
	rx4rvalid,
	rx4rready,

	local_spaddr,
	local_spwrite,
	local_spsel,
	local_spenable,
	local_spwdata,
	local_sprdata,
	local_spready,
	local_spslverr,

	local_allows_holds,

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
parameter BW_AXI_MASTER_TID = `DEFAULT_BW_AXI_TID;
parameter LOCAL_ENABLE = 0;
parameter LOCAL_UPPER_ADDR = 0;

parameter CHECK_WID = 0;
parameter TID_CONTROL_TYPE = `SINGLE_TARGET_SLAVE;

parameter NUM_AXIAR_BUFFER = 4;
parameter NUM_AXIAW_BUFFER = 2;
parameter NUM_AXIW_BUFFER = 4;
parameter NUM_AXIR_BUFFER = 4;
parameter NUM_AXIB_BUFFER = 2;

input wire clk_master, rstnn_master;
input wire clk_network, rstnn_network;

input wire comm_disable;

output wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] sfni_link;
input wire sfni_ready;
input wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] sbni_link;
output wire sbni_ready;

input wire [BW_AXI_MASTER_TID-1:0] rx4awid;
input wire [BW_PLATFORM_ADDR-1:0] rx4awaddr;
input wire [`BW_AXI_ALEN-1:0] rx4awlen;
input wire [`BW_AXI_ASIZE-1:0] rx4awsize;
input wire [`BW_AXI_ABURST-1:0] rx4awburst;
input wire rx4awvalid;
output wire rx4awready;

input wire [BW_NODE_DATA-1:0] rx4wdata;
input wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] rx4wstrb;
input wire rx4wlast;
input wire rx4wvalid;
output wire rx4wready;

output wire [BW_AXI_MASTER_TID-1:0] rx4bid;
output wire [`BW_AXI_BRESP-1:0] rx4bresp;
output wire rx4bvalid;
input wire rx4bready;

input wire [BW_AXI_MASTER_TID-1:0] rx4arid;
input wire [BW_PLATFORM_ADDR-1:0] rx4araddr;
input wire [`BW_AXI_ALEN-1:0] rx4arlen;
input wire [`BW_AXI_ASIZE-1:0] rx4arsize;
input wire [`BW_AXI_ABURST-1:0] rx4arburst;
input wire rx4arvalid;
output wire rx4arready;

output wire [BW_AXI_MASTER_TID-1:0] rx4rid;
output wire [BW_NODE_DATA-1:0] rx4rdata;
output wire [`BW_AXI_RRESP-1:0] rx4rresp;
output wire rx4rlast;
output wire rx4rvalid;
input wire rx4rready;

output wire [BW_PLATFORM_ADDR-1:0] local_spaddr;
output wire local_spwrite;
output wire local_spsel;
output wire local_spenable;
output wire [BW_NODE_DATA-1:0] local_spwdata;
input wire [BW_NODE_DATA-1:0] local_sprdata;
input wire local_spready;
input wire local_spslverr;

output wire local_allows_holds;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [BW_AXI_MASTER_TID-1:0] rx4wid = -1;

 MUNOC_AXI_MASTER_NETWORK_INTERFACE_MODULE_ASYNCH
 #(
  .NAME(NAME),
  .NODE_ID(NODE_ID),
  .BW_FNI_PHIT(BW_FNI_PHIT),
  .BW_BNI_PHIT(BW_BNI_PHIT),
  .BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
  .BW_NODE_DATA(BW_NODE_DATA),
  .BW_AXI_MASTER_TID(BW_AXI_MASTER_TID),
  .LOCAL_ENABLE(LOCAL_ENABLE),
  .LOCAL_UPPER_ADDR(LOCAL_UPPER_ADDR),
  .CHECK_WID(0),
  .TID_CONTROL_TYPE(TID_CONTROL_TYPE),
  .NUM_AXIAR_BUFFER(NUM_AXIAR_BUFFER),
  .NUM_AXIAW_BUFFER(NUM_AXIAW_BUFFER),
  .NUM_AXIW_BUFFER(NUM_AXIW_BUFFER),
  .NUM_AXIR_BUFFER(NUM_AXIR_BUFFER),
  .NUM_AXIB_BUFFER(NUM_AXIB_BUFFER)
)
i_munoc_instance_0
(
	.clk_master(clk_master),
	.rstnn_master(rstnn_master),
	.clk_network(clk_network),
	.rstnn_network(rstnn_network),

	.comm_disable(comm_disable),
	
	.sfni_link(sfni_link),
	.sfni_ready(sfni_ready),
	.sbni_link(sbni_link),
	.sbni_ready(sbni_ready),

	.rxawid(rx4awid),
	.rxawaddr(rx4awaddr),
	.rxawlen(rx4awlen),
	.rxawsize(rx4awsize),
	.rxawburst(rx4awburst),
	.rxawvalid(rx4awvalid),
	.rxawready(rx4awready),

	.rxwid(rx4wid),
	.rxwdata(rx4wdata),
	.rxwstrb(rx4wstrb),
	.rxwlast(rx4wlast),
	.rxwvalid(rx4wvalid),
	.rxwready(rx4wready), 

	.rxbid(rx4bid),
	.rxbresp(rx4bresp),
	.rxbvalid(rx4bvalid),
	.rxbready(rx4bready),

	.rxarid(rx4arid),
	.rxaraddr(rx4araddr),
	.rxarlen(rx4arlen),
	.rxarsize(rx4arsize),
	.rxarburst(rx4arburst),
	.rxarvalid(rx4arvalid),
	.rxarready(rx4arready),

	.rxrid(rx4rid),
	.rxrdata(rx4rdata),
	.rxrresp(rx4rresp),
	.rxrlast(rx4rlast),
	.rxrvalid(rx4rvalid),
	.rxrready(rx4rready),

	.local_spaddr(local_spaddr),
	.local_spwrite(local_spwrite),
	.local_spsel(local_spsel),
	.local_spenable(local_spenable),
	.local_spwdata(local_spwdata),
	.local_sprdata(local_sprdata),
	.local_spready(local_spready),
	.local_spslverr(local_spslverr),

	.local_allows_holds(local_allows_holds),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

endmodule
