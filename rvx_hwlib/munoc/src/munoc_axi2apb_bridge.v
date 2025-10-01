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
`include "ervp_axi_define.vh"



module MUNOC_AXI2APB_BRIDGE (
	clk,
	rstnn,

	rxawid,
	rxawaddr,
	rxawlen,
	rxawsize,
	rxawburst,
	rxawvalid,
	rxawready,

	rxwid,
	rxwdata,
	rxwstrb,
	rxwlast,
	rxwvalid,
	rxwready,

	rxbid,
	rxbresp,
	rxbvalid,
	rxbready,

	rxarid,
	rxaraddr,
	rxarlen,
	rxarsize,
	rxarburst,
	rxarvalid,
	rxarready,

	rxrid,
	rxrdata,
	rxrresp,
	rxrlast,
	rxrvalid,
	rxrready,

	spaddr,
	spwrite,
	spsel,
	spenable,
	spwdata,
	sptid,
	sprdata,
	spready,
	spslverr,
	spwstrb
);



parameter BW_AXI_TID = 4;
parameter BW_PLATFORM_ADDR = 32;
parameter BW_NODE_DATA = 32;
parameter CHECK_WID = 0;

input wire clk, rstnn;

input wire [BW_AXI_TID-1:0] rxawid;
input wire [BW_PLATFORM_ADDR-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_TID-1:0] rxwid;
input wire [BW_NODE_DATA-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [BW_AXI_TID-1:0] rxarid;
input wire [BW_PLATFORM_ADDR-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_TID-1:0] rxrid;
output wire [BW_NODE_DATA-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

output wire [BW_PLATFORM_ADDR-1:0] spaddr;
output wire spwrite;
output wire spsel;
output wire spenable;
output wire [BW_NODE_DATA-1:0] spwdata;
output wire [BW_AXI_TID-1:0] sptid;
input wire [BW_NODE_DATA-1:0] sprdata;
input wire spready;
input wire spslverr;
output wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] spwstrb;

wire munoc_signal_33;
wire munoc_signal_32;
wire [`BW_ARCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_20;
wire munoc_signal_35;
wire munoc_signal_26;
wire [`BW_ARCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_11;

wire [BW_AXI_TID-1:0] munoc_signal_02;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_12;
wire [`BW_AXI_ALEN-1:0] munoc_signal_17;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_24;
wire [`BW_AXI_ABURST-1:0] munoc_signal_28;
wire munoc_signal_30;
wire munoc_signal_04;

wire munoc_signal_16;
wire munoc_signal_18;
wire [`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_15;
wire munoc_signal_07;
wire munoc_signal_27;
wire [`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_13;

wire [BW_AXI_TID-1:0] munoc_signal_34;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_23;
wire [`BW_AXI_ALEN-1:0] munoc_signal_21;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_10;
wire [`BW_AXI_ABURST-1:0] munoc_signal_25;
wire munoc_signal_03;
wire munoc_signal_14;

wire munoc_signal_01;
wire munoc_signal_22;
wire [`BW_BCHANNEL(BW_NODE_DATA)-1:0] munoc_signal_09;
wire munoc_signal_05;
wire munoc_signal_08;
wire [`BW_BCHANNEL(BW_NODE_DATA)-1:0] munoc_signal_06;

wire [BW_AXI_TID-1:0] munoc_signal_31;
wire [`BW_AXI_BRESP-1:0] munoc_signal_29;
wire munoc_signal_19;
wire munoc_signal_00;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_ARCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)),
	.DEPTH(2)
)
i_munoc_instance_3
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_33),
	.wrequest(munoc_signal_32),
	.wdata(munoc_signal_20),
	.rready(munoc_signal_35),
	.rrequest(munoc_signal_26),
	.rdata(munoc_signal_11),
	.wfull(),
	.rempty()
);

assign rxarready = munoc_signal_33;
assign munoc_signal_32 = rxarvalid;
assign munoc_signal_20 = {rxarid,rxaraddr,rxarlen,rxarsize,rxarburst};
assign munoc_signal_30 = munoc_signal_35;
assign munoc_signal_26 = munoc_signal_04;
assign {munoc_signal_02,munoc_signal_12,munoc_signal_17,munoc_signal_24,munoc_signal_28} = munoc_signal_11;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)),
	.DEPTH(2)
)
i_munoc_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_16),
	.wrequest(munoc_signal_18),
	.wdata(munoc_signal_15),
	.rready(munoc_signal_07),
	.rrequest(munoc_signal_27),
	.rdata(munoc_signal_13),
	.wfull(),
	.rempty()
);

assign rxawready = munoc_signal_16;
assign munoc_signal_18 = rxawvalid;
assign munoc_signal_15 = {rxawid,rxawaddr,rxawlen,rxawsize,rxawburst};
assign munoc_signal_03 = munoc_signal_07;
assign munoc_signal_27 = munoc_signal_14;
assign {munoc_signal_34,munoc_signal_23,munoc_signal_21,munoc_signal_10,munoc_signal_25} = munoc_signal_13;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_BCHANNEL(BW_NODE_DATA)),
	.DEPTH(2)
)
i_munoc_instance_2
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_01),
	.wrequest(munoc_signal_22),
	.wdata(munoc_signal_06),
	.rready(munoc_signal_05),
	.rrequest(munoc_signal_08),
	.rdata(munoc_signal_09),
	.wfull(),
	.rempty()
);

assign munoc_signal_00 = munoc_signal_01;
assign munoc_signal_22 = munoc_signal_19;
assign munoc_signal_06 = {munoc_signal_31,munoc_signal_29};
assign rxbvalid = munoc_signal_05;
assign munoc_signal_08 = rxbready;
assign {rxbid,rxbresp} = munoc_signal_09;

MUNOC_AXI2APB_CONVERTER_
#(
	.BW_AXI_TID(BW_AXI_TID),
	.BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
	.BW_NODE_DATA(BW_NODE_DATA),
	.CHECK_WID(CHECK_WID)
)
i_munoc_instance_1
(
	.clk(clk),
	.rstnn(rstnn),

	.rxawid(munoc_signal_34),
	.rxawaddr(munoc_signal_23),
	.rxawlen(munoc_signal_21),
	.rxawsize(munoc_signal_10),
	.rxawburst(munoc_signal_25),
	.rxawvalid(munoc_signal_03),
	.rxawready(munoc_signal_14),

	.rxwid(rxwid),
	.rxwdata(rxwdata),
	.rxwstrb(rxwstrb),
	.rxwlast(rxwlast),
	.rxwvalid(rxwvalid),
	.rxwready(rxwready),

	.rxbid(munoc_signal_31),
	.rxbresp(munoc_signal_29),
	.rxbvalid(munoc_signal_19),
	.rxbready(munoc_signal_00),

	.rxarid(munoc_signal_02),
	.rxaraddr(munoc_signal_12),
	.rxarlen(munoc_signal_17),
	.rxarsize(munoc_signal_24),
	.rxarburst(munoc_signal_28),
	.rxarvalid(munoc_signal_30),
	.rxarready(munoc_signal_04),

	.rxrid(rxrid),
	.rxrdata(rxrdata),
	.rxrresp(rxrresp),
	.rxrlast(rxrlast),
	.rxrvalid(rxrvalid),
	.rxrready(rxrready),

	.spaddr(spaddr),
	.spwrite(spwrite),
	.spsel(spsel),
	.spenable(spenable),
	.spwdata(spwdata),
	.sptid(sptid),
	.sprdata(sprdata),
	.spready(spready),
	.spslverr(spslverr),
	.spwstrb(spwstrb)
);

endmodule
