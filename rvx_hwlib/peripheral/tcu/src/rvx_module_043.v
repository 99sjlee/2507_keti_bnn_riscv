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
`include "rvx_include_09.vh"




module RVX_MODULE_043
(
	rvx_port_05,
	rvx_port_03,

	rvx_port_04,
	rvx_port_12,
	rvx_port_11,
	rvx_port_09,
	rvx_port_07,
	rvx_port_06,
	rvx_port_10,
	rvx_port_01,

	rvx_port_00,
	rvx_port_02,
	rvx_port_08,
	rvx_port_13,
	rvx_port_14
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_05, rvx_port_03;
input wire rvx_port_04;
input wire rvx_port_12;
input wire [RVX_GPARA_1-1:0] rvx_port_11;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_07;
output wire [RVX_GPARA_0-1:0] rvx_port_06;
output reg rvx_port_10;
output reg rvx_port_01;

input wire rvx_port_00;

output wire [8-1:0] rvx_port_02;

output wire [(32)*(8)-1:0] rvx_port_08;

output wire [(32)*(8)-1:0] rvx_port_13;

output wire [(32)*(8)-1:0] rvx_port_14;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_050;
reg [RVX_GPARA_0-1:0] rvx_signal_158;
wire rvx_signal_040;
wire rvx_signal_109;
wire rvx_signal_089;

wire [`RVX_GDEF_082-1:0] paddr_offset = rvx_port_11;
wire [`RVX_GDEF_082-1:0] rvx_signal_156;
wire [RVX_GPARA_1-1:0] rvx_signal_053;
wire [`RVX_GDEF_174-1:0] rvx_signal_029;
wire [`RVX_GDEF_174-1:0] addr_unused = 0;
reg rvx_signal_025;
wire [8-1:0] rvx_signal_132;
reg rvx_signal_146;
wire [8-1:0] rvx_signal_099;
wire rvx_signal_123;
reg [8-1:0] rvx_signal_084;
reg rvx_signal_022;
wire [32-1:0] rvx_signal_108;
reg rvx_signal_062;
wire [32-1:0] rvx_signal_127;
wire rvx_signal_076;
reg [32-1:0] rvx_signal_003;
reg rvx_signal_119;
wire [32-1:0] rvx_signal_073;
reg rvx_signal_088;
wire [32-1:0] rvx_signal_116;
wire rvx_signal_018;
reg [32-1:0] rvx_signal_002;
reg rvx_signal_056;
wire [32-1:0] rvx_signal_055;
reg rvx_signal_149;
wire [32-1:0] rvx_signal_077;
wire rvx_signal_098;
reg [32-1:0] rvx_signal_079;
reg rvx_signal_093;
wire [32-1:0] rvx_signal_083;
reg rvx_signal_041;
wire [32-1:0] rvx_signal_061;
wire rvx_signal_113;
reg [32-1:0] rvx_signal_066;
reg rvx_signal_039;
wire [32-1:0] rvx_signal_070;
reg rvx_signal_117;
wire [32-1:0] rvx_signal_074;
wire rvx_signal_102;
reg [32-1:0] rvx_signal_087;
reg rvx_signal_101;
wire [32-1:0] rvx_signal_144;
reg rvx_signal_100;
wire [32-1:0] rvx_signal_120;
wire rvx_signal_047;
reg [32-1:0] rvx_signal_048;
reg rvx_signal_105;
wire [32-1:0] rvx_signal_159;
reg rvx_signal_157;
wire [32-1:0] rvx_signal_019;
wire rvx_signal_106;
reg [32-1:0] rvx_signal_004;
reg rvx_signal_032;
wire [32-1:0] rvx_signal_124;
reg rvx_signal_026;
wire [32-1:0] rvx_signal_085;
wire rvx_signal_110;
reg [32-1:0] rvx_signal_112;
reg rvx_signal_081;
wire [32-1:0] rvx_signal_007;
reg rvx_signal_052;
wire [32-1:0] rvx_signal_045;
wire rvx_signal_150;
reg [32-1:0] rvx_signal_033;
reg rvx_signal_023;
wire [32-1:0] rvx_signal_024;
reg rvx_signal_042;
wire [32-1:0] rvx_signal_131;
wire rvx_signal_037;
reg [32-1:0] rvx_signal_136;
reg rvx_signal_015;
wire [32-1:0] rvx_signal_094;
reg rvx_signal_078;
wire [32-1:0] rvx_signal_000;
wire rvx_signal_121;
reg [32-1:0] rvx_signal_005;
reg rvx_signal_031;
wire [32-1:0] rvx_signal_058;
reg rvx_signal_139;
wire [32-1:0] rvx_signal_129;
wire rvx_signal_154;
reg [32-1:0] rvx_signal_141;
reg rvx_signal_140;
wire [32-1:0] rvx_signal_118;
reg rvx_signal_153;
wire [32-1:0] rvx_signal_011;
wire rvx_signal_114;
reg [32-1:0] rvx_signal_145;
reg rvx_signal_027;
wire [32-1:0] rvx_signal_125;
reg rvx_signal_111;
wire [32-1:0] rvx_signal_104;
wire rvx_signal_064;
reg [32-1:0] rvx_signal_006;
reg rvx_signal_115;
wire [32-1:0] rvx_signal_080;
reg rvx_signal_014;
wire [32-1:0] rvx_signal_054;
wire rvx_signal_035;
reg [32-1:0] rvx_signal_147;
reg rvx_signal_155;
wire [32-1:0] rvx_signal_122;
reg rvx_signal_143;
wire [32-1:0] rvx_signal_151;
wire rvx_signal_001;
reg [32-1:0] rvx_signal_133;
reg rvx_signal_016;
wire [32-1:0] rvx_signal_046;
reg rvx_signal_135;
wire [32-1:0] rvx_signal_069;
wire rvx_signal_060;
reg [32-1:0] rvx_signal_059;
reg rvx_signal_128;
wire [32-1:0] rvx_signal_009;
reg rvx_signal_063;
wire [32-1:0] rvx_signal_107;
wire rvx_signal_130;
reg [32-1:0] rvx_signal_152;
reg rvx_signal_065;
wire [32-1:0] rvx_signal_028;
reg rvx_signal_044;
wire [32-1:0] rvx_signal_072;
wire rvx_signal_034;
reg [32-1:0] rvx_signal_103;
reg rvx_signal_142;
wire [32-1:0] rvx_signal_095;
reg rvx_signal_036;
wire [32-1:0] rvx_signal_137;
wire rvx_signal_010;
reg [32-1:0] rvx_signal_008;
reg rvx_signal_082;
wire [32-1:0] rvx_signal_043;
reg rvx_signal_138;
wire [32-1:0] rvx_signal_091;
wire rvx_signal_013;
reg [32-1:0] rvx_signal_049;
reg rvx_signal_097;
wire [32-1:0] rvx_signal_075;
reg rvx_signal_021;
wire [32-1:0] rvx_signal_134;
wire rvx_signal_126;
reg [32-1:0] rvx_signal_020;
reg rvx_signal_030;
wire [32-1:0] rvx_signal_051;
reg rvx_signal_038;
wire [32-1:0] rvx_signal_148;
wire rvx_signal_092;
reg [32-1:0] rvx_signal_071;
reg rvx_signal_067;
wire [32-1:0] rvx_signal_086;
reg rvx_signal_012;
wire [32-1:0] rvx_signal_057;
wire rvx_signal_068;
reg [32-1:0] rvx_signal_017;

assign rvx_signal_050 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_2,rvx_port_07);
assign rvx_port_06 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_2,rvx_signal_158);
assign {rvx_signal_053,rvx_signal_029} = paddr_offset;
assign rvx_signal_156 = {rvx_signal_053,addr_unused};
assign rvx_signal_089 = (rvx_signal_029==0);
assign rvx_signal_040 = rvx_port_04 & rvx_port_12 & rvx_signal_089 & (~rvx_port_09);
assign rvx_signal_109 = rvx_port_04 & rvx_port_12 & rvx_signal_089 & rvx_port_09;

assign rvx_signal_099 = $unsigned(rvx_port_07);
assign rvx_signal_127 = $unsigned(rvx_port_07);
assign rvx_signal_116 = $unsigned(rvx_port_07);
assign rvx_signal_077 = $unsigned(rvx_port_07);
assign rvx_signal_061 = $unsigned(rvx_port_07);
assign rvx_signal_074 = $unsigned(rvx_port_07);
assign rvx_signal_120 = $unsigned(rvx_port_07);
assign rvx_signal_019 = $unsigned(rvx_port_07);
assign rvx_signal_085 = $unsigned(rvx_port_07);
assign rvx_signal_045 = $unsigned(rvx_port_07);
assign rvx_signal_131 = $unsigned(rvx_port_07);
assign rvx_signal_000 = $unsigned(rvx_port_07);
assign rvx_signal_129 = $unsigned(rvx_port_07);
assign rvx_signal_011 = $unsigned(rvx_port_07);
assign rvx_signal_104 = $unsigned(rvx_port_07);
assign rvx_signal_054 = $unsigned(rvx_port_07);
assign rvx_signal_151 = $unsigned(rvx_port_07);
assign rvx_signal_069 = $unsigned(rvx_port_07);
assign rvx_signal_107 = $unsigned(rvx_port_07);
assign rvx_signal_072 = $unsigned(rvx_port_07);
assign rvx_signal_137 = $unsigned(rvx_port_07);
assign rvx_signal_091 = $unsigned(rvx_port_07);
assign rvx_signal_134 = $unsigned(rvx_port_07);
assign rvx_signal_148 = $unsigned(rvx_port_07);
assign rvx_signal_057 = $unsigned(rvx_port_07);

always@(*)
begin
	rvx_port_01 = 0;
	rvx_signal_158 = 0;
	rvx_port_10 = 1;

	rvx_signal_025 = 0;
	rvx_signal_146 = 0;

	rvx_signal_022 = 0;
	rvx_signal_062 = 0;

	rvx_signal_119 = 0;
	rvx_signal_088 = 0;

	rvx_signal_056 = 0;
	rvx_signal_149 = 0;

	rvx_signal_093 = 0;
	rvx_signal_041 = 0;

	rvx_signal_039 = 0;
	rvx_signal_117 = 0;

	rvx_signal_101 = 0;
	rvx_signal_100 = 0;

	rvx_signal_105 = 0;
	rvx_signal_157 = 0;

	rvx_signal_032 = 0;
	rvx_signal_026 = 0;

	rvx_signal_081 = 0;
	rvx_signal_052 = 0;

	rvx_signal_023 = 0;
	rvx_signal_042 = 0;

	rvx_signal_015 = 0;
	rvx_signal_078 = 0;

	rvx_signal_031 = 0;
	rvx_signal_139 = 0;

	rvx_signal_140 = 0;
	rvx_signal_153 = 0;

	rvx_signal_027 = 0;
	rvx_signal_111 = 0;

	rvx_signal_115 = 0;
	rvx_signal_014 = 0;

	rvx_signal_155 = 0;
	rvx_signal_143 = 0;

	rvx_signal_016 = 0;
	rvx_signal_135 = 0;

	rvx_signal_128 = 0;
	rvx_signal_063 = 0;

	rvx_signal_065 = 0;
	rvx_signal_044 = 0;

	rvx_signal_142 = 0;
	rvx_signal_036 = 0;

	rvx_signal_082 = 0;
	rvx_signal_138 = 0;

	rvx_signal_097 = 0;
	rvx_signal_021 = 0;

	rvx_signal_030 = 0;
	rvx_signal_038 = 0;

	rvx_signal_067 = 0;
	rvx_signal_012 = 0;

	if(rvx_port_04==1'b 1)
	begin
		case(rvx_signal_156)
			`RVX_GDEF_240:
			begin
				rvx_signal_025 = rvx_signal_040;
				rvx_signal_146 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_132);
				rvx_port_10 = rvx_signal_123;
			end
			`RVX_GDEF_300:
			begin
				rvx_signal_022 = rvx_signal_040;
				rvx_signal_062 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_108);
				rvx_port_10 = rvx_signal_076;
			end
			`RVX_GDEF_409:
			begin
				rvx_signal_119 = rvx_signal_040;
				rvx_signal_088 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_073);
				rvx_port_10 = rvx_signal_018;
			end
			`RVX_GDEF_293:
			begin
				rvx_signal_056 = rvx_signal_040;
				rvx_signal_149 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_055);
				rvx_port_10 = rvx_signal_098;
			end
			`RVX_GDEF_145:
			begin
				rvx_signal_093 = rvx_signal_040;
				rvx_signal_041 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_083);
				rvx_port_10 = rvx_signal_113;
			end
			`RVX_GDEF_269:
			begin
				rvx_signal_039 = rvx_signal_040;
				rvx_signal_117 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_070);
				rvx_port_10 = rvx_signal_102;
			end
			`RVX_GDEF_345:
			begin
				rvx_signal_101 = rvx_signal_040;
				rvx_signal_100 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_144);
				rvx_port_10 = rvx_signal_047;
			end
			`RVX_GDEF_354:
			begin
				rvx_signal_105 = rvx_signal_040;
				rvx_signal_157 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_159);
				rvx_port_10 = rvx_signal_106;
			end
			`RVX_GDEF_121:
			begin
				rvx_signal_032 = rvx_signal_040;
				rvx_signal_026 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_124);
				rvx_port_10 = rvx_signal_110;
			end
			`RVX_GDEF_163:
			begin
				rvx_signal_081 = rvx_signal_040;
				rvx_signal_052 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_007);
				rvx_port_10 = rvx_signal_150;
			end
			`RVX_GDEF_000:
			begin
				rvx_signal_023 = rvx_signal_040;
				rvx_signal_042 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_024);
				rvx_port_10 = rvx_signal_037;
			end
			`RVX_GDEF_024:
			begin
				rvx_signal_015 = rvx_signal_040;
				rvx_signal_078 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_094);
				rvx_port_10 = rvx_signal_121;
			end
			`RVX_GDEF_316:
			begin
				rvx_signal_031 = rvx_signal_040;
				rvx_signal_139 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_058);
				rvx_port_10 = rvx_signal_154;
			end
			`RVX_GDEF_364:
			begin
				rvx_signal_140 = rvx_signal_040;
				rvx_signal_153 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_118);
				rvx_port_10 = rvx_signal_114;
			end
			`RVX_GDEF_122:
			begin
				rvx_signal_027 = rvx_signal_040;
				rvx_signal_111 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_125);
				rvx_port_10 = rvx_signal_064;
			end
			`RVX_GDEF_140:
			begin
				rvx_signal_115 = rvx_signal_040;
				rvx_signal_014 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_080);
				rvx_port_10 = rvx_signal_035;
			end
			`RVX_GDEF_398:
			begin
				rvx_signal_155 = rvx_signal_040;
				rvx_signal_143 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_122);
				rvx_port_10 = rvx_signal_001;
			end
			`RVX_GDEF_142:
			begin
				rvx_signal_016 = rvx_signal_040;
				rvx_signal_135 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_046);
				rvx_port_10 = rvx_signal_060;
			end
			`RVX_GDEF_353:
			begin
				rvx_signal_128 = rvx_signal_040;
				rvx_signal_063 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_009);
				rvx_port_10 = rvx_signal_130;
			end
			`RVX_GDEF_255:
			begin
				rvx_signal_065 = rvx_signal_040;
				rvx_signal_044 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_028);
				rvx_port_10 = rvx_signal_034;
			end
			`RVX_GDEF_327:
			begin
				rvx_signal_142 = rvx_signal_040;
				rvx_signal_036 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_095);
				rvx_port_10 = rvx_signal_010;
			end
			`RVX_GDEF_259:
			begin
				rvx_signal_082 = rvx_signal_040;
				rvx_signal_138 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_043);
				rvx_port_10 = rvx_signal_013;
			end
			`RVX_GDEF_406:
			begin
				rvx_signal_097 = rvx_signal_040;
				rvx_signal_021 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_075);
				rvx_port_10 = rvx_signal_126;
			end
			`RVX_GDEF_237:
			begin
				rvx_signal_030 = rvx_signal_040;
				rvx_signal_038 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_051);
				rvx_port_10 = rvx_signal_092;
			end
			`RVX_GDEF_072:
			begin
				rvx_signal_067 = rvx_signal_040;
				rvx_signal_012 = rvx_signal_109;
				rvx_signal_158 = $unsigned(rvx_signal_086);
				rvx_port_10 = rvx_signal_068;
			end
			default:
				rvx_port_01 = 1;
		endcase
	end
end

always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_084 <= `RVX_GDEF_287;
	else if (rvx_signal_146==1'b 1)
		rvx_signal_084 <= rvx_signal_099;
end
assign rvx_signal_132 = rvx_signal_084;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_003 <= `RVX_GDEF_321;
	else if (rvx_signal_062==1'b 1)
		rvx_signal_003 <= rvx_signal_127;
end
assign rvx_signal_108 = rvx_signal_003;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_002 <= `RVX_GDEF_321;
	else if (rvx_signal_088==1'b 1)
		rvx_signal_002 <= rvx_signal_116;
end
assign rvx_signal_073 = rvx_signal_002;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_079 <= `RVX_GDEF_321;
	else if (rvx_signal_149==1'b 1)
		rvx_signal_079 <= rvx_signal_077;
end
assign rvx_signal_055 = rvx_signal_079;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_066 <= `RVX_GDEF_321;
	else if (rvx_signal_041==1'b 1)
		rvx_signal_066 <= rvx_signal_061;
end
assign rvx_signal_083 = rvx_signal_066;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_087 <= `RVX_GDEF_321;
	else if (rvx_signal_117==1'b 1)
		rvx_signal_087 <= rvx_signal_074;
end
assign rvx_signal_070 = rvx_signal_087;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_048 <= `RVX_GDEF_321;
	else if (rvx_signal_100==1'b 1)
		rvx_signal_048 <= rvx_signal_120;
end
assign rvx_signal_144 = rvx_signal_048;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_004 <= `RVX_GDEF_321;
	else if (rvx_signal_157==1'b 1)
		rvx_signal_004 <= rvx_signal_019;
end
assign rvx_signal_159 = rvx_signal_004;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_112 <= `RVX_GDEF_321;
	else if (rvx_signal_026==1'b 1)
		rvx_signal_112 <= rvx_signal_085;
end
assign rvx_signal_124 = rvx_signal_112;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_033 <= `RVX_GDEF_313;
	else if (rvx_signal_052==1'b 1)
		rvx_signal_033 <= rvx_signal_045;
end
assign rvx_signal_007 = rvx_signal_033;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_136 <= `RVX_GDEF_313;
	else if (rvx_signal_042==1'b 1)
		rvx_signal_136 <= rvx_signal_131;
end
assign rvx_signal_024 = rvx_signal_136;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_005 <= `RVX_GDEF_313;
	else if (rvx_signal_078==1'b 1)
		rvx_signal_005 <= rvx_signal_000;
end
assign rvx_signal_094 = rvx_signal_005;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_141 <= `RVX_GDEF_313;
	else if (rvx_signal_139==1'b 1)
		rvx_signal_141 <= rvx_signal_129;
end
assign rvx_signal_058 = rvx_signal_141;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_145 <= `RVX_GDEF_313;
	else if (rvx_signal_153==1'b 1)
		rvx_signal_145 <= rvx_signal_011;
end
assign rvx_signal_118 = rvx_signal_145;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_006 <= `RVX_GDEF_313;
	else if (rvx_signal_111==1'b 1)
		rvx_signal_006 <= rvx_signal_104;
end
assign rvx_signal_125 = rvx_signal_006;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_147 <= `RVX_GDEF_313;
	else if (rvx_signal_014==1'b 1)
		rvx_signal_147 <= rvx_signal_054;
end
assign rvx_signal_080 = rvx_signal_147;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_133 <= `RVX_GDEF_313;
	else if (rvx_signal_143==1'b 1)
		rvx_signal_133 <= rvx_signal_151;
end
assign rvx_signal_122 = rvx_signal_133;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_059 <= `RVX_GDEF_304;
	else if (rvx_signal_135==1'b 1)
		rvx_signal_059 <= rvx_signal_069;
end
assign rvx_signal_046 = rvx_signal_059;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_152 <= `RVX_GDEF_304;
	else if (rvx_signal_063==1'b 1)
		rvx_signal_152 <= rvx_signal_107;
end
assign rvx_signal_009 = rvx_signal_152;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_103 <= `RVX_GDEF_304;
	else if (rvx_signal_044==1'b 1)
		rvx_signal_103 <= rvx_signal_072;
end
assign rvx_signal_028 = rvx_signal_103;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_008 <= `RVX_GDEF_304;
	else if (rvx_signal_036==1'b 1)
		rvx_signal_008 <= rvx_signal_137;
end
assign rvx_signal_095 = rvx_signal_008;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_049 <= `RVX_GDEF_304;
	else if (rvx_signal_138==1'b 1)
		rvx_signal_049 <= rvx_signal_091;
end
assign rvx_signal_043 = rvx_signal_049;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_020 <= `RVX_GDEF_304;
	else if (rvx_signal_021==1'b 1)
		rvx_signal_020 <= rvx_signal_134;
end
assign rvx_signal_075 = rvx_signal_020;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_071 <= `RVX_GDEF_304;
	else if (rvx_signal_038==1'b 1)
		rvx_signal_071 <= rvx_signal_148;
end
assign rvx_signal_051 = rvx_signal_071;
always@(posedge rvx_port_05, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_017 <= `RVX_GDEF_304;
	else if (rvx_signal_012==1'b 1)
		rvx_signal_017 <= rvx_signal_057;
end
assign rvx_signal_086 = rvx_signal_017;

assign rvx_port_02 = rvx_signal_084;
assign rvx_signal_123 = 1;

assign rvx_port_08[(32)*((00)+1)-1-:32] = rvx_signal_003;

assign rvx_port_08[(32)*((01)+1)-1-:32] = rvx_signal_002;

assign rvx_port_08[(32)*((02)+1)-1-:32] = rvx_signal_079;

assign rvx_port_08[(32)*((03)+1)-1-:32] = rvx_signal_066;

assign rvx_port_08[(32)*((04)+1)-1-:32] = rvx_signal_087;

assign rvx_port_08[(32)*((05)+1)-1-:32] = rvx_signal_048;

assign rvx_port_08[(32)*((06)+1)-1-:32] = rvx_signal_004;

assign rvx_port_08[(32)*((07)+1)-1-:32] = rvx_signal_112;

assign rvx_signal_076 = 1;

assign rvx_signal_018 = 1;

assign rvx_signal_098 = 1;

assign rvx_signal_113 = 1;

assign rvx_signal_102 = 1;

assign rvx_signal_047 = 1;

assign rvx_signal_106 = 1;

assign rvx_signal_110 = 1;

assign rvx_port_13[(32)*((00)+1)-1-:32] = rvx_signal_033;

assign rvx_port_13[(32)*((01)+1)-1-:32] = rvx_signal_136;

assign rvx_port_13[(32)*((02)+1)-1-:32] = rvx_signal_005;

assign rvx_port_13[(32)*((03)+1)-1-:32] = rvx_signal_141;

assign rvx_port_13[(32)*((04)+1)-1-:32] = rvx_signal_145;

assign rvx_port_13[(32)*((05)+1)-1-:32] = rvx_signal_006;

assign rvx_port_13[(32)*((06)+1)-1-:32] = rvx_signal_147;

assign rvx_port_13[(32)*((07)+1)-1-:32] = rvx_signal_133;

assign rvx_signal_150 = 1;

assign rvx_signal_037 = 1;

assign rvx_signal_121 = 1;

assign rvx_signal_154 = 1;

assign rvx_signal_114 = 1;

assign rvx_signal_064 = 1;

assign rvx_signal_035 = 1;

assign rvx_signal_001 = 1;

assign rvx_port_14[(32)*((00)+1)-1-:32] = rvx_signal_059;

assign rvx_port_14[(32)*((01)+1)-1-:32] = rvx_signal_152;

assign rvx_port_14[(32)*((02)+1)-1-:32] = rvx_signal_103;

assign rvx_port_14[(32)*((03)+1)-1-:32] = rvx_signal_008;

assign rvx_port_14[(32)*((04)+1)-1-:32] = rvx_signal_049;

assign rvx_port_14[(32)*((05)+1)-1-:32] = rvx_signal_020;

assign rvx_port_14[(32)*((06)+1)-1-:32] = rvx_signal_071;

assign rvx_port_14[(32)*((07)+1)-1-:32] = rvx_signal_017;

assign rvx_signal_060 = 1;

assign rvx_signal_130 = 1;

assign rvx_signal_034 = 1;

assign rvx_signal_010 = 1;

assign rvx_signal_013 = 1;

assign rvx_signal_126 = 1;

assign rvx_signal_092 = 1;

assign rvx_signal_068 = 1;

endmodule
