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
`include "munoc_control.vh"
`include "munoc_include_10.vh"
`include "munoc_tid_control_type.vh"
`include "munoc_include_07.vh"



module MUNOC_AXI_MASTER_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,

	sfni_link,
	sfni_ready,
	sbni_link,
	sbni_ready,

	rxawid,
	rxawaddr,
	rxawlen,
	rxawsize,
	rxawburst,
	rxawvalid,
	rxawready,

	rxwid,
	rxwdata,
	rxwstrb,
	rxwlast,
	rxwvalid,
	rxwready, 

	rxbid,
	rxbresp,
	rxbvalid,
	rxbready,

	rxarid,
	rxaraddr,
	rxarlen,
	rxarsize,
	rxarburst,
	rxarvalid,
	rxarready,

	rxrid,
	rxrdata,
	rxrresp,
	rxrlast,
	rxrvalid,
	rxrready,

	local_spaddr,
	local_spwrite,
	local_spsel,
	local_spenable,
	local_spwdata,
	local_sprdata,
	local_spready,
	local_spslverr,

	local_allows_holds,

	svri_rlink,
	svri_rack,
	svri_slink,
	svri_sack
);



parameter NAME = "";
parameter NODE_ID = -1;
parameter BW_FNI_PHIT = 8;
parameter BW_BNI_PHIT = 8;
parameter BW_PLATFORM_ADDR = 32;
parameter BW_NODE_DATA = 32;
parameter BW_AXI_MASTER_TID = `DEFAULT_BW_AXI_TID;
parameter LOCAL_ENABLE = 0;
parameter LOCAL_UPPER_ADDR = 0;

parameter CHECK_WID = 0;
parameter TID_CONTROL_TYPE = `SINGLE_TARGET_SLAVE;

parameter NUM_AXIAR_BUFFER = 4;
parameter NUM_AXIAW_BUFFER = 2;
parameter NUM_AXIW_BUFFER = 4;
parameter NUM_AXIR_BUFFER = 4;
parameter NUM_AXIB_BUFFER = 2;

`include "ervp_log_util.vf"

localparam  MUNOC_LPARA_1 = "AXI";

localparam  MUNOC_LPARA_2 = `MAX(`MAX(`QUANTIZERU(NUM_AXIR_BUFFER,8),NUM_AXIB_BUFFER),2);
localparam  MUNOC_LPARA_0 = NUM_AXIR_BUFFER;

input wire clk, rstnn;

input wire comm_disable;

output wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] sfni_link;
input wire sfni_ready;
input wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] sbni_link;
output wire sbni_ready;

input wire [BW_AXI_MASTER_TID-1:0] rxawid;
input wire [BW_PLATFORM_ADDR-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_MASTER_TID-1:0] rxwid;
input wire [BW_NODE_DATA-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_MASTER_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [BW_AXI_MASTER_TID-1:0] rxarid;
input wire [BW_PLATFORM_ADDR-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_MASTER_TID-1:0] rxrid;
output wire [BW_NODE_DATA-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

output wire [BW_PLATFORM_ADDR-1:0] local_spaddr;
output wire local_spwrite;
output wire local_spsel;
output wire local_spenable;
output wire [BW_NODE_DATA-1:0] local_spwdata;
input wire [BW_NODE_DATA-1:0] local_sprdata;
input wire local_spready;
input wire local_spslverr;

output wire local_allows_holds;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_086;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_012;
wire [`BW_AXI_ALEN-1:0] munoc_signal_115;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_067;
wire [`BW_AXI_ABURST-1:0] munoc_signal_059;
wire munoc_signal_100;
wire munoc_signal_015;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_045;
wire [BW_NODE_DATA-1:0] munoc_signal_097;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_006;
wire munoc_signal_092;
wire munoc_signal_103;
wire munoc_signal_078;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_022;
wire [`BW_AXI_BRESP-1:0] munoc_signal_074;
wire munoc_signal_018;
wire munoc_signal_083;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_082;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_071;
wire [`BW_AXI_ALEN-1:0] munoc_signal_027;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_052;
wire [`BW_AXI_ABURST-1:0] munoc_signal_050;
wire munoc_signal_081;
wire munoc_signal_047;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_110;
wire [BW_NODE_DATA-1:0] munoc_signal_000;
wire [`BW_AXI_RRESP-1:0] munoc_signal_094;
wire munoc_signal_055;
wire munoc_signal_048;
wire munoc_signal_116;

wire [BW_PLATFORM_ADDR-1:0] munoc_signal_004;
wire munoc_signal_093;
wire munoc_signal_105;
wire munoc_signal_024;
wire [BW_NODE_DATA-1:0] munoc_signal_031;
wire [BW_NODE_DATA-1:0] munoc_signal_072;
wire munoc_signal_038;
wire munoc_signal_033;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_005;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_111;
wire [`BW_AXI_ALEN-1:0] munoc_signal_016;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_008;
wire [`BW_AXI_ABURST-1:0] munoc_signal_101;
wire munoc_signal_021;
wire munoc_signal_069;

wire [BW_NODE_DATA-1:0] munoc_signal_108;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_060;
wire munoc_signal_041;
wire munoc_signal_095;
wire munoc_signal_053;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_080;
wire [`BW_AXI_BRESP-1:0] munoc_signal_109;
wire munoc_signal_057;
wire munoc_signal_064;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_051;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_002;
wire [`BW_AXI_ALEN-1:0] munoc_signal_025;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_079;
wire [`BW_AXI_ABURST-1:0] munoc_signal_070;
wire munoc_signal_003;
wire munoc_signal_039;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_065;
wire [BW_NODE_DATA-1:0] munoc_signal_042;
wire [`BW_AXI_RRESP-1:0] munoc_signal_088;
wire munoc_signal_034;
wire munoc_signal_087;
wire munoc_signal_076;

wire munoc_signal_046;
wire munoc_signal_098;
wire [`BW_ARCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_056;
wire munoc_signal_096;
wire munoc_signal_075;
wire [`BW_ARCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_066;

wire munoc_signal_104;
wire munoc_signal_091;
wire [`BW_AWCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_102;
wire munoc_signal_077;
wire munoc_signal_058;
wire [`BW_AWCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_030;

wire munoc_signal_068;
wire munoc_signal_035;
wire [`BW_WCHANNEL(0,BW_NODE_DATA)-1:0] munoc_signal_112;
wire munoc_signal_113;
wire munoc_signal_017;
wire [`BW_WCHANNEL(0,BW_NODE_DATA)-1:0] munoc_signal_084;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_107;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_089;
wire munoc_signal_036;
wire munoc_signal_043;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_061;
wire munoc_signal_032;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_090;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_085;
wire munoc_signal_037;
wire munoc_signal_044;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_049;
wire munoc_signal_009;

wire munoc_signal_040;
wire munoc_signal_019;
wire munoc_signal_073;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_020;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_106;
wire [`BW_AXI_BRESP-1:0] munoc_signal_054;

wire munoc_signal_011;
wire [`BW_AXI_RRESP-1:0] munoc_signal_013;
wire [BW_NODE_DATA-1:0] munoc_signal_001;

wire munoc_signal_014;
wire munoc_signal_062;

wire [`MUNOC_GDEF_55-1:0] munoc_signal_029;
wire [`MUNOC_GDEF_12-1:0] munoc_signal_063;
wire munoc_signal_114;
wire [`MUNOC_GDEF_71-1:0] munoc_signal_028;
wire [`MUNOC_GDEF_71-1:0] munoc_signal_010;
wire [`MUNOC_GDEF_24-1:0] munoc_signal_026;
wire [`MUNOC_GDEF_80-1:0] munoc_signal_007;
wire munoc_signal_023;
wire munoc_signal_099;

MUNOC_MODULE_14
#(
	.MUNOC_GPARA_0(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_2(BW_NODE_DATA),
	.MUNOC_GPARA_1(BW_PLATFORM_ADDR)
)
i_munoc_instance_06
(
	.munoc_port_36(comm_disable),

	.munoc_port_55(rxawid),
	.munoc_port_34(rxawaddr),
	.munoc_port_21(rxawlen),
	.munoc_port_31(rxawsize),
	.munoc_port_20(rxawburst),
	.munoc_port_03(rxawvalid),
	.munoc_port_18(rxawready),

	.munoc_port_09(rxwid),
	.munoc_port_53(rxwdata),
	.munoc_port_57(rxwstrb),
	.munoc_port_02(rxwlast),
	.munoc_port_00(rxwvalid),
	.munoc_port_24(rxwready), 

	.munoc_port_44(rxbid),
	.munoc_port_01(rxbresp),
	.munoc_port_41(rxbvalid),
	.munoc_port_26(rxbready),

	.munoc_port_19(rxarid),
	.munoc_port_15(rxaraddr),
	.munoc_port_29(rxarlen),
	.munoc_port_33(rxarsize),
	.munoc_port_60(rxarburst),
	.munoc_port_52(rxarvalid),
	.munoc_port_28(rxarready),

	.munoc_port_39(rxrid),
	.munoc_port_54(rxrdata),
	.munoc_port_05(rxrresp),
	.munoc_port_45(rxrlast),
	.munoc_port_22(rxrvalid),
	.munoc_port_16(rxrready),

	.munoc_port_56(munoc_signal_086),
	.munoc_port_38(munoc_signal_012),
	.munoc_port_13(munoc_signal_115),
	.munoc_port_17(munoc_signal_067),
	.munoc_port_43(munoc_signal_059),
	.munoc_port_48(munoc_signal_100),
	.munoc_port_10(munoc_signal_015),

	.munoc_port_25(munoc_signal_045),
	.munoc_port_04(munoc_signal_097),
	.munoc_port_51(munoc_signal_006),
	.munoc_port_11(munoc_signal_092),
	.munoc_port_32(munoc_signal_103),
	.munoc_port_30(munoc_signal_078), 

	.munoc_port_14(munoc_signal_022),
	.munoc_port_49(munoc_signal_074),
	.munoc_port_12(munoc_signal_018),
	.munoc_port_46(munoc_signal_083),

	.munoc_port_27(munoc_signal_082),
	.munoc_port_59(munoc_signal_071),
	.munoc_port_40(munoc_signal_027),
	.munoc_port_47(munoc_signal_052),
	.munoc_port_42(munoc_signal_050),
	.munoc_port_35(munoc_signal_081),
	.munoc_port_07(munoc_signal_047),

	.munoc_port_37(munoc_signal_110),
	.munoc_port_08(munoc_signal_000),
	.munoc_port_58(munoc_signal_094),
	.munoc_port_50(munoc_signal_055),
	.munoc_port_23(munoc_signal_048),
	.munoc_port_06(munoc_signal_116)
);

MUNOC_MODULE_10
#(
	.MUNOC_GPARA_1(BW_NODE_DATA),
	.MUNOC_GPARA_0(BW_PLATFORM_ADDR)
)
i_munoc_instance_08
(
	.munoc_port_11(comm_disable),

	.munoc_port_16(munoc_signal_004),
	.munoc_port_08(munoc_signal_093),
	.munoc_port_06(munoc_signal_105),
	.munoc_port_05(munoc_signal_024),
	.munoc_port_00(munoc_signal_031),
	.munoc_port_09(munoc_signal_072),
	.munoc_port_02(munoc_signal_038),
	.munoc_port_12(munoc_signal_033),

	.munoc_port_15(local_spaddr),
	.munoc_port_01(local_spwrite),
	.munoc_port_13(local_spsel),
	.munoc_port_04(local_spenable),
	.munoc_port_10(local_spwdata),
	.munoc_port_14(local_sprdata),
	.munoc_port_03(local_spready),
	.munoc_port_07(local_spslverr)
);

MUNOC_MODULE_20
#(
	.MUNOC_GPARA_6(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_3(BW_NODE_DATA),
	.MUNOC_GPARA_0(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_5(LOCAL_ENABLE),
	.MUNOC_GPARA_4(LOCAL_UPPER_ADDR),
	.MUNOC_GPARA_2(CHECK_WID)
)
i_munoc_instance_03
(
	.munoc_port_30(clk),
	.munoc_port_16(rstnn),

	.munoc_port_17(munoc_signal_086),
	.munoc_port_11(munoc_signal_012),
	.munoc_port_23(munoc_signal_115),
	.munoc_port_52(munoc_signal_067),
	.munoc_port_48(munoc_signal_059),
	.munoc_port_41(munoc_signal_100),
	.munoc_port_69(munoc_signal_015),

	.munoc_port_25(munoc_signal_045),
	.munoc_port_56(munoc_signal_097),
	.munoc_port_18(munoc_signal_006),
	.munoc_port_67(munoc_signal_092),
	.munoc_port_06(munoc_signal_103),
	.munoc_port_10(munoc_signal_078), 

	.munoc_port_68(munoc_signal_022),
	.munoc_port_49(munoc_signal_074),
	.munoc_port_63(munoc_signal_018),
	.munoc_port_64(munoc_signal_083),

	.munoc_port_02(munoc_signal_082),
	.munoc_port_37(munoc_signal_071),
	.munoc_port_38(munoc_signal_027),
	.munoc_port_58(munoc_signal_052),
	.munoc_port_61(munoc_signal_050),
	.munoc_port_13(munoc_signal_081),
	.munoc_port_19(munoc_signal_047),

	.munoc_port_54(munoc_signal_110),
	.munoc_port_24(munoc_signal_000),
	.munoc_port_00(munoc_signal_094),
	.munoc_port_14(munoc_signal_055),
	.munoc_port_09(munoc_signal_048),
	.munoc_port_43(munoc_signal_116),

	.munoc_port_31(munoc_signal_004),
	.munoc_port_34(munoc_signal_093),
	.munoc_port_03(munoc_signal_105),
	.munoc_port_21(munoc_signal_024),
	.munoc_port_32(munoc_signal_031),
	.munoc_port_45(munoc_signal_072),
	.munoc_port_12(munoc_signal_038),
	.munoc_port_55(munoc_signal_033),
	.munoc_port_50(local_allows_holds),

	.munoc_port_29(munoc_signal_005),
	.munoc_port_60(munoc_signal_111),
	.munoc_port_47(munoc_signal_016),
	.munoc_port_70(munoc_signal_008),
	.munoc_port_05(munoc_signal_101),
	.munoc_port_36(munoc_signal_021),
	.munoc_port_51(munoc_signal_069),

	.munoc_port_65(),
	.munoc_port_26(munoc_signal_108),
	.munoc_port_59(munoc_signal_060),
	.munoc_port_57(munoc_signal_041),
	.munoc_port_62(munoc_signal_095),
	.munoc_port_08(munoc_signal_053), 

	.munoc_port_33(munoc_signal_080),
	.munoc_port_27(munoc_signal_109),
	.munoc_port_22(munoc_signal_057),
	.munoc_port_15(munoc_signal_064),

	.munoc_port_66(munoc_signal_051),
	.munoc_port_35(munoc_signal_002),
	.munoc_port_20(munoc_signal_025),
	.munoc_port_44(munoc_signal_079),
	.munoc_port_46(munoc_signal_070),
	.munoc_port_53(munoc_signal_003),
	.munoc_port_42(munoc_signal_039),

	.munoc_port_04(munoc_signal_065),
	.munoc_port_01(munoc_signal_042),
	.munoc_port_40(munoc_signal_088),
	.munoc_port_28(munoc_signal_034),
	.munoc_port_39(munoc_signal_087),
	.munoc_port_07(munoc_signal_076)
);

MUNOC_MODULE_01
#(
	.MUNOC_GPARA_0(`BW_ARCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)),
	.MUNOC_GPARA_1(NUM_AXIAR_BUFFER)
)
i_munoc_instance_04
(
	.munoc_port_0(clk),
	.munoc_port_1(rstnn),
	.munoc_port_7(munoc_signal_046),
	.munoc_port_6(munoc_signal_098),
	.munoc_port_2(munoc_signal_056),
	.munoc_port_4(munoc_signal_096),
	.munoc_port_3(munoc_signal_075),
	.munoc_port_5(munoc_signal_066)
);

assign munoc_signal_039 = munoc_signal_046;
assign munoc_signal_098 = munoc_signal_003;
assign munoc_signal_056 = {munoc_signal_051,munoc_signal_002,munoc_signal_025,munoc_signal_079,munoc_signal_070};

MUNOC_MODULE_01
#(
	.MUNOC_GPARA_0(`BW_AWCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)),
	.MUNOC_GPARA_1(NUM_AXIAW_BUFFER)
)
i_munoc_instance_01
(
	.munoc_port_0(clk),
	.munoc_port_1(rstnn),
	.munoc_port_7(munoc_signal_104),
	.munoc_port_6(munoc_signal_091),
	.munoc_port_2(munoc_signal_102),
	.munoc_port_4(munoc_signal_077),
	.munoc_port_3(munoc_signal_058),
	.munoc_port_5(munoc_signal_030)
);

assign munoc_signal_069 = munoc_signal_104;
assign munoc_signal_091 = munoc_signal_021;
assign munoc_signal_102 = {munoc_signal_005,munoc_signal_111,munoc_signal_016,munoc_signal_008,munoc_signal_101};

MUNOC_MODULE_01
#(
	.MUNOC_GPARA_0(`BW_WCHANNEL(0,BW_NODE_DATA)),
	.MUNOC_GPARA_1(NUM_AXIW_BUFFER)
)
i_munoc_instance_11
(
	.munoc_port_0(clk),
	.munoc_port_1(rstnn),
	.munoc_port_7(munoc_signal_068),
	.munoc_port_6(munoc_signal_035),
	.munoc_port_2(munoc_signal_084),
	.munoc_port_4(munoc_signal_113),
	.munoc_port_3(munoc_signal_017),
	.munoc_port_5(munoc_signal_112)
);

assign munoc_signal_053 = munoc_signal_068;
assign munoc_signal_035 = munoc_signal_095;
assign munoc_signal_084 = {munoc_signal_108,munoc_signal_060,munoc_signal_041};

MUNOC_MODULE_02
#(
	.MUNOC_GPARA_4(NODE_ID),
	.MUNOC_GPARA_2(BW_FNI_PHIT),
	.MUNOC_GPARA_1(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_0(BW_NODE_DATA),
	.MUNOC_GPARA_3(BW_AXI_MASTER_TID)
)
i_munoc_instance_09
(
	.munoc_port_06(clk),
	.munoc_port_21(rstnn),
	.munoc_port_01(munoc_signal_096),
	.munoc_port_13(munoc_signal_075),
	.munoc_port_14(munoc_signal_066),
	.munoc_port_09(munoc_signal_077),
	.munoc_port_08(munoc_signal_058),
	.munoc_port_00(munoc_signal_030),
	.munoc_port_04(munoc_signal_113),
	.munoc_port_07(munoc_signal_017),
	.munoc_port_03(munoc_signal_112),
	.munoc_port_16(sfni_link),
	.munoc_port_15(sfni_ready),
	.munoc_port_22(munoc_signal_099),
	.munoc_port_19(munoc_signal_107),
	.munoc_port_17(munoc_signal_089),
	.munoc_port_12(munoc_signal_036),
	.munoc_port_11(munoc_signal_043),
	.munoc_port_10(munoc_signal_090),
	.munoc_port_20(munoc_signal_085),
	.munoc_port_05(munoc_signal_037),
	.munoc_port_18(munoc_signal_044),
	.munoc_port_02(munoc_signal_029)
);

MUNOC_MODULE_33
#(
	.MUNOC_GPARA_1(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_0(`BW_SLAVE_NODE_ID),
	.MUNOC_GPARA_2(TID_CONTROL_TYPE)
)
i_munoc_instance_00
(
	.munoc_port_08(clk),
	.munoc_port_09(rstnn),
	.munoc_port_07(munoc_signal_107),
	.munoc_port_04(munoc_signal_089),
	.munoc_port_03(munoc_signal_036),
	.munoc_port_05(munoc_signal_043),
	.munoc_port_06(clk),
	.munoc_port_02(rstnn),
	.munoc_port_00(munoc_signal_061),
	.munoc_port_01(munoc_signal_032)
);

MUNOC_MODULE_33
#(
	.MUNOC_GPARA_1(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_0(`BW_SLAVE_NODE_ID),
	.MUNOC_GPARA_2(TID_CONTROL_TYPE)
)
i_munoc_instance_02
(
	.munoc_port_08(clk),
	.munoc_port_09(rstnn),
	.munoc_port_07(munoc_signal_090),
	.munoc_port_04(munoc_signal_085),
	.munoc_port_03(munoc_signal_037),
	.munoc_port_05(munoc_signal_044),
	.munoc_port_06(clk),
	.munoc_port_02(rstnn),
	.munoc_port_00(munoc_signal_049),
	.munoc_port_01(munoc_signal_009)
);

MUNOC_MODULE_22
#(
	 .MUNOC_GPARA_3(BW_BNI_PHIT),
	 .MUNOC_GPARA_0(BW_PLATFORM_ADDR),
	 .MUNOC_GPARA_2(BW_NODE_DATA),
	 .MUNOC_GPARA_4(BW_AXI_MASTER_TID),
	 .MUNOC_GPARA_1(MUNOC_LPARA_2),
	 .MUNOC_GPARA_5(MUNOC_LPARA_0)
)
i_munoc_instance_10
(
	.munoc_port_06(clk),
	.munoc_port_08(rstnn),

	.munoc_port_01(sbni_link),
	.munoc_port_03(sbni_ready),
	.munoc_port_09(munoc_signal_099),

	.munoc_port_07(munoc_signal_040),
	.munoc_port_04(munoc_signal_019),
	.munoc_port_11(munoc_signal_073),

	.munoc_port_05(munoc_signal_020),
	.munoc_port_15(munoc_signal_106),
	.munoc_port_10(munoc_signal_054),

	.munoc_port_02(munoc_signal_011),
	.munoc_port_12(munoc_signal_013),
	.munoc_port_13(munoc_signal_001),

	.munoc_port_14(munoc_signal_014),
	.munoc_port_00(munoc_signal_062)
);

MUNOC_MODULE_43
#(
	.MUNOC_GPARA_3(NODE_ID),
	.MUNOC_GPARA_1(BW_BNI_PHIT),
	.MUNOC_GPARA_2(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_4(BW_NODE_DATA),
	.MUNOC_GPARA_0(BW_AXI_MASTER_TID)
)
i_munoc_instance_12
(
	.munoc_port_21(clk),
	.munoc_port_19(rstnn),

	.munoc_port_03(munoc_signal_040),
	.munoc_port_00(munoc_signal_019),
	.munoc_port_22(munoc_signal_073),
	.munoc_port_14(munoc_signal_020),
	.munoc_port_26(munoc_signal_106),
	.munoc_port_25(munoc_signal_054),
	.munoc_port_23(munoc_signal_011),
	.munoc_port_09(munoc_signal_013),
	.munoc_port_15(munoc_signal_001),
	.munoc_port_12(munoc_signal_014),
	.munoc_port_01(munoc_signal_062),

	.munoc_port_24(munoc_signal_061),
	.munoc_port_02(munoc_signal_032),
	.munoc_port_17(munoc_signal_049),
	.munoc_port_13(munoc_signal_009),

	.munoc_port_16(munoc_signal_080),
	.munoc_port_18(munoc_signal_109),
	.munoc_port_28(munoc_signal_057),
	.munoc_port_07(munoc_signal_064),
	.munoc_port_05(munoc_signal_065),
	.munoc_port_08(munoc_signal_042),
	.munoc_port_06(munoc_signal_088),
	.munoc_port_10(munoc_signal_034),
	.munoc_port_04(munoc_signal_087),
	.munoc_port_20(munoc_signal_076),

	.munoc_port_27(munoc_signal_063),
	.munoc_port_11(munoc_signal_114)
);

`ifdef __MUNOC_INCLUDE_CONTROLLER

MUNOC_MODULE_26
#(
	.MUNOC_GPARA_6(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_7(BW_NODE_DATA),
	.MUNOC_GPARA_5(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_3(CHECK_WID),
	.MUNOC_GPARA_1(1)
)
i_munoc_instance_05
(
	.munoc_port_01(clk),
	.munoc_port_35(rstnn),
	.munoc_port_14(munoc_signal_023),

	.munoc_port_20(rxawid),
	.munoc_port_33(rxawaddr),
	.munoc_port_21(rxawlen),
	.munoc_port_32(rxawsize),
	.munoc_port_04(rxawburst),
	.munoc_port_22(rxawvalid),
	.munoc_port_30(rxawready),

	.munoc_port_13(rxwid),
	.munoc_port_31(rxwdata),
	.munoc_port_08(rxwstrb),
	.munoc_port_12(rxwlast),
	.munoc_port_27(rxwvalid),
	.munoc_port_18(rxwready), 

	.munoc_port_26(rxbid),
	.munoc_port_25(rxbresp),
	.munoc_port_29(rxbvalid),
	.munoc_port_02(rxbready),

	.munoc_port_28(rxarid),
	.munoc_port_34(rxaraddr),
	.munoc_port_05(rxarlen),
	.munoc_port_11(rxarsize),
	.munoc_port_36(rxarburst),
	.munoc_port_16(rxarvalid),
	.munoc_port_06(rxarready),

	.munoc_port_23(rxrid),
	.munoc_port_10(rxrdata),
	.munoc_port_03(rxrresp),
	.munoc_port_09(rxrlast),
	.munoc_port_07(rxrvalid),
	.munoc_port_19(rxrready),

	.munoc_port_24(munoc_signal_028),
	.munoc_port_00(munoc_signal_010),
	.munoc_port_15(munoc_signal_026),
	.munoc_port_17(munoc_signal_007)
);

MUNOC_MODULE_03
#(
	.MUNOC_GPARA_0(NAME),
	.MUNOC_GPARA_2(NODE_ID),
	.MUNOC_GPARA_1(MUNOC_LPARA_1)
)
i_munoc_instance_07
(
	.munoc_port_07(clk),
	.munoc_port_13(rstnn),
	.munoc_port_06(munoc_signal_029),
	.munoc_port_09(munoc_signal_063),
	.munoc_port_14(munoc_signal_114),
	.munoc_port_11(munoc_signal_028),
	.munoc_port_02(munoc_signal_010),
	.munoc_port_10(munoc_signal_026),
	.munoc_port_12(munoc_signal_007),
	.munoc_port_08(munoc_signal_023),
	.munoc_port_05(munoc_signal_099),
	.munoc_port_03(svri_rlink),
	.munoc_port_01(svri_rack),
	.munoc_port_00(svri_slink),
	.munoc_port_04(svri_sack)
);

`else

assign munoc_signal_023 = 0;
assign munoc_signal_099 = 0;
assign svri_rack = 0;
assign svri_slink = 0;

`endif

endmodule
