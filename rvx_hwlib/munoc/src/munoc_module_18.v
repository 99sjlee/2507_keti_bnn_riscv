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
`include "ervp_axi_define.vh"





module MUNOC_MODULE_18
(
	munoc_port_09,
	munoc_port_00,
	munoc_port_06,

	munoc_port_29,
	munoc_port_27,
	munoc_port_26,
	munoc_port_24,
	munoc_port_25,
	munoc_port_01,
	munoc_port_21,

	munoc_port_04,
	munoc_port_19,
	munoc_port_05,
	munoc_port_15,
	munoc_port_12,
	munoc_port_20, 

	munoc_port_14,
	munoc_port_17,
	munoc_port_07,
	munoc_port_03,

	munoc_port_23,
	munoc_port_33,
	munoc_port_32,
	munoc_port_08,
	munoc_port_10,
	munoc_port_31,
	munoc_port_22,

	munoc_port_13,
	munoc_port_18,
	munoc_port_02,
	munoc_port_16,
	munoc_port_28,
	munoc_port_11,

	munoc_port_30
);





parameter MUNOC_GPARA_1 = 32;
parameter MUNOC_GPARA_2 = 32;
parameter MUNOC_GPARA_3 = 4;

parameter MUNOC_GPARA_0 = 0;

input wire munoc_port_09, munoc_port_00;
input wire munoc_port_06;

input wire [MUNOC_GPARA_3-1:0] munoc_port_29;
input wire [MUNOC_GPARA_1-1:0] munoc_port_27;
input wire [`BW_AXI_ALEN-1:0] munoc_port_26;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_24;
input wire [`BW_AXI_ABURST-1:0] munoc_port_25;
input wire munoc_port_01;
input wire munoc_port_21;

input wire [MUNOC_GPARA_3-1:0] munoc_port_04;
input wire [MUNOC_GPARA_2-1:0] munoc_port_19;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_2)-1:0] munoc_port_05;
input wire munoc_port_15;
input wire munoc_port_12;
input wire munoc_port_20;

input wire [MUNOC_GPARA_3-1:0] munoc_port_14;
input wire [`BW_AXI_BRESP-1:0] munoc_port_17;
input wire munoc_port_07;
input wire munoc_port_03;

input wire [MUNOC_GPARA_3-1:0] munoc_port_23;
input wire [MUNOC_GPARA_1-1:0] munoc_port_33;
input wire [`BW_AXI_ALEN-1:0] munoc_port_32;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_08;
input wire [`BW_AXI_ABURST-1:0] munoc_port_10;
input wire munoc_port_31;
input wire munoc_port_22;

input wire [MUNOC_GPARA_3-1:0] munoc_port_13;
input wire [MUNOC_GPARA_2-1:0] munoc_port_18;
input wire [`BW_AXI_RRESP-1:0] munoc_port_02;
input wire munoc_port_16;
input wire munoc_port_28;
input wire munoc_port_11;

output wire [`MUNOC_GDEF_80-1:0] munoc_port_30;

wire munoc_signal_09;
wire munoc_signal_06;
wire munoc_signal_04;
wire munoc_signal_13;
wire munoc_signal_10;

wire munoc_signal_08;
wire munoc_signal_15;
wire munoc_signal_01;
wire munoc_signal_00;
wire munoc_signal_14;

wire munoc_signal_07;
wire munoc_signal_02;
wire munoc_signal_16;

wire munoc_signal_05;
wire munoc_signal_17;
wire [`BW_AXI_ALEN-1:0] munoc_signal_12;
wire munoc_signal_11;
wire munoc_signal_03;

MUNOC_MODULE_15
#(
	.MUNOC_GPARA_0(`BW_AXI_ALEN+`BW_AXI_ASIZE+`BW_AXI_ABURST+MUNOC_GPARA_1)
)
i_munoc_instance_2
(
	.munoc_port_7(munoc_port_09),
	.munoc_port_4(munoc_port_00),
	.munoc_port_0(munoc_port_06),
	.munoc_port_2(munoc_port_01),
	.munoc_port_6(munoc_port_21),
	.munoc_port_1({munoc_port_26,munoc_port_24,munoc_port_25,munoc_port_27}),
	.munoc_port_3(munoc_signal_09),
	.munoc_port_5(munoc_signal_08)
);

MUNOC_MODULE_15
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_2)
)
i_munoc_instance_3
(
	.munoc_port_7(munoc_port_09),
	.munoc_port_4(munoc_port_00),
	.munoc_port_0(munoc_port_06),
	.munoc_port_2(munoc_port_12),
	.munoc_port_6(munoc_port_20),
	.munoc_port_1(munoc_port_19),
	.munoc_port_3(munoc_signal_06),
	.munoc_port_5(munoc_signal_15)
);

MUNOC_MODULE_15
#(
	.MUNOC_GPARA_0(1)
)
i_munoc_instance_0
(
	.munoc_port_7(munoc_port_09),
	.munoc_port_4(munoc_port_00),
	.munoc_port_0(munoc_port_06),
	.munoc_port_2(munoc_port_07),
	.munoc_port_6(munoc_port_03),
	.munoc_port_1(1'b 0),
	.munoc_port_3(munoc_signal_04),
	.munoc_port_5(munoc_signal_01)
);

MUNOC_MODULE_15
#(
	.MUNOC_GPARA_0(`BW_AXI_ALEN+`BW_AXI_ASIZE+`BW_AXI_ABURST+MUNOC_GPARA_1)
)
i_munoc_instance_8
(
	.munoc_port_7(munoc_port_09),
	.munoc_port_4(munoc_port_00),
	.munoc_port_0(munoc_port_06),
	.munoc_port_2(munoc_port_31),
	.munoc_port_6(munoc_port_22),
	.munoc_port_1({munoc_port_32,munoc_port_08,munoc_port_10,munoc_port_33}),
	.munoc_port_3(munoc_signal_13),
	.munoc_port_5(munoc_signal_00)
);

MUNOC_MODULE_15
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_2)
)
i_munoc_instance_4
(
	.munoc_port_7(munoc_port_09),
	.munoc_port_4(munoc_port_00),
	.munoc_port_0(munoc_port_06),
	.munoc_port_2(munoc_port_28),
	.munoc_port_6(munoc_port_11),
	.munoc_port_1(munoc_port_18),
	.munoc_port_3(munoc_signal_10),
	.munoc_port_5(munoc_signal_14)
);

MUNOC_MODULE_41
#(
	.MUNOC_GPARA_5(`BW_AXI_ALEN),
	.MUNOC_GPARA_6(4),
	.MUNOC_GPARA_4(0),
	.MUNOC_GPARA_3(0)
)
i_munoc_instance_7
(
	.munoc_port_03(munoc_port_09),
	.munoc_port_04(munoc_port_00),
	.munoc_port_00(munoc_port_06),

	.munoc_port_05(munoc_port_26),
	.munoc_port_01(munoc_port_01&munoc_port_21),
	.munoc_port_11(),
	.munoc_port_07(),

	.munoc_port_10(munoc_signal_12),
	.munoc_port_02(munoc_signal_11),
	.munoc_port_09(),
	.munoc_port_08(),

	.munoc_port_06(munoc_signal_07)
);

assign munoc_signal_11 = munoc_port_12 & munoc_port_20 & munoc_port_15;

ERVP_COUNTER
#(
	.BW_COUNTER(`BW_AXI_ALEN)
)
i_munoc_instance_1
(
	.clk(munoc_port_09),
	.rstnn(munoc_port_00),
	.enable(munoc_port_06),
	.init(munoc_signal_05),
	.count(munoc_signal_17),
	.value(munoc_signal_12),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_05 = munoc_signal_11;
assign munoc_signal_17 = munoc_port_12 & munoc_port_20 & (~munoc_port_15);

MUNOC_MODULE_41
#(
	.MUNOC_GPARA_5(MUNOC_GPARA_3),
	.MUNOC_GPARA_1(`BW_AXI_ALEN),
	.MUNOC_GPARA_6(16),
	.MUNOC_GPARA_4(1),
	.MUNOC_GPARA_2(1),
	.MUNOC_GPARA_3(0)
)
i_munoc_instance_5
(
	.munoc_port_03(munoc_port_09),
	.munoc_port_04(munoc_port_00),
	.munoc_port_00((MUNOC_GPARA_0==1) & munoc_port_06),

	.munoc_port_05(munoc_port_29),
	.munoc_port_01(munoc_port_01&munoc_port_21),
	.munoc_port_11(),
	.munoc_port_07(munoc_port_26),

	.munoc_port_10(munoc_port_04),
	.munoc_port_02(munoc_port_12&munoc_port_20),
	.munoc_port_09(),
	.munoc_port_08(),

	.munoc_port_06(munoc_signal_02)
);

ERVP_VALID_ONCE_CAPTURER
i_munoc_instance_6
(
	.clk(munoc_port_09),
	.rstnn(munoc_port_00),
	.clear(1'b 0),
  .enable(munoc_port_06),
  .valid_once(munoc_signal_03),
	.valid_extended(munoc_signal_16),
  .invalidate(1'b 0)
);

assign munoc_signal_03 = munoc_port_12 & (munoc_port_05==0);

assign munoc_port_30 = {munoc_signal_09,munoc_signal_06,munoc_signal_04,munoc_signal_13,munoc_signal_10,munoc_signal_08,munoc_signal_15,munoc_signal_01,munoc_signal_00,munoc_signal_14,munoc_signal_07,munoc_signal_02,munoc_signal_16};

endmodule
