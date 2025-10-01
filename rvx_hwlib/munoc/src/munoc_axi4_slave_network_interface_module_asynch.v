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



module MUNOC_AXI4_SLAVE_NETWORK_INTERFACE_MODULE_ASYNCH
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

	sx4awid,
	sx4awaddr,
	sx4awlen,
	sx4awsize,
	sx4awburst,
	sx4awvalid,
	sx4awready,

	sx4wdata,
	sx4wstrb,
	sx4wlast,
	sx4wvalid,
	sx4wready, 

	sx4bid,
	sx4bresp,
	sx4bvalid,
	sx4bready,

	sx4arid,
	sx4araddr,
	sx4arlen,
	sx4arsize,
	sx4arburst,
	sx4arvalid,
	sx4arready,

	sx4rid,
	sx4rdata,
	sx4rresp,
	sx4rlast,
	sx4rvalid,
	sx4rready,

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

output wire [BW_AXI_SLAVE_TID-1:0] sx4awid;
output wire [BW_PLATFORM_ADDR-1:0] sx4awaddr;
output wire [`BW_AXI_ALEN-1:0] sx4awlen;
output wire [`BW_AXI_ASIZE-1:0] sx4awsize;
output wire [`BW_AXI_ABURST-1:0] sx4awburst;
output wire sx4awvalid;
input wire sx4awready;

output wire [BW_NODE_DATA-1:0] sx4wdata;
output wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] sx4wstrb;
output wire sx4wlast;
output wire sx4wvalid;
input wire sx4wready;

input wire [BW_AXI_SLAVE_TID-1:0] sx4bid;
input wire [`BW_AXI_BRESP-1:0] sx4bresp;
input wire sx4bvalid;
output wire sx4bready;

output wire [BW_AXI_SLAVE_TID-1:0] sx4arid;
output wire [BW_PLATFORM_ADDR-1:0] sx4araddr;
output wire [`BW_AXI_ALEN-1:0] sx4arlen;
output wire [`BW_AXI_ASIZE-1:0] sx4arsize;
output wire [`BW_AXI_ABURST-1:0] sx4arburst;
output wire sx4arvalid;
input wire sx4arready;

input wire [BW_AXI_SLAVE_TID-1:0] sx4rid;
input wire [BW_NODE_DATA-1:0] sx4rdata;
input wire [`BW_AXI_RRESP-1:0] sx4rresp;
input wire sx4rlast;
input wire sx4rvalid;
output wire sx4rready;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [BW_AXI_SLAVE_TID-1:0] sx4wid = -1;

MUNOC_AXI_SLAVE_NETWORK_INTERFACE_MODULE_ASYNCH
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

	.sxawid(sx4awid),
	.sxawaddr(sx4awaddr),
	.sxawlen(sx4awlen),
	.sxawsize(sx4awsize),
	.sxawburst(sx4awburst),
	.sxawvalid(sx4awvalid),
	.sxawready(sx4awready),

	.sxwid(sx4wid),
	.sxwdata(sx4wdata),
	.sxwstrb(sx4wstrb),
	.sxwlast(sx4wlast),
	.sxwvalid(sx4wvalid),
	.sxwready(sx4wready), 

	.sxbid(sx4bid),
	.sxbresp(sx4bresp),
	.sxbvalid(sx4bvalid),
	.sxbready(sx4bready),

	.sxarid(sx4arid),
	.sxaraddr(sx4araddr),
	.sxarlen(sx4arlen),
	.sxarsize(sx4arsize),
	.sxarburst(sx4arburst),
	.sxarvalid(sx4arvalid),
	.sxarready(sx4arready),

	.sxrid(sx4rid),
	.sxrdata(sx4rdata),
	.sxrresp(sx4rresp),
	.sxrlast(sx4rlast),
	.sxrvalid(sx4rvalid),
	.sxrready(sx4rready),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

endmodule
