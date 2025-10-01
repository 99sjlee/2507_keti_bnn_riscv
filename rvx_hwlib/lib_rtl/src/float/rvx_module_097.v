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




module RVX_MODULE_097
(
  rvx_port_07,
  rvx_port_00,
  rvx_port_04,
	rvx_port_08,
  
  rvx_port_02,
  rvx_port_05,
  rvx_port_09,
  rvx_port_06,

  rvx_port_03,
  rvx_port_01
);




`include "rvx_include_05.vh"

parameter RVX_GPARA_0 = BW_SIGNIFICAND_EXTENDED+1;
localparam  RVX_LPARA_0 = 0; 

input wire [BW_FPIR_VALUE-1:0] rvx_port_07;
input wire [BW_FPIR_VALUE-1:0] rvx_port_00;
input wire rvx_port_04;
input wire [BW_FPIR_VALUE-1:0] rvx_port_08;

output wire [RVX_GPARA_0-1:0] rvx_port_02;
output wire [RVX_GPARA_0-1:0] rvx_port_05;
output wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_06;

output wire [BW_FPIR_VALUE-1:0] rvx_port_03;
output wire rvx_port_01;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_12;
wire rvx_signal_27;
wire [BW_EXPONENT-1:0] rvx_signal_06;
wire [BW_SIGNIFICAND-1:0] rvx_signal_14;
wire [BW_GUARD-1:0] rvx_signal_09;
wire [BW_OVERFLOW-1:0] rvx_signal_17;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_20;
wire rvx_signal_07;
wire [BW_EXPONENT-1:0] rvx_signal_08;
wire [BW_SIGNIFICAND-1:0] rvx_signal_02;
wire [BW_GUARD-1:0] rvx_signal_04;
wire [BW_OVERFLOW-1:0] rvx_signal_26;

wire [BW_EXPONENT_EXTENDED-1:0] rvx_signal_13;
wire [BW_EXPONENT_EXTENDED-1:0] rvx_signal_15;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_22;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_00;

wire rvx_signal_16;
wire rvx_signal_11;
wire rvx_signal_18;

wire [RVX_GPARA_0-1:0] rvx_signal_29;
wire rvx_signal_10;
wire rvx_signal_05;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_23;

wire [BW_FPIR_VALUE-1:0] rvx_signal_24;
wire [`BW_FPIR_TYPE-1:0] rvx_signal_01;
wire rvx_signal_25;
wire [BW_EXPONENT-1:0] rvx_signal_19;
wire [BW_SIGNIFICAND-1:0] rvx_signal_03;
wire [BW_GUARD-1:0] rvx_signal_28;
wire [BW_OVERFLOW-1:0] rvx_signal_21;

assign {rvx_signal_12, rvx_signal_27, rvx_signal_06, rvx_signal_14, rvx_signal_09, rvx_signal_17} = rvx_port_07;
assign {rvx_signal_20, rvx_signal_07, rvx_signal_08, rvx_signal_02, rvx_signal_04, rvx_signal_26} = rvx_port_00;
assign rvx_signal_24 = {rvx_signal_01, rvx_signal_25, rvx_signal_19, rvx_signal_03, rvx_signal_28, rvx_signal_21};

assign rvx_signal_13 = $signed(rvx_signal_06);
assign rvx_signal_15 = $signed(rvx_signal_08);
assign rvx_signal_22 = {rvx_signal_14, rvx_signal_09};
assign rvx_signal_00 = {rvx_signal_02, rvx_signal_04};

assign rvx_signal_16 = rvx_signal_27 & rvx_signal_07;
assign rvx_signal_11 = rvx_signal_27 & (~rvx_signal_16);
assign rvx_signal_18 = rvx_signal_07 & (~rvx_signal_16);

assign rvx_port_02 = rvx_signal_11? (~{1'b0,rvx_signal_22}) : {1'b0,rvx_signal_22};
assign rvx_port_05 = rvx_signal_18? (~{1'b0,rvx_signal_00}) : {1'b0,rvx_signal_00};
assign rvx_port_09 = rvx_signal_11 | rvx_signal_18;

assign rvx_signal_10 = (rvx_signal_27==rvx_signal_07) & rvx_port_06[BW_SIGNIFICAND_EXTENDED]; 
assign rvx_signal_05 = (rvx_signal_27 ^ rvx_signal_07) & rvx_port_06[BW_SIGNIFICAND_EXTENDED]; 
assign rvx_signal_29 = (rvx_signal_05? (~rvx_port_06) : rvx_port_06) + rvx_signal_05;
assign rvx_signal_23 = rvx_signal_10? (rvx_port_06>>1) : rvx_signal_29;

assign rvx_signal_01 = rvx_signal_12;
assign rvx_signal_25 = rvx_signal_16 | rvx_signal_05;
assign {rvx_signal_21,rvx_signal_19} = rvx_signal_13 + rvx_signal_10;
assign {rvx_signal_03,rvx_signal_28} = rvx_signal_23;

assign rvx_port_01 = rvx_port_04;
assign rvx_port_03 = rvx_port_04? rvx_port_08 : rvx_signal_24;

endmodule
