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





module RVX_MODULE_029
(
	rvx_port_07,
	rvx_port_05,

	rvx_port_02,
	rvx_port_00,
	rvx_port_06,
	rvx_port_03,
	rvx_port_11,

	rvx_port_01,
	rvx_port_10,
	rvx_port_04,
	rvx_port_09,
	rvx_port_08
);





parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;

input wire rvx_port_07, rvx_port_05;

input wire [RVX_GPARA_1-1:0] rvx_port_02;
input wire [RVX_GPARA_1-1:0] rvx_port_00;
input wire [RVX_GPARA_1*RVX_GPARA_2-1:0] rvx_port_06;
output wire [RVX_GPARA_1-1:0] rvx_port_03;
output reg [RVX_GPARA_1*RVX_GPARA_0-1:0] rvx_port_11;

output wire [RVX_GPARA_1-1:0] rvx_port_01;
output reg rvx_port_10;
output reg [RVX_GPARA_2-1:0] rvx_port_04;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_08;

genvar i,j;
integer k;

wire [RVX_GPARA_1-1:0] rvx_signal_00;

localparam  RVX_LPARA_2 = 2;
localparam  RVX_LPARA_1 = 0;
localparam  RVX_LPARA_0 = 1;
localparam  RVX_LPARA_3 = 2;
localparam  RVX_LPARA_4 = 3;

reg [RVX_LPARA_2-1:0] rvx_signal_02;

wire rvx_signal_01;
wire rvx_signal_05;
wire rvx_signal_06;
wire rvx_signal_04;

reg [RVX_GPARA_1-1:0] rvx_signal_07;
reg [RVX_GPARA_1-1:0] rvx_signal_03;
wire rvx_signal_09;

wire [RVX_GPARA_2-1:0] rvx_signal_08;

always@(posedge rvx_port_07, negedge rvx_port_05)
begin
	if(rvx_port_05==0)
		rvx_signal_02 <= RVX_LPARA_1;
	else
		case(rvx_signal_02)
			RVX_LPARA_1:
				if(rvx_signal_01)
					rvx_signal_02 <= RVX_LPARA_0;
			RVX_LPARA_0:
				if(rvx_signal_01)
					rvx_signal_02 <= RVX_LPARA_3;
			RVX_LPARA_3:
				if(rvx_signal_06)
					rvx_signal_02 <= RVX_LPARA_4;
			RVX_LPARA_4:
				if(rvx_signal_04)
					rvx_signal_02 <= RVX_LPARA_1;
				else
					rvx_signal_02 <= RVX_LPARA_0;
		endcase
end

assign rvx_signal_01 = ((rvx_signal_07 & rvx_port_02)!=0);
assign rvx_signal_06 = rvx_port_10 & rvx_port_09;
assign rvx_signal_04 = ((rvx_signal_07 & (~rvx_port_00))!=0);

always@(posedge rvx_port_07, negedge rvx_port_05)
begin
	if(rvx_port_05==0)
		rvx_signal_07 <= 1;
	else if(rvx_signal_09)
		rvx_signal_07 <= rvx_signal_03;
end

assign rvx_signal_05 = (((~rvx_signal_07) & rvx_port_02)!=0);
assign rvx_signal_09 = (rvx_signal_02==RVX_LPARA_1) & rvx_signal_05;

always@(*)
begin
	rvx_signal_03 = rvx_signal_07;
	for(k=0;k<RVX_GPARA_1;k=k+1)
		if(k==0)
			rvx_signal_03[0] = rvx_signal_07[RVX_GPARA_1-1];
		else
			rvx_signal_03[k] = rvx_signal_07[k-1];
end

assign rvx_signal_00 = (rvx_signal_02==RVX_LPARA_1)? 0 : rvx_signal_07;

always@(posedge rvx_port_07, negedge rvx_port_05)
begin
	if(rvx_port_05==0)
		{rvx_port_10,rvx_port_04} <= 0;
	else if(rvx_signal_06)
		rvx_port_10 <= 0;
	else if((rvx_signal_02==RVX_LPARA_0)&&rvx_signal_01)
	begin
		rvx_port_10 <= 1;
		rvx_port_04 <= rvx_signal_08;
	end
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_GPARA_2),
	.NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.data_input_list(rvx_port_06),
	.select(rvx_signal_07),
	.data_output(rvx_signal_08)
);

always@(posedge rvx_port_07, negedge rvx_port_05)
begin
	if(rvx_port_05==0)
		rvx_port_11 <= 0;
	else if(rvx_signal_06)
		for(k=0; k<RVX_GPARA_1; k=k+1)
			if(rvx_signal_07[k]==1)
				rvx_port_11[RVX_GPARA_0*(k+1)-1 -:RVX_GPARA_0] <= rvx_port_08;
end

assign rvx_port_03 = (rvx_signal_02==RVX_LPARA_4)? rvx_signal_07 : 0;

assign rvx_port_01 = rvx_signal_07;

endmodule
