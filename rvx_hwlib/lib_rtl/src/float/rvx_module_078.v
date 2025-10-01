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
`include "fpir_define.vh"




module RVX_MODULE_078
(
	rvx_port_5,
	rvx_port_1,
	rvx_port_6,

	rvx_port_3,
	rvx_port_2,
	rvx_port_0,
	rvx_port_4
);




`include "rvx_include_05.vh"
`include "rvx_include_12.vh"

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire rvx_port_5;
input wire rvx_port_1;
input wire rvx_port_6;

input wire rvx_port_3;
input wire [BW_FPIR_VALUE-1:0] rvx_port_2;
output wire rvx_port_0;
output wire [BW_IEEE_VALUE-1:0] rvx_port_4;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_01;
wire rvx_signal_10;
wire [BW_EXPONENT-1:0] rvx_signal_21;
wire [BW_SIGNIFICAND-1:0] rvx_signal_23;
wire [BW_GUARD-1:0] rvx_signal_17;
wire [BW_OVERFLOW-1:0] rvx_signal_20;

localparam  RVX_LPARA_0 = `MAX(BW_IEEE_EXPONENT, BW_EXPONENT_EXTENDED);
localparam  RVX_LPARA_3 = BW_SIGNIFICAND_EXTENDED + BW_IEEE_SIGNIFICAND;

wire [RVX_LPARA_0-1:0] rvx_signal_00;
wire [RVX_LPARA_3-1:0] rvx_signal_14;

wire [RVX_LPARA_3-1:0] rvx_signal_24;
wire [RVX_LPARA_3-1:0] rvx_signal_09;
wire rvx_signal_06;

wire [RVX_LPARA_0-1:0] rvx_signal_07;
reg  [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_18;

localparam  RVX_LPARA_2 = RVX_LPARA_3;
localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_INDEX(BW_IEEE_MANTISSA+1+BW_SIGNIFICAND_EXTENDED);

wire [RVX_LPARA_2-1:0] rvx_signal_15;
wire [RVX_LPARA_1-1:0] rvx_signal_16;
wire [RVX_LPARA_2-1:0] rvx_signal_03;

wire rvx_signal_05;
wire rvx_signal_02;
wire rvx_signal_08;

wire rvx_signal_12;
reg  [BW_IEEE_EXPONENT-1:0] rvx_signal_13;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_19;

reg  rvx_signal_11;
reg  [BW_IEEE_EXPONENT-1:0] rvx_signal_04;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_22;

assign {rvx_signal_01, rvx_signal_10, rvx_signal_21, rvx_signal_23, rvx_signal_17, rvx_signal_20} = rvx_port_2;

assign rvx_signal_00 = $signed({rvx_signal_20,rvx_signal_21});

RVX_MODULE_004
#(
  .RVX_GPARA_1(BW_SIGNIFICAND_EXTENDED),
  .RVX_GPARA_0(RVX_LPARA_3)
)
i_rvx_instance_0
(
	.rvx_port_1({rvx_signal_23,rvx_signal_17}),
	.rvx_port_0(rvx_signal_14)
);

RVX_MODULE_064
#(
  .RVX_GPARA_2(RVX_LPARA_3),
  .RVX_GPARA_1(BW_SIGNIFICAND_EXTENDED),
  .UNSIGNED(1)
)
i_rvx_instance_2
(
	.rvx_port_1(rvx_signal_24),
	.rvx_port_2(rvx_signal_09),
  .rvx_port_0(rvx_signal_06)
);

assign rvx_signal_24 = rvx_signal_14;

assign rvx_signal_07 = $signed(rvx_signal_00) + IEEE_EXPONENT_BIAS  + $unsigned(rvx_signal_06);
always@(*)
begin
  rvx_signal_18 = 0;
  if(rvx_signal_06)
    rvx_signal_18[BW_IEEE_SIGNIFICAND-1] = 1;
  else
    rvx_signal_18 = rvx_signal_09[RVX_LPARA_3-1-:BW_IEEE_SIGNIFICAND];
end

assign rvx_signal_05 = (rvx_signal_18==0) | ($signed(rvx_signal_07)<(IEEE_EXPONENT_MIN_NORMALIZED-1));
assign rvx_signal_02 = (~rvx_signal_05) & ($signed(rvx_signal_07)<=0);
assign rvx_signal_08 = ($signed(rvx_signal_07)>IEEE_EXPONENT_MAX);

RVX_MODULE_055
#(
  .RVX_GPARA_2(RVX_LPARA_2),
  .RVX_GPARA_1(RVX_LPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_0(rvx_signal_15),
	.rvx_port_1(rvx_signal_16),
	.rvx_port_2(rvx_signal_03)
);

assign rvx_signal_15 = rvx_signal_14;
assign rvx_signal_16 = (~rvx_signal_07) + 1'b 1 + 1'b 1 + BW_SIGNIFICAND_EXTENDED;

assign rvx_signal_12 = rvx_signal_10;
always@(*)
begin
  rvx_signal_13 = 0;
  rvx_signal_19 = 0;
  if(rvx_signal_05)
  begin
    rvx_signal_13 = 0;
    rvx_signal_19 = 0;
  end
  else if(rvx_signal_02)
  begin
    rvx_signal_13 = 0;
    rvx_signal_19 = rvx_signal_03;
  end
  else if(rvx_signal_08)
  begin
    rvx_signal_13 = IEEE_INF_EXPONENT;
    rvx_signal_19 = IEEE_INF_MANTISSA;
  end
  else
  begin
    rvx_signal_13 = rvx_signal_07;
    rvx_signal_19 = rvx_signal_18;
  end
end

always@(*)
begin
	rvx_signal_11 = 1'b1;
	rvx_signal_04 = IEEE_NAN_EXPONENT;
	rvx_signal_22 = IEEE_NAN_MANTISSA;
	case(rvx_signal_01)
		`FPIR_TYPE_NAN:
		begin
			rvx_signal_11= 1'b1;
			rvx_signal_04 = IEEE_NAN_EXPONENT;
			rvx_signal_22 = IEEE_NAN_MANTISSA;
		end
		`FPIR_TYPE_MINF:
		begin
			rvx_signal_11= 1'b1;
			rvx_signal_04 = IEEE_INF_EXPONENT;
			rvx_signal_22 = IEEE_INF_MANTISSA;
		end
		`FPIR_TYPE_PINF:
		begin
			rvx_signal_11= 1'b 0;
			rvx_signal_04 = IEEE_INF_EXPONENT;
			rvx_signal_22 = IEEE_INF_MANTISSA;
		end
		`FPIR_TYPE_MZERO:
		begin
			rvx_signal_11= 1'b1;
			rvx_signal_04 = 0;
			rvx_signal_22 = 0;
		end
		`FPIR_TYPE_PZERO:
		begin
			rvx_signal_11= 1'b 0;
			rvx_signal_04 = 0;
			rvx_signal_22 = 0;
		end
		default:
		begin
			rvx_signal_11= rvx_signal_12;
			rvx_signal_04 = rvx_signal_13;
			rvx_signal_22 = rvx_signal_19;
		end
	endcase
end

assign rvx_port_0 = rvx_port_3;
assign rvx_port_4 = {rvx_signal_11,rvx_signal_04,rvx_signal_22};

endmodule
