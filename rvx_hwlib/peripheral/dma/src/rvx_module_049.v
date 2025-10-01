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
// 2025-07-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_06.vh"





module RVX_MODULE_049
(
	rvx_port_34,
	rvx_port_07,

	rvx_port_35,
	rvx_port_10,
	rvx_port_28,
	rvx_port_19,
	rvx_port_41,
	rvx_port_45,
	rvx_port_27,
	rvx_port_09,

	rvx_port_54,
	rvx_port_06,
	rvx_port_43,
	rvx_port_11,
	rvx_port_17,
	rvx_port_26,
	rvx_port_44,
	rvx_port_48,
	rvx_port_15,
	rvx_port_42,
	rvx_port_50,
	rvx_port_52,
	rvx_port_12,
	rvx_port_32,
	rvx_port_38,
	rvx_port_01,
	rvx_port_24,
	rvx_port_25,
	rvx_port_13,
	rvx_port_47,
	rvx_port_31,
	rvx_port_23,
	rvx_port_14,
	rvx_port_08,
	rvx_port_29,
	rvx_port_18,
	rvx_port_33,
	rvx_port_22,
	rvx_port_21,
	rvx_port_39,
	rvx_port_04,
	rvx_port_53,
	rvx_port_03,
	rvx_port_46,
	rvx_port_30,
	rvx_port_02,
	rvx_port_36,
	rvx_port_40,
	rvx_port_20,
	rvx_port_37,
	rvx_port_51,
	rvx_port_49,
	rvx_port_16,
	rvx_port_00,
	rvx_port_05
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_34, rvx_port_07;
input wire rvx_port_35;
input wire rvx_port_10;
input wire [RVX_GPARA_0-1:0] rvx_port_28;
input wire rvx_port_19;
input wire [RVX_GPARA_1-1:0] rvx_port_41;
output wire [RVX_GPARA_1-1:0] rvx_port_45;
output reg rvx_port_27;
output reg rvx_port_09;

input wire rvx_port_54;

output wire rvx_port_06;
input wire [3-1:0] rvx_port_43;

output wire rvx_port_11;

output wire [32-1:0] rvx_port_17;

output wire rvx_port_50;
output wire rvx_port_52;
output wire [RVX_GPARA_1-1:0] rvx_port_12;
output wire rvx_port_26;
output wire rvx_port_44;
output wire [RVX_GPARA_1-1:0] rvx_port_48;
input wire rvx_port_15;
output wire [32-1:0] rvx_port_42;

output wire rvx_port_13;
output wire rvx_port_47;
output wire [RVX_GPARA_1-1:0] rvx_port_31;
output wire rvx_port_32;
output wire rvx_port_38;
output wire [RVX_GPARA_1-1:0] rvx_port_01;
input wire rvx_port_24;
output wire [32-1:0] rvx_port_25;

output wire rvx_port_33;
output wire rvx_port_22;
output wire [RVX_GPARA_1-1:0] rvx_port_21;
output wire rvx_port_23;
output wire rvx_port_14;
output wire [RVX_GPARA_1-1:0] rvx_port_08;
input wire rvx_port_29;
output wire [32-1:0] rvx_port_18;

output wire rvx_port_30;
output wire rvx_port_02;
output wire [RVX_GPARA_1-1:0] rvx_port_36;
output wire rvx_port_39;
output wire rvx_port_04;
output wire [RVX_GPARA_1-1:0] rvx_port_53;
input wire rvx_port_03;
output wire [32-1:0] rvx_port_46;

output wire rvx_port_16;
output wire rvx_port_00;
output wire [RVX_GPARA_1-1:0] rvx_port_05;
output wire rvx_port_40;
output wire rvx_port_20;
output wire [RVX_GPARA_1-1:0] rvx_port_37;
input wire rvx_port_51;
output wire [32-1:0] rvx_port_49;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_062;
reg [RVX_GPARA_1-1:0] rvx_signal_038;
wire rvx_signal_078;
wire rvx_signal_015;
wire rvx_signal_001;

wire [`RVX_GDEF_015-1:0] paddr_offset = rvx_port_28;
wire [`RVX_GDEF_015-1:0] rvx_signal_041;
wire [RVX_GPARA_0-1:0] rvx_signal_092;
wire [`RVX_GDEF_048-1:0] rvx_signal_097;
wire [`RVX_GDEF_048-1:0] addr_unused = 0;
reg rvx_signal_100;
wire [3-1:0] rvx_signal_017;
reg rvx_signal_085;
wire [3-1:0] rvx_signal_027;
wire rvx_signal_069;
reg rvx_signal_071;
wire [1-1:0] rvx_signal_006;
reg rvx_signal_047;
wire [1-1:0] rvx_signal_089;
wire rvx_signal_024;
reg rvx_signal_096;
wire [32-1:0] rvx_signal_086;
reg rvx_signal_068;
wire [32-1:0] rvx_signal_061;
wire rvx_signal_075;
reg [32-1:0] rvx_signal_025;
reg rvx_signal_042;
wire [32-1:0] rvx_signal_011;
reg rvx_signal_079;
wire [32-1:0] rvx_signal_034;
wire rvx_signal_010;
wire rvx_signal_008;
wire rvx_signal_023;
wire rvx_signal_014;
wire [32-1:0] rvx_signal_013;
wire [RVX_GPARA_1-1:0] rvx_signal_043;
wire rvx_signal_000;
wire rvx_signal_072;
wire rvx_signal_019;
wire [32-1:0] rvx_signal_028;
wire [RVX_GPARA_1-1:0] rvx_signal_073;
reg rvx_signal_065;
wire [32-1:0] rvx_signal_060;
reg rvx_signal_070;
wire [32-1:0] rvx_signal_026;
wire rvx_signal_077;
wire rvx_signal_053;
wire rvx_signal_012;
wire rvx_signal_074;
wire [32-1:0] rvx_signal_057;
wire [RVX_GPARA_1-1:0] rvx_signal_066;
wire rvx_signal_037;
wire rvx_signal_081;
wire rvx_signal_022;
wire [32-1:0] rvx_signal_021;
wire [RVX_GPARA_1-1:0] rvx_signal_045;
reg rvx_signal_018;
wire [32-1:0] rvx_signal_020;
reg rvx_signal_005;
wire [32-1:0] rvx_signal_002;
wire rvx_signal_087;
wire rvx_signal_091;
wire rvx_signal_016;
wire rvx_signal_036;
wire [32-1:0] rvx_signal_084;
wire [RVX_GPARA_1-1:0] rvx_signal_056;
wire rvx_signal_080;
wire rvx_signal_063;
wire rvx_signal_009;
wire [32-1:0] rvx_signal_098;
wire [RVX_GPARA_1-1:0] rvx_signal_044;
reg rvx_signal_054;
wire [32-1:0] rvx_signal_029;
reg rvx_signal_031;
wire [32-1:0] rvx_signal_076;
wire rvx_signal_051;
wire rvx_signal_040;
wire rvx_signal_046;
wire rvx_signal_030;
wire [32-1:0] rvx_signal_099;
wire [RVX_GPARA_1-1:0] rvx_signal_033;
wire rvx_signal_052;
wire rvx_signal_035;
wire rvx_signal_083;
wire [32-1:0] rvx_signal_095;
wire [RVX_GPARA_1-1:0] rvx_signal_049;
reg rvx_signal_058;
wire [32-1:0] rvx_signal_048;
reg rvx_signal_093;
wire [32-1:0] rvx_signal_082;
wire rvx_signal_039;
wire rvx_signal_003;
wire rvx_signal_064;
wire rvx_signal_007;
wire [32-1:0] rvx_signal_004;
wire [RVX_GPARA_1-1:0] rvx_signal_032;
wire rvx_signal_090;
wire rvx_signal_050;
wire rvx_signal_088;
wire [32-1:0] rvx_signal_055;
wire [RVX_GPARA_1-1:0] rvx_signal_067;

assign rvx_signal_062 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_41);
assign rvx_port_45 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_038);
assign {rvx_signal_092,rvx_signal_097} = paddr_offset;
assign rvx_signal_041 = {rvx_signal_092,addr_unused};
assign rvx_signal_001 = (rvx_signal_097==0);
assign rvx_signal_078 = rvx_port_35 & rvx_port_10 & rvx_signal_001 & (~rvx_port_19);
assign rvx_signal_015 = rvx_port_35 & rvx_port_10 & rvx_signal_001 & rvx_port_19;

assign rvx_signal_027 = $unsigned(rvx_port_41);
assign rvx_signal_089 = $unsigned(rvx_port_41);
assign rvx_signal_061 = $unsigned(rvx_port_41);
assign rvx_signal_034 = $unsigned(rvx_port_41);
assign rvx_signal_026 = $unsigned(rvx_port_41);
assign rvx_signal_002 = $unsigned(rvx_port_41);
assign rvx_signal_076 = $unsigned(rvx_port_41);
assign rvx_signal_082 = $unsigned(rvx_port_41);

always@(*)
begin
	rvx_port_09 = 0;
	rvx_signal_038 = 0;
	rvx_port_27 = 1;

	rvx_signal_100 = 0;
	rvx_signal_085 = 0;

	rvx_signal_071 = 0;
	rvx_signal_047 = 0;

	rvx_signal_096 = 0;
	rvx_signal_068 = 0;

	rvx_signal_042 = 0;
	rvx_signal_079 = 0;

	rvx_signal_065 = 0;
	rvx_signal_070 = 0;

	rvx_signal_018 = 0;
	rvx_signal_005 = 0;

	rvx_signal_054 = 0;
	rvx_signal_031 = 0;

	rvx_signal_058 = 0;
	rvx_signal_093 = 0;

	if(rvx_port_35==1'b 1)
	begin
		case(rvx_signal_041)
			`RVX_GDEF_390:
			begin
				rvx_signal_100 = rvx_signal_078;
				rvx_signal_085 = rvx_signal_015;
				rvx_signal_038 = $unsigned(rvx_signal_017);
				rvx_port_27 = rvx_signal_069;
			end
			`RVX_GDEF_173:
			begin
				rvx_signal_071 = rvx_signal_078;
				rvx_signal_047 = rvx_signal_015;
				rvx_signal_038 = $unsigned(rvx_signal_006);
				rvx_port_27 = rvx_signal_024;
			end
			`RVX_GDEF_221:
			begin
				rvx_signal_096 = rvx_signal_078;
				rvx_signal_068 = rvx_signal_015;
				rvx_signal_038 = $unsigned(rvx_signal_086);
				rvx_port_27 = rvx_signal_075;
			end
			`RVX_GDEF_348:
			begin
				rvx_signal_042 = rvx_signal_078;
				rvx_signal_079 = rvx_signal_015;
				rvx_signal_038 = $unsigned(rvx_signal_011);
				rvx_port_27 = rvx_signal_010;
			end
			`RVX_GDEF_362:
			begin
				rvx_signal_065 = rvx_signal_078;
				rvx_signal_070 = rvx_signal_015;
				rvx_signal_038 = $unsigned(rvx_signal_060);
				rvx_port_27 = rvx_signal_077;
			end
			`RVX_GDEF_180:
			begin
				rvx_signal_018 = rvx_signal_078;
				rvx_signal_005 = rvx_signal_015;
				rvx_signal_038 = $unsigned(rvx_signal_020);
				rvx_port_27 = rvx_signal_087;
			end
			`RVX_GDEF_007:
			begin
				rvx_signal_054 = rvx_signal_078;
				rvx_signal_031 = rvx_signal_015;
				rvx_signal_038 = $unsigned(rvx_signal_029);
				rvx_port_27 = rvx_signal_051;
			end
			`RVX_GDEF_085:
			begin
				rvx_signal_058 = rvx_signal_078;
				rvx_signal_093 = rvx_signal_015;
				rvx_signal_038 = $unsigned(rvx_signal_048);
				rvx_port_27 = rvx_signal_039;
			end
			default:
				rvx_port_09 = 1;
		endcase
	end
end

always@(posedge rvx_port_34, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_025 <= `RVX_GDEF_428;
	else if (rvx_signal_068==1'b 1)
		rvx_signal_025 <= rvx_signal_061;
end
assign rvx_signal_086 = rvx_signal_025;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.clk(rvx_port_34),
	.rstnn(rvx_port_07),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_008),
	.wfull(rvx_signal_023),
	.wrequest(rvx_signal_014),
	.wdata(rvx_signal_013),
	.wnum(rvx_signal_043),
	.rready(rvx_signal_000),
	.rempty(rvx_signal_072),
	.rrequest(rvx_signal_019),
	.rdata(rvx_signal_028),
	.rnum(rvx_signal_073)
);
assign rvx_port_50 = rvx_signal_008;
assign rvx_port_52 = rvx_signal_023;
assign rvx_port_12 = rvx_signal_043;
assign rvx_port_26 = rvx_signal_000;
assign rvx_port_44 = rvx_signal_072;
assign rvx_port_48 = rvx_signal_073;
assign rvx_signal_014 = rvx_signal_079;
assign rvx_signal_013 = rvx_signal_034;
assign rvx_signal_011 = rvx_signal_043;
assign rvx_signal_019 = rvx_port_15;
assign rvx_port_42 = rvx_signal_028;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.clk(rvx_port_34),
	.rstnn(rvx_port_07),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_053),
	.wfull(rvx_signal_012),
	.wrequest(rvx_signal_074),
	.wdata(rvx_signal_057),
	.wnum(rvx_signal_066),
	.rready(rvx_signal_037),
	.rempty(rvx_signal_081),
	.rrequest(rvx_signal_022),
	.rdata(rvx_signal_021),
	.rnum(rvx_signal_045)
);
assign rvx_port_13 = rvx_signal_053;
assign rvx_port_47 = rvx_signal_012;
assign rvx_port_31 = rvx_signal_066;
assign rvx_port_32 = rvx_signal_037;
assign rvx_port_38 = rvx_signal_081;
assign rvx_port_01 = rvx_signal_045;
assign rvx_signal_074 = rvx_signal_070;
assign rvx_signal_057 = rvx_signal_026;
assign rvx_signal_060 = rvx_signal_066;
assign rvx_signal_022 = rvx_port_24;
assign rvx_port_25 = rvx_signal_021;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_4
(
	.clk(rvx_port_34),
	.rstnn(rvx_port_07),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_091),
	.wfull(rvx_signal_016),
	.wrequest(rvx_signal_036),
	.wdata(rvx_signal_084),
	.wnum(rvx_signal_056),
	.rready(rvx_signal_080),
	.rempty(rvx_signal_063),
	.rrequest(rvx_signal_009),
	.rdata(rvx_signal_098),
	.rnum(rvx_signal_044)
);
assign rvx_port_33 = rvx_signal_091;
assign rvx_port_22 = rvx_signal_016;
assign rvx_port_21 = rvx_signal_056;
assign rvx_port_23 = rvx_signal_080;
assign rvx_port_14 = rvx_signal_063;
assign rvx_port_08 = rvx_signal_044;
assign rvx_signal_036 = rvx_signal_005;
assign rvx_signal_084 = rvx_signal_002;
assign rvx_signal_020 = rvx_signal_056;
assign rvx_signal_009 = rvx_port_29;
assign rvx_port_18 = rvx_signal_098;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_3
(
	.clk(rvx_port_34),
	.rstnn(rvx_port_07),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_040),
	.wfull(rvx_signal_046),
	.wrequest(rvx_signal_030),
	.wdata(rvx_signal_099),
	.wnum(rvx_signal_033),
	.rready(rvx_signal_052),
	.rempty(rvx_signal_035),
	.rrequest(rvx_signal_083),
	.rdata(rvx_signal_095),
	.rnum(rvx_signal_049)
);
assign rvx_port_30 = rvx_signal_040;
assign rvx_port_02 = rvx_signal_046;
assign rvx_port_36 = rvx_signal_033;
assign rvx_port_39 = rvx_signal_052;
assign rvx_port_04 = rvx_signal_035;
assign rvx_port_53 = rvx_signal_049;
assign rvx_signal_030 = rvx_signal_031;
assign rvx_signal_099 = rvx_signal_076;
assign rvx_signal_029 = rvx_signal_033;
assign rvx_signal_083 = rvx_port_03;
assign rvx_port_46 = rvx_signal_095;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_2
(
	.clk(rvx_port_34),
	.rstnn(rvx_port_07),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_003),
	.wfull(rvx_signal_064),
	.wrequest(rvx_signal_007),
	.wdata(rvx_signal_004),
	.wnum(rvx_signal_032),
	.rready(rvx_signal_090),
	.rempty(rvx_signal_050),
	.rrequest(rvx_signal_088),
	.rdata(rvx_signal_055),
	.rnum(rvx_signal_067)
);
assign rvx_port_16 = rvx_signal_003;
assign rvx_port_00 = rvx_signal_064;
assign rvx_port_05 = rvx_signal_032;
assign rvx_port_40 = rvx_signal_090;
assign rvx_port_20 = rvx_signal_050;
assign rvx_port_37 = rvx_signal_067;
assign rvx_signal_007 = rvx_signal_093;
assign rvx_signal_004 = rvx_signal_082;
assign rvx_signal_048 = rvx_signal_032;
assign rvx_signal_088 = rvx_port_51;
assign rvx_port_49 = rvx_signal_055;
assign rvx_port_06 = rvx_signal_100;
assign rvx_signal_017 = rvx_port_43;
assign rvx_signal_069 = 1;
assign rvx_port_11 = rvx_signal_047;
assign rvx_signal_006 = 0;
assign rvx_signal_024 = 1;
assign rvx_port_17 = rvx_signal_025;
assign rvx_signal_075 = 1;
assign rvx_signal_010 = 1;
assign rvx_signal_077 = 1;
assign rvx_signal_087 = 1;
assign rvx_signal_051 = 1;
assign rvx_signal_039 = 1;

endmodule
