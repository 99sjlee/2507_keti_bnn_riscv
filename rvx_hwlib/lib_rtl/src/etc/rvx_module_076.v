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





module RVX_MODULE_076
(
	rvx_port_2,
	rvx_port_3,
	rvx_port_7,
	rvx_port_6,
	rvx_port_4,
	rvx_port_0,
	rvx_port_5,
	rvx_port_1,
	rvx_port_8
);





parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_3 = 0;
parameter RVX_GPARA_2 = 16;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(RVX_GPARA_0);

input wire rvx_port_2, rvx_port_3;
output wire rvx_port_7;
input wire rvx_port_6;
input wire [RVX_GPARA_1-1:0] rvx_port_4;
output wire rvx_port_0;
input wire [RVX_GPARA_0-1:0] rvx_port_5;
output wire [RVX_GPARA_1-1:0] rvx_port_1;
output wire [RVX_GPARA_2-1:0] rvx_port_8;

genvar i;
integer j;

wire [RVX_LPARA_0-1:0] rvx_signal_1, rvx_signal_0;
reg [RVX_GPARA_1-1:0] rvx_signal_2 [0:RVX_GPARA_0-1];

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_0),
	.LAST_NUMBER(RVX_GPARA_0-1),
	.CIRCULAR(RVX_GPARA_3)
)
i_rvx_instance_1
(
	.clk(rvx_port_2),
	.rstnn(rvx_port_3),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_port_6),
	.value(rvx_signal_1),
	.is_first_count(rvx_port_0),
	.is_last_count(rvx_port_7)
);

assign rvx_signal_0 = $unsigned(rvx_port_5);

ERVP_REGISTER_FILE_1R1W
#(
	.WIDTH(RVX_GPARA_1),
	.DEPTH(RVX_GPARA_0),
	.BW_INDEX(RVX_LPARA_0)
)
i_rvx_instance_2
(
	.clk(rvx_port_2),
	.rstnn(rvx_port_3),
	.index(),

	.windex(rvx_signal_1),
	.wenable(rvx_port_6 & ((RVX_GPARA_3==1) | (~rvx_port_7))),
	.wpermit(1'b 1),
	.wdata(rvx_port_4),

	.rindex(rvx_signal_0),
	.rdata_list_asynch(),
	.rdata_asynch(rvx_port_1),
	.renable(1'b 1),
	.rdata_synch()
);

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.clk(rvx_port_2),
	.rstnn(rvx_port_3),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_port_6),
	.value(rvx_port_8),
	.is_first_count(),
	.is_last_count()
);

endmodule
