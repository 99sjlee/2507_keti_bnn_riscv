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
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_106
(
  rvx_port_25,
  rvx_port_15,
  rvx_port_22,
  rvx_port_37,

  
  rvx_port_28,
  rvx_port_30,
  rvx_port_34,
  rvx_port_31,
  rvx_port_46,
  rvx_port_52,
  rvx_port_42,
	rvx_port_36,
	rvx_port_17,
	rvx_port_03,
  rvx_port_18,
  rvx_port_19,
  rvx_port_01,
  rvx_port_12,
  rvx_port_40,
  rvx_port_00,
  rvx_port_29,
  rvx_port_05,
  rvx_port_10,
  rvx_port_11,
  rvx_port_50,
  rvx_port_16,
  rvx_port_39,
  rvx_port_49,
  rvx_port_44,
  rvx_port_41,
  rvx_port_43,
  rvx_port_06,
  rvx_port_20,
  rvx_port_14,
  rvx_port_23,
  rvx_port_24,

  
  rvx_port_07,
  rvx_port_33,
  rvx_port_35,
  rvx_port_21,
  rvx_port_48,
  rvx_port_09,
  rvx_port_13,
  rvx_port_45,
  rvx_port_32,
  rvx_port_08,
  rvx_port_47,
  rvx_port_38,
  rvx_port_04,
  rvx_port_26,
  rvx_port_02,
  rvx_port_51,
  rvx_port_27
);





parameter RVX_GPARA_2 = 32;

parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_7 = 32;
parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_6 = 32;
parameter RVX_GPARA_5 = 32;

parameter RVX_GPARA_0 = 0;
parameter MMIOX1_FIFO_PARA = 0;

input wire rvx_port_25;
input wire rvx_port_15;
input wire rvx_port_22;
input wire rvx_port_37;

input wire rvx_port_28;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_30;
input wire rvx_port_34;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_31;
input wire rvx_port_46;
output wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_52;
input wire rvx_port_42;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_36;
input wire rvx_port_17;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_03;
input wire rvx_port_18;
output wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_19;
output wire rvx_port_01;
input wire rvx_port_12;
input wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_40;
output wire rvx_port_00;
output wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_29;
input wire rvx_port_05;
input wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_10;
output wire rvx_port_11;
input wire rvx_port_50;
output wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_16;
output wire rvx_port_39;
output wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_49;
input wire rvx_port_44;
input wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_41;
output wire rvx_port_43;
input wire rvx_port_06;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_20;
input wire rvx_port_14;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_23;

output wire [32-1:0] rvx_port_24;

output wire [RVX_GPARA_3-1:0] rvx_port_07;
input wire [RVX_GPARA_7-1:0] rvx_port_33;
output wire rvx_port_35;
input wire rvx_port_21;

output wire rvx_port_48;
input wire rvx_port_09;
input wire [RVX_GPARA_4-1:0] rvx_port_13;

output wire rvx_port_45;
output wire [RVX_GPARA_1-1:0] rvx_port_32;
input wire rvx_port_08;
input wire rvx_port_47;

output wire rvx_port_38;
output wire [RVX_GPARA_6-1:0] rvx_port_04;
input wire rvx_port_26;

output wire rvx_port_02;
input wire rvx_port_51;
input wire [RVX_GPARA_5-1:0] rvx_port_27;

wire rvx_signal_029;
wire rvx_signal_098;
wire rvx_signal_040;
wire rvx_signal_050;
wire rvx_signal_048;
wire rvx_signal_016;
wire rvx_signal_001;
wire rvx_signal_075;
wire rvx_signal_012;

localparam  RVX_LPARA_19 = 16;

`include "rvx_include_07.vh"
`include "rvx_include_08.vh"

localparam  RVX_LPARA_09 = RVX_GPARA_4;
localparam  RVX_LPARA_07 = RVX_GPARA_4;
localparam  RVX_LPARA_10 = RVX_GPARA_2;
localparam  RVX_LPARA_08 = LOG_FIFO_DEPTH;

wire rvx_signal_094;
wire rvx_signal_019;
wire rvx_signal_106;
wire rvx_signal_053;
wire rvx_signal_039;
wire rvx_signal_007;
wire rvx_signal_045;
wire [RVX_LPARA_07-1:0] rvx_signal_060;

wire rvx_signal_082;
wire rvx_signal_036;
wire rvx_signal_078;
wire rvx_signal_046;
wire rvx_signal_077;
wire rvx_signal_103;
wire rvx_signal_020;
wire [RVX_LPARA_10-1:0] rvx_signal_084;

localparam  RVX_LPARA_20 = RVX_GPARA_1;
localparam  RVX_LPARA_14 = RVX_GPARA_2;
localparam  RVX_LPARA_03 = RVX_GPARA_1;
localparam  RVX_LPARA_00 = INST_FIFO_DEPTH;

wire rvx_signal_035;
wire rvx_signal_006;
wire rvx_signal_085;
wire rvx_signal_018;
wire rvx_signal_059;
wire rvx_signal_008;
wire rvx_signal_027;
wire [RVX_LPARA_14-1:0] rvx_signal_069;
wire [RVX_LPARA_19-1:0] rvx_signal_015;

wire rvx_signal_096;
wire rvx_signal_076;
wire rvx_signal_042;
wire rvx_signal_074;
wire rvx_signal_072;
wire rvx_signal_056;
wire rvx_signal_026;
wire [RVX_LPARA_03-1:0] rvx_signal_062;

localparam  RVX_LPARA_11 = 1;
localparam  RVX_LPARA_17 = INST_FIFO_DEPTH;

wire rvx_signal_022;
wire rvx_signal_066;
wire rvx_signal_083;
wire rvx_signal_044;
wire rvx_signal_009;
wire [RVX_LPARA_11-1:0] rvx_signal_057;

wire rvx_signal_002;
wire rvx_signal_070;
wire rvx_signal_049;
wire rvx_signal_087;
wire rvx_signal_102;
wire [RVX_LPARA_11-1:0] rvx_signal_038;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_05 = REQUIRED_BITWIDTH_UNSIGNED(INST_FIFO_DEPTH) + 1;

wire rvx_signal_071;
wire rvx_signal_013;
wire rvx_signal_003;
wire rvx_signal_100;
wire [RVX_LPARA_05-1:0] rvx_signal_107;
wire [RVX_LPARA_05-1:0] rvx_signal_017;

wire rvx_signal_043;
wire [8-1:0] rvx_signal_108;
wire [8-1:0] rvx_signal_109;

localparam  RVX_LPARA_12 = RVX_GPARA_6;
localparam  RVX_LPARA_15 = RVX_GPARA_2;
localparam  RVX_LPARA_18 = RVX_GPARA_6;
localparam  RVX_LPARA_06 = INPUT_FIFO_DEPTH;

wire rvx_signal_037;
wire rvx_signal_090;
wire rvx_signal_004;
wire rvx_signal_033;
wire rvx_signal_055;
wire rvx_signal_101;
wire rvx_signal_095;
wire [RVX_LPARA_15-1:0] rvx_signal_068;
wire [RVX_LPARA_19-1:0] rvx_signal_065;

wire rvx_signal_091;
wire rvx_signal_014;
wire rvx_signal_032;
wire rvx_signal_010;
wire rvx_signal_081;
wire rvx_signal_028;
wire rvx_signal_021;
wire [RVX_LPARA_18-1:0] rvx_signal_067;

localparam  RVX_LPARA_04 = RVX_GPARA_5;
localparam  RVX_LPARA_21 = RVX_GPARA_5;
localparam  RVX_LPARA_16 = RVX_GPARA_2;
localparam  RVX_LPARA_13 = OUTPUT_FIFO_DEPTH;

wire rvx_signal_034;
wire rvx_signal_061;
wire rvx_signal_000;
wire rvx_signal_011;
wire rvx_signal_073;
wire rvx_signal_054;
wire rvx_signal_051;
wire [RVX_LPARA_21-1:0] rvx_signal_099;

wire rvx_signal_025;
wire rvx_signal_041;
wire rvx_signal_088;
wire rvx_signal_080;
wire rvx_signal_031;
wire rvx_signal_086;
wire rvx_signal_110;
wire [RVX_LPARA_16-1:0] rvx_signal_058;
wire [RVX_LPARA_19-1:0] rvx_signal_105;

localparam  RVX_LPARA_02 = `BW_MMIO_ITR_REQUEST;
localparam  RVX_LPARA_01 = INST_FIFO_DEPTH;

wire rvx_signal_089;
wire rvx_signal_030;
wire rvx_signal_063;
wire rvx_signal_079;
wire [RVX_LPARA_02-1:0] rvx_signal_093;
wire rvx_signal_104;
wire rvx_signal_023;
wire [RVX_LPARA_02-1:0] rvx_signal_064;

reg [RVX_GPARA_2-1:0] rvx_signal_092;
reg [RVX_GPARA_2-1:0] rvx_signal_052;
wire [RVX_GPARA_7-1:0] rvx_signal_097;
wire [RVX_GPARA_3-1:0] rvx_signal_024;

wire [16-1:0] rvx_signal_047;
wire [16-1:0] rvx_signal_005;

ERVP_MMIO_WIDE_REG
#(
  .BW_MMIO(`BW_MMIO_CORE_CONFIG_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_3),
  .DEFAULT_VALUE(RVX_GPARA_0)
)
i_rvx_instance_00
(
  .clk(rvx_port_25),
  .rstnn(rvx_port_15),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_28),
  .mmio_rdata(rvx_port_30),
  .mmio_we(rvx_port_34),
  .mmio_wdata(rvx_port_31),

  .wide_data_out(rvx_signal_024)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_3)
)
i_rvx_instance_07
(
  .clk(rvx_port_22),
  .rstnn(rvx_port_37),
  .enable(1'b 1),
  .asynch_value(rvx_signal_024),
  .synch_value(rvx_port_07)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_7)
)
i_rvx_instance_10
(
  .clk(rvx_port_25),
  .rstnn(rvx_port_15),
  .enable(1'b 1),
  .asynch_value(rvx_port_33),
  .synch_value(rvx_signal_097)
);

ERVP_MMIO_WIDE_READ
#(
  .BW_MMIO(`BW_MMIO_CORE_STATUS_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_7)
)
i_rvx_instance_01
(
  .clk(rvx_port_25),
  .rstnn(rvx_port_15),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_46),
  .mmio_rdata(rvx_port_52),

  .wide_data_in(rvx_signal_097)
);

ERVP_ASYNCH_SF2VR
i_rvx_instance_02
(
	.wclk(rvx_signal_029),
	.wrstnn(rvx_signal_098),
	.wstart(rvx_signal_040),
  .wbusy(rvx_signal_050),
	.wfinish(rvx_signal_048),
	.rclk(rvx_signal_016),
	.rrstnn(rvx_signal_001),
	.rvalid(rvx_signal_075),
	.rready(rvx_signal_012)
);

assign rvx_signal_029 = rvx_port_25;
assign rvx_signal_098 = rvx_port_15;
assign rvx_signal_040 = rvx_port_17;
assign rvx_signal_016 = rvx_port_22;
assign rvx_signal_001 = rvx_port_37;
assign rvx_port_35 = rvx_signal_075;
assign rvx_signal_012 = rvx_port_21;

assign rvx_port_36 = rvx_signal_050;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_09),
  .BW_PARTIAL_WRITE(RVX_LPARA_07),
  .BW_PARTIAL_READ(RVX_LPARA_10),
  .DEPTH(RVX_LPARA_08)
)
i_rvx_instance_03
(
  .wclk(rvx_signal_094),
  .wrstnn(rvx_signal_019),
  .wready(rvx_signal_106),
  .wfull(rvx_signal_053),
  .wstartindex(rvx_signal_039),
  .wlastindex(rvx_signal_007),
  .wrequest(rvx_signal_045),
  .wdata(rvx_signal_060),
  .wnum(),

  .rclk(rvx_signal_082),
  .rrstnn(rvx_signal_036),
  .rready(rvx_signal_078),
  .rempty(rvx_signal_046),
  .rstartindex(rvx_signal_077),
  .rlastindex(rvx_signal_103),
  .rrequest(rvx_signal_020),
  .rdata(rvx_signal_084),
  .rnum()
);

assign rvx_signal_094 = rvx_port_22;
assign rvx_signal_019 = rvx_port_37 & INCLUDE_LOG_FIFO;
assign rvx_port_48 = rvx_signal_106;
assign rvx_signal_045 = rvx_port_09;
assign rvx_signal_060 = rvx_port_13;

assign rvx_signal_082 = rvx_port_25;
assign rvx_signal_036 = rvx_port_15 & INCLUDE_LOG_FIFO;
assign rvx_port_19 = rvx_signal_084;
assign rvx_signal_020 = rvx_port_18;
assign rvx_port_01 = rvx_signal_078;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_20),
  .BW_PARTIAL_WRITE(RVX_LPARA_14),
  .BW_PARTIAL_READ(RVX_LPARA_03),
  .DEPTH(RVX_LPARA_00),
  .BW_NUM_DATA(RVX_LPARA_19)
)
i_rvx_instance_04
(
  .wclk(rvx_signal_035),
  .wrstnn(rvx_signal_006),
  .wready(rvx_signal_085),
  .wfull(rvx_signal_018),
  .wstartindex(rvx_signal_059),
  .wlastindex(rvx_signal_008),
  .wrequest(rvx_signal_027),
  .wdata(rvx_signal_069),
  .wnum(rvx_signal_015),

  .rclk(rvx_signal_096),
  .rrstnn(rvx_signal_076),
  .rready(rvx_signal_042),
  .rempty(rvx_signal_074),
  .rstartindex(rvx_signal_072),
  .rlastindex(rvx_signal_056),
  .rrequest(rvx_signal_026),
  .rdata(rvx_signal_062),
  .rnum()
);

assign rvx_signal_035 = rvx_port_25;
assign rvx_signal_006 = rvx_port_15 & INCLUDE_INST_FIFO;
assign rvx_port_00 = rvx_signal_043 & rvx_signal_085;
assign rvx_signal_027 = rvx_signal_043 & rvx_port_12;
assign rvx_signal_069 = rvx_port_40;

assign rvx_signal_096 = rvx_port_22;
assign rvx_signal_076 = rvx_port_37 & INCLUDE_INST_FIFO;
assign rvx_port_45 = rvx_signal_042;
assign rvx_port_32 = rvx_signal_062;
assign rvx_signal_026 = rvx_port_08;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_11),
  .DEPTH(RVX_LPARA_17)
)
i_rvx_instance_06
(
  .wclk(rvx_signal_022),
  .wrstnn(rvx_signal_066),
  .wready(rvx_signal_083),
  .wfull(rvx_signal_044),
  .wrequest(rvx_signal_009),
  .wdata(rvx_signal_057),  

  .rclk(rvx_signal_002),
  .rrstnn(rvx_signal_070),
  .rready(rvx_signal_049),
  .rempty(rvx_signal_087),
  .rrequest(rvx_signal_102),
  .rdata(rvx_signal_038)
);

assign rvx_signal_022 = rvx_port_22;
assign rvx_signal_066 = rvx_port_37 & INCLUDE_INST_FIFO;
assign rvx_signal_009 = rvx_port_47;
assign rvx_signal_057 = 0;

assign rvx_signal_002 = rvx_port_25;
assign rvx_signal_070 = rvx_port_15 & INCLUDE_INST_FIFO;
assign rvx_signal_102 = rvx_signal_049;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_05)
)
i_rvx_instance_08
(
  .clk(rvx_port_25),
  .rstnn(rvx_port_15),
  .enable(rvx_signal_071),
  .init(rvx_signal_013),
  .up(rvx_signal_003),
  .down(rvx_signal_100),
  .count_amount(rvx_signal_107),
  .value(rvx_signal_017),
  .is_upper_limit(),
  .is_lower_limit()
);

assign rvx_signal_071 = INCLUDE_INST_FIFO;
assign rvx_signal_013 = 0;
assign rvx_signal_003 = rvx_signal_085 & rvx_signal_027 & rvx_signal_008;
assign rvx_signal_100 = rvx_signal_049 & rvx_signal_102;
assign rvx_signal_107 = 1;

assign rvx_signal_043 = ~(rvx_signal_017[RVX_LPARA_05-1]);

assign rvx_signal_108 = ((INCLUDE_INST_FIFO==0)||(~rvx_signal_043))? 0 : ((rvx_signal_015[RVX_LPARA_19-1:8]==0)? rvx_signal_015 : 63);
assign rvx_signal_109 = (rvx_signal_017>63)? 63 : rvx_signal_017;
assign rvx_port_29[`BW_MMIO_INST_STATUS-1:16]  = rvx_signal_078;
assign rvx_port_29[16-1-:8] = rvx_signal_109;
assign rvx_port_29[8-1-:8] = rvx_signal_108;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_12),
  .BW_PARTIAL_WRITE(RVX_LPARA_15),
  .BW_PARTIAL_READ(RVX_LPARA_18),
  .DEPTH(RVX_LPARA_06),
  .BW_NUM_DATA(RVX_LPARA_19)
)
i_rvx_instance_09
(
  .wclk(rvx_signal_037),
  .wrstnn(rvx_signal_090),
  .wready(rvx_signal_004),
  .wfull(rvx_signal_033),
  .wstartindex(rvx_signal_055),
  .wlastindex(rvx_signal_101),
  .wrequest(rvx_signal_095),
  .wdata(rvx_signal_068),
  .wnum(rvx_signal_065),

  .rclk(rvx_signal_091),
  .rrstnn(rvx_signal_014),
  .rready(rvx_signal_032),
  .rempty(rvx_signal_010),
  .rstartindex(rvx_signal_081),
  .rlastindex(rvx_signal_028),
  .rrequest(rvx_signal_021),
  .rdata(rvx_signal_067),
  .rnum()
);

assign rvx_signal_037 = rvx_port_25;
assign rvx_signal_090 = rvx_port_15 & INCLUDE_INPUT_FIFO;
assign rvx_port_11 = rvx_signal_004;
assign rvx_signal_095 = rvx_port_05;
assign rvx_signal_068 = rvx_port_10;

assign rvx_signal_091 = rvx_port_22;
assign rvx_signal_014 = rvx_port_37 & INCLUDE_INPUT_FIFO;
assign rvx_port_38 = rvx_signal_032;
assign rvx_port_04 = rvx_signal_067;
assign rvx_signal_021 = rvx_port_26;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_04),
  .BW_PARTIAL_WRITE(RVX_LPARA_21),
  .BW_PARTIAL_READ(RVX_LPARA_16),
  .DEPTH(RVX_LPARA_13),
  .BW_NUM_DATA(RVX_LPARA_19)
)
i_rvx_instance_11
(
  .wclk(rvx_signal_034),
  .wrstnn(rvx_signal_061),
  .wready(rvx_signal_000),
  .wfull(rvx_signal_011),
  .wstartindex(rvx_signal_073),
  .wlastindex(rvx_signal_054),
  .wrequest(rvx_signal_051),
  .wdata(rvx_signal_099),
  .wnum(),

  .rclk(rvx_signal_025),
  .rrstnn(rvx_signal_041),
  .rready(rvx_signal_088),
  .rempty(rvx_signal_080),
  .rstartindex(rvx_signal_031),
  .rlastindex(rvx_signal_086),
  .rrequest(rvx_signal_110),
  .rdata(rvx_signal_058),
  .rnum(rvx_signal_105)
);

assign rvx_signal_034 = rvx_port_22;
assign rvx_signal_061 = rvx_port_37 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_02 = rvx_signal_000;
assign rvx_signal_051 = rvx_port_51;
assign rvx_signal_099 = rvx_port_27;

assign rvx_signal_025 = rvx_port_25;
assign rvx_signal_041 = rvx_port_15 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_16 = rvx_signal_058;
assign rvx_signal_110 = rvx_port_50;
assign rvx_port_39 = rvx_signal_088;

assign rvx_signal_047 = rvx_signal_065[RVX_LPARA_19-1]? 0 : rvx_signal_065;
assign rvx_signal_005 = rvx_signal_105[RVX_LPARA_19-1]? 0 : rvx_signal_105;

assign rvx_port_49[32-1-:16] = rvx_signal_047;
assign rvx_port_49[16-1-:16] = rvx_signal_005;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_02),
  .DEPTH(RVX_LPARA_01)
)
i_rvx_instance_05
(
  .clk(rvx_signal_089),
  .rstnn(rvx_signal_030),
  .enable(1'b 1),
  .clear(1'b 0),
  .wready(rvx_signal_063),
  .wfull(),
  .wrequest(rvx_signal_079),
  .wdata(rvx_signal_093),
  .wnum(),
  .rready(rvx_signal_104),
  .rempty(),
  .rrequest(rvx_signal_023),
  .rdata(rvx_signal_064),
  .rnum()
);

assign rvx_signal_089 = rvx_port_25;
assign rvx_signal_030 = rvx_port_15 & INCLUDE_INST_FIFO;

assign rvx_signal_079 = rvx_signal_043 & rvx_port_44;
assign rvx_signal_093 = rvx_port_41;
assign rvx_port_43 = rvx_signal_043 & rvx_signal_063;
assign rvx_signal_023 = rvx_signal_100; 

always@(posedge rvx_port_25, negedge rvx_port_15)
begin
  if(rvx_port_15==0)
    rvx_signal_092 <= 0;
  else if(rvx_signal_023|rvx_port_14)
    rvx_signal_092 <= rvx_signal_052;
end

always@(*)
begin
  rvx_signal_052 = rvx_signal_092;
  if(rvx_signal_023& rvx_signal_104)
    rvx_signal_052 = rvx_signal_052 | rvx_signal_064;
  if(rvx_port_14)
    rvx_signal_052 = rvx_signal_052 & (~rvx_port_23);
end

assign rvx_port_20 = rvx_signal_092;
assign rvx_port_24 = rvx_signal_092;

endmodule
