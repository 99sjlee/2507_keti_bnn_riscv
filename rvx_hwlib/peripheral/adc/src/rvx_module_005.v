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
`include "rvx_include_03.vh"





module RVX_MODULE_005
(
	rvx_port_06,
	rvx_port_03,

	rvx_port_00,
	rvx_port_10,
	rvx_port_08,
	rvx_port_09,
	rvx_port_07,
	rvx_port_05,
	rvx_port_04,
	rvx_port_01,

	rvx_port_12,
  rvx_port_11,
  rvx_port_02
);





parameter RVX_GPARA_5 = 1;
parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_4 = 16;

input wire rvx_port_06, rvx_port_03;
input wire rvx_port_00;
input wire rvx_port_10;
input wire [RVX_GPARA_5-1:0] rvx_port_08;
input wire rvx_port_09;
input wire [RVX_GPARA_3-1:0] rvx_port_07;
output wire [RVX_GPARA_3-1:0] rvx_port_05;
output wire rvx_port_04;
output wire rvx_port_01;

input wire rvx_port_12;
output wire [RVX_GPARA_1-1:0] rvx_port_11;
input wire [RVX_GPARA_0-1:0] rvx_port_02;

wire rvx_signal_06;
wire [32-1:0] rvx_signal_03;
wire rvx_signal_09;
wire [32-1:0] rvx_signal_10;
wire [32-1:0] rvx_signal_07;
wire [32-1:0] rvx_signal_01;
wire rvx_signal_04;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_02;
wire [32-1:0] rvx_signal_05;

localparam  RVX_LPARA_1 = `DIVIDERU(RVX_GPARA_1,RVX_GPARA_3);
localparam  RVX_LPARA_0 = RVX_LPARA_1*RVX_GPARA_3;

reg [RVX_LPARA_0-1:0] rvx_signal_00;

RVX_MODULE_079
#(
  .RVX_GPARA_1(RVX_GPARA_5),
  .RVX_GPARA_2(RVX_GPARA_3),
  .RVX_GPARA_0(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.rvx_port_15(rvx_port_06),
	.rvx_port_09(rvx_port_03),

	.rvx_port_14(rvx_port_00),
	.rvx_port_03(rvx_port_10),
	.rvx_port_19(rvx_port_08),
	.rvx_port_20(rvx_port_09),
	.rvx_port_05(rvx_port_07),
	.rvx_port_13(rvx_port_05),
	.rvx_port_02(rvx_port_04),
	.rvx_port_07(rvx_port_01),

	.rvx_port_18(1'b 0),
	.rvx_port_01(rvx_signal_06),
	.rvx_port_16(rvx_signal_03),
	.rvx_port_10(rvx_signal_09),
	.rvx_port_12(rvx_signal_10),
	.rvx_port_11(rvx_signal_07),
	.rvx_port_06(rvx_signal_01),
	.rvx_port_04(rvx_signal_04),
	.rvx_port_00(rvx_signal_08),
	.rvx_port_08(rvx_signal_02),
	.rvx_port_17(rvx_signal_05)
);

assign rvx_signal_03 = rvx_port_11;

always@(posedge rvx_port_06, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_00 <= 0;
  else if(rvx_signal_09)
    rvx_signal_00 <= rvx_signal_10;
end

assign rvx_port_11 = rvx_signal_00;
assign rvx_signal_08 = rvx_port_02;
assign rvx_signal_05 = rvx_port_02;

endmodule
