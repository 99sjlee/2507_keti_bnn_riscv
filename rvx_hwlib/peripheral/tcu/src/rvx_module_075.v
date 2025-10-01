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





module RVX_MODULE_075
(
	rvx_port_3,
	rvx_port_4,
	rvx_port_6,
	rvx_port_7,
	rvx_port_5,
	rvx_port_1,
	rvx_port_2,
	rvx_port_8,
	rvx_port_0
);





`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 128;
parameter RVX_GPARA_2 = 1;
localparam  RVX_LPARA_0 = GET_ADDR_MASK_BITWIDTH(RVX_GPARA_0);
localparam  RVX_LPARA_1 = RVX_GPARA_3 - RVX_LPARA_0;

genvar i;

input wire [RVX_GPARA_3*RVX_GPARA_2-1:0] rvx_port_3;
input wire [RVX_GPARA_3*RVX_GPARA_2-1:0] rvx_port_4;
input wire [RVX_GPARA_3*RVX_GPARA_2-1:0] rvx_port_6;
input wire [RVX_GPARA_2-1:0] rvx_port_7;
input wire [RVX_GPARA_3-1:0] rvx_port_5;

output wire rvx_port_1;
output wire [RVX_GPARA_3-1:0] rvx_port_2;
output wire [RVX_GPARA_3-1:0] rvx_port_8;
output wire [RVX_GPARA_3-1:0] rvx_port_0;

wire [RVX_LPARA_1-1:0] rvx_signal_6 [0:RVX_GPARA_2-1];
wire [RVX_LPARA_1-1:0] rvx_signal_1 [0:RVX_GPARA_2-1];

wire [RVX_LPARA_1-1:0] rvx_signal_5;

wire [RVX_GPARA_2-1:0] rvx_signal_4;
wire [RVX_GPARA_2-1:0] rvx_signal_0;

wire [RVX_GPARA_2-1:0] rvx_signal_2;
wire [RVX_GPARA_3-1:0] rvx_signal_3;

generate
	for(i=0;i<RVX_GPARA_2;i=i+1)
	begin : generate_base
		assign rvx_signal_6[i] = rvx_port_3[RVX_GPARA_3*(i+1)-1-:RVX_LPARA_1];
		assign rvx_signal_1[i] = rvx_port_4[RVX_GPARA_3*(i+1)-1-:RVX_LPARA_1];
	end
endgenerate

assign rvx_signal_5 = rvx_port_5[RVX_GPARA_3-1:RVX_LPARA_0];

generate
	for(i=0;i<RVX_GPARA_2;i=i+1)
	begin : generate_above_and_below
		assign rvx_signal_4[i] = (rvx_signal_5 >= rvx_signal_6[i]);
		assign rvx_signal_0[i] = (rvx_signal_5 <= rvx_signal_1[i]);
	end
endgenerate

generate
	for(i=0;i<RVX_GPARA_2;i=i+1)
	begin : generate_match
		assign rvx_signal_2[i] = (rvx_port_7[i])? (rvx_signal_4[i] && rvx_signal_0[i]): 1'b0;
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_GPARA_3),
	.NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_1
(
	.data_input_list(rvx_port_3),
	.select(rvx_signal_2),
	.data_output(rvx_port_8)
);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_GPARA_3),
	.NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_2
(
	.data_input_list(rvx_port_4),
	.select(rvx_signal_2),
	.data_output(rvx_port_0)
);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_GPARA_3),
	.NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.data_input_list(rvx_port_6),
	.select(rvx_signal_2),
	.data_output(rvx_signal_3)
);

assign rvx_port_1 = (rvx_signal_2!=0)? 1'b1: 1'b0;

assign rvx_port_2 = rvx_port_5 + rvx_signal_3;

endmodule
