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





module RVX_MODULE_067
(
	rvx_port_00,
	rvx_port_14,

	rvx_port_03,
	rvx_port_07,
	rvx_port_17,
	rvx_port_11,
	rvx_port_04,
	rvx_port_02,
	rvx_port_13,
	rvx_port_05,
	rvx_port_10,

	rvx_port_06,
	rvx_port_19,
	rvx_port_01,
	rvx_port_15,
	rvx_port_08,
	rvx_port_12,
	rvx_port_16,
	rvx_port_18,
	rvx_port_09
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_1 = 1;

input wire rvx_port_00, rvx_port_14;

input wire [RVX_GPARA_2-1:0] rvx_port_03;
input wire [RVX_GPARA_2-1:0] rvx_port_07;
input wire [RVX_GPARA_2*RVX_GPARA_0-1:0] rvx_port_17;
input wire [RVX_GPARA_2-1:0] rvx_port_11;
input wire [RVX_GPARA_2*RVX_GPARA_3-1:0] rvx_port_04;
input wire [RVX_GPARA_2*RVX_GPARA_1-1:0] rvx_port_10;
output wire [RVX_GPARA_2*RVX_GPARA_3-1:0] rvx_port_02;
output wire [RVX_GPARA_2-1:0] rvx_port_13;
output wire [RVX_GPARA_2-1:0] rvx_port_05;

output wire rvx_port_06;
output wire rvx_port_19;
output wire [RVX_GPARA_0-1:0] rvx_port_01;
output wire rvx_port_15;
output wire [RVX_GPARA_3-1:0] rvx_port_08;
output wire [RVX_GPARA_1-1:0] rvx_port_09;
input wire [RVX_GPARA_3-1:0] rvx_port_12;
input wire rvx_port_16;
input wire rvx_port_18;

genvar i,j;

wire [RVX_GPARA_0-1:0] rvx_signal_13 [RVX_GPARA_2-1:0];
wire [RVX_GPARA_3-1:0] rvx_signal_02 [RVX_GPARA_2-1:0];
wire [RVX_GPARA_1-1:0] rvx_signal_06 [RVX_GPARA_2-1:0];

localparam  RVX_LPARA_5 = 1 + RVX_GPARA_0 + RVX_GPARA_3 + RVX_GPARA_1;
localparam  RVX_LPARA_0 = RVX_GPARA_3 + 1;

wire [RVX_LPARA_5-1:0] rvx_signal_04 [RVX_GPARA_2-1:0];
wire [RVX_GPARA_2*RVX_LPARA_5-1:0] rvx_signal_05;
wire [RVX_GPARA_2*RVX_LPARA_0-1:0] rvx_signal_03;
wire [RVX_LPARA_0-1:0] rvx_signal_09 [RVX_GPARA_2-1:0];
wire [RVX_GPARA_3-1:0] rvx_signal_07 [RVX_GPARA_2-1:0];

wire [RVX_GPARA_2-1:0] rvx_signal_14;

wire rvx_signal_08;
wire [RVX_LPARA_5-1:0] rvx_signal_00;
wire rvx_signal_11;
wire [RVX_LPARA_0-1:0] rvx_signal_01;

generate
	for(i=0; i<RVX_GPARA_2; i=i+1)
	begin : i_demux_response
		assign rvx_signal_13[i] = rvx_port_17[RVX_GPARA_0*(i+1)-1 -:RVX_GPARA_0];
		assign rvx_signal_02[i] = rvx_port_04[RVX_GPARA_3*(i+1)-1 -:RVX_GPARA_3];
		assign rvx_signal_06[i] = rvx_port_10[RVX_GPARA_1*(i+1)-1 -:RVX_GPARA_1];
		assign rvx_signal_04[i] = {rvx_port_11[i],rvx_signal_13[i],rvx_signal_02[i],rvx_signal_06[i]};
		assign rvx_signal_05[RVX_LPARA_5*(i+1)-1 -:RVX_LPARA_5] = rvx_signal_04[i];
		assign rvx_signal_09[i] = rvx_signal_03[RVX_LPARA_0*(i+1)-1 -:RVX_LPARA_0];
		assign {rvx_signal_07[i],rvx_port_05[i]} = rvx_signal_09[i];
		assign rvx_port_02[RVX_GPARA_3*(i+1)-1 -:RVX_GPARA_3] = rvx_signal_07[i];
	end
endgenerate

assign rvx_signal_14 = 0;

localparam  RVX_LPARA_1 = 2;
localparam  RVX_LPARA_2 = 0;
localparam  RVX_LPARA_3 = 2;
localparam  RVX_LPARA_4 = 3;

reg [RVX_LPARA_1-1:0] rvx_signal_10;
wire rvx_signal_12;

RVX_MODULE_029
#(
	.RVX_GPARA_1(RVX_GPARA_2),
	.RVX_GPARA_2(RVX_LPARA_5),
	.RVX_GPARA_0(RVX_LPARA_0)
)
i_rvx_instance_0
(
	.rvx_port_07(rvx_port_00),
	.rvx_port_05(rvx_port_14),

	.rvx_port_02(rvx_port_03 & rvx_port_07),
	.rvx_port_00(rvx_signal_14),
	.rvx_port_06(rvx_signal_05),
	.rvx_port_03(rvx_port_13),
	.rvx_port_11(rvx_signal_03),

	.rvx_port_01(),
	.rvx_port_10(rvx_signal_08),
	.rvx_port_04(rvx_signal_00),
	.rvx_port_09(rvx_signal_11),
	.rvx_port_08(rvx_signal_01)
);

assign {rvx_port_15,rvx_port_01,rvx_port_08,rvx_port_09} = rvx_signal_00;
assign rvx_signal_01 = {rvx_port_12,rvx_port_18};

always@(posedge rvx_port_00, negedge rvx_port_14)
begin
	if(rvx_port_14==0)
		rvx_signal_10 <= RVX_LPARA_2;
	else
		case(rvx_signal_10)
			RVX_LPARA_2:
				if(rvx_signal_08)
					rvx_signal_10 <= RVX_LPARA_3;
			RVX_LPARA_3:
				rvx_signal_10 <= RVX_LPARA_4;
			RVX_LPARA_4:
				if(rvx_signal_12)
					rvx_signal_10 <= RVX_LPARA_2;
		endcase
end

assign {rvx_port_06,rvx_port_19} = rvx_signal_10;
assign rvx_signal_12 = (rvx_signal_10==RVX_LPARA_4) & rvx_port_16;
assign rvx_signal_11 = rvx_signal_12;

endmodule
