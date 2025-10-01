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




module RVX_MODULE_073
(
	rvx_port_3,
	rvx_port_2,
	rvx_port_4,

	rvx_port_1,
	rvx_port_0,
  rvx_port_5,
	rvx_port_6	
);




`include "rvx_include_05.vh"
`include "rvx_include_12.vh"

input wire rvx_port_3;
input wire rvx_port_2;
input wire rvx_port_4;

input wire rvx_port_1;
input wire [BW_IEEE_VALUE-1:0] rvx_port_0;
output wire rvx_port_5;
output wire [BW_FPIR_VALUE-1:0] rvx_port_6;

wire rvx_signal_13;
wire [BW_IEEE_EXPONENT-1:0] rvx_signal_01;
wire [BW_IEEE_MANTISSA-1:0] rvx_signal_09;

wire rvx_signal_15;
wire rvx_signal_19;
wire rvx_signal_18;

wire rvx_signal_07;
wire rvx_signal_11;
wire rvx_signal_10;
wire rvx_signal_12;
wire rvx_signal_03;
wire rvx_signal_14;

wire [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_08;

localparam  RVX_LPARA_0 = `MAX(BW_IEEE_EXPONENT, BW_EXPONENT_EXTENDED);

wire [RVX_LPARA_0-1:0] rvx_signal_06;

reg [`BW_FPIR_TYPE-1:0] rvx_signal_05;
wire rvx_signal_00;
wire [BW_EXPONENT-1:0] rvx_signal_16;
wire [BW_SIGNIFICAND-1:0] rvx_signal_02;
wire [BW_GUARD-1:0] rvx_signal_04;
wire [BW_OVERFLOW-1:0] rvx_signal_17;

assign {rvx_signal_13,rvx_signal_01,rvx_signal_09} = rvx_port_0;
assign rvx_port_6 = {rvx_signal_05, rvx_signal_00, rvx_signal_16, rvx_signal_02, rvx_signal_04, rvx_signal_17};

assign rvx_signal_15 = (rvx_signal_01==0);
assign rvx_signal_19 = `IS_ALL_ONE(rvx_signal_01);
assign rvx_signal_18 = (rvx_signal_09==0);

assign rvx_signal_10 = rvx_signal_19 & (~rvx_signal_18);
assign rvx_signal_12 = rvx_signal_13 & rvx_signal_15 & rvx_signal_18;
assign rvx_signal_03 = (~rvx_signal_13) & rvx_signal_15 & rvx_signal_18;
assign rvx_signal_07 = rvx_signal_13 & rvx_signal_19 & rvx_signal_18;
assign rvx_signal_11 = (~rvx_signal_13) & rvx_signal_19 & rvx_signal_18;
assign rvx_signal_14 = rvx_signal_15 & (~rvx_signal_18);

assign rvx_signal_08 = rvx_signal_14? {rvx_signal_09,1'b 0} : {1'b 1, rvx_signal_09};

assign rvx_signal_06 = $unsigned({2'b 00,rvx_signal_01}) - IEEE_EXPONENT_BIAS;

always@(*)
begin
	rvx_signal_05 = `FPIR_TYPE_NORMAL;
	if(rvx_signal_10)
		rvx_signal_05 = `FPIR_TYPE_NAN;
	if(rvx_signal_03)
		rvx_signal_05 = `FPIR_TYPE_PZERO;
	if(rvx_signal_12)
		rvx_signal_05 = `FPIR_TYPE_MZERO;
	if(rvx_signal_11)
		rvx_signal_05 = `FPIR_TYPE_PINF;
	if(rvx_signal_07)
		rvx_signal_05 = `FPIR_TYPE_MINF;
end

assign rvx_signal_00 = rvx_signal_13;
assign {rvx_signal_17,rvx_signal_16} = rvx_signal_06;

RVX_MODULE_004
#(
  .RVX_GPARA_1(BW_IEEE_SIGNIFICAND),
  .RVX_GPARA_0(BW_SIGNIFICAND_EXTENDED)
)
i_rvx_instance_0
(
	.rvx_port_1(rvx_signal_08),
	.rvx_port_0({rvx_signal_02, rvx_signal_04})
);

assign rvx_port_5 = rvx_port_1;

endmodule
