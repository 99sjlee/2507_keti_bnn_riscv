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



module ERVP_EXTINPUT_BACKEND
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

localparam  RVX_LPARA_07 = 0;
localparam  RVX_LPARA_09 = 0;
localparam  RVX_LPARA_03 = BW_CONFIG+RVX_LPARA_07;
localparam  RVX_LPARA_08 = BW_STATUS+RVX_LPARA_09;
localparam  RVX_LPARA_00 = 1;
localparam  RVX_LPARA_06 = `RVX_GDEF_257;
localparam  RVX_LPARA_02 = 1;
localparam  RVX_LPARA_01 = BW_EXTINPUT;

input wire clk_system;
input wire tick_1us;

input wire clk;
input wire rstnn;

input wire [(RVX_LPARA_03)-1:0] control_rmx_core_config;
output wire [(RVX_LPARA_08)-1:0] control_rmx_core_status;
input wire control_rmx_clear_request;
output wire control_rmx_clear_finish;
input wire control_rmx_log_fifo_wready;
output wire control_rmx_log_fifo_wrequest;
output wire [(RVX_LPARA_00)-1:0] control_rmx_log_fifo_wdata;
input wire control_rmx_inst_fifo_rready;
input wire [(RVX_LPARA_06)-1:0] control_rmx_inst_fifo_rdata;
output wire control_rmx_inst_fifo_rrequest;
output wire control_rmx_operation_finish;
input wire control_rmx_input_fifo_rready;
input wire [(RVX_LPARA_02)-1:0] control_rmx_input_fifo_rdata;
output wire control_rmx_input_fifo_rrequest;
input wire control_rmx_output_fifo_wready;
output wire control_rmx_output_fifo_wrequest;
output wire [(RVX_LPARA_01)-1:0] control_rmx_output_fifo_wdata;

output wire [BW_CONFIG-1:0] extinput_config;
input wire [BW_STATUS-1:0] extinput_status;
input wire extinput_valid;
input wire [BW_EXTINPUT-1:0] extinput_data;
output wire extinput_ready;

localparam  RVX_LPARA_04 = BW_ADDR;
localparam  RVX_LPARA_05 = 1;

wire [(2)-1:0] rvx_signal_12;
wire rvx_signal_00;
wire rvx_signal_05;
wire rvx_signal_16;
wire [`BW_AXI_ALEN-1:0] rvx_signal_14;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_03;
wire [`BW_AXI_ABURST-1:0] rvx_signal_01;
wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_signal_13;
wire [BW_AXI_DATA-1:0] rvx_signal_17;
wire [RVX_LPARA_04-1:0] rvx_signal_06;
wire [RVX_LPARA_05-1:0] rvx_signal_11;
wire [(2)-1:0] rvx_signal_10;
wire rvx_signal_02;
wire rvx_signal_04;
wire rvx_signal_08;
wire [`BW_AXI_RESP-1:0] rvx_signal_09;
wire [BW_AXI_DATA-1:0] rvx_signal_15;
wire [RVX_LPARA_05-1:0] rvx_signal_07;

ERVP_EXTINPUT_BACKEND_DMA
#(
  .BW_ADDR(BW_ADDR),
  .BW_AXI_DATA(BW_AXI_DATA),
  .BW_CONFIG(BW_CONFIG),
  .BW_STATUS(BW_STATUS),
  .BW_EXTINPUT(BW_EXTINPUT),
  .DMA_FIFO_DEPTH(0)
)
i_rvx_instance_0
(
  .clk_system(clk_system),
  .tick_1us(tick_1us),

  .clk(clk),
  .rstnn(rstnn),

  .control_rmx_core_config(control_rmx_core_config),
  .control_rmx_core_status(control_rmx_core_status),
  .control_rmx_clear_request(control_rmx_clear_request),
  .control_rmx_clear_finish(control_rmx_clear_finish),
  .control_rmx_log_fifo_wready(control_rmx_log_fifo_wready),
  .control_rmx_log_fifo_wrequest(control_rmx_log_fifo_wrequest),
  .control_rmx_log_fifo_wdata(control_rmx_log_fifo_wdata),
  .control_rmx_inst_fifo_rready(control_rmx_inst_fifo_rready),
  .control_rmx_inst_fifo_rdata(control_rmx_inst_fifo_rdata),
  .control_rmx_inst_fifo_rrequest(control_rmx_inst_fifo_rrequest),
  .control_rmx_operation_finish(control_rmx_operation_finish),
  .control_rmx_input_fifo_rready(control_rmx_input_fifo_rready),
  .control_rmx_input_fifo_rdata(control_rmx_input_fifo_rdata),
  .control_rmx_input_fifo_rrequest(control_rmx_input_fifo_rrequest),
  .control_rmx_output_fifo_wready(control_rmx_output_fifo_wready),
  .control_rmx_output_fifo_wrequest(control_rmx_output_fifo_wrequest),
  .control_rmx_output_fifo_wdata(control_rmx_output_fifo_wdata),

  .dma_slxqdready(rvx_signal_12),
  .dma_slxqvalid(rvx_signal_00),
  .dma_slxqlast(rvx_signal_05),
  .dma_slxqwrite(rvx_signal_16),
  .dma_slxqlen(rvx_signal_14),
  .dma_slxqsize(rvx_signal_03),
  .dma_slxqburst(rvx_signal_01),
  .dma_slxqwstrb(rvx_signal_13),
  .dma_slxqwdata(rvx_signal_17),
  .dma_slxqaddr(rvx_signal_06),
  .dma_slxqburden(rvx_signal_11),
  .dma_slxydready(rvx_signal_10),
  .dma_slxyvalid(rvx_signal_02),
  .dma_slxylast(rvx_signal_04),
  .dma_slxywreply(rvx_signal_08),
  .dma_slxyresp(rvx_signal_09),
  .dma_slxyrdata(rvx_signal_15),
  .dma_slxyburden(rvx_signal_07),

  .extinput_config(extinput_config),
  .extinput_status(extinput_status),
  .extinput_valid(extinput_valid),
  .extinput_data(extinput_data),
  .extinput_ready(extinput_ready)
);

assign rvx_signal_12 = 0;
assign rvx_signal_02 = 0;
assign rvx_signal_04 = 0;
assign rvx_signal_08 = 0;
assign rvx_signal_09 = 0;
assign rvx_signal_15 = 0;
assign rvx_signal_07 = 0;

endmodule
