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
`include "ervp_platform_controller_memorymap_offset.vh"




module RVX_MODULE_038
(
	rvx_port_03,
	rvx_port_18,

	rvx_port_00,
	rvx_port_10,
	rvx_port_30,
	rvx_port_11,
	rvx_port_14,
	rvx_port_04,
	rvx_port_15,
	rvx_port_21,

	rvx_port_02,
	rvx_port_16,
	rvx_port_22,
	rvx_port_08,
	rvx_port_34,
	rvx_port_37,
	rvx_port_36,
	rvx_port_06,
	rvx_port_09,
	rvx_port_32,
	rvx_port_31,
	rvx_port_19,
	rvx_port_13,
	rvx_port_29,
	rvx_port_27,
	rvx_port_26,
	rvx_port_25,
	rvx_port_01,
	rvx_port_28,
	rvx_port_07,
	rvx_port_33,
	rvx_port_35,
	rvx_port_24,
	rvx_port_20,
	rvx_port_23,
	rvx_port_05,
	rvx_port_12,
	rvx_port_17
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_03, rvx_port_18;
input wire rvx_port_00;
input wire rvx_port_10;
input wire [RVX_GPARA_0-1:0] rvx_port_30;
input wire rvx_port_11;
input wire [RVX_GPARA_1-1:0] rvx_port_14;
output wire [RVX_GPARA_1-1:0] rvx_port_04;
output reg rvx_port_15;
output reg rvx_port_21;

input wire rvx_port_02;

output wire rvx_port_16;
input wire [4-1:0] rvx_port_22;

output wire rvx_port_08;
input wire [1-1:0] rvx_port_34;

output wire rvx_port_37;
input wire [1-1:0] rvx_port_36;
output wire rvx_port_06;
output wire [1-1:0] rvx_port_09;

output wire rvx_port_32;
input wire [1-1:0] rvx_port_31;

output wire rvx_port_19;
input wire [32-1:0] rvx_port_13;
output wire rvx_port_29;
output wire [32-1:0] rvx_port_27;

output wire [32-1:0] rvx_port_26;

output wire rvx_port_25;
input wire [32-1:0] rvx_port_01;

output wire rvx_port_28;
input wire [32-1:0] rvx_port_07;

output wire rvx_port_33;
input wire [32-1:0] rvx_port_35;

output wire rvx_port_24;
input wire [32-1:0] rvx_port_20;

output wire [4-1:0] rvx_port_23;
input wire [(32)*(4)-1:0] rvx_port_05;

output wire [4-1:0] rvx_port_12;
input wire [(32)*(4)-1:0] rvx_port_17;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_047;
reg [RVX_GPARA_1-1:0] rvx_signal_088;
wire rvx_signal_021;
wire rvx_signal_056;
wire rvx_signal_011;

wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] paddr_offset = rvx_port_30;
wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_082;
wire [RVX_GPARA_0-1:0] rvx_signal_034;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_046;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] addr_unused = 0;
reg rvx_signal_066;
wire [4-1:0] rvx_signal_080;
reg rvx_signal_042;
wire [4-1:0] rvx_signal_014;
wire rvx_signal_026;
reg rvx_signal_036;
wire [1-1:0] rvx_signal_096;
reg rvx_signal_008;
wire [1-1:0] rvx_signal_041;
wire rvx_signal_061;
reg rvx_signal_040;
wire [1-1:0] rvx_signal_003;
reg rvx_signal_083;
wire [1-1:0] rvx_signal_073;
wire rvx_signal_032;
reg rvx_signal_017;
wire [1-1:0] rvx_signal_018;
reg rvx_signal_093;
wire [1-1:0] rvx_signal_023;
wire rvx_signal_100;
reg rvx_signal_057;
wire [32-1:0] rvx_signal_022;
reg rvx_signal_007;
wire [32-1:0] rvx_signal_029;
wire rvx_signal_009;
reg rvx_signal_015;
wire [32-1:0] rvx_signal_055;
reg rvx_signal_090;
wire [32-1:0] rvx_signal_043;
wire rvx_signal_099;
reg [32-1:0] rvx_signal_006;
reg rvx_signal_012;
wire [32-1:0] rvx_signal_016;
reg rvx_signal_025;
wire [32-1:0] rvx_signal_024;
wire rvx_signal_005;
reg rvx_signal_060;
wire [32-1:0] rvx_signal_019;
reg rvx_signal_078;
wire [32-1:0] rvx_signal_094;
wire rvx_signal_048;
reg rvx_signal_076;
wire [32-1:0] rvx_signal_092;
reg rvx_signal_095;
wire [32-1:0] rvx_signal_089;
wire rvx_signal_054;
reg rvx_signal_039;
wire [32-1:0] rvx_signal_058;
reg rvx_signal_031;
wire [32-1:0] rvx_signal_067;
wire rvx_signal_002;
reg rvx_signal_079;
wire [32-1:0] rvx_signal_072;
reg rvx_signal_068;
wire [32-1:0] rvx_signal_084;
wire rvx_signal_059;
reg rvx_signal_053;
wire [32-1:0] rvx_signal_091;
reg rvx_signal_001;
wire [32-1:0] rvx_signal_052;
wire rvx_signal_010;
reg rvx_signal_028;
wire [32-1:0] rvx_signal_020;
reg rvx_signal_049;
wire [32-1:0] rvx_signal_000;
wire rvx_signal_033;
reg rvx_signal_037;
wire [32-1:0] rvx_signal_030;
reg rvx_signal_044;
wire [32-1:0] rvx_signal_013;
wire rvx_signal_071;
reg rvx_signal_085;
wire [32-1:0] rvx_signal_063;
reg rvx_signal_062;
wire [32-1:0] rvx_signal_064;
wire rvx_signal_081;
reg rvx_signal_077;
wire [32-1:0] rvx_signal_069;
reg rvx_signal_045;
wire [32-1:0] rvx_signal_097;
wire rvx_signal_098;
reg rvx_signal_086;
wire [32-1:0] rvx_signal_035;
reg rvx_signal_087;
wire [32-1:0] rvx_signal_050;
wire rvx_signal_004;
reg rvx_signal_074;
wire [32-1:0] rvx_signal_038;
reg rvx_signal_070;
wire [32-1:0] rvx_signal_027;
wire rvx_signal_075;

assign rvx_signal_047 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_14);
assign rvx_port_04 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_088);
assign {rvx_signal_034,rvx_signal_046} = paddr_offset;
assign rvx_signal_082 = {rvx_signal_034,addr_unused};
assign rvx_signal_011 = (rvx_signal_046==0);
assign rvx_signal_021 = rvx_port_00 & rvx_port_10 & rvx_signal_011 & (~rvx_port_11);
assign rvx_signal_056 = rvx_port_00 & rvx_port_10 & rvx_signal_011 & rvx_port_11;

assign rvx_signal_014 = $unsigned(rvx_port_14);
assign rvx_signal_041 = $unsigned(rvx_port_14);
assign rvx_signal_073 = $unsigned(rvx_port_14);
assign rvx_signal_023 = $unsigned(rvx_port_14);
assign rvx_signal_029 = $unsigned(rvx_port_14);
assign rvx_signal_043 = $unsigned(rvx_port_14);
assign rvx_signal_024 = $unsigned(rvx_port_14);
assign rvx_signal_094 = $unsigned(rvx_port_14);
assign rvx_signal_089 = $unsigned(rvx_port_14);
assign rvx_signal_067 = $unsigned(rvx_port_14);
assign rvx_signal_084 = $unsigned(rvx_port_14);
assign rvx_signal_052 = $unsigned(rvx_port_14);
assign rvx_signal_000 = $unsigned(rvx_port_14);
assign rvx_signal_013 = $unsigned(rvx_port_14);
assign rvx_signal_064 = $unsigned(rvx_port_14);
assign rvx_signal_097 = $unsigned(rvx_port_14);
assign rvx_signal_050 = $unsigned(rvx_port_14);
assign rvx_signal_027 = $unsigned(rvx_port_14);

always@(*)
begin
	rvx_port_21 = 0;
	rvx_signal_088 = 0;
	rvx_port_15 = 1;

	rvx_signal_066 = 0;
	rvx_signal_042 = 0;

	rvx_signal_036 = 0;
	rvx_signal_008 = 0;

	rvx_signal_040 = 0;
	rvx_signal_083 = 0;

	rvx_signal_017 = 0;
	rvx_signal_093 = 0;

	rvx_signal_057 = 0;
	rvx_signal_007 = 0;

	rvx_signal_015 = 0;
	rvx_signal_090 = 0;

	rvx_signal_012 = 0;
	rvx_signal_025 = 0;

	rvx_signal_060 = 0;
	rvx_signal_078 = 0;

	rvx_signal_076 = 0;
	rvx_signal_095 = 0;

	rvx_signal_039 = 0;
	rvx_signal_031 = 0;

	rvx_signal_079 = 0;
	rvx_signal_068 = 0;

	rvx_signal_053 = 0;
	rvx_signal_001 = 0;

	rvx_signal_028 = 0;
	rvx_signal_049 = 0;

	rvx_signal_037 = 0;
	rvx_signal_044 = 0;

	rvx_signal_085 = 0;
	rvx_signal_062 = 0;

	rvx_signal_077 = 0;
	rvx_signal_045 = 0;

	rvx_signal_086 = 0;
	rvx_signal_087 = 0;

	rvx_signal_074 = 0;
	rvx_signal_070 = 0;

	if(rvx_port_00==1'b 1)
	begin
		case(rvx_signal_082)
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_MODE:
			begin
				rvx_signal_066 = rvx_signal_021;
				rvx_signal_042 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_080);
				rvx_port_15 = rvx_signal_026;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_INITIALIZED:
			begin
				rvx_signal_036 = rvx_signal_021;
				rvx_signal_008 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_096);
				rvx_port_15 = rvx_signal_061;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_SIM_ENV:
			begin
				rvx_signal_040 = rvx_signal_021;
				rvx_signal_083 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_003);
				rvx_port_15 = rvx_signal_032;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_JTAG_SELECT:
			begin
				rvx_signal_017 = rvx_signal_021;
				rvx_signal_093 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_018);
				rvx_port_15 = rvx_signal_100;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_STATUS:
			begin
				rvx_signal_057 = rvx_signal_021;
				rvx_signal_007 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_022);
				rvx_port_15 = rvx_signal_009;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_APP_ADDR:
			begin
				rvx_signal_015 = rvx_signal_021;
				rvx_signal_090 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_055);
				rvx_port_15 = rvx_signal_099;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_AUTO_ID:
			begin
				rvx_signal_012 = rvx_signal_021;
				rvx_signal_025 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_016);
				rvx_port_15 = rvx_signal_005;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_STATUS:
			begin
				rvx_signal_060 = rvx_signal_021;
				rvx_signal_078 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_019);
				rvx_port_15 = rvx_signal_048;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC00:
			begin
				rvx_signal_076 = rvx_signal_021;
				rvx_signal_095 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_092);
				rvx_port_15 = rvx_signal_054;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC01:
			begin
				rvx_signal_039 = rvx_signal_021;
				rvx_signal_031 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_058);
				rvx_port_15 = rvx_signal_002;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC02:
			begin
				rvx_signal_079 = rvx_signal_021;
				rvx_signal_068 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_072);
				rvx_port_15 = rvx_signal_059;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC03:
			begin
				rvx_signal_053 = rvx_signal_021;
				rvx_signal_001 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_091);
				rvx_port_15 = rvx_signal_010;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST00:
			begin
				rvx_signal_028 = rvx_signal_021;
				rvx_signal_049 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_020);
				rvx_port_15 = rvx_signal_033;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST01:
			begin
				rvx_signal_037 = rvx_signal_021;
				rvx_signal_044 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_030);
				rvx_port_15 = rvx_signal_071;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST02:
			begin
				rvx_signal_085 = rvx_signal_021;
				rvx_signal_062 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_063);
				rvx_port_15 = rvx_signal_081;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST03:
			begin
				rvx_signal_077 = rvx_signal_021;
				rvx_signal_045 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_069);
				rvx_port_15 = rvx_signal_098;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_IMP_TYPE:
			begin
				rvx_signal_086 = rvx_signal_021;
				rvx_signal_087 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_035);
				rvx_port_15 = rvx_signal_004;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_FLASH_BASE_ADDR:
			begin
				rvx_signal_074 = rvx_signal_021;
				rvx_signal_070 = rvx_signal_056;
				rvx_signal_088 = $unsigned(rvx_signal_038);
				rvx_port_15 = rvx_signal_075;
			end
			default:
				rvx_port_21 = 1;
		endcase
	end
end

always@(posedge rvx_port_03, negedge rvx_port_18)
begin
	if(rvx_port_18==0)
		rvx_signal_006 <= `PLATFORM_REGISTER_APP_ADDR_DEFAULT_VALUE;
	else if (rvx_signal_090==1'b 1)
		rvx_signal_006 <= rvx_signal_043;
end
assign rvx_signal_055 = rvx_signal_006;
assign rvx_port_16 = rvx_signal_066;
assign rvx_signal_080 = rvx_port_22;
assign rvx_signal_026 = 1;
assign rvx_port_08 = rvx_signal_036;
assign rvx_signal_096 = rvx_port_34;
assign rvx_signal_061 = 1;
assign rvx_port_37 = rvx_signal_040;
assign rvx_signal_003 = rvx_port_36;
assign rvx_port_06 = rvx_signal_083;
assign rvx_port_09 = rvx_signal_073;
assign rvx_signal_032 = 1;
assign rvx_port_32 = rvx_signal_017;
assign rvx_signal_018 = rvx_port_31;
assign rvx_signal_100 = 1;
assign rvx_port_19 = rvx_signal_057;
assign rvx_signal_022 = rvx_port_13;
assign rvx_port_29 = rvx_signal_007;
assign rvx_port_27 = rvx_signal_029;
assign rvx_signal_009 = 1;
assign rvx_port_26 = rvx_signal_006;
assign rvx_signal_099 = 1;
assign rvx_port_25 = rvx_signal_012;
assign rvx_signal_016 = rvx_port_01;
assign rvx_signal_005 = 1;
assign rvx_port_28 = rvx_signal_060;
assign rvx_signal_019 = rvx_port_07;
assign rvx_signal_048 = 1;
assign rvx_port_33 = rvx_signal_086;
assign rvx_signal_035 = rvx_port_35;
assign rvx_signal_004 = 1;
assign rvx_port_24 = rvx_signal_074;
assign rvx_signal_038 = rvx_port_20;
assign rvx_signal_075 = 1;

assign rvx_port_23[00] = rvx_signal_076;
assign rvx_signal_092 = rvx_port_05[(32)*((00)+1)-1-:32];

assign rvx_port_23[01] = rvx_signal_039;
assign rvx_signal_058 = rvx_port_05[(32)*((01)+1)-1-:32];

assign rvx_port_23[02] = rvx_signal_079;
assign rvx_signal_072 = rvx_port_05[(32)*((02)+1)-1-:32];

assign rvx_port_23[03] = rvx_signal_053;
assign rvx_signal_091 = rvx_port_05[(32)*((03)+1)-1-:32];

assign rvx_signal_054 = 1;

assign rvx_signal_002 = 1;

assign rvx_signal_059 = 1;

assign rvx_signal_010 = 1;

assign rvx_port_12[00] = rvx_signal_028;
assign rvx_signal_020 = rvx_port_17[(32)*((00)+1)-1-:32];

assign rvx_port_12[01] = rvx_signal_037;
assign rvx_signal_030 = rvx_port_17[(32)*((01)+1)-1-:32];

assign rvx_port_12[02] = rvx_signal_085;
assign rvx_signal_063 = rvx_port_17[(32)*((02)+1)-1-:32];

assign rvx_port_12[03] = rvx_signal_077;
assign rvx_signal_069 = rvx_port_17[(32)*((03)+1)-1-:32];

assign rvx_signal_033 = 1;

assign rvx_signal_071 = 1;

assign rvx_signal_081 = 1;

assign rvx_signal_098 = 1;

endmodule
