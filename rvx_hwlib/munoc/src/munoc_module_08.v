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
`include "munoc_network_link.vh"
`include "munoc_include_10.vh"
`include "munoc_include_03.vh"
`include "munoc_include_06.vh"
`include "munoc_control.vh"
`include "munoc_include_07.vh"





module MUNOC_MODULE_08
(
	munoc_port_02,
	munoc_port_45,

	munoc_port_46,
	munoc_port_05,
	munoc_port_32,
	munoc_port_38,
	munoc_port_12,
	munoc_port_14,
	munoc_port_08,

	munoc_port_48,
	munoc_port_26,
	munoc_port_07,
	munoc_port_16,
	munoc_port_22,
	munoc_port_41, 

	munoc_port_10,
	munoc_port_20,
	munoc_port_28,
	munoc_port_15,

	munoc_port_13,
	munoc_port_24,
	munoc_port_35,
	munoc_port_33,
	munoc_port_00,
	munoc_port_21,
	munoc_port_43,

	munoc_port_19,
	munoc_port_11,
	munoc_port_18,
	munoc_port_31,
	munoc_port_06,
	munoc_port_01,

	munoc_port_36,
	munoc_port_42,
	munoc_port_03,
	munoc_port_09,

	munoc_port_39,

	munoc_port_44,
	munoc_port_25,
	munoc_port_47,
	munoc_port_37,
	munoc_port_27,
	munoc_port_30,
	munoc_port_29,
	munoc_port_34,

	munoc_port_04,
	munoc_port_40,
	munoc_port_23,
	munoc_port_17
);





parameter MUNOC_GPARA_2 = "";
parameter MUNOC_GPARA_1 = -1;
parameter MUNOC_GPARA_0 = 32;
parameter MUNOC_GPARA_3 = 32;

parameter MUNOC_GPARA_4 = `REQUIRED_BW_OF_SLAVE_TID;

localparam  MUNOC_LPARA_1 = "APB";
localparam  MUNOC_LPARA_2 = (MUNOC_GPARA_3==8);
localparam  MUNOC_LPARA_0 = (MUNOC_LPARA_2==1)? 32 : MUNOC_GPARA_3;

input wire munoc_port_02, munoc_port_45;

input wire [MUNOC_GPARA_4-1:0] munoc_port_46;
input wire [MUNOC_GPARA_0-1:0] munoc_port_05;
input wire [`BW_AXI_ALEN-1:0] munoc_port_32;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_38;
input wire [`BW_AXI_ABURST-1:0] munoc_port_12;
input wire munoc_port_14;
output wire munoc_port_08;

input wire [MUNOC_GPARA_4-1:0] munoc_port_48;
input wire [MUNOC_GPARA_3-1:0] munoc_port_26;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_07;
input wire munoc_port_16;
input wire munoc_port_22;
output wire munoc_port_41;

output wire [MUNOC_GPARA_4-1:0] munoc_port_10;
output wire [`BW_AXI_BRESP-1:0] munoc_port_20;
output wire munoc_port_28;
input wire munoc_port_15;

input wire [MUNOC_GPARA_4-1:0] munoc_port_13;
input wire [MUNOC_GPARA_0-1:0] munoc_port_24;
input wire [`BW_AXI_ALEN-1:0] munoc_port_35;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_33;
input wire [`BW_AXI_ABURST-1:0] munoc_port_00;
input wire munoc_port_21;
output wire munoc_port_43;

output wire [MUNOC_GPARA_4-1:0] munoc_port_19;
output wire [MUNOC_GPARA_3-1:0] munoc_port_11;
output wire [`BW_AXI_RRESP-1:0] munoc_port_18;
output wire munoc_port_31;
output wire munoc_port_06;
input wire munoc_port_01;

output wire munoc_port_36;
input wire [`MUNOC_GDEF_52-1:0] munoc_port_42;
input wire [`MUNOC_GDEF_03-1:0] munoc_port_03;
input wire munoc_port_09;

input wire munoc_port_39;

output wire [MUNOC_GPARA_0-1:0] munoc_port_44;
output wire munoc_port_25;
output wire munoc_port_47;
output wire munoc_port_37;
output wire [MUNOC_GPARA_3-1:0] munoc_port_27;
input wire [MUNOC_GPARA_3-1:0] munoc_port_30;
input wire munoc_port_29;
input wire munoc_port_34;

input wire [`BW_SVRING_LINK-1:0] munoc_port_04;
output wire munoc_port_40;
output wire [`BW_SVRING_LINK-1:0] munoc_port_23;
input wire munoc_port_17;

wire [MUNOC_GPARA_0-1:0] munoc_signal_14;
wire munoc_signal_20;
wire munoc_signal_04;
wire munoc_signal_06;
wire [MUNOC_GPARA_3-1:0] munoc_signal_18;
wire [MUNOC_GPARA_3-1:0] munoc_signal_08;
wire munoc_signal_16;
wire munoc_signal_12;

wire [MUNOC_GPARA_0-1:0] munoc_signal_25;
wire munoc_signal_29;
wire munoc_signal_09;
wire munoc_signal_24;
wire [MUNOC_GPARA_3-1:0] munoc_signal_19;
wire [MUNOC_GPARA_3-1:0] munoc_signal_23;
wire munoc_signal_27;
wire munoc_signal_22;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_28;

wire [MUNOC_GPARA_0-1:0] munoc_signal_00;
wire munoc_signal_15;
wire munoc_signal_03;
wire munoc_signal_10;
wire [8-1:0] munoc_signal_13;
wire [MUNOC_GPARA_3-1:0] munoc_signal_21;
wire munoc_signal_07;
wire munoc_signal_05;

wire [`MUNOC_GDEF_71-1:0] munoc_signal_11;
wire [`MUNOC_GDEF_71-1:0] munoc_signal_01;
wire [`MUNOC_GDEF_24-1:0] munoc_signal_26;
wire [`MUNOC_GDEF_80-1:0] munoc_signal_02;
wire munoc_signal_17;

MUNOC_AXI2APB_CONVERTER_
#(
	.BW_AXI_TID(MUNOC_GPARA_4),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_0),
	.BW_NODE_DATA(MUNOC_GPARA_3)
)
i_munoc_instance_3
(
	.clk(munoc_port_02),
	.rstnn(munoc_port_45),

	.rxawid(munoc_port_46),
	.rxawaddr(munoc_port_05),
	.rxawlen(munoc_port_32),
	.rxawsize(munoc_port_38),
	.rxawburst(munoc_port_12),
	.rxawvalid(munoc_port_14),
	.rxawready(munoc_port_08),

	.rxwid(munoc_port_48),
	.rxwdata(munoc_port_26),
	.rxwstrb(munoc_port_07),
	.rxwlast(munoc_port_16),
	.rxwvalid(munoc_port_22),
	.rxwready(munoc_port_41),

	.rxbid(munoc_port_10),
	.rxbresp(munoc_port_20),
	.rxbvalid(munoc_port_28),
	.rxbready(munoc_port_15),

	.rxarid(munoc_port_13),
	.rxaraddr(munoc_port_24),
	.rxarlen(munoc_port_35),
	.rxarsize(munoc_port_33),
	.rxarburst(munoc_port_00),
	.rxarvalid(munoc_port_21),
	.rxarready(munoc_port_43),

	.rxrid(munoc_port_19),
	.rxrdata(munoc_port_11),
	.rxrresp(munoc_port_18),
	.rxrlast(munoc_port_31),
	.rxrvalid(munoc_port_06),
	.rxrready(munoc_port_01),

	.spaddr(munoc_signal_25),
	.spwrite(munoc_signal_29),
	.spsel(munoc_signal_09),
	.spenable(munoc_signal_24),
	.spwdata(munoc_signal_19),
	.sptid(),
	.sprdata(munoc_signal_23),
	.spready(munoc_signal_27),
	.spslverr(munoc_signal_22),
	.spwstrb(munoc_signal_28)
);

MUNOC_MODULE_32
#(
	.MUNOC_GPARA_2(1),
	.MUNOC_GPARA_0(MUNOC_GPARA_0),
	.MUNOC_GPARA_3(MUNOC_LPARA_0),
	.MUNOC_GPARA_1(8)
)
i_munoc_instance_0
(
	.munoc_port_09(munoc_signal_25),
	.munoc_port_01(munoc_signal_29),
	.munoc_port_15(munoc_signal_09),
	.munoc_port_02(munoc_signal_24),
	.munoc_port_10(munoc_signal_19),
	.munoc_port_17(1'b 0),
	.munoc_port_05(munoc_signal_21),
	.munoc_port_04(munoc_signal_07),
	.munoc_port_06(munoc_signal_05),
	.munoc_port_03(munoc_signal_28),

	.munoc_port_19(munoc_signal_00),
	.munoc_port_12(munoc_signal_15),
	.munoc_port_13(munoc_signal_03),
	.munoc_port_11(munoc_signal_10),
	.munoc_port_14(munoc_signal_13),
	.munoc_port_00(),
	.munoc_port_07(munoc_port_30[7:0]),
	.munoc_port_18(munoc_port_29),
	.munoc_port_16(munoc_port_34),
	.munoc_port_08()
);

assign munoc_signal_14 = (MUNOC_LPARA_2==1)? munoc_signal_00 : munoc_signal_25;
assign munoc_signal_20 = (MUNOC_LPARA_2==1)? munoc_signal_15 : munoc_signal_29;
assign munoc_signal_04 = (MUNOC_LPARA_2==1)? munoc_signal_03 : munoc_signal_09;
assign munoc_signal_06 = (MUNOC_LPARA_2==1)? munoc_signal_10 : munoc_signal_24;
assign munoc_signal_18 = (MUNOC_LPARA_2==1)? munoc_signal_13 : munoc_signal_19;

assign munoc_signal_23 = (MUNOC_LPARA_2==1)? munoc_signal_21 : munoc_signal_08;
assign munoc_signal_27 = (MUNOC_LPARA_2==1)? munoc_signal_07 : munoc_signal_16;
assign munoc_signal_22 = (MUNOC_LPARA_2==1)? munoc_signal_05 : munoc_signal_12;

MUNOC_MODULE_10
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_3),
	.MUNOC_GPARA_0(MUNOC_GPARA_0)
)
i_munoc_instance_2
(
	.munoc_port_11(munoc_port_39),

	.munoc_port_16(munoc_signal_14),
	.munoc_port_08(munoc_signal_20),
	.munoc_port_06(munoc_signal_04),
	.munoc_port_05(munoc_signal_06),
	.munoc_port_00(munoc_signal_18),
	.munoc_port_09(munoc_signal_08),
	.munoc_port_02(munoc_signal_16),
	.munoc_port_12(munoc_signal_12),

	.munoc_port_15(munoc_port_44),
	.munoc_port_01(munoc_port_25),
	.munoc_port_13(munoc_port_47),
	.munoc_port_04(munoc_port_37),
	.munoc_port_10(munoc_port_27),
	.munoc_port_14(munoc_port_30),
	.munoc_port_03(munoc_port_29),
	.munoc_port_07(munoc_port_34)
);

`ifdef __MUNOC_INCLUDE_CONTROLLER

assign munoc_signal_11 = 0;

MUNOC_MODULE_13
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_2),
	.MUNOC_GPARA_1(MUNOC_GPARA_1),
	.MUNOC_GPARA_0(MUNOC_LPARA_1)
)
i_munoc_instance_1
(
	.munoc_port_04(munoc_port_02),
	.munoc_port_12(munoc_port_45),
	.munoc_port_11(munoc_port_42),
	.munoc_port_03(munoc_port_03),
	.munoc_port_05(munoc_port_09),
	.munoc_port_13(munoc_signal_11),
	.munoc_port_14(munoc_signal_01),
	.munoc_port_08(munoc_signal_26),
	.munoc_port_02(munoc_signal_02),
	.munoc_port_01(munoc_signal_17),
	.munoc_port_09(munoc_port_36),
	.munoc_port_10(munoc_port_04),
	.munoc_port_07(munoc_port_40),
	.munoc_port_00(munoc_port_23),
	.munoc_port_06(munoc_port_17)
);

`else

assign munoc_signal_17 = 0;
assign munoc_port_36 = 0;
assign munoc_port_40 = 0;
assign munoc_port_23 = 0;

`endif

endmodule
