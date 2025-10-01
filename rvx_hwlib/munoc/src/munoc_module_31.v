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
// 2024-05-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_04.vh"





module MUNOC_MODULE_31 (
	munoc_port_8,
	munoc_port_3,

	munoc_port_1,
	munoc_port_0,
	munoc_port_5,
	munoc_port_4,

	munoc_port_2,
	munoc_port_7,
	munoc_port_6
);





parameter MUNOC_GPARA_2 = 1;
parameter MUNOC_GPARA_0 = 1;
parameter MUNOC_GPARA_1 = 1;

output wire munoc_port_1;
input wire munoc_port_0;
input	wire [MUNOC_GPARA_2-1:0] munoc_port_5;
input wire munoc_port_4;

input wire munoc_port_8;
input wire munoc_port_3;
output wire [MUNOC_GPARA_0-1:0] munoc_port_2;
input wire [MUNOC_GPARA_0-1:0] munoc_port_7;
output wire [MUNOC_GPARA_0*MUNOC_GPARA_2-1:0] munoc_port_6;

genvar i;
integer j;

wire [MUNOC_GPARA_0-1:0] munoc_signal_3;
wire [MUNOC_GPARA_0-1:0] munoc_signal_2;
wire [MUNOC_GPARA_0-1:0] munoc_signal_4;

wire munoc_signal_0;
wire [MUNOC_GPARA_0-1:0] munoc_signal_1;

generate
for(i=0; i<MUNOC_GPARA_0; i=i+1)
begin : i_gen_buffer
	ERVP_SMALL_FIFO
	#(
		.BW_DATA(MUNOC_GPARA_2),
		.DEPTH(MUNOC_GPARA_1)
	)
	i_munoc_instance_0
	(
		.clk(munoc_port_8),
		.rstnn(munoc_port_3),
		.enable(1'b 1),
    .clear(1'b 0),
		.wready(munoc_signal_3[i]),
		.wrequest(munoc_signal_2[i]),
		.wdata(munoc_port_5),
		.rready(munoc_port_2[i]),
		.rrequest(munoc_port_7[i]),
		.rdata(munoc_port_6[MUNOC_GPARA_2*(i+1)-1-:MUNOC_GPARA_2]),
		.wfull(),
		.rempty()
	);
end
endgenerate

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(MUNOC_GPARA_0),
	.UP(0)
)
i_munoc_instance_1
(
	.clk(munoc_port_8),
	.rstnn(munoc_port_3),
	.enable(1'b 1),
	.init(munoc_port_4),
	.count(munoc_signal_0),
	.value(munoc_signal_1),
	.is_first_count(),
	.is_last_count()
);

generate
for(i=0; i<MUNOC_GPARA_0; i=i+1)
begin : i_gen_write_request
	assign munoc_signal_4[i] = munoc_signal_3[i]&munoc_signal_1[i];
	assign munoc_signal_2[i] = munoc_signal_4[i]&munoc_port_0;
end
endgenerate

assign munoc_port_1 = |munoc_signal_4;
assign munoc_signal_0 = munoc_port_1 & munoc_port_0;

endmodule
