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
`include "munoc_include_00.vh"
`include "munoc_control.vh"





module MUNOC_MODULE_06
(
	munoc_port_13,
	munoc_port_00,
	munoc_port_11,
	munoc_port_35,
	
	munoc_port_08,
	munoc_port_31,
	munoc_port_03,
	munoc_port_38,

	munoc_port_33,
	munoc_port_15,
	munoc_port_19,
	munoc_port_02,
	munoc_port_22,
	munoc_port_25,
	munoc_port_20,

	munoc_port_26,
	munoc_port_14,
	munoc_port_37,
	munoc_port_36,
	munoc_port_10,
	munoc_port_34, 

	munoc_port_41,
	munoc_port_16,
	munoc_port_27,
	munoc_port_05,

	munoc_port_40,
	munoc_port_21,
	munoc_port_32,
	munoc_port_04,
	munoc_port_07,
	munoc_port_18,
	munoc_port_01,

	munoc_port_23,
	munoc_port_09,
	munoc_port_12,
	munoc_port_39,
	munoc_port_29,
	munoc_port_28,

	munoc_port_06,
	munoc_port_17,
	munoc_port_24,
	munoc_port_30
);





parameter MUNOC_GPARA_01 = -1;
parameter MUNOC_GPARA_09 = 8;
parameter MUNOC_GPARA_11 = 8;
parameter MUNOC_GPARA_03 = 32;
parameter MUNOC_GPARA_00 = 32;
parameter MUNOC_GPARA_05 = `DEFAULT_BW_AXI_TID;
parameter MUNOC_GPARA_12 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_06 = `LLIMIT_OF_DATA_WIDTH;

parameter MUNOC_GPARA_10 = 2;
parameter MUNOC_GPARA_07 = 2;
parameter MUNOC_GPARA_08 = 4;
parameter MUNOC_GPARA_04 = 4;
parameter MUNOC_GPARA_13 = 2;

parameter MUNOC_GPARA_02 = 1;
parameter MUNOC_GPARA_14 = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_2 = (MUNOC_GPARA_02==1)? ((MUNOC_GPARA_14==1)? `BW_MASTER_NODE_ID : MUNOC_GPARA_05) : `MAX(MUNOC_GPARA_05,`REQUIRED_BW_OF_SLAVE_TID);
localparam  MUNOC_LPARA_1 = `MAX(`MAX(`QUANTIZERU(MUNOC_GPARA_10,8),MUNOC_GPARA_07),2);
localparam  MUNOC_LPARA_0 = MUNOC_GPARA_08;

input wire munoc_port_13, munoc_port_00;
input wire munoc_port_11, munoc_port_35;

input wire [`BW_FNI_LINK(MUNOC_GPARA_09)-1:0] munoc_port_08;
output wire munoc_port_31;
output wire [`BW_BNI_LINK(MUNOC_GPARA_11)-1:0] munoc_port_03;
input wire munoc_port_38;

output wire [MUNOC_LPARA_2-1:0] munoc_port_33;
output wire [MUNOC_GPARA_03-1:0] munoc_port_15;
output wire [`BW_AXI_ALEN-1:0] munoc_port_19;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_02;
output wire [`BW_AXI_ABURST-1:0] munoc_port_22;
output wire munoc_port_25;
input wire munoc_port_20;

output wire [MUNOC_LPARA_2-1:0] munoc_port_26;
output wire [MUNOC_GPARA_00-1:0] munoc_port_14;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_00)-1:0] munoc_port_37;
output wire munoc_port_36;
output wire munoc_port_10;
input wire munoc_port_34;

input wire [MUNOC_LPARA_2-1:0] munoc_port_41;
input wire [`BW_AXI_BRESP-1:0] munoc_port_16;
input wire munoc_port_27;
output wire munoc_port_05;

output wire [MUNOC_LPARA_2-1:0] munoc_port_40;
output wire [MUNOC_GPARA_03-1:0] munoc_port_21;
output wire [`BW_AXI_ALEN-1:0] munoc_port_32;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_04;
output wire [`BW_AXI_ABURST-1:0] munoc_port_07;
output wire munoc_port_18;
input wire munoc_port_01;

input wire [MUNOC_LPARA_2-1:0] munoc_port_23;
input wire [MUNOC_GPARA_00-1:0] munoc_port_09;
input wire [`BW_AXI_RRESP-1:0] munoc_port_12;
input wire munoc_port_39;
input wire munoc_port_29;
output wire munoc_port_28;

input wire munoc_port_06;
output wire [`MUNOC_GDEF_52-1:0] munoc_port_17;
output wire [`MUNOC_GDEF_03-1:0] munoc_port_24;
output wire munoc_port_30;

genvar i;

wire munoc_signal_19;
wire munoc_signal_01;
wire munoc_signal_20;
wire munoc_signal_14;

wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_05;
wire [`MUNOC_GDEF_33-1:0] munoc_signal_36;
wire [`MUNOC_GDEF_23-1:0] munoc_signal_13;
wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_25;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_00;
wire [MUNOC_GPARA_03-1:0] munoc_signal_11;
wire [`BW_AXI_ALEN-1:0] munoc_signal_31;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_39;
wire [`BW_AXI_ABURST-1:0] munoc_signal_22;

wire munoc_signal_07;
wire [MUNOC_GPARA_12-1:0] munoc_signal_34;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_12)-1:0] munoc_signal_35;

wire munoc_signal_12;
wire munoc_signal_42;
wire [`MUNOC_GDEF_13-1:0] munoc_signal_29;

wire munoc_signal_32;
wire munoc_signal_18;
wire [`MUNOC_GDEF_56-1:0] munoc_signal_10;
wire munoc_signal_03;
wire munoc_signal_06;
wire [`MUNOC_GDEF_56-1:0] munoc_signal_15;

wire munoc_signal_38;
wire munoc_signal_33;
wire [`MUNOC_GDEF_93(MUNOC_GPARA_00)-1:0] munoc_signal_23;

wire munoc_signal_26;
wire munoc_signal_41;
wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_signal_37;
wire munoc_signal_17;
wire munoc_signal_28;
wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_signal_24;

wire [MUNOC_GPARA_12/`LLIMIT_OF_DATA_WIDTH-1:0] munoc_signal_16;
wire munoc_signal_27;
wire munoc_signal_09;
wire munoc_signal_40;
wire [`BW_RCHANNEL(MUNOC_LPARA_2,MUNOC_GPARA_12)-1:0] munoc_signal_08;

wire munoc_signal_02;
wire [`MUNOC_GDEF_23-1:0] munoc_signal_04;
wire munoc_signal_21;
wire [`BW_RCHANNEL(MUNOC_LPARA_2,MUNOC_GPARA_12)-1:0] munoc_signal_30;

MUNOC_MODULE_21
#(
	.MUNOC_GPARA_3(MUNOC_GPARA_09),
	.MUNOC_GPARA_2(MUNOC_GPARA_03),
	.MUNOC_GPARA_0(MUNOC_GPARA_12),
	.MUNOC_GPARA_4(MUNOC_LPARA_1),
	.MUNOC_GPARA_1(MUNOC_LPARA_0)
)
i_munoc_instance_2
(
	.munoc_port_11(munoc_port_11),
	.munoc_port_14(munoc_port_35),
	.munoc_port_20(munoc_port_13),
	.munoc_port_01(munoc_port_00),

	.munoc_port_07(munoc_port_08),
	.munoc_port_06(munoc_port_31),
	.munoc_port_02(munoc_port_06),

	.munoc_port_17(munoc_signal_19),
	.munoc_port_15(munoc_signal_01),

	.munoc_port_00(munoc_signal_05),
	.munoc_port_18(munoc_signal_36),
	.munoc_port_09(munoc_signal_13),
	.munoc_port_21(munoc_signal_25),
	.munoc_port_16(munoc_signal_00),
	.munoc_port_03(munoc_signal_11),
	.munoc_port_10(munoc_signal_31),
	.munoc_port_13(munoc_signal_39),
	.munoc_port_12(munoc_signal_22),

	.munoc_port_19(munoc_signal_07),
	.munoc_port_22(munoc_signal_34),
	.munoc_port_08(munoc_signal_35),

	.munoc_port_05(munoc_signal_20),
	.munoc_port_04(munoc_signal_14)
);

MUNOC_MODULE_35
#(
	.MUNOC_GPARA_3(MUNOC_GPARA_01),
	.MUNOC_GPARA_6(MUNOC_GPARA_09),
	.MUNOC_GPARA_2(MUNOC_GPARA_03),
	.MUNOC_GPARA_7(MUNOC_GPARA_00),
	.MUNOC_GPARA_1(MUNOC_LPARA_2),
	.MUNOC_GPARA_4(MUNOC_GPARA_12),
	.MUNOC_GPARA_0(MUNOC_GPARA_02),
	.MUNOC_GPARA_5(MUNOC_GPARA_14)
)
i_munoc_instance_7
(
	.munoc_port_16(munoc_port_13),
	.munoc_port_19(munoc_port_00),

	.munoc_port_11(munoc_signal_19),
	.munoc_port_38(munoc_signal_01),
	.munoc_port_47(munoc_signal_05),
	.munoc_port_12(munoc_signal_36),
	.munoc_port_07(munoc_signal_13),
	.munoc_port_21(munoc_signal_25),
	.munoc_port_48(munoc_signal_00),
	.munoc_port_34(munoc_signal_11),
	.munoc_port_45(munoc_signal_31),
	.munoc_port_43(munoc_signal_39),
	.munoc_port_06(munoc_signal_22),
	.munoc_port_20(munoc_signal_07),
	.munoc_port_08(munoc_signal_34),
	.munoc_port_22(munoc_signal_35),
	.munoc_port_10(munoc_signal_20),
	.munoc_port_40(munoc_signal_14),

	.munoc_port_37(munoc_signal_29),
	.munoc_port_42(munoc_signal_12),
	.munoc_port_18(munoc_signal_42),
	.munoc_port_15(munoc_signal_32),
	.munoc_port_14(munoc_signal_18),
	.munoc_port_17(munoc_signal_10),
	.munoc_port_35(munoc_signal_23),
	.munoc_port_29(munoc_signal_38),
	.munoc_port_23(munoc_signal_33),

	.munoc_port_46(munoc_port_33),
	.munoc_port_27(munoc_port_15),
	.munoc_port_36(munoc_port_19),
	.munoc_port_03(munoc_port_02),
	.munoc_port_02(munoc_port_22),
	.munoc_port_44(munoc_port_25),
	.munoc_port_30(munoc_port_20),

	.munoc_port_00(munoc_port_26),
	.munoc_port_26(munoc_port_14),
	.munoc_port_05(munoc_port_37),
	.munoc_port_28(munoc_port_36),
	.munoc_port_13(munoc_port_10),
	.munoc_port_32(munoc_port_34),

	.munoc_port_01(munoc_port_40),
	.munoc_port_39(munoc_port_21),
	.munoc_port_31(munoc_port_32),
	.munoc_port_25(munoc_port_04),
	.munoc_port_04(munoc_port_07),
	.munoc_port_33(munoc_port_18),
	.munoc_port_24(munoc_port_01),

	.munoc_port_41(munoc_port_17),
	.munoc_port_09(munoc_port_30)
);

MUNOC_MODULE_28
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_02),
	.MUNOC_GPARA_3(MUNOC_GPARA_00),
	.MUNOC_GPARA_2(MUNOC_LPARA_2),
	.MUNOC_GPARA_0(MUNOC_GPARA_07)
)
i_munoc_instance_0
(
	.munoc_port_10(munoc_port_13),
	.munoc_port_11(munoc_port_00),

	.munoc_port_03(munoc_signal_38),
	.munoc_port_01(munoc_signal_33),
	.munoc_port_02(munoc_signal_23),

	.munoc_port_06(munoc_port_41),
	.munoc_port_08(munoc_port_16),
	.munoc_port_07(munoc_port_27),
	.munoc_port_05(munoc_port_05),

	.munoc_port_04(munoc_signal_26),
	.munoc_port_09(munoc_signal_41),
	.munoc_port_00(munoc_signal_37)
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)),
	.DEPTH(MUNOC_GPARA_13)
)
i_munoc_instance_5
(
	.wclk(munoc_port_13),
	.wrstnn(munoc_port_00),
	.wready(munoc_signal_26),
	.wrequest(munoc_signal_41),
	.wdata(munoc_signal_37),
	.rclk(munoc_port_11),
	.rrstnn(munoc_port_35),
	.rready(munoc_signal_17),
	.rrequest(munoc_signal_28),
	.rdata(munoc_signal_24),
	.wfull(),
	.rempty()
);

MUNOC_MODULE_16
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_00),
	.MUNOC_GPARA_4(MUNOC_LPARA_2),
	.MUNOC_GPARA_2(`LLIMIT_OF_DATA_WIDTH),
	.MUNOC_GPARA_3(MUNOC_GPARA_12),
	.MUNOC_GPARA_1(MUNOC_GPARA_10)
)
i_munoc_instance_4
(
	.munoc_port_07(munoc_port_13),
	.munoc_port_12(munoc_port_00),

	.munoc_port_03(munoc_signal_12),
	.munoc_port_05(munoc_signal_42),
	.munoc_port_04(munoc_signal_29),

	.munoc_port_00(munoc_port_23),
	.munoc_port_06(munoc_port_09),
	.munoc_port_01(munoc_port_12),
	.munoc_port_02(munoc_port_39),
	.munoc_port_08(munoc_port_29),
	.munoc_port_13(munoc_port_28),
	
	.munoc_port_09(munoc_signal_16),
	.munoc_port_14(munoc_signal_27),
	.munoc_port_11(munoc_signal_09),
	.munoc_port_15(munoc_signal_40),
	.munoc_port_10(munoc_signal_08)
);

MUNOC_MODULE_27
#(
	.MUNOC_GPARA_4(MUNOC_LPARA_2),
	.MUNOC_GPARA_1(MUNOC_GPARA_12),
	.MUNOC_GPARA_3(`LLIMIT_OF_DATA_WIDTH),
	.MUNOC_GPARA_0(MUNOC_GPARA_04)
)
i_munoc_instance_1
(
	.munoc_port_03(munoc_port_13),
	.munoc_port_01(munoc_port_00),
	.munoc_port_08(munoc_port_11),
	.munoc_port_12(munoc_port_35),

	.munoc_port_05(munoc_signal_16),
	.munoc_port_11(munoc_signal_27),
	.munoc_port_10(munoc_signal_09),
	.munoc_port_06(munoc_signal_40),
	.munoc_port_00(munoc_signal_08),

	.munoc_port_04(munoc_signal_02),
	.munoc_port_09(munoc_signal_04),
	.munoc_port_02(munoc_signal_21),
	.munoc_port_07(munoc_signal_30)
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_56),
	.DEPTH(MUNOC_GPARA_10)
)
i_munoc_instance_6
(
	.wclk(munoc_port_13),
	.wrstnn(munoc_port_00),
	.wready(munoc_signal_32),
	.wrequest(munoc_signal_18),
	.wdata(munoc_signal_10),
	.rclk(munoc_port_11),
	.rrstnn(munoc_port_35),
	.rready(munoc_signal_03),
	.rrequest(munoc_signal_06),
	.rdata(munoc_signal_15),
	.wfull(),
	.rempty()
);

MUNOC_MODULE_00
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_01),
	.MUNOC_GPARA_1(MUNOC_LPARA_2),
	.MUNOC_GPARA_3(MUNOC_GPARA_11),
	.MUNOC_GPARA_5(MUNOC_GPARA_03),
	.MUNOC_GPARA_4(MUNOC_GPARA_12),
	.MUNOC_GPARA_2(MUNOC_GPARA_02)
)
i_munoc_instance_3
(
	.munoc_port_00(munoc_port_11),
	.munoc_port_13(munoc_port_35),
	.munoc_port_03(munoc_signal_17),
	.munoc_port_05(munoc_signal_28),
	.munoc_port_10(munoc_signal_24),
	.munoc_port_04(munoc_signal_03),
	.munoc_port_06(munoc_signal_06),
	.munoc_port_08(munoc_signal_15),
	.munoc_port_01(munoc_signal_02),
	.munoc_port_02(munoc_signal_04),
	.munoc_port_12(munoc_signal_21),
	.munoc_port_11(munoc_signal_30),
	.munoc_port_15(munoc_port_03),
	.munoc_port_14(munoc_port_38),
	.munoc_port_09(munoc_port_06),
	.munoc_port_07(munoc_port_24)
);

endmodule
