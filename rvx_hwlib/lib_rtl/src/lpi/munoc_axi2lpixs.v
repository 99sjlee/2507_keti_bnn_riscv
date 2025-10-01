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
// 2025-07-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"



module MUNOC_AXI2LPIXS
(
	clk,
	rstnn,
  clear,
  enable,

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

  slqdready,
  slqvalid,
  slqhint,
  slqlast,
  slqafy,
  slqdata,

  slydready,
  slyvalid,
  slyhint,
  slylast,
  slydata
);



parameter BW_AXI_ADDR = 32;
parameter BW_AXI_DATA = 32;
parameter BW_AXI_TID = 4;
parameter MEMORY_OPERATION_TYPE = 3;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = BW_AXI_ADDR;
localparam  BW_LPIXS_DATA = BW_AXI_DATA;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXS_BURDEN(BW_AXI_TID);

`include "lpixs_lpara.vb"

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

input wire [BW_AXI_TID-1:0] rxarid;
input wire [BW_AXI_ADDR-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_TID-1:0] rxrid;
output wire [BW_AXI_DATA-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

input wire [BW_AXI_TID-1:0] rxawid;
input wire [BW_AXI_ADDR-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_TID-1:0] rxwid;
input wire [BW_AXI_DATA-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [2-1:0] slqdready;
output wire slqvalid;
output wire slqhint;
output wire slqlast;
output wire slqafy;
output wire [BW_LPI_QDATA-1:0] slqdata;

output wire [2-1:0] slydready;
input wire slyvalid;
input wire slyhint;
input wire slylast;
input wire [BW_LPI_YDATA-1:0] slydata;

`include "lpixm_function.vb"

localparam  RVX_LPARA_2 = BW_AXI2LPIXM_BURDEN(BW_AXI_TID);
localparam  RVX_LPARA_4 = BW_LPIXM_QPARCEL(BW_AXI_ADDR,BW_AXI_DATA);
localparam  RVX_LPARA_1 = BW_LPIXM_YPARCEL(BW_AXI_DATA);
localparam  RVX_LPARA_0 = BW_LPI_DATA(RVX_LPARA_2,RVX_LPARA_4);
localparam  RVX_LPARA_3 = BW_LPI_DATA(RVX_LPARA_2,RVX_LPARA_1);

wire [2-1:0] rvx_signal_05;
wire rvx_signal_03;
wire rvx_signal_09;
wire rvx_signal_00;
wire rvx_signal_02;
wire [RVX_LPARA_0-1:0] rvx_signal_01;

wire [2-1:0] rvx_signal_04;
wire rvx_signal_06;
wire rvx_signal_08;
wire rvx_signal_07;
wire [RVX_LPARA_3-1:0] rvx_signal_10;

RVX_MODULE_024
#(
  .RVX_GPARA_2(BW_AXI_ADDR),
  .RVX_GPARA_0(BW_AXI_DATA),
  .RVX_GPARA_1(BW_AXI_TID),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE)
)
i_rvx_instance_0
(
	.rvx_port_29(clk),
	.rvx_port_43(rstnn),
  .rvx_port_00(clear),
  .rvx_port_21(enable),

  .rvx_port_30(rxarid),
	.rvx_port_14(rxaraddr),
	.rvx_port_35(rxarlen),
	.rvx_port_33(rxarsize),
	.rvx_port_34(rxarburst),
	.rvx_port_40(rxarvalid),
	.rvx_port_19(rxarready),

	.rvx_port_24(rxrid),
	.rvx_port_02(rxrdata),
	.rvx_port_32(rxrresp),
	.rvx_port_08(rxrlast),
	.rvx_port_26(rxrvalid),
	.rvx_port_11(rxrready),

	.rvx_port_12(rxawid),
  .rvx_port_07(rxawaddr),
  .rvx_port_13(rxawlen),
  .rvx_port_01(rxawsize),
  .rvx_port_38(rxawburst),
  .rvx_port_10(rxawvalid),
  .rvx_port_20(rxawready),

  .rvx_port_04(rxwid),
  .rvx_port_18(rxwdata),
  .rvx_port_09(rxwstrb),
  .rvx_port_42(rxwlast),
  .rvx_port_16(rxwvalid),
  .rvx_port_37(rxwready),

  .rvx_port_28(rxbid),
  .rvx_port_27(rxbresp),
  .rvx_port_39(rxbvalid),
  .rvx_port_31(rxbready),

  .rvx_port_36(rvx_signal_05),
  .rvx_port_41(rvx_signal_03),
  .rvx_port_23(rvx_signal_09),
  .rvx_port_44(rvx_signal_00),
  .rvx_port_25(rvx_signal_02),
  .rvx_port_05(rvx_signal_01),

  .rvx_port_22(rvx_signal_04),
  .rvx_port_03(rvx_signal_06),
  .rvx_port_06(rvx_signal_08),
  .rvx_port_15(rvx_signal_07),
  .rvx_port_17(rvx_signal_10)
);

RVX_MODULE_083
#(
  .RVX_GPARA_1(BW_AXI_ADDR),
  .RVX_GPARA_0(BW_AXI_DATA),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .BW_LPI_BURDEN(RVX_LPARA_2)
)
i_rvx_instance_1
(
	.rvx_port_14(clk),
	.rvx_port_25(rstnn),
  .rvx_port_06(clear),
  .rvx_port_15(enable),

  .rvx_port_10(rvx_signal_05),
  .rvx_port_11(rvx_signal_03),
  .rvx_port_01(rvx_signal_09),
  .rvx_port_09(rvx_signal_00),
  .rvx_port_00(rvx_signal_02),
  .rvx_port_04(rvx_signal_01),

  .rvx_port_20(rvx_signal_04),
  .rvx_port_18(rvx_signal_06),
  .rvx_port_05(rvx_signal_08),
  .rvx_port_23(rvx_signal_07),
  .rvx_port_07(rvx_signal_10),

  .rvx_port_02(slqdready),
  .rvx_port_21(slqvalid),
  .rvx_port_08(slqhint),
  .rvx_port_24(slqlast),
  .rvx_port_16(slqafy),
  .rvx_port_12(slqdata),

  .rvx_port_17(slydready),
  .rvx_port_13(slyvalid),
  .rvx_port_19(slyhint),
  .rvx_port_03(slylast),
  .rvx_port_22(slydata)
);

endmodule
