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
`include "munoc_extended_config.vh"
`include "munoc_include_07.vh"
`include "ervp_ahb_define.vh"





module MUNOC_MODULE_09
(
	munoc_port_5,
	munoc_port_0,
	munoc_port_1,

	munoc_port_7,
	munoc_port_2,	
	munoc_port_4,

	munoc_port_3,
	munoc_port_8,
	munoc_port_6
);





parameter MUNOC_GPARA_1 = 16;
parameter MUNOC_GPARA_2 = 500;

parameter MUNOC_GPARA_0 = -1;

input wire munoc_port_5, munoc_port_0;
input wire munoc_port_1;

input wire munoc_port_7;
input wire [`BW_AHB_TRANS-1:0] munoc_port_2;
input wire munoc_port_4;

output wire [`MUNOC_GDEF_71-1:0] munoc_port_3;
output wire [`MUNOC_GDEF_71-1:0] munoc_port_8;
output wire [`MUNOC_GDEF_24-1:0] munoc_port_6;

wire munoc_signal_0;
wire munoc_signal_1;

`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_0 1
reg munoc_signal_2;

assign munoc_signal_0 = munoc_port_7 & ((munoc_port_2==`AHB_TRANS_NONSEQ) | (munoc_port_2==`AHB_TRANS_SEQ));

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR

	MUNOC_MODULE_23
	#(
		.MUNOC_GPARA_1(MUNOC_GPARA_1),
		.MUNOC_GPARA_0(MUNOC_GPARA_2)
	)
	i_munoc_instance_0
	(
		.munoc_port_2(munoc_port_5),
		.munoc_port_1(munoc_port_0),
		.munoc_port_0(munoc_port_1),
		.munoc_port_6(munoc_signal_0),
		.munoc_port_5(munoc_port_4),
		.munoc_port_4(munoc_signal_1),
		.munoc_port_7(),
		.munoc_port_3()
	);
`else
	assign munoc_signal_1 = 0;
`endif

assign munoc_port_3 = (MUNOC_GPARA_0==1)? 0 : $unsigned(munoc_signal_1);
assign munoc_port_8 = (MUNOC_GPARA_0==1)? $unsigned(munoc_signal_1) : 0;

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR

	always @(posedge munoc_port_5, negedge munoc_port_0)
	begin
		if(munoc_port_0==0)
			munoc_signal_2 <= `MUNOC_LDEF_1;
		else if(munoc_port_1)
			case(munoc_signal_2)
				`MUNOC_LDEF_1:
					if(munoc_signal_0 && munoc_port_4)
						munoc_signal_2 <= `MUNOC_LDEF_0;
					`MUNOC_LDEF_0:
						if(munoc_port_7 && (munoc_port_2==`AHB_TRANS_IDLE) && munoc_port_4)
							munoc_signal_2 <= `MUNOC_LDEF_1;
			endcase
	end

	MUNOC_MODULE_19
	#(
		.MUNOC_GPARA_1(`MUNOC_GDEF_24),
		.MUNOC_GPARA_2(`MUNOC_GDEF_10),
		.MUNOC_GPARA_0(`MUNOC_GDEF_05)
		)
	i_munoc_instance_1
	(
		.munoc_port_3(munoc_port_5),
		.munoc_port_4(munoc_port_0),
		.munoc_port_1(munoc_port_1),
		.munoc_port_2((munoc_signal_2==`MUNOC_LDEF_1)),
		.munoc_port_0(munoc_port_6)
	);
`else
	assign munoc_port_6 = 0;
`endif

`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
endmodule
