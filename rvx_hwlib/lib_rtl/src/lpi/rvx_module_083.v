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
`include "ervp_axi_define.vh"





module RVX_MODULE_083
(
	rvx_port_14,
	rvx_port_25,
  rvx_port_06,
  rvx_port_15,

  rvx_port_10,
  rvx_port_11,
  rvx_port_01,
  rvx_port_09,
  rvx_port_00,
  rvx_port_04,

  rvx_port_20,
  rvx_port_18,
  rvx_port_05,
  rvx_port_23,
  rvx_port_07,

  rvx_port_02,
  rvx_port_21,
  rvx_port_08,
  rvx_port_24,
  rvx_port_16,
  rvx_port_12,

  rvx_port_17,
  rvx_port_13,
  rvx_port_19,
  rvx_port_03,
  rvx_port_22
);





parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 32;
parameter BW_LPI_BURDEN = 1;
parameter MEMORY_OPERATION_TYPE = 3;

`include "rvx_include_15.vh"

`include "lpit_function.vb"
`include "lpixm_function.vb"
`include "lpixs_function.vb"

localparam  RVX_LPARA_03 = BW_LPI_BURDEN;
localparam  RVX_LPARA_08 = BW_LPIXM_QPARCEL(RVX_GPARA_1,RVX_GPARA_0);
localparam  RVX_LPARA_10 = BW_LPIXM_YPARCEL(RVX_GPARA_0);
localparam  RVX_LPARA_06 = BW_LPI_DATA(RVX_LPARA_03,RVX_LPARA_08);
localparam  RVX_LPARA_02 = BW_LPI_DATA(RVX_LPARA_03,RVX_LPARA_10);

localparam  RVX_LPARA_05 = RVX_LPARA_03;
localparam  RVX_LPARA_07 = BW_LPIXS_QPARCEL(RVX_GPARA_1,RVX_GPARA_0);
localparam  RVX_LPARA_04 = BW_LPIXS_YPARCEL(RVX_GPARA_0);
localparam  RVX_LPARA_09 = BW_LPI_DATA(RVX_LPARA_05,RVX_LPARA_07);
localparam  RVX_LPARA_01 = BW_LPI_DATA(RVX_LPARA_05,RVX_LPARA_04);

input wire rvx_port_14;
input wire rvx_port_25;
input wire rvx_port_06;
input wire rvx_port_15;

output wire [2-1:0] rvx_port_10;
input wire rvx_port_11;
input wire rvx_port_01;
input wire rvx_port_09;
input wire rvx_port_00;
input wire [RVX_LPARA_06-1:0] rvx_port_04;

input wire [2-1:0] rvx_port_20;
output wire rvx_port_18;
output wire rvx_port_05;
output wire rvx_port_23;
output wire [RVX_LPARA_02-1:0] rvx_port_07;

input wire [2-1:0] rvx_port_02;
output wire rvx_port_21;
output wire rvx_port_08;
output wire rvx_port_24;
output wire rvx_port_16;
output wire [RVX_LPARA_09-1:0] rvx_port_12;

output wire [2-1:0] rvx_port_17;
input wire rvx_port_13;
input wire rvx_port_19;
input wire rvx_port_03;
input wire [RVX_LPARA_01-1:0] rvx_port_22;

wire [BW_LPI_BURDEN_NZ-1:0] rvx_signal_19;
wire rvx_signal_08;
wire [`BW_AXI_ALEN-1:0] rvx_signal_28;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_14;
wire [`BW_AXI_ABURST-1:0] rvx_signal_04;
wire [`NUM_BYTE(RVX_GPARA_0)-1:0] rvx_signal_07;
wire [RVX_GPARA_0-1:0] rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_16;

wire [BW_LPI_BURDEN_NZ-1:0] rvx_signal_13;
wire rvx_signal_31;
wire [`BW_AXI_ALEN-1:0] rvx_signal_23;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_21;
wire [`BW_AXI_ABURST-1:0] rvx_signal_30;
wire [`NUM_BYTE(RVX_GPARA_0)-1:0] rvx_signal_06;
wire [RVX_GPARA_0-1:0] rvx_signal_29;
wire [RVX_GPARA_1-1:0] rvx_signal_20;

localparam  RVX_LPARA_00 = BW_LPI_BURDEN_NZ+1;

wire rvx_signal_27;
wire rvx_signal_12;
wire [RVX_LPARA_00-1:0] rvx_signal_26;
wire [RVX_GPARA_1-1:0] rvx_signal_15;
wire [`BW_AXI_ALEN-1:0] rvx_signal_03;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_17;
wire [`BW_AXI_ABURST-1:0] rvx_signal_02;

wire rvx_signal_32;
wire rvx_signal_05;
wire [RVX_LPARA_00-1:0] rvx_signal_09;
wire [RVX_GPARA_1-1:0] rvx_signal_22;
wire [`BW_AXI_ALEN-1:0] rvx_signal_10;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_25;
wire [`BW_AXI_ABURST-1:0] rvx_signal_24;
wire rvx_signal_18;

reg rvx_signal_01;
reg rvx_signal_11;

always@(*)
begin
  rvx_signal_01 = 0;
  if(rvx_signal_05)
  begin
    if(rvx_signal_31)
      rvx_signal_01 = 0;
    else
      rvx_signal_01 = rvx_signal_27;
  end
  else
    rvx_signal_01 = 1;
end

assign rvx_port_10 = {1'b 0, rvx_signal_11};
always@(*)
begin
  rvx_signal_11 = 0;
  if(rvx_signal_05 && rvx_signal_31)
    rvx_signal_11 = rvx_signal_32;
  else if(rvx_signal_01)
    rvx_signal_11 = ~rvx_signal_08;
end

assign {rvx_signal_19,rvx_signal_08,rvx_signal_28,rvx_signal_14,rvx_signal_04,rvx_signal_07,rvx_signal_00,rvx_signal_16} = rvx_port_04;

RVX_MODULE_072
#(
  .RVX_GPARA_1(RVX_GPARA_1),
  .RVX_GPARA_0(RVX_LPARA_00)
)
i_rvx_instance_0
(
	.rvx_port_12(rvx_port_14),
	.rvx_port_06(rvx_port_25),
  .rvx_port_03(rvx_port_06),
  .rvx_port_10(rvx_port_15),

  .rvx_port_09(rvx_signal_27),
  .rvx_port_04(rvx_signal_12),
  .rvx_port_18(rvx_signal_26),
	.rvx_port_01(rvx_signal_15),
	.rvx_port_11(rvx_signal_03),
	.rvx_port_14(rvx_signal_17),
	.rvx_port_05(rvx_signal_02),

	.rvx_port_16(rvx_signal_32),
  .rvx_port_13(rvx_signal_05),
  .rvx_port_07(rvx_signal_09),
	.rvx_port_17(rvx_signal_22),
  .rvx_port_02(rvx_signal_10),
	.rvx_port_15(rvx_signal_25),
  .rvx_port_08(rvx_signal_24),
  .rvx_port_00(rvx_signal_18)
);

assign rvx_signal_12 = rvx_signal_01 & rvx_port_11;
assign rvx_signal_26 = {rvx_signal_19,rvx_signal_08};
assign rvx_signal_15 = rvx_signal_16;
assign rvx_signal_03 = rvx_signal_28;
assign rvx_signal_17 = rvx_signal_14;
assign rvx_signal_02 = rvx_signal_04;

assign {rvx_signal_13,rvx_signal_31} = rvx_signal_09;
assign rvx_signal_23 = rvx_signal_10;
assign rvx_signal_21 = rvx_signal_25;
assign rvx_signal_30 = rvx_signal_24;
assign rvx_signal_06 = rvx_signal_07;
assign rvx_signal_29 = rvx_signal_00;
assign rvx_signal_20 = rvx_signal_22;
assign rvx_signal_32 = rvx_port_02[0] & (rvx_signal_31? rvx_port_11 : 1);

assign rvx_port_21 = rvx_signal_05 & (rvx_signal_31? rvx_port_11 : 1);
assign rvx_port_08 = rvx_port_11;
assign rvx_port_24 = 1;
assign rvx_port_16 = rvx_signal_31? rvx_signal_18 : 1;
assign rvx_port_12 = {rvx_signal_13,rvx_signal_31,rvx_signal_23,rvx_signal_21,rvx_signal_30,rvx_signal_06,rvx_signal_29,rvx_signal_20};

assign rvx_port_17 = rvx_port_20;
assign rvx_port_18 = rvx_port_13;
assign rvx_port_05 = rvx_port_19;
assign rvx_port_23 = rvx_port_03;
assign rvx_port_07 = rvx_port_22;

endmodule
