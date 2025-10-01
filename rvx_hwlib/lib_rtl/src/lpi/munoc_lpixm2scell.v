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



module MUNOC_LPIXM2SCELL
(
	clk,
	rstnn,
  clear,
  enable,

  rlqdready,
  rlqvalid,
  rlqhint,
  rlqlast,
  rlqafy,
  rlqdata,

  rlydready,
  rlyvalid,
  rlyhint,
  rlylast,
  rlydata,

  sscell_select_list,
	sscell_index_list,
	sscell_enable_list,
	sscell_wenable_list,
	sscell_wenable_byte_list,
	sscell_wenable_bit_list,
	sscell_wdata_list,
	sscell_renable_list,
	sscell_rdata_list,
  sscell_stall_list
);



parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_LPI_BURDEN = 1;
parameter MEMORY_OPERATION_TYPE = 3;
parameter BASEADDR = 0;

parameter BW_CELL_INDEX = 32;
parameter CELL_WIDTH = BW_DATA;
parameter NUM_CELL = 1;

localparam  RVX_LPARA_0 = `NUM_BYTE(CELL_WIDTH);

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = BW_ADDR;
localparam  BW_LPIXM_DATA = BW_DATA;

`include "lpixm_lpara.vb"

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

output wire [2-1:0] rlqdready;
input wire rlqvalid;
input wire rlqhint;
input wire rlqlast;
input wire rlqafy;
input wire [BW_LPI_QDATA-1:0] rlqdata;

input wire [2-1:0] rlydready;
output wire rlyvalid;
output wire rlyhint;
output wire rlylast;
output wire [BW_LPI_YDATA-1:0] rlydata;

output wire [NUM_CELL-1:0] sscell_select_list;
output wire [BW_CELL_INDEX*NUM_CELL-1:0] sscell_index_list;
output wire [NUM_CELL-1:0] sscell_enable_list;
output wire [NUM_CELL-1:0] sscell_wenable_list;
output wire [RVX_LPARA_0*NUM_CELL-1:0] sscell_wenable_byte_list;
output wire [CELL_WIDTH*NUM_CELL-1:0] sscell_wenable_bit_list;
output wire [CELL_WIDTH*NUM_CELL-1:0] sscell_wdata_list;
output wire [NUM_CELL-1:0] sscell_renable_list;
input wire [CELL_WIDTH*NUM_CELL-1:0] sscell_rdata_list;
input wire [NUM_CELL-1:0] sscell_stall_list;

wire [2-1:0] rvx_signal_09;
wire rvx_signal_03;
wire rvx_signal_07;
wire rvx_signal_00;
wire rvx_signal_02;
wire [BW_LPI_QDATA-1:0] rvx_signal_10;

wire [2-1:0] rvx_signal_01;
wire rvx_signal_06;
wire rvx_signal_05;
wire rvx_signal_08;
wire [BW_LPI_YDATA-1:0] rvx_signal_04;

RVX_MODULE_083
#(
  .RVX_GPARA_1(BW_ADDR),
  .RVX_GPARA_0(BW_DATA),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE)
)
i_rvx_instance_0
(
	.rvx_port_14(clk),
	.rvx_port_25(rstnn),
  .rvx_port_06(clear),
  .rvx_port_15(enable),

  .rvx_port_10(rlqdready),
  .rvx_port_11(rlqvalid),
  .rvx_port_01(rlqhint),
  .rvx_port_09(rlqlast),
  .rvx_port_00(rlqafy),
  .rvx_port_04(rlqdata),

  .rvx_port_20(rlydready),
  .rvx_port_18(rlyvalid),
  .rvx_port_05(rlyhint),
  .rvx_port_23(rlylast),
  .rvx_port_07(rlydata),

  .rvx_port_02(rvx_signal_09),
  .rvx_port_21(rvx_signal_03),
  .rvx_port_08(rvx_signal_07),
  .rvx_port_24(rvx_signal_00),
  .rvx_port_16(rvx_signal_02),
  .rvx_port_12(rvx_signal_10),

  .rvx_port_17(rvx_signal_01),
  .rvx_port_13(rvx_signal_06),
  .rvx_port_19(rvx_signal_05),
  .rvx_port_03(rvx_signal_08),
  .rvx_port_22(rvx_signal_04)
);

RVX_MODULE_101
#(
  .RVX_GPARA_3(BW_ADDR),
  .RVX_GPARA_5(BW_DATA),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .RVX_GPARA_1(BASEADDR),
  .RVX_GPARA_4(BW_CELL_INDEX),
  .RVX_GPARA_2(CELL_WIDTH),
  .RVX_GPARA_0(NUM_CELL)
)
i_rvx_instance_1
(
	.rvx_port_08(clk),
	.rvx_port_21(rstnn),
  .rvx_port_04(clear),
  .rvx_port_14(enable),

  .rvx_port_12(rvx_signal_09),
  .rvx_port_01(rvx_signal_03),
  .rvx_port_16(rvx_signal_07),
  .rvx_port_09(rvx_signal_00),
  .rvx_port_24(rvx_signal_02),
  .rvx_port_02(rvx_signal_10),

  .rvx_port_19(rvx_signal_01),
  .rvx_port_07(rvx_signal_06),
  .rvx_port_05(rvx_signal_05),
  .rvx_port_13(rvx_signal_08),
  .rvx_port_00(rvx_signal_04),

  .rvx_port_03(sscell_select_list),
	.rvx_port_10(sscell_index_list),
	.rvx_port_18(sscell_enable_list),
	.rvx_port_17(sscell_wenable_list),
	.rvx_port_11(sscell_wenable_byte_list),
	.rvx_port_15(sscell_wenable_bit_list),
	.rvx_port_23(sscell_wdata_list),
	.rvx_port_22(sscell_renable_list),
	.rvx_port_06(sscell_rdata_list),
  .rvx_port_20(sscell_stall_list)
);

endmodule
