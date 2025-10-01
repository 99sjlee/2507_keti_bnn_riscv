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





module MUNOC_MODULE_24
(
	munoc_port_0,
	munoc_port_4,

	munoc_port_3,
	munoc_port_2,
	munoc_port_5,

	munoc_port_1,
	munoc_port_6
);





parameter MUNOC_GPARA_0 = 16;
parameter MUNOC_GPARA_1 = 100;

parameter MUNOC_GPARA_2 = -1;

input wire munoc_port_0, munoc_port_4;
input wire munoc_port_3;
input wire munoc_port_2;
input wire munoc_port_5;

output wire munoc_port_1;
output wire [`MUNOC_GDEF_24-1:0] munoc_port_6;

wire munoc_signal_0;

assign munoc_signal_0 = munoc_port_3 & munoc_port_2;

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR

	MUNOC_MODULE_23
	#(
		.BW_COUNTER(MUNOC_GPARA_0),
		.MUNOC_GPARA_0(MUNOC_GPARA_1)
	)
	i_munoc_instance_1
	(
		.munoc_port_2(munoc_port_0),
		.munoc_port_1(munoc_port_4),
		.munoc_port_6(munoc_signal_0),
		.munoc_port_5(munoc_port_5),
		.munoc_port_4(munoc_port_1),
		.munoc_port_7(),
		.munoc_port_3()
	);
`else
	assign munoc_port_1 = 0;
`endif

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR

	MUNOC_MODULE_19
	#(
		.MUNOC_GPARA_1(`MUNOC_GDEF_24),
		.MUNOC_GPARA_2(`MUNOC_GDEF_10),
		.MUNOC_GPARA_0(`MUNOC_GDEF_05)
	)
	i_munoc_instance_0
	(
		.munoc_port_3(munoc_port_0),
		.munoc_port_4(munoc_port_4),
		.munoc_port_2(~munoc_signal_0),
		.munoc_port_0(munoc_port_6)
	);
`endif

endmodule

