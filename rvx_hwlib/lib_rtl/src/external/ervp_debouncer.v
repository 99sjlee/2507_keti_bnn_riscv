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



module ERVP_DEBOUNCER
(
	clk,
	rstnn,
	enable,
	tick,
	input_raw,
	input_debounced
);



parameter BW_DATA = 1;

localparam  RVX_LPARA_0 = 3;

input wire clk, rstnn;
input wire tick;
input wire enable;
input wire [BW_DATA-1:0] input_raw;
output wire [BW_DATA-1:0] input_debounced;

wire [RVX_LPARA_0-1:0] rvx_signal_0 [BW_DATA-1:0];
wire rvx_signal_1 [BW_DATA-1:0];
wire rvx_signal_2 [BW_DATA-1:0];

genvar i;

generate
	for(i=0; i<BW_DATA; i=i+1)
	begin : i_generate
		ERVP_UPDOWN_COUNTER
		#(
			.BW_COUNTER(RVX_LPARA_0),
			.BW_COUNT_AMOUNT(2),
			.UNSIGNED(1)
		)
		i_rvx_instance_0
		(
			.clk(clk),
			.rstnn(rstnn),
			.enable(enable),
			.init(1'b 0),
			.up(rvx_signal_1[i]),
			.down(rvx_signal_2[i]),
			.count_amount(2'b 1),
			.value(rvx_signal_0[i]),
			.is_upper_limit(),
			.is_lower_limit()
		);

		assign input_debounced[i] = enable? rvx_signal_0[i][RVX_LPARA_0-1] : input_raw[i];
		assign rvx_signal_1[i] = tick & input_raw[i];
		assign rvx_signal_2[i] = tick & (~(input_raw[i]));
	end
endgenerate

endmodule
