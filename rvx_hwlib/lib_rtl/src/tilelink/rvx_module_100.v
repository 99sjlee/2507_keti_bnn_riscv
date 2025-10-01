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
`include "rvx_include_18.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_100 (
	rvx_port_12,
	rvx_port_02,

	rvx_port_18,
	rvx_port_27,
	rvx_port_32,
	rvx_port_10,
	rvx_port_04,
	rvx_port_08,
	rvx_port_15,
	rvx_port_16,
	rvx_port_07,
	rvx_port_25,

	rvx_port_06,
	rvx_port_28,
	rvx_port_14,
	rvx_port_34,
	rvx_port_21,
	rvx_port_09,
	rvx_port_30,
	rvx_port_13,
	rvx_port_03,
	rvx_port_26,

	rvx_port_23,
	rvx_port_29,
	rvx_port_17,
	rvx_port_01,
	rvx_port_19,
	rvx_port_05,
	rvx_port_24,
	rvx_port_22,
	rvx_port_33,
	rvx_port_31,
	rvx_port_00,
	rvx_port_11,
	rvx_port_20
);





parameter RVX_GPARA_2 = 1; 
parameter RVX_GPARA_0 = 1; 
parameter RVX_GPARA_1 = 1; 
parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_4 = 1; 

localparam  RVX_LPARA_0 = (RVX_GPARA_2/8); 

localparam  RVX_LPARA_1 = `RVX_GDEF_324+`RVX_GDEF_202+RVX_GPARA_3+RVX_GPARA_1+RVX_GPARA_0+RVX_LPARA_0+RVX_GPARA_2+1;
input wire rvx_port_12, rvx_port_02;

output wire rvx_port_18;
input wire rvx_port_27;
input wire [`RVX_GDEF_324-1:0] rvx_port_32;
input wire [`RVX_GDEF_202-1:0] rvx_port_10;
input wire [RVX_GPARA_3-1:0] rvx_port_04;
input wire [RVX_GPARA_1-1:0] rvx_port_08;
input wire [RVX_GPARA_0-1:0] rvx_port_15;
input wire [RVX_LPARA_0-1:0] rvx_port_16;
input wire [RVX_GPARA_2-1:0] rvx_port_07;
input wire rvx_port_25;

output wire rvx_port_06;
input wire rvx_port_28;
input wire [`RVX_GDEF_324-1:0] rvx_port_14;
input wire [`RVX_GDEF_202-1:0] rvx_port_34;
input wire [RVX_GPARA_3-1:0] rvx_port_21;
input wire [RVX_GPARA_1-1:0] rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_30;
input wire [RVX_LPARA_0-1:0] rvx_port_13;
input wire [RVX_GPARA_2-1:0] rvx_port_03;
input wire rvx_port_26;

output reg rvx_port_23;
output reg [`RVX_GDEF_179-1:0] rvx_port_29;
output reg [`RVX_GDEF_324-1:0] rvx_port_17;
output reg [`RVX_GDEF_202-1:0] rvx_port_01;
output reg [RVX_GPARA_3-1:0] rvx_port_19;
output reg [RVX_GPARA_1-1:0] rvx_port_05;
output reg [RVX_GPARA_0-1:0] rvx_port_24;
output reg [RVX_LPARA_0-1:0] rvx_port_22;
output reg [RVX_GPARA_2-1:0] rvx_port_33;
output reg rvx_port_31;
input wire rvx_port_00;
input wire rvx_port_11;
input wire rvx_port_20;

wire rvx_signal_19;
wire rvx_signal_20;
wire [`RVX_GDEF_324-1:0] rvx_signal_05;
wire [`RVX_GDEF_202-1:0] rvx_signal_08;
wire [RVX_GPARA_3-1:0] rvx_signal_13;
wire [RVX_GPARA_1-1:0] rvx_signal_07;
wire [RVX_GPARA_0-1:0] rvx_signal_02;
wire [RVX_LPARA_0-1:0] rvx_signal_04;
wire [RVX_GPARA_2-1:0] rvx_signal_15;
wire rvx_signal_06;

wire rvx_signal_09;
wire rvx_signal_18;
wire [`RVX_GDEF_324-1:0] rvx_signal_03;
wire [`RVX_GDEF_202-1:0] rvx_signal_16;
wire [RVX_GPARA_3-1:0] rvx_signal_21;
wire [RVX_GPARA_1-1:0] rvx_signal_14;
wire [RVX_GPARA_0-1:0] rvx_signal_01;
wire [RVX_LPARA_0-1:0] rvx_signal_11;
wire [RVX_GPARA_2-1:0] rvx_signal_00;
wire rvx_signal_17;

`define RVX_LDEF_0 0
`define RVX_LDEF_1 1

reg rvx_signal_22;
wire rvx_signal_10;
wire rvx_signal_12;

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(2)
)
i_rvx_instance_0
(
	.clk(rvx_port_12),
	.rstnn(rvx_port_02),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_port_18),
	.wrequest(rvx_port_27),
	.wdata({rvx_port_32,rvx_port_10,rvx_port_04,rvx_port_08,rvx_port_15,rvx_port_16,rvx_port_07,rvx_port_25}),
	.rready(rvx_signal_20),
	.rrequest(rvx_signal_19),
	.rdata({rvx_signal_05,rvx_signal_08,rvx_signal_13,rvx_signal_07,rvx_signal_02,rvx_signal_04,rvx_signal_15,rvx_signal_06}),
	.wfull(),
	.rempty()
);

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(2)
)
i_rvx_instance_1
(
	.clk(rvx_port_12),
	.rstnn(rvx_port_02),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_port_06),
	.wrequest(rvx_port_28),
	.wdata({rvx_port_14,rvx_port_34,rvx_port_21,rvx_port_09,rvx_port_30,rvx_port_13,rvx_port_03,rvx_port_26}),
	.rready(rvx_signal_18),
	.rrequest(rvx_signal_09),
	.rdata({rvx_signal_03,rvx_signal_16,rvx_signal_21,rvx_signal_14,rvx_signal_01,rvx_signal_11,rvx_signal_00,rvx_signal_17}),
	.wfull(),
	.rempty()
);

always@(posedge rvx_port_12, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
	begin
		rvx_signal_22 <= 0;
		rvx_port_29 <= `RVX_GDEF_060;
	end
	else if(rvx_signal_12)
	begin
		rvx_signal_22 <= 0;
		case(rvx_port_29)
			`RVX_GDEF_060:
				if(rvx_signal_18)
					rvx_port_29 <= `RVX_GDEF_280;
			`RVX_GDEF_280:
				if(rvx_signal_20)
					rvx_port_29 <= `RVX_GDEF_060;
		endcase
	end
	else if(rvx_signal_22==`RVX_LDEF_0)
	begin
		if(rvx_port_23 & rvx_port_00)
			rvx_signal_22 <= `RVX_LDEF_1;
	end
end

assign rvx_signal_10 = rvx_port_23 & rvx_port_11;
assign rvx_signal_12 = (rvx_signal_10 & rvx_port_20) | ((rvx_signal_22==`RVX_LDEF_0) & (~rvx_port_23));

always@(*)
begin
	rvx_port_23 = rvx_signal_20;
	rvx_port_17 = rvx_signal_05;
	rvx_port_01 = rvx_signal_08;
	rvx_port_19 = rvx_signal_13;
	rvx_port_05 = rvx_signal_07;
	rvx_port_24 = rvx_signal_02;
	rvx_port_22 = rvx_signal_04;
	rvx_port_33 = rvx_signal_15;
	rvx_port_31 = rvx_signal_06;
	case(rvx_port_29)
		`RVX_GDEF_060:
		begin
			rvx_port_23 = rvx_signal_20;
			rvx_port_17 = rvx_signal_05;
			rvx_port_01 = rvx_signal_08;
			rvx_port_19 = rvx_signal_13;
			rvx_port_05 = rvx_signal_07;
			rvx_port_24 = rvx_signal_02;
			rvx_port_22 = rvx_signal_04;
			rvx_port_33 = rvx_signal_15;
			rvx_port_31 = rvx_signal_06;
		end
		`RVX_GDEF_280:
		begin
			rvx_port_23 = rvx_signal_18;
			rvx_port_17 = rvx_signal_03;
			rvx_port_01 = rvx_signal_16;
			rvx_port_19 = rvx_signal_21;
			rvx_port_05 = rvx_signal_14;
			rvx_port_24 = rvx_signal_01;
			rvx_port_22 = rvx_signal_11;
			rvx_port_33 = rvx_signal_00;
			rvx_port_31 = rvx_signal_17;
		end
	endcase
end

assign rvx_signal_19 = (rvx_port_29==`RVX_GDEF_060) & rvx_port_11;
assign rvx_signal_09 = (rvx_port_29==`RVX_GDEF_280) & rvx_port_11;

`undef RVX_LDEF_0
`undef RVX_LDEF_1
endmodule
