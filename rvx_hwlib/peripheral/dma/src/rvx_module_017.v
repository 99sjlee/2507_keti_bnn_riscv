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
`include "rvx_include_06.vh"




module RVX_MODULE_017
(
	rvx_port_00,
	rvx_port_14,

	rvx_port_05,
	rvx_port_13,
	rvx_port_04,
	rvx_port_11,

	rvx_port_12,
	rvx_port_06,
	rvx_port_07,

	rvx_port_03,
	rvx_port_10,
	rvx_port_08,
	rvx_port_02,
	rvx_port_01,
	rvx_port_09
);




parameter RVX_GPARA_0 = 32;
parameter BW_AXI_DATA = 32;

`include "rvx_include_14.vh"
`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_2 = 16;
localparam  RVX_LPARA_3 = AXI_SIZE_BYTE * (MAX_AXI_LENGTH + 1);	
localparam  RVX_LPARA_4 = REQUIRED_BITWIDTH_UNSIGNED(MAX_AXI_LENGTH);
localparam  RVX_LPARA_0 = AXI_SIZE;
localparam  RVX_LPARA_1 = RVX_LPARA_2 - RVX_LPARA_4 - RVX_LPARA_0;

input wire rvx_port_00;
input wire rvx_port_14;

input wire [RVX_GPARA_0-1:0] rvx_port_05;
input wire [BW_LINE_SIZE-1:0] rvx_port_13;
input wire [BW_NUM_LINES-1:0] rvx_port_04;
input wire [RVX_GPARA_0-1:0] rvx_port_11;

input wire rvx_port_12;
input wire rvx_port_06;
output wire rvx_port_07;

output wire [RVX_GPARA_0-1:0] rvx_port_03;
output wire rvx_port_10;
output reg [`BW_AXI_ALEN-1:0] rvx_port_08;
output reg [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_02;
output wire rvx_port_01;
input wire rvx_port_09;

reg [RVX_GPARA_0-1:0] rvx_signal_12;
reg [RVX_GPARA_0-1:0] rvx_signal_02;

reg [RVX_LPARA_2-1:0] rvx_signal_07;

`define RVX_LDEF_5	3
`define RVX_LDEF_3    	0
`define RVX_LDEF_2   	1
`define RVX_LDEF_4	2
`define RVX_LDEF_0		3
`define RVX_LDEF_1		4

reg [`RVX_LDEF_5-1:0] rvx_signal_15;

wire rvx_signal_06;
wire rvx_signal_14;
wire rvx_signal_03;

reg [BW_NUM_LINES-1:0] rvx_signal_09;

wire [RVX_LPARA_1-1:0] rvx_signal_13;
wire [RVX_LPARA_4-1:0] rvx_signal_10;
wire [RVX_LPARA_4-1:0] rvx_signal_04;
wire [RVX_LPARA_0-1:0] rvx_signal_11;
wire rvx_signal_05;
reg rvx_signal_00;
reg rvx_signal_08;

wire rvx_signal_01;
wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_signal_16;

assign {rvx_signal_13, rvx_signal_10, rvx_signal_11} = rvx_port_13;
assign rvx_signal_04 = rvx_signal_10 - 1;

assign rvx_port_03 = rvx_signal_02;

assign rvx_signal_01 = (rvx_signal_15 != `RVX_LDEF_3) & (rvx_signal_15 != `RVX_LDEF_2);
assign rvx_port_01 = rvx_signal_01 & (~rvx_port_06);
assign rvx_signal_06 = rvx_port_01 & rvx_port_09;

assign rvx_signal_14 = (rvx_signal_07 > rvx_port_13);
assign rvx_signal_03 = (rvx_signal_09 == rvx_port_04);

assign rvx_port_10 = ((rvx_signal_15 == `RVX_LDEF_4) || (rvx_signal_15 == `RVX_LDEF_0));
assign rvx_signal_05 = (rvx_signal_15==`RVX_LDEF_3) & rvx_port_12;
assign rvx_signal_16 = $unsigned((1 << rvx_signal_11) - 1);

always@(*)
begin
	rvx_signal_00 = 0;
	case(rvx_signal_15)
		`RVX_LDEF_4:
			if(rvx_signal_14 & (rvx_signal_10 == 0) & (rvx_signal_11 == 0))
				rvx_signal_00 = 1;
		`RVX_LDEF_0:
			if(rvx_signal_11 == 0)
				rvx_signal_00= 1;
		`RVX_LDEF_1:
			rvx_signal_00 = 1;
	endcase
end

assign rvx_port_07 = rvx_signal_06 & rvx_signal_03 & rvx_signal_00;

always@(*)
begin
	rvx_signal_08 = 0;
	case(rvx_signal_15)
		`RVX_LDEF_3,
		`RVX_LDEF_2:
			rvx_signal_08 = 1;
		`RVX_LDEF_4,
		`RVX_LDEF_0,
		`RVX_LDEF_1:
			rvx_signal_08 = rvx_signal_06;
	endcase
end

always@(posedge rvx_port_00, negedge rvx_port_14)
begin
	if(rvx_port_14==0)
	begin
		rvx_signal_15 <= `RVX_LDEF_3;
		rvx_port_08 <= 0;
		rvx_signal_09 <= 0;
		rvx_port_02 <= 0;
	end
	else if(rvx_port_07)
	begin
		rvx_signal_15 <= `RVX_LDEF_3;
		rvx_signal_09 <= 0;
	end
	else if(rvx_signal_08)
	begin
		case(rvx_signal_15)
			`RVX_LDEF_3:
				if(rvx_signal_05)
					rvx_signal_15 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
			begin
				rvx_signal_09 <= rvx_signal_09 + 1;
				if(rvx_signal_13 > 0)
				begin
					rvx_signal_15 <= `RVX_LDEF_4;
					rvx_port_08 <= MAX_AXI_LENGTH;
					rvx_port_02 <= `ALL_ONE;
				end
				else if(rvx_signal_10 > 0)
				begin
					rvx_signal_15 <= `RVX_LDEF_0;
					rvx_port_08 <= rvx_signal_04;
					rvx_port_02 <= `ALL_ONE;
				end
				else if(rvx_signal_11 > 0)
				begin
					rvx_signal_15 <= `RVX_LDEF_1;
					rvx_port_08 <= `AXI_LENGTH_01;
					rvx_port_02 <= rvx_signal_16;
				end
				else
					rvx_signal_15 <= `RVX_LDEF_3;
			end
			`RVX_LDEF_4:
				if(rvx_port_06 == 0)
				begin
					if(rvx_signal_14)
					begin
						if(rvx_signal_10 > 0)
						begin
							rvx_signal_15 <= `RVX_LDEF_0;
							rvx_port_08 <= rvx_signal_04;
							rvx_port_02 <= `ALL_ONE;
						end
						else if(rvx_signal_11 > 0)
						begin
							rvx_signal_15 <= `RVX_LDEF_1;
							rvx_port_08 <= `AXI_LENGTH_01;
							rvx_port_02 <= rvx_signal_16;
						end
						else if(!rvx_signal_03)
							rvx_signal_15 <= `RVX_LDEF_2;
					end
				end
			`RVX_LDEF_0:
				if(rvx_port_06 == 0)
				begin
					if(rvx_signal_11 > 0)
					begin
						rvx_signal_15 <= `RVX_LDEF_1;
						rvx_port_08 <= `AXI_LENGTH_01;
						rvx_port_02 <= rvx_signal_16;
					end
					else if(!rvx_signal_03)
						rvx_signal_15 <= `RVX_LDEF_2;
				end
			`RVX_LDEF_1:
				if(rvx_port_06 == 0)
				begin
					if(!rvx_signal_03)
						rvx_signal_15 <= `RVX_LDEF_2;
				end
		endcase
	end
end

always @(posedge rvx_port_00 or negedge rvx_port_14)
begin
	if(rvx_port_14 == 0)
	begin
		rvx_signal_02 <= 0;
		rvx_signal_12 <= 0;
		rvx_signal_07 <= 0;
	end
	else if(rvx_signal_15 == `RVX_LDEF_2)
	begin
		if(rvx_signal_09==0)
		begin
			rvx_signal_02 <= rvx_port_05;

			rvx_signal_12 <= rvx_port_05;
		end
		else
		begin
			rvx_signal_02 <= rvx_signal_12 + rvx_port_11;
			rvx_signal_12 <= rvx_signal_12 + rvx_port_11;
		end
		rvx_signal_07 <= RVX_LPARA_3 * 2;
	end
	else if(rvx_port_06 == 0)
	begin
		case(rvx_signal_15)
			`RVX_LDEF_4:
			begin
				if(rvx_signal_06)
				begin
					rvx_signal_02 <= rvx_signal_02 + RVX_LPARA_3;
					rvx_signal_07 <= rvx_signal_07 + RVX_LPARA_3;
				end
			end
			`RVX_LDEF_0:
			begin
				if(rvx_signal_06)
				begin
					rvx_signal_02 <= rvx_signal_02 + (rvx_signal_10 << AXI_SIZE);
				end
			end
		endcase
	end
end

endmodule
