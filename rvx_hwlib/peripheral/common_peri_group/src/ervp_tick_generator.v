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



module ERVP_TICK_GENERATOR
(
	clk,
	rstnn,
	tick_config,
	tick_1us,
	tick_62d5ms
);



`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_5 = 11;

localparam  RVX_LPARA_3 = 1000000;
localparam  RVX_LPARA_1 = 10;

localparam  RVX_LPARA_4 = 16;
localparam  RVX_LPARA_2 = `DIVIDERU(RVX_LPARA_3, RVX_LPARA_4);
localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_UNSIGNED(RVX_LPARA_2);

input wire clk, rstnn;
input wire [RVX_LPARA_5-1:0] tick_config;
output wire tick_1us;
output wire tick_62d5ms;

wire rvx_signal_2;
wire [RVX_LPARA_1-1:0] rvx_signal_1;
wire [RVX_LPARA_1-1:0] rvx_signal_0;

assign {rvx_signal_1,rvx_signal_2} = tick_config;

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_1),
	.RESET_NUMBER(1),
	.CIRCULAR(0)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(rvx_signal_2),
	.init(tick_1us),
	.count(1'b 1),
	.value(rvx_signal_0),
	.is_first_count(),
	.is_last_count()
);

assign tick_1us = (rvx_signal_0==rvx_signal_1);

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_0),
	.LAST_NUMBER(RVX_LPARA_2-1),
	.CIRCULAR(0)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(rvx_signal_2),
	.init(tick_62d5ms),
	.count(tick_1us),
	.value(),
	.is_first_count(),
	.is_last_count(tick_62d5ms)
);

endmodule
