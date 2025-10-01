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





module RVX_MODULE_121
(
  rvx_port_01,
  rvx_port_23,

  rvx_port_27,
  rvx_port_07,
  rvx_port_11,

  rvx_port_16,
  rvx_port_14,
  rvx_port_03,
  rvx_port_15,

  rvx_port_06,
  rvx_port_09,
  rvx_port_18,
  rvx_port_02,
  rvx_port_26,
  rvx_port_12,
  rvx_port_17,
  rvx_port_13,
  rvx_port_00,
  rvx_port_21,
  rvx_port_28,
  rvx_port_08,
  rvx_port_10,
  rvx_port_25,
  rvx_port_19,
  rvx_port_05,
  rvx_port_24,
  rvx_port_22,

  rvx_port_04,
  rvx_port_20
);





parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_3 = 32;

localparam  RVX_LPARA_07 = 1;
localparam  RVX_LPARA_15 = 1;
localparam  RVX_LPARA_04 = 1;
localparam  RVX_LPARA_14 = `RVX_GDEF_257;
localparam  RVX_LPARA_12 = 1;
localparam  RVX_LPARA_13 = RVX_GPARA_1;

input wire rvx_port_01;
input wire rvx_port_23;

input wire rvx_port_27;
input wire [RVX_GPARA_1-1:0] rvx_port_07;
output wire rvx_port_11;

input wire rvx_port_16;
input wire [RVX_LPARA_14-1:0] rvx_port_14;
output wire rvx_port_03;
input wire rvx_port_15;

localparam  RVX_LPARA_11 = RVX_GPARA_2;
localparam  RVX_LPARA_17 = 1;

input wire [(2)-1:0] rvx_port_06;
output wire rvx_port_09;
output wire rvx_port_18;
output wire rvx_port_02;
output wire [`BW_AXI_ALEN-1:0] rvx_port_26;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_12;
output wire [`BW_AXI_ABURST-1:0] rvx_port_17;
output wire [`BW_AXI_WSTRB(RVX_GPARA_0)-1:0] rvx_port_13;
output wire [RVX_GPARA_0-1:0] rvx_port_00;
output wire [RVX_LPARA_11-1:0] rvx_port_21;
output wire [RVX_LPARA_17-1:0] rvx_port_28;
output wire [(2)-1:0] rvx_port_08;
input wire rvx_port_10;
input wire rvx_port_25;
input wire rvx_port_19;
input wire [`BW_AXI_RESP-1:0] rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_24;
input wire [RVX_LPARA_17-1:0] rvx_port_22;

output wire rvx_port_04;
output wire rvx_port_20;

genvar i;

localparam  RVX_LPARA_09 = 1<<`PLOG2(RVX_GPARA_1);
localparam  RVX_LPARA_00 = (RVX_GPARA_3!=0);

wire [`RVX_GDEF_329-1:0] rvx_signal_23;
wire [RVX_GPARA_2-1:0] rvx_signal_29;
wire [`RVX_GDEF_208-1:0] rvx_signal_07;
wire rvx_signal_02;
wire rvx_signal_03;
wire rvx_signal_22;
wire rvx_signal_25;
wire rvx_signal_06;

localparam  RVX_LPARA_10 = RVX_LPARA_14;
localparam  RVX_LPARA_02 = 4;

wire rvx_signal_21;
wire rvx_signal_28;
wire rvx_signal_04;
wire rvx_signal_15;
wire [RVX_LPARA_10-1:0] rvx_signal_10;
wire rvx_signal_00;
wire rvx_signal_17;
wire [RVX_LPARA_10-1:0] rvx_signal_20;

localparam  RVX_LPARA_01 = RVX_GPARA_1;
localparam  RVX_LPARA_05 = RVX_LPARA_00? RVX_GPARA_3 : 2;

wire rvx_signal_18;
wire rvx_signal_05;
wire rvx_signal_24;
wire rvx_signal_27;
wire [RVX_LPARA_01-1:0] rvx_signal_32;
wire rvx_signal_14;
wire rvx_signal_01;
wire [RVX_LPARA_01-1:0] rvx_signal_12;

localparam  RVX_LPARA_08 = `RVX_GDEF_329;

wire rvx_signal_11;
wire rvx_signal_26;
wire rvx_signal_13;
wire [RVX_LPARA_08-1:0] rvx_signal_16;

wire rvx_signal_09;
wire rvx_signal_31;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_30;

localparam  RVX_LPARA_06 = `GET_AXI_SIZE(RVX_GPARA_0);

wire [RVX_LPARA_06-1:0] rvx_signal_33;
wire [RVX_LPARA_06-1:0] rvx_signal_08;
wire [RVX_LPARA_11-1:0] rvx_signal_19;

localparam  RVX_LPARA_16 = `BW_AXI_WSTRB(RVX_GPARA_0);
localparam  RVX_LPARA_03 = RVX_LPARA_06;

assign {rvx_signal_06,rvx_signal_25,rvx_signal_22,rvx_signal_03,rvx_signal_02,rvx_signal_07,rvx_signal_29,rvx_signal_23} = rvx_signal_20;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_10),
  .DEPTH(RVX_LPARA_02)
)
i_rvx_instance_2
(
  .clk(rvx_port_01),
  .rstnn(rvx_port_23),
  .enable(rvx_signal_21),
  .clear(rvx_signal_28),
  .wready(rvx_signal_04),
  .wfull(),
  .wrequest(rvx_signal_15),
  .wdata(rvx_signal_10),
  .wnum(),
  .rready(rvx_signal_00),
  .rempty(),
  .rrequest(rvx_signal_17),
  .rdata(rvx_signal_20),
  .rnum()
);

assign rvx_signal_21 = 1;
assign rvx_signal_28 = rvx_port_04;
assign rvx_port_03 = rvx_signal_04;
assign rvx_signal_15 = rvx_port_16;
assign rvx_signal_10 = rvx_port_14;
assign rvx_signal_17 = rvx_port_20;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_01),
  .DEPTH(RVX_LPARA_05)
)
i_rvx_instance_1
(
  .clk(rvx_port_01),
  .rstnn(rvx_port_23),
  .enable(rvx_signal_18),
  .clear(rvx_signal_05),
  .wready(rvx_signal_24),
  .wfull(),
  .wrequest(rvx_signal_27),
  .wdata(rvx_signal_32),
  .wnum(),
  .rready(rvx_signal_14),
  .rempty(),
  .rrequest(rvx_signal_01),
  .rdata(rvx_signal_12),
  .rnum()
);

assign rvx_signal_18 = RVX_LPARA_00;
assign rvx_signal_05 = rvx_port_04;
assign rvx_signal_27 = rvx_port_27;
assign rvx_signal_32 = rvx_port_07;
assign rvx_port_11 = rvx_signal_24;
assign rvx_signal_01 = rvx_signal_13;

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_08)
)
i_rvx_instance_0
(
	.clk(rvx_port_01),
  .rstnn(rvx_port_23),
	.enable(rvx_signal_11),
	.init(rvx_signal_26),
  .count(rvx_signal_13),
	.value(rvx_signal_16),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_11 = RVX_LPARA_00;
assign rvx_signal_26 = rvx_signal_31;
assign rvx_signal_13 = rvx_signal_09;

assign rvx_signal_09 = rvx_port_09 & rvx_port_06[0];
assign rvx_signal_31 = rvx_signal_09 & rvx_port_18;

assign rvx_signal_30 = `GET_AXI_SIZE(RVX_LPARA_09);

assign rvx_signal_33 = 0;
assign rvx_signal_08 = rvx_signal_29;
assign rvx_signal_19 = {rvx_signal_29[RVX_LPARA_11-1:RVX_LPARA_06], rvx_signal_33};

assign rvx_port_09 = rvx_signal_00 & rvx_signal_25;
assign rvx_port_18 = (rvx_signal_16==rvx_signal_07);
assign rvx_port_02 = 1;
assign rvx_port_26 = rvx_signal_07;
assign rvx_port_12 = rvx_signal_30;
assign rvx_port_17 = `AXI_BURST_INCR;
assign rvx_port_21 = rvx_signal_19;
assign rvx_port_28 = 0;

assign rvx_port_13 = -1;

generate
for(i=0; i<RVX_GPARA_0/RVX_LPARA_09; i=i+1)
begin : i_duplicate_dma_wdata
  assign rvx_port_00[RVX_LPARA_09*(i+1)-1-:RVX_LPARA_09] = rvx_signal_12;
end
endgenerate

assign rvx_port_08[1] = 1;
assign rvx_port_08[0] = 1;

assign rvx_port_04 = rvx_port_15 & (~rvx_signal_00);
assign rvx_port_20 = rvx_signal_00 & (rvx_signal_25? ((~rvx_signal_06) & rvx_signal_31) : 1);

endmodule
