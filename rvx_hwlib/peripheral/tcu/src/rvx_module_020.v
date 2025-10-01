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





module RVX_MODULE_020
(
	rvx_port_03,
	rvx_port_02,
	rvx_port_06,
	rvx_port_11,
	rvx_port_10,
	rvx_port_07,
	rvx_port_05,
	rvx_port_12,

	rvx_port_01,
	rvx_port_00,
	rvx_port_08,
	rvx_port_04,
	rvx_port_09
);





`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 32;
localparam  RVX_LPARA_2 = `BW_AXI_WSTRB(RVX_GPARA_0);
localparam  RVX_LPARA_1 = GET_ADDR_MASK_BITWIDTH(RVX_GPARA_0);
localparam  RVX_LPARA_0 = `NUM_BYTE(RVX_GPARA_0);

genvar i;
input wire rvx_port_03;
input wire rvx_port_02;
input wire [RVX_GPARA_1-1:0] rvx_port_06;
input wire [`BW_AXI_ALEN-1:0] rvx_port_11;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_10;
input wire [`BW_AXI_ABURST-1:0] rvx_port_07;
input wire rvx_port_05;
input wire rvx_port_12;

input wire [RVX_GPARA_1-1:0] rvx_port_01;
input wire [RVX_GPARA_1-1:0] rvx_port_00;
input wire rvx_port_08;
input wire [RVX_LPARA_2-1:0] rvx_port_04;
output reg [RVX_LPARA_2-1:0] rvx_port_09;

wire [RVX_GPARA_1-1:0] rvx_signal_05;

reg [RVX_GPARA_1-1:0] rvx_signal_11;
reg [RVX_GPARA_1-1:0] rvx_signal_01;

wire [RVX_LPARA_2-1:0] rvx_signal_09;
wire [RVX_LPARA_2-1:0] rvx_signal_08;

reg [RVX_LPARA_2-1:0] rvx_signal_02;
reg [RVX_LPARA_2-1:0] rvx_signal_04;

wire [RVX_LPARA_1-1:0] rvx_signal_06;
wire [RVX_LPARA_1-1:0] rvx_signal_03;

wire [RVX_GPARA_1-RVX_LPARA_1-1:0] rvx_signal_07;
wire [RVX_GPARA_1-RVX_LPARA_1-1:0] rvx_signal_10;
wire [RVX_GPARA_1-RVX_LPARA_1-1:0] rvx_signal_00;

RVX_MODULE_057
#(
	.RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.rvx_port_10(rvx_port_03),
	.rvx_port_07(rvx_port_02),
	.rvx_port_02(rvx_port_06),
	.rvx_port_11(rvx_port_11),
	.rvx_port_00(rvx_port_10),
	.rvx_port_06(rvx_port_07),
	.rvx_port_01(rvx_port_05),
	.rvx_port_08(rvx_port_12),
	.rvx_port_09(rvx_signal_05),
	.rvx_port_03(),
	.rvx_port_04(),
	.rvx_port_05()
);
always@(posedge rvx_port_03, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
	begin
		rvx_signal_11 <= 0;
		rvx_signal_01 <= 0;
	end
	else
	begin
		if(rvx_port_05)
		begin
			rvx_signal_11 <= rvx_port_01;
			rvx_signal_01 <= rvx_port_00;
		end
	end
end

assign {rvx_signal_07, rvx_signal_06} = rvx_signal_11;
assign {rvx_signal_10, rvx_signal_03} = rvx_signal_01;
assign rvx_signal_00 = rvx_signal_05 [RVX_GPARA_1-1:RVX_LPARA_1];

generate
	for(i=0;i<RVX_LPARA_0;i=i+1)
	begin : genertate_strb
		assign rvx_signal_09[i] = (rvx_signal_06<=i)? 1'b1: 1'b0;
		assign rvx_signal_08[i] = (rvx_signal_03>=i)? 1'b1: 1'b0;
	end
endgenerate

always@(*)
begin
	if(rvx_signal_00 == rvx_signal_07)
		rvx_signal_02 = rvx_signal_09;
	else if(rvx_signal_00 < rvx_signal_07)
		rvx_signal_02 = 0;
	else
		rvx_signal_02 = `ALL_ONE;
end

always@(*)
begin
	if(rvx_signal_00==rvx_signal_10)
		rvx_signal_04 = rvx_signal_08;
	else if(rvx_signal_00>rvx_signal_10)
		rvx_signal_04 = 0;
	else
		rvx_signal_04 = `ALL_ONE;
end

always@(*)
begin
	if(rvx_port_08)
		rvx_port_09 = rvx_port_04;
	else
		rvx_port_09 = rvx_port_04 & rvx_signal_02 & rvx_signal_04;
end

endmodule
