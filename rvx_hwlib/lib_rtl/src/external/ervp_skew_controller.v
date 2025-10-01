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



module ERVP_SKEW_CONTROLLER
(
	signal,
	signal_skewed,
	skew_value
);



parameter BW_SIGNAL = 1;
parameter BW_SKEW_VALUE = 1;

input wire [BW_SIGNAL-1:0] signal;
output wire [BW_SIGNAL-1:0] signal_skewed;
input wire [BW_SKEW_VALUE-1:0] skew_value;

localparam  RVX_LPARA_0 = (2**BW_SKEW_VALUE);

genvar i;

wire [BW_SIGNAL-1:0] rvx_signal_0 [0:RVX_LPARA_0-1];
wire [BW_SIGNAL*RVX_LPARA_0-1:0] rvx_signal_1;

assign rvx_signal_0[0] = signal;

generate
for(i=1; i<RVX_LPARA_0; i=i+1)
begin : i_gen_stage
	BUF
	i_rvx_instance_0
	(
		.I(rvx_signal_0[i-1]),
		.O(rvx_signal_0[i])
	);
end
endgenerate

generate
for(i=0; i<RVX_LPARA_0; i=i+1)
begin : i_concat_stage
	assign rvx_signal_1[BW_SIGNAL*(i+1)-1-:BW_SIGNAL] = rvx_signal_0[i];
end
endgenerate

ERVP_MUX
#(
	.BW_DATA(BW_SIGNAL),
	.NUM_DATA(RVX_LPARA_0)
)
i_rvx_instance_1
(
	.data_input_list(rvx_signal_1),
	.select(skew_value),
	.data_output(signal_skewed)
);

endmodule
