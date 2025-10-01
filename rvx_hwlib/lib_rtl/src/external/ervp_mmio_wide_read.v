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



module ERVP_MMIO_WIDE_READ
(
	clk,
  rstnn,
  clear,
	enable,

  mmio_re,
  mmio_rdata,

  wide_data_in
);



parameter BW_MMIO = 32;
parameter BW_WIDE_DATA = 32;

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

input wire mmio_re;
output wire [BW_MMIO-1:0] mmio_rdata;

input wire [BW_WIDE_DATA-1:0] wide_data_in;

integer i;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_0 = `DIVIDERU(BW_WIDE_DATA, BW_MMIO);
localparam  RVX_LPARA_1 = RVX_LPARA_0;

wire rvx_signal_2;
wire [RVX_LPARA_1-1:0] rvx_signal_0;

wire [BW_MMIO*RVX_LPARA_0-1:0] rvx_signal_1;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_1),
	.CIRCULAR(1)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(enable),
	.init(clear),
	.count(rvx_signal_2),
	.value(rvx_signal_0),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_2 = mmio_re;

assign rvx_signal_1 = wide_data_in;

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_MMIO),
  .NUM_DATA(RVX_LPARA_0),
  .ACTIVE_HIGH(1)
)
i_rvx_instance_1
(
	.data_input_list(rvx_signal_1),
	.select(rvx_signal_0),
	.data_output(mmio_rdata)
);

endmodule
