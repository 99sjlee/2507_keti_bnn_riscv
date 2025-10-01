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



module MUNOC_AXI2APB_CONVERTER_
(
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



parameter BW_AXI_TID = 1;
parameter BW_PLATFORM_ADDR = 8;
parameter BW_NODE_DATA = 8;
parameter IGNORE_BYTE_INFO = 1;
parameter CHECK_WID = 0;

input wire clk, rstnn;

localparam  MUNOC_LPARA_2 = BW_PLATFORM_ADDR;
localparam  MUNOC_LPARA_0 = BW_NODE_DATA;

input wire [BW_AXI_TID-1:0] rxawid;
input wire [MUNOC_LPARA_2-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_TID-1:0] rxwid;
input wire [MUNOC_LPARA_0-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(MUNOC_LPARA_0)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [BW_AXI_TID-1:0] rxarid;
input wire [MUNOC_LPARA_2-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_TID-1:0] rxrid;
output wire [MUNOC_LPARA_0-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

localparam  MUNOC_LPARA_3 = MUNOC_LPARA_2;
localparam  MUNOC_LPARA_1 = MUNOC_LPARA_0;

output wire [MUNOC_LPARA_3-1:0] spaddr;
output wire spwrite;
output wire spsel;
output wire spenable;
output wire [MUNOC_LPARA_1-1:0] spwdata;
output wire [BW_AXI_TID-1:0] sptid;
input wire [MUNOC_LPARA_1-1:0] sprdata;
input wire spready;
input wire spslverr;
output wire [`BW_AXI_WSTRB(MUNOC_LPARA_1)-1:0] spwstrb;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = MUNOC_LPARA_2;
localparam  BW_LPIXS_DATA = MUNOC_LPARA_0;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXS_BURDEN(BW_AXI_TID);

`include "lpixs_lpara.vb"

wire [2-1:0] munoc_signal_08;
wire munoc_signal_02;
wire munoc_signal_01;
wire munoc_signal_07;
wire munoc_signal_05;
wire [BW_LPI_QDATA-1:0] munoc_signal_10;

wire [2-1:0] munoc_signal_03;
wire munoc_signal_04;
wire munoc_signal_09;
wire munoc_signal_00;
wire [BW_LPI_YDATA-1:0] munoc_signal_06;

MUNOC_AXI2LPIXS
#(
  .BW_AXI_ADDR(MUNOC_LPARA_2),
  .BW_AXI_DATA(MUNOC_LPARA_0),
  .BW_AXI_TID(BW_AXI_TID)
)
i_munoc_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
  .clear(1'b 0),
  .enable(1'b 1),

  .rxarid(rxarid),
	.rxaraddr(rxaraddr),
	.rxarlen(rxarlen),
	.rxarsize(rxarsize),
	.rxarburst(rxarburst),
	.rxarvalid(rxarvalid),
	.rxarready(rxarready),

	.rxrid(rxrid),
	.rxrdata(rxrdata),
	.rxrresp(rxrresp),
	.rxrlast(rxrlast),
	.rxrvalid(rxrvalid),
	.rxrready(rxrready),

	.rxawid(rxawid),
  .rxawaddr(rxawaddr),
  .rxawlen(rxawlen),
  .rxawsize(rxawsize),
  .rxawburst(rxawburst),
  .rxawvalid(rxawvalid),
  .rxawready(rxawready),

  .rxwid(rxwid),
  .rxwdata(rxwdata),
  .rxwstrb(rxwstrb),
  .rxwlast(rxwlast),
  .rxwvalid(rxwvalid),
  .rxwready(rxwready),

  .rxbid(rxbid),
  .rxbresp(rxbresp),
  .rxbvalid(rxbvalid),
  .rxbready(rxbready),

  .slqdready(munoc_signal_08),
  .slqvalid(munoc_signal_02),
  .slqhint(munoc_signal_01),
  .slqlast(munoc_signal_07),
  .slqafy(munoc_signal_05),
  .slqdata(munoc_signal_10),

  .slydready(munoc_signal_03),
  .slyvalid(munoc_signal_04),
  .slyhint(munoc_signal_09),
  .slylast(munoc_signal_00),
  .slydata(munoc_signal_06)
);

RVX_MODULE_016
#(
  .RVX_GPARA_1(BW_PLATFORM_ADDR),
  .RVX_GPARA_2(BW_NODE_DATA),
  .RVX_GPARA_0(BW_AXI_TID)
)
i_munoc_instance_0
(
	.rvx_port_17(clk),
	.rvx_port_23(rstnn),
  .rvx_port_08(1'b 0),
  .rvx_port_01(1'b 1),

  .rvx_port_11(munoc_signal_08),
  .rvx_port_18(munoc_signal_02),
  .rvx_port_06(munoc_signal_01),
  .rvx_port_20(munoc_signal_07),
  .rvx_port_00(munoc_signal_05),
  .rvx_port_13(munoc_signal_10),

  .rvx_port_02(munoc_signal_03),
  .rvx_port_05(munoc_signal_04),
  .rvx_port_15(munoc_signal_09),
  .rvx_port_22(munoc_signal_00),
  .rvx_port_07(munoc_signal_06),

  .rvx_port_03(spsel),
	.rvx_port_12(spenable),
  .rvx_port_19(spaddr),
	.rvx_port_16(spwrite),
	.rvx_port_10(spwdata),
	.rvx_port_04(sprdata),
	.rvx_port_24(spready),
	.rvx_port_09(spslverr),
  .rvx_port_14(sptid),
	.rvx_port_21(spwstrb)
);

endmodule
