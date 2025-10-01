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
`include "ervp_endian.vh"
`include "ervp_axi_define.vh"

`include "rvx_include_00.vh"



module ERVP_EXTINPUT_BACKEND_DMA
(
  clk_system,
  tick_1us,

  clk,
  rstnn,

  control_rmx_core_config,
  control_rmx_core_status,
  control_rmx_clear_request,
  control_rmx_clear_finish,
  control_rmx_log_fifo_wready,
  control_rmx_log_fifo_wrequest,
  control_rmx_log_fifo_wdata,
  control_rmx_inst_fifo_rready,
  control_rmx_inst_fifo_rdata,
  control_rmx_inst_fifo_rrequest,
  control_rmx_operation_finish,
  control_rmx_input_fifo_rready,
  control_rmx_input_fifo_rdata,
  control_rmx_input_fifo_rrequest,
  control_rmx_output_fifo_wready,
  control_rmx_output_fifo_wrequest,
  control_rmx_output_fifo_wdata,

  dma_slxqdready,
  dma_slxqvalid,
  dma_slxqlast,
  dma_slxqwrite,
  dma_slxqlen,
  dma_slxqsize,
  dma_slxqburst,
  dma_slxqwstrb,
  dma_slxqwdata,
  dma_slxqaddr,
  dma_slxqburden,
  dma_slxydready,
  dma_slxyvalid,
  dma_slxylast,
  dma_slxywreply,
  dma_slxyresp,
  dma_slxyrdata,
  dma_slxyburden,

  extinput_config,
  extinput_status,
  extinput_valid,
  extinput_data,
  extinput_ready
);



parameter BW_ADDR = 32;
parameter BW_AXI_DATA = 32;
parameter BW_CONFIG = 1;
parameter BW_STATUS = 1;
parameter BW_EXTINPUT = 32;
parameter DMA_FIFO_DEPTH = 32;

localparam  RVX_LPARA_05 = 0;
localparam  RVX_LPARA_04 = 0;
localparam  RVX_LPARA_07 = BW_CONFIG+RVX_LPARA_05;
localparam  RVX_LPARA_01 = BW_STATUS+RVX_LPARA_04;
localparam  RVX_LPARA_06 = 1;
localparam  RVX_LPARA_02 = `RVX_GDEF_257;
localparam  RVX_LPARA_09 = 1;
localparam  RVX_LPARA_08 = BW_EXTINPUT;

input wire clk_system;
input wire tick_1us;

input wire clk;
input wire rstnn;

input wire [(RVX_LPARA_07)-1:0] control_rmx_core_config;
output wire [(RVX_LPARA_01)-1:0] control_rmx_core_status;
input wire control_rmx_clear_request;
output wire control_rmx_clear_finish;
input wire control_rmx_log_fifo_wready;
output wire control_rmx_log_fifo_wrequest;
output wire [(RVX_LPARA_06)-1:0] control_rmx_log_fifo_wdata;
input wire control_rmx_inst_fifo_rready;
input wire [(RVX_LPARA_02)-1:0] control_rmx_inst_fifo_rdata;
output wire control_rmx_inst_fifo_rrequest;
output wire control_rmx_operation_finish;
input wire control_rmx_input_fifo_rready;
input wire [(RVX_LPARA_09)-1:0] control_rmx_input_fifo_rdata;
output wire control_rmx_input_fifo_rrequest;
input wire control_rmx_output_fifo_wready;
output wire control_rmx_output_fifo_wrequest;
output wire [(RVX_LPARA_08)-1:0] control_rmx_output_fifo_wdata;

localparam  RVX_LPARA_00 = BW_ADDR;
localparam  RVX_LPARA_03 = 1;

input wire [(2)-1:0] dma_slxqdready;
output wire dma_slxqvalid;
output wire dma_slxqlast;
output wire dma_slxqwrite;
output wire [`BW_AXI_ALEN-1:0] dma_slxqlen;
output wire [`BW_AXI_ASIZE-1:0] dma_slxqsize;
output wire [`BW_AXI_ABURST-1:0] dma_slxqburst;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] dma_slxqwstrb;
output wire [BW_AXI_DATA-1:0] dma_slxqwdata;
output wire [RVX_LPARA_00-1:0] dma_slxqaddr;
output wire [RVX_LPARA_03-1:0] dma_slxqburden;
output wire [(2)-1:0] dma_slxydready;
input wire dma_slxyvalid;
input wire dma_slxylast;
input wire dma_slxywreply;
input wire [`BW_AXI_RESP-1:0] dma_slxyresp;
input wire [BW_AXI_DATA-1:0] dma_slxyrdata;
input wire [RVX_LPARA_03-1:0] dma_slxyburden;

output wire [BW_CONFIG-1:0] extinput_config;
input wire [BW_STATUS-1:0] extinput_status;
input wire extinput_valid;
input wire [BW_EXTINPUT-1:0] extinput_data;
output wire extinput_ready;

wire rvx_signal_4;
wire [BW_EXTINPUT-1:0] rvx_signal_5;
wire rvx_signal_3;

wire rvx_signal_1;
wire [RVX_LPARA_02-1:0] rvx_signal_6;
wire rvx_signal_0;
wire rvx_signal_2;

RVX_MODULE_093
#(
  .RVX_GPARA_2(BW_ADDR),
  .RVX_GPARA_3(BW_CONFIG),
  .RVX_GPARA_1(BW_STATUS),
  .RVX_GPARA_0(BW_EXTINPUT)
)
i_rvx_instance_0
(
  .rvx_port_26(clk_system),
  .rvx_port_05(tick_1us),

  .rvx_port_18(clk),
  .rvx_port_23(rstnn),

  .rvx_port_09(control_rmx_core_config),
  .rvx_port_08(control_rmx_core_status),
  .rvx_port_15(control_rmx_clear_request),
  .rvx_port_04(control_rmx_log_fifo_wready),
  .rvx_port_19(control_rmx_log_fifo_wrequest),
  .rvx_port_16(control_rmx_log_fifo_wdata),
  .rvx_port_17(control_rmx_inst_fifo_rready),
  .rvx_port_22(control_rmx_inst_fifo_rdata),
  .rvx_port_14(control_rmx_inst_fifo_rrequest),
  .rvx_port_11(control_rmx_input_fifo_rready),
  .rvx_port_01(control_rmx_input_fifo_rdata),
  .rvx_port_07(control_rmx_input_fifo_rrequest),
  .rvx_port_21(control_rmx_output_fifo_wready),
  .rvx_port_00(control_rmx_output_fifo_wrequest),
  .rvx_port_13(control_rmx_output_fifo_wdata),

  .rvx_port_20(extinput_config),
  .rvx_port_12(extinput_status),
  .rvx_port_27(extinput_valid),
  .rvx_port_25(extinput_data),
  .rvx_port_06(extinput_ready),

  .rvx_port_24(rvx_signal_4),
  .rvx_port_28(rvx_signal_5),
  .rvx_port_02(rvx_signal_3),

  .rvx_port_30(rvx_signal_1),
  .rvx_port_10(rvx_signal_6),
  .rvx_port_03(rvx_signal_0),
  .rvx_port_29(rvx_signal_2)
);

RVX_MODULE_121
#(
  .RVX_GPARA_2(BW_ADDR),
  .RVX_GPARA_0(BW_AXI_DATA),
  .RVX_GPARA_1(BW_EXTINPUT),
  .RVX_GPARA_3(DMA_FIFO_DEPTH)
)
i_rvx_instance_1
(
  .rvx_port_01(clk),
  .rvx_port_23(rstnn),

  .rvx_port_27(rvx_signal_4),
  .rvx_port_07(rvx_signal_5),
  .rvx_port_11(rvx_signal_3),

  .rvx_port_16(rvx_signal_1),
  .rvx_port_14(rvx_signal_6),
  .rvx_port_03(rvx_signal_0),
  .rvx_port_15(rvx_signal_2),

  .rvx_port_06(dma_slxqdready),
  .rvx_port_09(dma_slxqvalid),
  .rvx_port_18(dma_slxqlast),
  .rvx_port_02(dma_slxqwrite),
  .rvx_port_26(dma_slxqlen),
  .rvx_port_12(dma_slxqsize),
  .rvx_port_17(dma_slxqburst),
  .rvx_port_13(dma_slxqwstrb),
  .rvx_port_00(dma_slxqwdata),
  .rvx_port_21(dma_slxqaddr),
  .rvx_port_28(dma_slxqburden),
  .rvx_port_08(dma_slxydready),
  .rvx_port_10(dma_slxyvalid),
  .rvx_port_25(dma_slxylast),
  .rvx_port_19(dma_slxywreply),
  .rvx_port_05(dma_slxyresp),
  .rvx_port_24(dma_slxyrdata),
  .rvx_port_22(dma_slxyburden),

  .rvx_port_04(control_rmx_clear_finish),
  .rvx_port_20(control_rmx_operation_finish)
);

endmodule
