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
`include "rvx_include_01.vh"
`include "fpir_define.vh"



module ERVP_FLORIAN
(
	clk,
	rstnn,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr
);



`include "rvx_include_16.vh"
`include "rvx_include_21.vh"

parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter SUPPORT_DOUBLE = 0;
parameter INCLUDE_DIVIDER = 1;

input wire clk, rstnn;
input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

localparam  RVX_LPARA_01 = (SUPPORT_DOUBLE? BW_IEEEDP_EXPONENT : BW_IEEESP_EXPONENT) + 1;
localparam  RVX_LPARA_12 = (SUPPORT_DOUBLE? BW_IEEEDP_SIGNIFICAND : BW_IEEESP_SIGNIFICAND);
localparam  RVX_LPARA_02 = `MAX((48-RVX_LPARA_12),3);
localparam  RVX_LPARA_09 = 2;

localparam  RVX_LPARA_07 = `BW_FPIR_TYPE + 1 + RVX_LPARA_01 + RVX_LPARA_12 + RVX_LPARA_02 + RVX_LPARA_09;

localparam  RVX_LPARA_04 = RVX_LPARA_12 + RVX_LPARA_02;
localparam  RVX_LPARA_06 = RVX_LPARA_01 + RVX_LPARA_09;

wire rvx_signal_030;
wire rvx_signal_011;
wire rvx_signal_036;
wire [BW_DATA-1:0] rvx_signal_037;
wire rvx_signal_013;
wire rvx_signal_048;
wire [BW_DATA-1:0] rvx_signal_041;
reg  rvx_signal_012;
wire [32-1:0] rvx_signal_005;
wire rvx_signal_046;

wire rvx_signal_102;
wire rvx_signal_076;
wire rvx_signal_070;
wire [BW_DATA-1:0] rvx_signal_060;
wire rvx_signal_066;
wire rvx_signal_056;
wire [BW_DATA-1:0] rvx_signal_002;
reg  rvx_signal_106;
reg  [32-1:0] rvx_signal_115;
wire rvx_signal_029;

reg [`RVX_GDEF_089-1:0] rvx_signal_100;
reg [`RVX_GDEF_139-1:0] rvx_signal_098;
reg [`RVX_GDEF_408-1:0] rvx_signal_093;
reg [`RVX_GDEF_408-1:0] rvx_signal_094;
wire rvx_signal_113;
wire rvx_signal_049;
wire rvx_signal_063;
wire rvx_signal_061;
reg  rvx_signal_088;
wire rvx_signal_026;
wire rvx_signal_059;

localparam  RVX_LPARA_03 = 4;

wire rvx_signal_014;
wire rvx_signal_018;
wire [RVX_LPARA_03-1:0] rvx_signal_081;
reg [RVX_LPARA_03-1:0] rvx_signal_086;
reg [RVX_LPARA_03-1:0] rvx_signal_092;

reg [32-1:0] rvx_signal_085;
reg rvx_signal_105;
reg [32-1:0] rvx_signal_095;
reg rvx_signal_067;
reg rvx_signal_003;
wire rvx_signal_044;

localparam  RVX_LPARA_13 = 32;

wire rvx_signal_065;
wire [RVX_LPARA_13-1:0] rvx_signal_111;

wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_032;
wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_074;

wire [RVX_LPARA_07-1:0] rvx_signal_097;
wire [RVX_LPARA_07-1:0] rvx_signal_027;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_040;
wire rvx_signal_031;
wire [RVX_LPARA_01-1:0] rvx_signal_064;
wire [RVX_LPARA_12-1:0] rvx_signal_072;
wire [RVX_LPARA_02-1:0] rvx_signal_058;
wire [RVX_LPARA_09-1:0] rvx_signal_099;

wire [24-1:0] rvx_signal_057;

reg [RVX_LPARA_07-1:0] rvx_signal_008;
reg rvx_signal_043;

reg [RVX_LPARA_07-1:0] rvx_signal_087;
reg rvx_signal_021;

localparam  RVX_LPARA_10 = RVX_LPARA_04 + 1;

reg [RVX_LPARA_10-1:0] rvx_signal_001;
reg [RVX_LPARA_10-1:0] rvx_signal_022;
reg rvx_signal_035;
wire [RVX_LPARA_10-1:0] rvx_signal_109;

wire [RVX_LPARA_07-1:0] rvx_signal_042;
wire [RVX_LPARA_07-1:0] rvx_signal_015;
wire rvx_signal_052;
wire [RVX_LPARA_07-1:0] rvx_signal_009;
wire [RVX_LPARA_07-1:0] rvx_signal_055;
wire rvx_signal_039;
wire [RVX_LPARA_07-1:0] rvx_signal_080;
wire [RVX_LPARA_10-1:0] rvx_signal_017;
wire [RVX_LPARA_10-1:0] rvx_signal_045;
wire rvx_signal_073;
wire [RVX_LPARA_10-1:0] rvx_signal_034;
wire [RVX_LPARA_07-1:0] rvx_signal_051;
wire rvx_signal_019;

localparam  RVX_LPARA_00 = RVX_LPARA_12;
localparam  RVX_LPARA_11 = RVX_LPARA_12;
localparam  RVX_LPARA_08 = 2*RVX_LPARA_12;

wire [RVX_LPARA_07-1:0] rvx_signal_047;
wire [RVX_LPARA_07-1:0] rvx_signal_053;
wire rvx_signal_077;
wire [RVX_LPARA_00-1:0] rvx_signal_114;
wire [RVX_LPARA_00-1:0] rvx_signal_054;
wire [2*RVX_LPARA_00-1:0] rvx_signal_108;
wire [RVX_LPARA_11-1:0] rvx_signal_071;
wire [RVX_LPARA_11-1:0] rvx_signal_020;
wire [RVX_LPARA_08-1:0] rvx_signal_000;
wire [RVX_LPARA_10-1:0] rvx_signal_096;
wire [RVX_LPARA_10-1:0] rvx_signal_069;
wire rvx_signal_006;
wire [RVX_LPARA_10-1:0] rvx_signal_062;
wire [RVX_LPARA_07-1:0] rvx_signal_075;

wire rvx_signal_103;
wire rvx_signal_090;
wire [RVX_LPARA_12-1:0] rvx_signal_025;
wire [RVX_LPARA_12-1:0] rvx_signal_107;
wire rvx_signal_079;
wire rvx_signal_082;
wire [RVX_LPARA_08-1:0] rvx_signal_110;

wire [RVX_LPARA_07-1:0] rvx_signal_016;
wire [`BW_FPIR_TYPE-1:0] rvx_signal_024;
wire rvx_signal_028;
wire [RVX_LPARA_01-1:0] rvx_signal_004;
wire [RVX_LPARA_12-1:0] rvx_signal_068;
wire [RVX_LPARA_02-1:0] rvx_signal_101;
wire [RVX_LPARA_09-1:0] rvx_signal_033;

wire [RVX_LPARA_07-1:0] rvx_signal_083;
wire [RVX_LPARA_07-1:0] rvx_signal_023;

wire [RVX_LPARA_07-1:0] rvx_signal_091;
wire [RVX_LPARA_07-1:0] rvx_signal_104;

reg [RVX_LPARA_07-1:0] rvx_signal_050;
reg [RVX_LPARA_07-1:0] rvx_signal_112;
reg [RVX_LPARA_07-1:0] rvx_signal_078;
wire [BW_IEEESP_VALUE-1:0] rvx_signal_038;
wire [BW_IEEEDP_VALUE-1:0] rvx_signal_010;

localparam  RVX_LPARA_05 = RVX_LPARA_03;

reg [RVX_LPARA_05*BW_DATA-1:0] rvx_signal_089;

wire [32-1:0] rvx_signal_084;
reg  [32-1:0] rvx_signal_007;

RVX_MODULE_102
#(
  .RVX_GPARA_0(BW_ADDR),
  .RVX_GPARA_2(BW_DATA),
  .RVX_GPARA_1(ENDIAN_TYPE)
)
i_rvx_instance_10
(
	.rvx_port_03(clk),
	.rvx_port_11(rstnn),

	.rvx_port_21(rpsel),
	.rvx_port_07(rpenable),
	.rvx_port_00(rpaddr),
	.rvx_port_05(rpwrite),
	.rvx_port_27(rpwdata),
	.rvx_port_06(rprdata),
	.rvx_port_13(rpready),
	.rvx_port_15(rpslverr),

	.rvx_port_28(1'b 0),
  .rvx_port_20(rvx_signal_030),
	.rvx_port_24(rvx_signal_013),
	.rvx_port_04(rvx_signal_048),
	.rvx_port_01(rvx_signal_041),
	.rvx_port_19(rvx_signal_012),
	.rvx_port_08(rvx_signal_005),
	.rvx_port_10(rvx_signal_011),
	.rvx_port_17(rvx_signal_036),
	.rvx_port_16(rvx_signal_037),
	.rvx_port_09(rvx_signal_046),
	.rvx_port_18(rvx_signal_102),
	.rvx_port_12(rvx_signal_076),
	.rvx_port_22(rvx_signal_070),
	.rvx_port_23(rvx_signal_060),
	.rvx_port_14(rvx_signal_066),
	.rvx_port_26(rvx_signal_056),
	.rvx_port_25(rvx_signal_002),
	.rvx_port_02(rvx_signal_106),
	.rvx_port_29(rvx_signal_115),
	.rvx_port_30(rvx_signal_029)
);

assign rvx_signal_030 = 0;
assign rvx_signal_046 = ~rvx_signal_036;
assign rvx_signal_102 = 0;
assign rvx_signal_029 = ~rvx_signal_070;

always@(*)
begin
  rvx_signal_012 = 0;
  case(rvx_signal_100)
    `RVX_GDEF_156:
      rvx_signal_012 = 1;
    `RVX_GDEF_023:
      rvx_signal_012 = 1;
  endcase
end

always@(*)
begin
  rvx_signal_106 = 0;
  case(rvx_signal_100)
    `RVX_GDEF_023:
      case(rvx_signal_098)
        `RVX_GDEF_226:
          rvx_signal_106 = rvx_signal_043 | rvx_signal_021;
        `RVX_GDEF_403:
          if(INCLUDE_DIVIDER==0)
            rvx_signal_106 = rvx_signal_043 | rvx_signal_021;
      endcase
    `RVX_GDEF_295:
      rvx_signal_106 = 1;
  endcase
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_DATA),
  .NUM_DATA(RVX_LPARA_05)
)
i_rvx_instance_04
(
	.data_input_list(rvx_signal_089),
	.select(rvx_signal_081[RVX_LPARA_05-1:0]),
	.data_output(rvx_signal_084)
);

always@(*)
begin
  rvx_signal_007 = $unsigned(rvx_signal_057);
  case(rvx_signal_098)
    `RVX_GDEF_226,
    `RVX_GDEF_403:
      rvx_signal_007 = $unsigned(rvx_signal_057);
  endcase
end

always@(*)
begin
  rvx_signal_115 = rvx_signal_084;
  case(rvx_signal_100)
    `RVX_GDEF_023:
      rvx_signal_115 = rvx_signal_007;
    `RVX_GDEF_295:
      rvx_signal_115 = rvx_signal_084;
  endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_100 <= `RVX_GDEF_156;
  else
    case(rvx_signal_100)
      `RVX_GDEF_156:
        if(rvx_signal_049)
          rvx_signal_100 <= `RVX_GDEF_023;
      `RVX_GDEF_023:
        if(rvx_signal_061)
          rvx_signal_100 <= `RVX_GDEF_369;
      `RVX_GDEF_369:
        if(rvx_signal_088)
          rvx_signal_100 <= `RVX_GDEF_189;
      `RVX_GDEF_189:
        rvx_signal_100 <= `RVX_GDEF_290;
      `RVX_GDEF_290:
        rvx_signal_100 <= `RVX_GDEF_295;
      `RVX_GDEF_295:
        if(rvx_signal_059)
          rvx_signal_100 <= `RVX_GDEF_156;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  {rvx_signal_098,rvx_signal_093,rvx_signal_094} <= 0;
  else if(rvx_signal_049)
    {rvx_signal_098,rvx_signal_093,rvx_signal_094} <= rvx_signal_005;
end

assign rvx_signal_113 = rvx_signal_013 & rvx_signal_012;
assign rvx_signal_049 = (rvx_signal_100==`RVX_GDEF_156) & rvx_signal_113;
assign rvx_signal_063 = (rvx_signal_100==`RVX_GDEF_023) & rvx_signal_113;

always@(*)
begin
  rvx_signal_088 = 0;
  case(rvx_signal_100)
    `RVX_GDEF_369:
      if(rvx_signal_098==`RVX_GDEF_403)
      begin
        if(INCLUDE_DIVIDER)
          rvx_signal_088 = rvx_signal_079;
        else
          rvx_signal_088 = 1;
      end
      else
        rvx_signal_088 = 1;
  endcase
end

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(RVX_LPARA_03)
)
i_rvx_instance_08
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(1'b 1),
	.init(rvx_signal_014),
  .count(rvx_signal_018),
	.value(rvx_signal_081),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_014 = rvx_signal_061 | rvx_signal_059;
assign rvx_signal_018 = rvx_signal_063 | rvx_signal_026;

always@(*)
begin
  rvx_signal_086 = ((1'b 1) << 0);
  case(rvx_signal_098)
    `RVX_GDEF_166:
      rvx_signal_086 = ((1'b 1) << 0);
    `RVX_GDEF_331,
    `RVX_GDEF_308:
      rvx_signal_086 = ((1'b 1) << 1);
    `RVX_GDEF_226:
      rvx_signal_086 = ((1'b 1) << 3);
    `RVX_GDEF_403:
      if(INCLUDE_DIVIDER)
        rvx_signal_086 = ((1'b 1) << 1);
      else
        rvx_signal_086 = ((1'b 1) << 3);
  endcase
end

assign rvx_signal_026 = (rvx_signal_100==`RVX_GDEF_295) & rvx_signal_106;
assign rvx_signal_061 = rvx_signal_063 & (rvx_signal_081==rvx_signal_086);

always@(*)
begin
  rvx_signal_092 = ((1'b 1) << 0);
  case(rvx_signal_094)
    `RVX_GDEF_034:
      rvx_signal_092 = ((1'b 1) << 1);
  endcase
end

assign rvx_signal_059 = rvx_signal_026 & (rvx_signal_081==rvx_signal_092);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_085 <= 0;
  else if(rvx_signal_105)
    rvx_signal_085 <= rvx_signal_005;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_095 <= 0;
  else if(rvx_signal_067)
    rvx_signal_095 <= rvx_signal_005;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_003 <= 0;
  else if(rvx_signal_044)
    case(rvx_signal_093)
      `RVX_GDEF_196:
        rvx_signal_003 <= rvx_signal_005[32-1];
      default:
        rvx_signal_003 <= 0;
    endcase
end
assign rvx_signal_044 = rvx_signal_105 | rvx_signal_067;

assign rvx_signal_065 = rvx_signal_003;
assign rvx_signal_111 = rvx_signal_065? ((~rvx_signal_085)+1'b 1) : rvx_signal_085;
assign rvx_signal_032 = {rvx_signal_095,rvx_signal_085};
assign rvx_signal_074 = {rvx_signal_095,rvx_signal_085};

RVX_MODULE_073
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_12),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_09),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_06
(
	.rvx_port_3(clk),
	.rvx_port_2(rstnn),
	.rvx_port_4(1'b 1),

	.rvx_port_1(rvx_signal_013 & (rvx_signal_100==`RVX_GDEF_023)),
	.rvx_port_0(rvx_signal_005),
  .rvx_port_5(),
	.rvx_port_6(rvx_signal_097)	
);

assign rvx_signal_027 = rvx_signal_023;

assign {rvx_signal_040, rvx_signal_031, rvx_signal_064, rvx_signal_072, rvx_signal_058, rvx_signal_099} = rvx_signal_027;

RVX_MODULE_004
#(
  .RVX_GPARA_1(RVX_LPARA_04),
  .RVX_GPARA_0(24)
)
i_rvx_instance_07
(
	.rvx_port_1({rvx_signal_072,rvx_signal_058}),
	.rvx_port_0(rvx_signal_057)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_008 <= 0;
  else if(rvx_signal_043)
    rvx_signal_008 <= rvx_signal_027;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_087 <= 0;
  else if(rvx_signal_021)
    rvx_signal_087 <= rvx_signal_027;
end

always@(*)
begin
  rvx_signal_105 = 0;
  rvx_signal_067 = 0;
  rvx_signal_043 = 0;
  rvx_signal_021 = 0;
  if(rvx_signal_063)
    case(rvx_signal_098)
      `RVX_GDEF_166:
      begin
        rvx_signal_105 = rvx_signal_081[0];
        rvx_signal_067 = rvx_signal_081[1];
      end
      `RVX_GDEF_331,
      `RVX_GDEF_308:
      begin
        rvx_signal_043 = rvx_signal_081[0];
        rvx_signal_021 = rvx_signal_081[1];
      end
      `RVX_GDEF_226,
      `RVX_GDEF_403:
      begin
        rvx_signal_043 = rvx_signal_081[0];
        rvx_signal_021 = rvx_signal_081[1];
        rvx_signal_105 = rvx_signal_081[2];
        rvx_signal_067 = rvx_signal_081[3];
      end
    endcase
end

always@(*)
begin
  rvx_signal_001 = rvx_signal_017;
  rvx_signal_022 = rvx_signal_045;
  rvx_signal_035 = rvx_signal_073;
   case(rvx_signal_098)
      `RVX_GDEF_331,
      `RVX_GDEF_308:
      begin
        rvx_signal_001 = rvx_signal_017;
        rvx_signal_022 = rvx_signal_045;
        rvx_signal_035 = rvx_signal_073;
      end
      `RVX_GDEF_226,
      `RVX_GDEF_403:
      begin
        rvx_signal_001 = rvx_signal_096;
        rvx_signal_022 = rvx_signal_069;
        rvx_signal_035 = rvx_signal_006;
      end
   endcase
end

assign rvx_signal_109 = rvx_signal_001 + rvx_signal_022 + rvx_signal_035;

RVX_MODULE_116
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_12),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_09)
)
i_rvx_instance_03
(
	.rvx_port_1(rvx_signal_042),
  .rvx_port_0(rvx_signal_015),
  .rvx_port_6(rvx_signal_052),

  .rvx_port_2(rvx_signal_009),
  .rvx_port_4(rvx_signal_055),
  .rvx_port_3(rvx_signal_039),
	.rvx_port_5(rvx_signal_080)
);

assign rvx_signal_042 = rvx_signal_008;
assign rvx_signal_015 = rvx_signal_087;
assign rvx_signal_052 = rvx_signal_098[`RVX_GDEF_132];

RVX_MODULE_097
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_12),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_09),
  .RVX_GPARA_0(RVX_LPARA_10)
)
i_rvx_instance_02
(
  .rvx_port_07(rvx_signal_009),
  .rvx_port_00(rvx_signal_055),
  .rvx_port_04(rvx_signal_039),
	.rvx_port_08(rvx_signal_080),
  
  .rvx_port_02(rvx_signal_017),
  .rvx_port_05(rvx_signal_045),
  .rvx_port_09(rvx_signal_073),
  .rvx_port_06(rvx_signal_034),

  .rvx_port_03(rvx_signal_051),
  .rvx_port_01(rvx_signal_019)
);

assign rvx_signal_034 = rvx_signal_109;

RVX_MODULE_091
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_12),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_09),
  .RVX_GPARA_1(RVX_LPARA_10),
  .RVX_GPARA_0(RVX_LPARA_00),
  .RVX_GPARA_3(RVX_LPARA_11),
  .RVX_GPARA_4(RVX_LPARA_08),
  .RVX_GPARA_2(0)
)
i_rvx_instance_00
(
	.rvx_port_03(rvx_signal_047),
  .rvx_port_06(rvx_signal_053),
  .rvx_port_11(rvx_signal_077),

  .rvx_port_07(rvx_signal_114),
  .rvx_port_01(rvx_signal_054),
  .rvx_port_09(rvx_signal_108),

  .rvx_port_12(rvx_signal_071),
  .rvx_port_10(rvx_signal_020),
  .rvx_port_02(rvx_signal_000),

  .rvx_port_05(rvx_signal_096),
  .rvx_port_08(rvx_signal_069),
  .rvx_port_04(rvx_signal_006),
  .rvx_port_00(rvx_signal_062),

	.rvx_port_13(rvx_signal_075)
);

assign rvx_signal_047 = rvx_signal_008;
assign rvx_signal_053 = rvx_signal_087;
assign rvx_signal_077 = rvx_signal_098[`RVX_GDEF_320];
assign rvx_signal_062 = rvx_signal_109;
assign rvx_signal_108 = rvx_signal_032;
assign rvx_signal_000 = (INCLUDE_DIVIDER==1)? rvx_signal_110 : rvx_signal_074;

RVX_MODULE_045
#(
  .RVX_GPARA_0(RVX_LPARA_12),
  .RVX_GPARA_1(RVX_LPARA_08)
)
i_rvx_instance_05
(
  .rvx_port_10(clk),
  .rvx_port_07(rstnn),
  .rvx_port_00((INCLUDE_DIVIDER==1)),

  .rvx_port_02(rvx_signal_103),
  .rvx_port_06(rvx_signal_090),
	.rvx_port_01(rvx_signal_025),
	.rvx_port_08(rvx_signal_107),
  .rvx_port_09(rvx_signal_079),
  .rvx_port_03(rvx_signal_082),
	.rvx_port_05(rvx_signal_110),
  .rvx_port_04()
);

assign rvx_signal_103 = (rvx_signal_100==`RVX_GDEF_369) & (rvx_signal_098==`RVX_GDEF_403);
assign rvx_signal_025 = rvx_signal_071;
assign rvx_signal_107 = rvx_signal_020;
assign rvx_signal_082 = 1;

assign rvx_signal_024 = `FPIR_TYPE_NORMAL;
assign rvx_signal_028 = rvx_signal_065;
assign rvx_signal_004 = RVX_LPARA_13-1;
assign rvx_signal_033 = 0;

RVX_MODULE_004
#(
  .RVX_GPARA_1(RVX_LPARA_13),
  .RVX_GPARA_0(RVX_LPARA_04)
)
i_rvx_instance_11
(
	.rvx_port_1(rvx_signal_111),
	.rvx_port_0({rvx_signal_068,rvx_signal_101})
);

assign rvx_signal_016 = {rvx_signal_024, rvx_signal_028, rvx_signal_004, rvx_signal_068, rvx_signal_101, rvx_signal_033};

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_112 <= 0;
  else if(rvx_signal_088)
    rvx_signal_112 <= rvx_signal_050;
end

always@(*)
begin
  rvx_signal_050 = 0;
  case(rvx_signal_098)
    `RVX_GDEF_166:
      rvx_signal_050 = rvx_signal_016;
    `RVX_GDEF_331,
    `RVX_GDEF_308:
      rvx_signal_050 = rvx_signal_051;
    `RVX_GDEF_226,
    `RVX_GDEF_403:
      rvx_signal_050 = rvx_signal_075;
  endcase
end

RVX_MODULE_027
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_12),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_09)
)
i_rvx_instance_09
(
  .rvx_port_1(rvx_signal_083),
  .rvx_port_0(rvx_signal_023)
);

assign rvx_signal_083 = (rvx_signal_100==`RVX_GDEF_023)? rvx_signal_097 : rvx_signal_112;

assign rvx_signal_104 = rvx_signal_023;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_078 <= 0;
  else if(rvx_signal_100==`RVX_GDEF_189)
    rvx_signal_078 <= rvx_signal_104;
end

RVX_MODULE_078
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_12),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_09),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_01
(
	.rvx_port_5(clk),
	.rvx_port_1(rstnn),
	.rvx_port_6(1'b 1),

	.rvx_port_3(1'b 1),
	.rvx_port_2(rvx_signal_078),
	.rvx_port_0(),
	.rvx_port_4(rvx_signal_038)
);

RVX_MODULE_078
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_12),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_09),
  .BW_IEEE_EXPONENT(BW_IEEEDP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEEDP_MANTISSA)
)
i_rvx_instance_12
(
	.rvx_port_5(clk),
	.rvx_port_1(rstnn),
	.rvx_port_6(1'b 1),

	.rvx_port_3(1'b 1),
	.rvx_port_2(rvx_signal_078),
	.rvx_port_0(),
	.rvx_port_4(rvx_signal_010)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_089 <= 0;
  else if(rvx_signal_100==`RVX_GDEF_290)
    case(rvx_signal_094)
      `RVX_GDEF_385:
        rvx_signal_089 <= rvx_signal_038;
      `RVX_GDEF_034:
        rvx_signal_089 <= rvx_signal_010;
    endcase
end

endmodule
