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
`include "ervp_axi_define.vh"
`include "ervp_ahb_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_10.vh"
`include "munoc_include_03.vh"
`include "munoc_include_06.vh"
`include "munoc_control.vh"
`include "munoc_include_07.vh"





module MUNOC_MODULE_42
(
	munoc_port_10,
	munoc_port_11,

	munoc_port_08,
	munoc_port_30,
	munoc_port_37,
	munoc_port_38,
	munoc_port_17,
	munoc_port_22,
	munoc_port_43,

	munoc_port_06,
	munoc_port_27,
	munoc_port_15,
	munoc_port_28,
	munoc_port_42,
	munoc_port_51, 

	munoc_port_13,
	munoc_port_52,
	munoc_port_31,
	munoc_port_49,

	munoc_port_19,
	munoc_port_23,
	munoc_port_04,
	munoc_port_14,
	munoc_port_07,
	munoc_port_41,
	munoc_port_36,

	munoc_port_44,
	munoc_port_50,
	munoc_port_34,
	munoc_port_20,
	munoc_port_00,
	munoc_port_03,

	munoc_port_33,
	munoc_port_18,
	munoc_port_25,
	munoc_port_45,

	munoc_port_32,

	munoc_port_29,
	munoc_port_05,
	munoc_port_12,
	munoc_port_35,
	munoc_port_40,
	munoc_port_01,
	munoc_port_02,	
	munoc_port_21,
	munoc_port_53,
	munoc_port_09,
	munoc_port_47,
	munoc_port_16,
	munoc_port_39,

	munoc_port_24,
	munoc_port_46,
	munoc_port_48,
	munoc_port_26
);





parameter MUNOC_GPARA_4 = "";
parameter MUNOC_GPARA_3 = -1;
parameter MUNOC_GPARA_1 = 32;
parameter MUNOC_GPARA_2 = 32;

parameter MUNOC_GPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;

localparam  MUNOC_LPARA_0 = "AHB";

input wire munoc_port_10, munoc_port_11;

input wire [MUNOC_GPARA_0-1:0] munoc_port_08;
input wire [MUNOC_GPARA_1-1:0] munoc_port_30;
input wire [`BW_AXI_ALEN-1:0] munoc_port_37;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_38;
input wire [`BW_AXI_ABURST-1:0] munoc_port_17;
input wire munoc_port_22;
output wire munoc_port_43;

input wire [MUNOC_GPARA_0-1:0] munoc_port_06;
input wire [MUNOC_GPARA_2-1:0] munoc_port_27;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_2)-1:0] munoc_port_15;
input wire munoc_port_28;
input wire munoc_port_42;
output wire munoc_port_51;

output wire [MUNOC_GPARA_0-1:0] munoc_port_13;
output wire [`BW_AXI_BRESP-1:0] munoc_port_52;
output wire munoc_port_31;
input wire munoc_port_49;

input wire [MUNOC_GPARA_0-1:0] munoc_port_19;
input wire [MUNOC_GPARA_1-1:0] munoc_port_23;
input wire [`BW_AXI_ALEN-1:0] munoc_port_04;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_14;
input wire [`BW_AXI_ABURST-1:0] munoc_port_07;
input wire munoc_port_41;
output wire munoc_port_36;

output wire [MUNOC_GPARA_0-1:0] munoc_port_44;
output wire [MUNOC_GPARA_2-1:0] munoc_port_50;
output wire [`BW_AXI_RRESP-1:0] munoc_port_34;
output wire munoc_port_20;
output wire munoc_port_00;
input wire munoc_port_03;

output wire munoc_port_33;
input wire [`MUNOC_GDEF_52-1:0] munoc_port_18;
input wire [`MUNOC_GDEF_03-1:0] munoc_port_25;
input wire munoc_port_45;

input wire munoc_port_32;

output wire munoc_port_29;
output wire [MUNOC_GPARA_1-1:0] munoc_port_05;
output wire [`BW_AHB_BURST-1:0] munoc_port_12;
output wire munoc_port_35;
output wire [`BW_AHB_PROT-1:0] munoc_port_40;
output wire [`BW_AHB_SIZE-1:0] munoc_port_01;
output wire [`BW_AHB_TRANS-1:0] munoc_port_02;
output wire munoc_port_21;
output wire [MUNOC_GPARA_2-1:0] munoc_port_53;
output wire munoc_port_09;

input wire munoc_port_47;
input wire munoc_port_16;
input wire [MUNOC_GPARA_2-1:0] munoc_port_39;

input wire [`BW_SVRING_LINK-1:0] munoc_port_24;
output wire munoc_port_46;
output wire [`BW_SVRING_LINK-1:0] munoc_port_48;
input wire munoc_port_26;

wire munoc_signal_03;
wire [MUNOC_GPARA_1-1:0] munoc_signal_02;
wire [`BW_AHB_BURST-1:0] munoc_signal_16;
wire munoc_signal_07;
wire [`BW_AHB_PROT-1:0] munoc_signal_05;
wire [`BW_AHB_SIZE-1:0] munoc_signal_08;
wire [`BW_AHB_TRANS-1:0] munoc_signal_00;
wire munoc_signal_14;
wire [MUNOC_GPARA_2-1:0] munoc_signal_12;
wire munoc_signal_09;
wire munoc_signal_11;
wire [MUNOC_GPARA_2-1:0] munoc_signal_13;

wire [`MUNOC_GDEF_71-1:0] munoc_signal_01;
wire [`MUNOC_GDEF_71-1:0] munoc_signal_04;
wire [`MUNOC_GDEF_24-1:0] munoc_signal_15;
wire [`MUNOC_GDEF_80-1:0] munoc_signal_10;
wire munoc_signal_06;

MUNOC_MODULE_17
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_0),
	.MUNOC_GPARA_1(MUNOC_GPARA_1),
	.MUNOC_GPARA_0(MUNOC_GPARA_2)
)
i_munoc_instance_2
(
	.munoc_port_27(munoc_port_10),
	.munoc_port_22(munoc_port_11),

	.munoc_port_25(munoc_port_08),
	.munoc_port_31(munoc_port_30),
	.munoc_port_44(munoc_port_37),
	.munoc_port_37(munoc_port_38),
	.munoc_port_12(munoc_port_17),
	.munoc_port_04(munoc_port_22),
	.munoc_port_33(munoc_port_43),

	.munoc_port_08(munoc_port_06),
	.munoc_port_15(munoc_port_27),
	.munoc_port_35(munoc_port_15),
	.munoc_port_05(munoc_port_28),
	.munoc_port_17(munoc_port_42),
	.munoc_port_20(munoc_port_51),

	.munoc_port_24(munoc_port_13),
	.munoc_port_18(munoc_port_52),
	.munoc_port_03(munoc_port_31),
	.munoc_port_07(munoc_port_49),

	.munoc_port_01(munoc_port_19),
	.munoc_port_00(munoc_port_23),
	.munoc_port_16(munoc_port_04),
	.munoc_port_11(munoc_port_14),
	.munoc_port_21(munoc_port_07),
	.munoc_port_19(munoc_port_41),
	.munoc_port_13(munoc_port_36),

	.munoc_port_39(munoc_port_44),
	.munoc_port_41(munoc_port_50),
	.munoc_port_36(munoc_port_34),
	.munoc_port_26(munoc_port_20),
	.munoc_port_43(munoc_port_00),
	.munoc_port_32(munoc_port_03),

	.munoc_port_30(munoc_signal_03),
	.munoc_port_14(munoc_signal_02),
	.munoc_port_09(munoc_signal_16),
	.munoc_port_28(munoc_signal_07),
	.munoc_port_23(munoc_signal_05),
	.munoc_port_34(munoc_signal_08),
	.munoc_port_42(munoc_signal_00),
	.munoc_port_06(munoc_signal_14),
	.munoc_port_29(munoc_signal_12),
	.munoc_port_38(),
	.munoc_port_40(munoc_signal_09),
	.munoc_port_02(munoc_signal_11),
	.munoc_port_10(munoc_signal_13)
);

MUNOC_MODULE_37
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_2),
	.MUNOC_GPARA_1(MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.munoc_port_12(munoc_port_32),

	.munoc_port_06(munoc_signal_03),
	.munoc_port_15(munoc_signal_02),
	.munoc_port_21(munoc_signal_16),
	.munoc_port_03(munoc_signal_07),
	.munoc_port_14(munoc_signal_05),
	.munoc_port_17(munoc_signal_08),
	.munoc_port_10(munoc_signal_00),	
	.munoc_port_05(munoc_signal_14),
	.munoc_port_04(munoc_signal_12),	
	.munoc_port_11(munoc_signal_09),
	.munoc_port_16(munoc_signal_11),
	.munoc_port_00(munoc_signal_13),

	.munoc_port_08(munoc_port_29),
	.munoc_port_13(munoc_port_05),
	.munoc_port_22(munoc_port_12),
	.munoc_port_01(munoc_port_35),
	.munoc_port_02(munoc_port_40),
	.munoc_port_19(munoc_port_01),
	.munoc_port_18(munoc_port_02),	
	.munoc_port_23(munoc_port_21),
	.munoc_port_24(munoc_port_53),	
	.munoc_port_09(munoc_port_47),
	.munoc_port_20(munoc_port_16),
	.munoc_port_07(munoc_port_39)
);

assign munoc_port_09 = munoc_port_47;

`ifdef __MUNOC_INCLUDE_CONTROLLER

assign munoc_signal_01 = 0;

MUNOC_MODULE_13
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_4),
	.MUNOC_GPARA_1(MUNOC_GPARA_3),
	.MUNOC_GPARA_0(MUNOC_LPARA_0)
)
i_munoc_instance_1
(
	.munoc_port_04(munoc_port_10),
	.munoc_port_12(munoc_port_11),
	.munoc_port_11(munoc_port_18),
	.munoc_port_03(munoc_port_25),
	.munoc_port_05(munoc_port_45),
	.munoc_port_13(munoc_signal_01),
	.munoc_port_14(munoc_signal_04),
	.munoc_port_08(munoc_signal_15),
	.munoc_port_02(munoc_signal_10),
	.munoc_port_01(munoc_signal_06),
	.munoc_port_09(munoc_port_33),
	.munoc_port_10(munoc_port_24),
	.munoc_port_07(munoc_port_46),
	.munoc_port_00(munoc_port_48),
	.munoc_port_06(munoc_port_26)
);

`else

assign munoc_signal_06 = 0;
assign munoc_port_33 = 0;
assign munoc_port_46 = 0;
assign munoc_port_48 = 0;

`endif

endmodule
