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



module ERVP_MMIO_WIDE_REG
(
	clk,
  rstnn,
  clear,
	enable,

  mmio_re,
  mmio_rdata,
  mmio_we,
  mmio_wdata,

  wide_data_out
);



parameter BW_MMIO = 32;
parameter BW_WIDE_DATA = 32;
parameter DEFAULT_VALUE = 0;

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

input wire mmio_re;
output wire [BW_MMIO-1:0] mmio_rdata;
input wire mmio_we;
input wire [BW_MMIO-1:0] mmio_wdata;

output wire [BW_WIDE_DATA-1:0] wide_data_out;

integer i;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_0 = `DIVIDERU(BW_WIDE_DATA, BW_MMIO);
localparam  RVX_LPARA_1 = RVX_LPARA_0;

wire rvx_signal_0;
wire [RVX_LPARA_1-1:0] rvx_signal_2;

reg [BW_MMIO*RVX_LPARA_0-1:0] rvx_signal_1;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_1),
	.CIRCULAR(1)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(enable),
	.init(clear),
	.count(rvx_signal_0),
	.value(rvx_signal_2),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_0 = mmio_re | mmio_we;

always @(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_1 <= DEFAULT_VALUE;
  else if(clear)
    rvx_signal_1 <= DEFAULT_VALUE;
  else if(enable && mmio_we)
  begin
    for(i=0;i<RVX_LPARA_0; i=i+1)
      if(rvx_signal_2[i])
        rvx_signal_1[BW_MMIO*(i+1)-1-:BW_MMIO] <= mmio_wdata;
  end
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_MMIO),
  .NUM_DATA(RVX_LPARA_0),
  .ACTIVE_HIGH(1)
)
i_rvx_instance_0
(
	.data_input_list(rvx_signal_1),
	.select(rvx_signal_2),
	.data_output(mmio_rdata)
);

assign wide_data_out = rvx_signal_1;

endmodule
