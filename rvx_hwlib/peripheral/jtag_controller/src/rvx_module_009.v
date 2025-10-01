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
`include "ervp_jtag_memorymap_offset.vh"





module RVX_MODULE_009
(
	rvx_port_02,
	rvx_port_12,

	rvx_port_10,
	rvx_port_04,
	rvx_port_09,
	rvx_port_01,

	rvx_port_07,
	rvx_port_05,
	rvx_port_11,
	rvx_port_14,

	rvx_port_13,
	rvx_port_00,
	rvx_port_17,
	rvx_port_16,

	rvx_port_08,
	rvx_port_03,
	rvx_port_06,
	rvx_port_15
);





parameter RVX_GPARA_1 = 8;
parameter RVX_GPARA_0 = 32;

input wire rvx_port_02;
input wire rvx_port_12;

output wire [RVX_GPARA_1-1:0] rvx_port_10;
input wire rvx_port_04;
input wire [RVX_GPARA_1-1:0] rvx_port_09;
input wire rvx_port_01;

output reg [RVX_GPARA_0-1:0] rvx_port_07;
input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_11;
input wire rvx_port_14;

input wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire rvx_port_00;
output wire [RVX_GPARA_0-1:0] rvx_port_17;
input wire rvx_port_16;

input wire [RVX_GPARA_0-1:0] rvx_port_08;
input wire rvx_port_03;
input wire [RVX_GPARA_0-1:0] rvx_port_06;
output wire rvx_port_15;

wire [RVX_GPARA_0-1:0] rvx_signal_08;
reg rvx_signal_09;
reg [RVX_GPARA_0-1:0] rvx_signal_06;
wire rvx_signal_04;

wire [RVX_GPARA_0-1:0] rvx_signal_00;
wire rvx_signal_05;
wire [RVX_GPARA_0-1:0] rvx_signal_02;
reg rvx_signal_03;

wire rvx_signal_01;
wire rvx_signal_07;

assign rvx_port_00 = rvx_signal_09;
assign rvx_port_17 = rvx_signal_06;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_GPARA_0+1)
)
i_rvx_instance_1
(
	.clk(rvx_port_02),
	.rstnn(rvx_port_12),
	.enable(1'b 1),
	.asynch_value({rvx_port_13,rvx_port_16}),
	.synch_value({rvx_signal_08,rvx_signal_04})
);

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_GPARA_0+1+RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_02),
	.rstnn(rvx_port_12),
	.enable(1'b 1),
	.asynch_value({rvx_port_08,rvx_port_03,rvx_port_06}),
	.synch_value({rvx_signal_00,rvx_signal_05,rvx_signal_02})
);

assign rvx_port_15 = rvx_signal_03;

assign rvx_signal_01 = (rvx_signal_09==rvx_signal_04);

always@(posedge rvx_port_02, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
	begin
		rvx_signal_09 <= 0;
		rvx_signal_06 <= 0;
	end
	else if(rvx_signal_01)
	begin
		if(rvx_port_14 && (rvx_port_09==`JTAG_INST_REQUEST))
		begin
			rvx_signal_09 <= ~rvx_signal_09;
			rvx_signal_06 <= $unsigned(rvx_port_11);
		end
	end
end

assign rvx_signal_07 = (rvx_signal_03!=rvx_signal_05);

always@(posedge rvx_port_02, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_03 <= 0;
	else if(rvx_signal_07)
	begin
		if(rvx_port_14 && (rvx_port_09==`JTAG_INST_RESPONSE))
			rvx_signal_03 <= ~rvx_signal_03;
	end
end

assign rvx_port_10 = 1;

always@(*)
begin
	rvx_port_07 = 0;
	case(rvx_port_09)
		`JTAG_INST_REQUEST:
			if(rvx_signal_01)
				rvx_port_07 = 0;
			else
				rvx_port_07 = 1;
		`JTAG_INST_RESPONSE:
			rvx_port_07 = rvx_signal_02;
		`JTAG_INST_NUM_REQUEST:
			rvx_port_07 = rvx_signal_08;
		`JTAG_INST_NUM_RESPONSE:
			rvx_port_07 = rvx_signal_00;
		endcase
end

endmodule
