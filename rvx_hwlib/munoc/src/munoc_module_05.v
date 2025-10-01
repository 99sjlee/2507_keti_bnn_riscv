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





module MUNOC_MODULE_05
(
	munoc_port_4,
	munoc_port_6,
	munoc_port_8,

	munoc_port_0,
	munoc_port_3,

	munoc_port_2,
	munoc_port_7,
	munoc_port_1,
	munoc_port_5
);





parameter MUNOC_GPARA_0 = 4;
parameter MUNOC_GPARA_4 = 16;
parameter MUNOC_GPARA_2 = 500;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_3 = 0;

input wire munoc_port_4, munoc_port_6;
input wire munoc_port_8;

input wire munoc_port_0;
input wire munoc_port_3;

output wire munoc_port_2;
output wire munoc_port_7;
output wire [MUNOC_GPARA_4-1:0] munoc_port_1;
output wire [MUNOC_GPARA_1-1:0] munoc_port_5;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

wire [MUNOC_GPARA_0-1:0] munoc_signal_6;

wire munoc_signal_7;
wire munoc_signal_4;
wire munoc_signal_1, munoc_signal_3, munoc_signal_0;
reg munoc_signal_5;
wire munoc_signal_2;

ERVP_UPDOWN_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_0),
	.BW_COUNT_AMOUNT(2),
	.RESET_NUMBER(0),
	.UNSIGNED(((MUNOC_GPARA_3==1)? 0 : 1))
)
i_munoc_instance_1
(
	.clk(munoc_port_4),
	.rstnn(munoc_port_6),
	.enable(munoc_port_8),
	.init(1'b 0),
	.up(munoc_port_0),
	.down(munoc_port_3),
	.count_amount(2'd 1),
	.value(munoc_signal_6),
	.is_upper_limit(),
	.is_lower_limit()
);

assign munoc_signal_1 = (munoc_signal_6==0);
assign munoc_signal_3 = (MUNOC_GPARA_3==1)? ($signed(munoc_signal_6)>0) : (munoc_signal_6!=0);
assign munoc_signal_0 = (MUNOC_GPARA_3==1)? ($signed(munoc_signal_6)<0) : 0;

assign munoc_port_2 = munoc_signal_1;

always @(posedge munoc_port_4 or negedge munoc_port_6)
begin
	if(munoc_port_6==0)
		munoc_signal_5 <= 0;
	else if((MUNOC_GPARA_3==0) && munoc_port_8)
	begin
		if(munoc_signal_1 && munoc_port_3 && (~munoc_port_0))
			munoc_signal_5 <= 1;
	end
end

RVX_MODULE_018
#(
	.RVX_GPARA_1(MUNOC_GPARA_4),
	.RVX_GPARA_2(MUNOC_GPARA_2),
	.RVX_GPARA_0(MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.rvx_port_5(munoc_port_4),
	.rvx_port_0(munoc_port_6),
	.rvx_port_1(munoc_port_8),
	.rvx_port_4(munoc_signal_7),
	.rvx_port_6(munoc_signal_4),
	.rvx_port_7(munoc_signal_2),
	.rvx_port_3(munoc_port_1),
	.rvx_port_2(munoc_port_5)
);

assign munoc_signal_7 = munoc_port_3 | munoc_port_0;

assign munoc_signal_4 = ~munoc_port_2;
assign munoc_port_7 = (MUNOC_GPARA_3==1)? munoc_signal_2 : (munoc_signal_5 | munoc_signal_2);

endmodule

