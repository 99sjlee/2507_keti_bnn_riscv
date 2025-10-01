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
`include "ervp_axi_define.vh"

`include "rvx_include_00.vh"





module RVX_MODULE_093
(
  rvx_port_26,
  rvx_port_05,

  rvx_port_18,
  rvx_port_23,

  rvx_port_09,
  rvx_port_08,
  rvx_port_15,
  rvx_port_04,
  rvx_port_19,
  rvx_port_16,
  rvx_port_17,
  rvx_port_22,
  rvx_port_14,
  rvx_port_11,
  rvx_port_01,
  rvx_port_07,
  rvx_port_21,
  rvx_port_00,
  rvx_port_13,

  rvx_port_20,
  rvx_port_12,
  rvx_port_27,
  rvx_port_25,
  rvx_port_06,

  rvx_port_24,
  rvx_port_28,
  rvx_port_02,

  rvx_port_30,
  rvx_port_10,
  rvx_port_03,
  rvx_port_29
);





parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 32;

localparam  RVX_LPARA_05 = 1;
localparam  RVX_LPARA_00 = `RVX_GDEF_257;
localparam  RVX_LPARA_04 = 1;
localparam  RVX_LPARA_06 = RVX_GPARA_0;

localparam  RVX_LPARA_02 = 0;
localparam  RVX_LPARA_07 = 0;
localparam  RVX_LPARA_09 = RVX_GPARA_3+RVX_LPARA_02;
localparam  RVX_LPARA_01 = RVX_GPARA_1+RVX_LPARA_07;

input wire rvx_port_26;
input wire rvx_port_05;

input wire rvx_port_18;
input wire rvx_port_23;

input wire [(RVX_LPARA_09)-1:0] rvx_port_09;
output wire [(RVX_LPARA_01)-1:0] rvx_port_08;
input wire rvx_port_15;
input wire rvx_port_04;
output wire rvx_port_19;
output wire [(RVX_LPARA_05)-1:0] rvx_port_16;
input wire rvx_port_17;
input wire [(RVX_LPARA_00)-1:0] rvx_port_22;
output wire rvx_port_14;
input wire rvx_port_11;
input wire [(RVX_LPARA_04)-1:0] rvx_port_01;
output wire rvx_port_07;
input wire rvx_port_21;
output wire rvx_port_00;
output wire [(RVX_LPARA_06)-1:0] rvx_port_13;

output wire [RVX_GPARA_3-1:0] rvx_port_20;
input wire [RVX_GPARA_1-1:0] rvx_port_12;
input wire rvx_port_27;
input wire [RVX_GPARA_0-1:0] rvx_port_25;
output wire rvx_port_06;

output wire rvx_port_24;
output wire [RVX_GPARA_0-1:0] rvx_port_28;
input wire rvx_port_02;

output wire rvx_port_30;
output wire [RVX_LPARA_00-1:0] rvx_port_10;
input wire rvx_port_03;
output wire rvx_port_29;

wire rvx_signal_07;

wire [`RVX_GDEF_329-1:0] rvx_signal_21;
wire [RVX_GPARA_2-1:0] rvx_signal_20;
wire [`RVX_GDEF_208-1:0] rvx_signal_03;
wire rvx_signal_09;
wire rvx_signal_22;
wire rvx_signal_06;
wire rvx_signal_04;
wire rvx_signal_18;

localparam  RVX_LPARA_03 = `RVX_GDEF_329;

wire rvx_signal_02;
wire rvx_signal_10;
wire rvx_signal_14;
wire [RVX_LPARA_03-1:0] rvx_signal_11;

localparam  RVX_LPARA_08 = `RVX_GDEF_208;

wire rvx_signal_01;
wire rvx_signal_19;
wire rvx_signal_12;
wire [RVX_LPARA_08-1:0] rvx_signal_16;

wire rvx_signal_13;
wire rvx_signal_05;
wire rvx_signal_15;

wire rvx_signal_00;
wire rvx_signal_17;
wire rvx_signal_08;

ERVP_ASYNCH_SINGLE_CYCLE
i_rvx_instance_1
(
	.wclk(rvx_port_26),
	.wrstnn(rvx_port_23),
	.wcontrol(rvx_port_05),
	.rclk(rvx_port_18),
	.rrstnn(rvx_port_23),
	.rcontrol(rvx_signal_07)
);

assign {rvx_signal_18,rvx_signal_04,rvx_signal_06,rvx_signal_22,rvx_signal_09,rvx_signal_03,rvx_signal_20,rvx_signal_21} = rvx_port_22;

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_03)
)
i_rvx_instance_2
(
	.clk(rvx_port_18),
  .rstnn(rvx_port_23),
	.enable(rvx_signal_02),
	.init(rvx_signal_10),
  .count(rvx_signal_14),
	.value(rvx_signal_11),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_02 = rvx_signal_13;
assign rvx_signal_10 = rvx_signal_00 | rvx_port_15;
assign rvx_signal_14 = rvx_signal_09? 0 : (rvx_signal_22? rvx_signal_07 : 1);

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_08)
)
i_rvx_instance_0
(
	.clk(rvx_port_18),
  .rstnn(rvx_port_23),
	.enable(rvx_signal_01),
	.init(rvx_signal_19),
  .count(rvx_signal_12),
	.value(rvx_signal_16),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_01 = rvx_signal_13;
assign rvx_signal_19 = rvx_signal_08 | rvx_port_15;
assign rvx_signal_12 = rvx_signal_00;

assign rvx_signal_17 = (rvx_signal_16==rvx_signal_03);

assign rvx_signal_13 = rvx_port_17 & (rvx_signal_06|rvx_signal_22|rvx_signal_09);
assign rvx_signal_05 = rvx_signal_13 & (rvx_signal_09? 1 : (rvx_signal_11==rvx_signal_21));
assign rvx_signal_15 = rvx_signal_05 & (rvx_signal_09? rvx_port_27 : 1);
assign rvx_port_06 = rvx_signal_05 & (rvx_signal_04? rvx_port_02 : rvx_port_21);
assign rvx_signal_00 = rvx_signal_15 & rvx_port_06;
assign rvx_signal_08 = rvx_signal_00 & rvx_signal_17;

assign rvx_port_24 = rvx_signal_04 & rvx_signal_15;
assign rvx_port_28 = rvx_port_25;

assign rvx_port_30 = rvx_signal_08 | rvx_port_15;
assign rvx_port_10 = rvx_port_22;
assign rvx_port_29 = rvx_port_15 & (~rvx_port_17);

assign rvx_port_20 = rvx_port_09;
assign rvx_port_08 = rvx_port_12;
assign rvx_port_19 = (rvx_signal_15 & (~rvx_port_06)) | (rvx_port_30 & (~rvx_port_03));
assign rvx_port_16 = 0;
assign rvx_port_14 = ((~rvx_signal_18) & rvx_signal_08) | rvx_port_15;
assign rvx_port_07 = 0;
assign rvx_port_00 = (~rvx_signal_04) & rvx_signal_15;
assign rvx_port_13 = rvx_port_25;

endmodule
