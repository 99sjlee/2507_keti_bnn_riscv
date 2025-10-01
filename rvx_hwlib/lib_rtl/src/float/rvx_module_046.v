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





module RVX_MODULE_046
(
	rvx_port_08,
  rvx_port_10,
  rvx_port_07,

  rvx_port_09,
  rvx_port_06,
  rvx_port_00,

  rvx_port_03,
  rvx_port_02,
  rvx_port_04,

  rvx_port_01,
  rvx_port_11,
  rvx_port_05
);





`include "rvx_include_05.vh"

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RVX_GPARA_2 = BW_SIGNIFICAND_EXTENDED+1;
parameter RVX_GPARA_0 = BW_SIGNIFICAND_EXTENDED+1;
parameter RVX_GPARA_3 = BW_SIGNIFICAND_EXTENDED+1;
parameter RVX_GPARA_1 = 1;

input wire [BW_FPIR_VALUE-1:0] rvx_port_08;
input wire [BW_FPIR_VALUE-1:0] rvx_port_10;
input wire rvx_port_07;

output wire [RVX_GPARA_2-1:0] rvx_port_09;
output wire [RVX_GPARA_2-1:0] rvx_port_06;
input wire [2*RVX_GPARA_2-1:0] rvx_port_00;

output wire [RVX_GPARA_0-1:0] rvx_port_03;
output wire [RVX_GPARA_0-1:0] rvx_port_02;
input wire [RVX_GPARA_3-1:0] rvx_port_04;

output wire rvx_port_01;
output wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_port_11;
output wire rvx_port_05;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_12;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_18;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_15;
wire rvx_signal_04;
wire [BW_EXPONENT-1:0] rvx_signal_02;
wire [BW_SIGNIFICAND-1:0] rvx_signal_13;
wire [BW_GUARD-1:0] rvx_signal_01;
wire [BW_OVERFLOW-1:0] rvx_signal_00;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_11;
wire rvx_signal_05;
wire [BW_EXPONENT-1:0] rvx_signal_16;
wire [BW_SIGNIFICAND-1:0] rvx_signal_06;
wire [BW_GUARD-1:0] rvx_signal_14;
wire [BW_OVERFLOW-1:0] rvx_signal_03;

wire [2*BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_07;
wire [2*BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_09;
wire [2*BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_10;

wire [2*BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_17;

wire [2*BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_08;

assign {rvx_signal_15, rvx_signal_04, rvx_signal_02, rvx_signal_13, rvx_signal_01, rvx_signal_00} = rvx_port_08;
assign {rvx_signal_11, rvx_signal_05, rvx_signal_16, rvx_signal_06, rvx_signal_14, rvx_signal_03} = rvx_port_10;

assign rvx_signal_12 = (RVX_GPARA_1==1)? $unsigned({rvx_signal_13,rvx_signal_01}) : $unsigned(rvx_signal_13);
assign rvx_signal_18 = (RVX_GPARA_1==1)? $unsigned({rvx_signal_06,rvx_signal_14}) : $unsigned(rvx_signal_06);

assign rvx_port_09 = $unsigned(rvx_signal_12);
assign rvx_port_06 = $unsigned(rvx_signal_18);

assign rvx_signal_07 = $unsigned(rvx_port_00);
assign rvx_signal_09 = rvx_port_00 << (2*BW_GUARD);
assign rvx_signal_10 = (RVX_GPARA_1==1)? rvx_signal_07 : rvx_signal_09;

assign rvx_port_03 = $unsigned(rvx_signal_12);
assign rvx_port_02 = $unsigned(rvx_signal_18);

RVX_MODULE_004
#(
  .RVX_GPARA_1(RVX_GPARA_3),
  .RVX_GPARA_0(2*BW_SIGNIFICAND_EXTENDED)
)
i_rvx_instance_0
(
	.rvx_port_1(rvx_port_04),
	.rvx_port_0(rvx_signal_17)
);

assign rvx_signal_08 = rvx_port_07? rvx_signal_17 : rvx_signal_10;
assign rvx_port_01 = rvx_signal_04 ^ rvx_signal_05;
assign rvx_port_05 = rvx_signal_08[2*BW_SIGNIFICAND_EXTENDED-1];
assign rvx_port_11 = rvx_port_05? rvx_signal_08[2*BW_SIGNIFICAND_EXTENDED-1-:BW_SIGNIFICAND_EXTENDED] : rvx_signal_08[2*BW_SIGNIFICAND_EXTENDED-1-1-:BW_SIGNIFICAND_EXTENDED];

endmodule
