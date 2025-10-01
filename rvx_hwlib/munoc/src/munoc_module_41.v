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





module MUNOC_MODULE_41
(
	munoc_port_03,
	munoc_port_04,
	munoc_port_00,

	munoc_port_05,
	munoc_port_01,
	munoc_port_11,
	munoc_port_07,

	munoc_port_10,
	munoc_port_02,
	munoc_port_09,
	munoc_port_08,

	munoc_port_06
);





parameter MUNOC_GPARA_5 = 32;
parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_6 = 16;
parameter MUNOC_GPARA_4 = 0;
parameter MUNOC_GPARA_2 = 0;
parameter MUNOC_GPARA_3 = 0;
parameter MUNOC_GPARA_0 = 0;

input wire munoc_port_03, munoc_port_04;
input wire munoc_port_00;

input wire [MUNOC_GPARA_5-1:0] munoc_port_05;
input wire munoc_port_01;
output wire munoc_port_11;
input wire [MUNOC_GPARA_1-1:0] munoc_port_07;
input wire [MUNOC_GPARA_5-1:0] munoc_port_10;
input wire munoc_port_02;
output wire munoc_port_09;
input wire [MUNOC_GPARA_1-1:0] munoc_port_08;

output reg munoc_port_06;

wire munoc_signal_16;
wire munoc_signal_06;
wire [MUNOC_GPARA_5-1:0] munoc_signal_13;
wire [MUNOC_GPARA_1-1:0] munoc_signal_00;

wire munoc_signal_02;
wire munoc_signal_15;
wire [MUNOC_GPARA_1-1:0] munoc_signal_01;
wire munoc_signal_14;

wire munoc_signal_17;
wire munoc_signal_04;
wire [MUNOC_GPARA_5-1:0] munoc_signal_09;
wire [MUNOC_GPARA_1-1:0] munoc_signal_03;

wire munoc_signal_08;
wire munoc_signal_12;
wire [MUNOC_GPARA_1-1:0] munoc_signal_05;
wire munoc_signal_11;

wire munoc_signal_07;
wire munoc_signal_10;

ERVP_FIFO
#(
	.BW_DATA(MUNOC_GPARA_5+MUNOC_GPARA_1),
	.DEPTH(MUNOC_GPARA_6)
)
i_munoc_instance_1
(
	.clk(munoc_port_03),
	.rstnn(munoc_port_04),
	.enable(munoc_port_00),
  .clear(1'b 0),
	.wready(munoc_port_11),
	.wfull(),
	.wrequest(munoc_port_01),
	.wdata({munoc_port_07,munoc_port_05}),
	.rready(munoc_signal_16),
	.rempty(),
	.rrequest(munoc_signal_06),
	.rdata({munoc_signal_00,munoc_signal_13}),
	.wnum(),
	.rnum()
);

ERVP_FIFO
#(
	.BW_DATA(MUNOC_GPARA_5+MUNOC_GPARA_1),
	.DEPTH(MUNOC_GPARA_6)
)
i_munoc_instance_3
(
	.clk(munoc_port_03),
	.rstnn(munoc_port_04),
	.enable(munoc_port_00),
  .clear(1'b 0),
	.wready(munoc_port_09),
	.wfull(),
	.wrequest(munoc_port_02),
	.wdata({munoc_port_08,munoc_port_10}),
	.rready(munoc_signal_17),
	.rempty(),
	.rrequest(munoc_signal_04),
	.rdata({munoc_signal_03,munoc_signal_09}),
	.wnum(),
	.rnum()
);

assign munoc_signal_07 = munoc_port_00 & munoc_signal_16 & munoc_signal_17;
assign munoc_signal_10 = munoc_signal_07 & (munoc_signal_13==munoc_signal_09);

ERVP_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_1),
	.RESET_NUMBER((MUNOC_GPARA_2==1)? 0 : 1),
	.CIRCULAR(0)
)
i_munoc_instance_0
(
	.clk(munoc_port_03),
	.rstnn(munoc_port_04),
	.enable((MUNOC_GPARA_4==1)&munoc_port_00),
	.init(munoc_signal_02),
	.count(munoc_signal_15),
	.value(munoc_signal_01),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_14 = (MUNOC_GPARA_4==1)? (munoc_signal_01==munoc_signal_00) : 1;
assign munoc_signal_02 = munoc_signal_10 & munoc_signal_14;
assign munoc_signal_15 = munoc_signal_10 & (~munoc_signal_14);
assign munoc_signal_06 = munoc_signal_02;

ERVP_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_1),
	.RESET_NUMBER((MUNOC_GPARA_0==1)? 0 : 1),
	.CIRCULAR(0)
)
i_munoc_instance_2
(
	.clk(munoc_port_03),
	.rstnn(munoc_port_04),
	.enable((MUNOC_GPARA_3==1)&munoc_port_00),
	.init(munoc_signal_08),
	.count(munoc_signal_12),
	.value(munoc_signal_05),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_11 = (MUNOC_GPARA_3==1)? (munoc_signal_05==munoc_signal_03) : 1;
assign munoc_signal_08 = munoc_signal_10 & munoc_signal_11;
assign munoc_signal_12 = munoc_signal_10 & (~munoc_signal_11);
assign munoc_signal_04 = munoc_signal_08;

always@(posedge munoc_port_03, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_port_06 <= 0;
	else if(munoc_signal_07 & (~munoc_signal_10))
		munoc_port_06 <= 1;
end

endmodule
