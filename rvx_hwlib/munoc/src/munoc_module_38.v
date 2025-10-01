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
// 2024-05-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_04.vh"
`include "munoc_extended_config.vh"
`include "munoc_network_type.vh"
`include "munoc_network_link.vh"
`include "munoc_arbitration_type.vh"





module MUNOC_MODULE_38
(
	munoc_port_3,
	munoc_port_1,
	munoc_port_4,
	munoc_port_5,
	munoc_port_0,
	munoc_port_2,
	munoc_port_6,
	munoc_port_7
);





parameter MUNOC_GPARA_2 = `NOT_SELECTED; 
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_0 = 1;
parameter MUNOC_GPARA_1 = `QOS_ARBITRATION;

localparam  MUNOC_LPARA_0 = (MUNOC_GPARA_2==`FORWARD_NETWORK)? `BW_FNI_LINK(MUNOC_GPARA_3) : `BW_BNI_LINK(MUNOC_GPARA_3);

input wire munoc_port_3, munoc_port_1;
input wire [MUNOC_LPARA_0*MUNOC_GPARA_0-1:0] munoc_port_4;
input wire [MUNOC_GPARA_0-1:0] munoc_port_5;
input wire munoc_port_0;
output wire [MUNOC_GPARA_0-1:0] munoc_port_2;
output wire [MUNOC_GPARA_0-1:0] munoc_port_6;
output wire munoc_port_7;

genvar i;
integer j;

wire [MUNOC_LPARA_0-1:0] munoc_signal_13[MUNOC_GPARA_0-1:0];
wire [MUNOC_GPARA_0-1:0] munoc_signal_08;
wire [MUNOC_GPARA_0-1:0] munoc_signal_05;

reg [MUNOC_GPARA_0-1:0] munoc_signal_17;
reg [MUNOC_GPARA_0-1:0] munoc_signal_16;
reg [MUNOC_GPARA_0-1:0] munoc_signal_14;
reg munoc_signal_01;

`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_0 1

reg munoc_signal_10;
wire munoc_signal_11;
wire munoc_signal_04;
wire munoc_signal_07;

wire munoc_signal_15;
wire munoc_signal_09;

wire [MUNOC_GPARA_0-1:0] munoc_signal_12;
wire [MUNOC_GPARA_0-1:0] munoc_signal_06;

wire [MUNOC_GPARA_0-1:0] munoc_signal_02;
wire [MUNOC_GPARA_0-1:0] munoc_signal_03;
wire munoc_signal_00;

generate
for(i=0;i<MUNOC_GPARA_0;i=i+1)
begin : i_input_separation
	assign munoc_signal_13[i] = munoc_port_4[MUNOC_LPARA_0*(i+1)-1-:MUNOC_LPARA_0];
	assign munoc_signal_08[i] = munoc_signal_13[i][MUNOC_LPARA_0-1]&munoc_port_5[i];
	assign munoc_signal_05[i] = munoc_signal_13[i][MUNOC_LPARA_0-1-1];
end
endgenerate

always@(posedge munoc_port_3, negedge munoc_port_1)
begin
	if(munoc_port_1==0)
		munoc_signal_17 <= 1;
	else if(munoc_signal_01)
		munoc_signal_17 <= munoc_signal_14;
end

assign munoc_signal_11 = ((munoc_signal_08 & munoc_signal_17)!=0);
assign munoc_signal_04 = ((munoc_signal_05 & munoc_signal_17)!=0);
assign munoc_signal_15 = munoc_port_7 & munoc_port_0;
assign munoc_signal_09 = munoc_signal_15 & munoc_signal_04;

generate
for(i=0;i<MUNOC_GPARA_0;i=i+1)
begin : i_ready_request
	assign munoc_port_2[i] = munoc_signal_17[i];
	assign munoc_port_6[i] = munoc_signal_17[i] & munoc_signal_08[i] & munoc_port_0;
end
endgenerate
assign munoc_port_7 = munoc_signal_11;

always@(posedge munoc_port_3, negedge munoc_port_1)
begin
	if(munoc_port_1==0)
		munoc_signal_10 <= `MUNOC_LDEF_1;
	else if(munoc_signal_15)
		case(munoc_signal_10)
			`MUNOC_LDEF_1:
				if(~munoc_signal_04)
					munoc_signal_10 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				if(munoc_signal_04)
					munoc_signal_10 <= `MUNOC_LDEF_1;
		endcase
end

always@(*)
begin
	munoc_signal_01 = 0;
	if(munoc_signal_07)
		case(munoc_signal_10)
			`MUNOC_LDEF_1:
				if(!munoc_signal_11)
					munoc_signal_01 = 1;
				else if(munoc_signal_09)
					munoc_signal_01 = 1;
			`MUNOC_LDEF_0:
				if(munoc_signal_09)
					munoc_signal_01 = 1;
		endcase
end

assign munoc_signal_12 = munoc_signal_08 & (~munoc_signal_17);
assign munoc_signal_07 = (munoc_signal_12!=0);

RVX_MODULE_070
#(
	.RVX_GPARA_0(MUNOC_GPARA_0)
)
i_munoc_instance_1
(
	.rvx_port_1(munoc_signal_12),
	.rvx_port_0(munoc_signal_06)
);

assign munoc_signal_02 = munoc_signal_08 & (~munoc_signal_17) & (~munoc_signal_16);
assign munoc_signal_00 = (munoc_signal_02!=0);

always@(posedge munoc_port_3, negedge munoc_port_1)
begin
	if(munoc_port_1==0)
		munoc_signal_16 <= 0;
	else if(munoc_signal_09)
	begin
		if(munoc_signal_00)
			munoc_signal_16 <= munoc_signal_16 | munoc_signal_17;
		else
			munoc_signal_16 <= 0;
	end
end

RVX_MODULE_070
#(
	.RVX_GPARA_0(MUNOC_GPARA_0)
)
i_munoc_instance_0
(
	.rvx_port_1(munoc_signal_02),
	.rvx_port_0(munoc_signal_03)
);

always@(*)
begin
	munoc_signal_14 = munoc_signal_17;
	case(MUNOC_GPARA_1)
		`LAZY_SCALABLE_ARBITRATION:
			for(j=0;j<MUNOC_GPARA_0;j=j+1)
				if(j==0)
					munoc_signal_14[0] = munoc_signal_17[MUNOC_GPARA_0-1];
				else
					munoc_signal_14[j] = munoc_signal_17[j-1];
		`PRIORITIZED_ARBITRATION:
			munoc_signal_14 = munoc_signal_06;
		`QOS_ARBITRATION:
			if(munoc_signal_00)
				munoc_signal_14 = munoc_signal_03;
			else
				munoc_signal_14 = munoc_signal_06;
	endcase
end

`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
endmodule
