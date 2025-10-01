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
`include "ervp_axi_define.vh"
`include "munoc_include_10.vh"
`include "munoc_include_01.vh"





module MUNOC_MODULE_27
(
	munoc_port_03,
	munoc_port_01,
	munoc_port_08,
	munoc_port_12,
	
	munoc_port_05,
	munoc_port_11,
	munoc_port_10,
	munoc_port_06,
	munoc_port_00,

	munoc_port_04,
	munoc_port_09,
	munoc_port_02,
	munoc_port_07
);





parameter MUNOC_GPARA_4 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_1 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_3 = `LLIMIT_OF_DATA_WIDTH;
parameter MUNOC_GPARA_0 = 1;
parameter MUNOC_GPARA_2 = 1;

localparam  MUNOC_LPARA_0 = MUNOC_GPARA_4+`BW_AXI_RLAST+`BW_AXI_RRESP;

input wire munoc_port_03, munoc_port_01;
input wire munoc_port_08, munoc_port_12;

input wire [MUNOC_GPARA_1/MUNOC_GPARA_3-1:0] munoc_port_05;
output reg [MUNOC_GPARA_2-1:0] munoc_port_11;
input wire munoc_port_10;
input wire munoc_port_06;
input wire [`BW_RCHANNEL(MUNOC_GPARA_4,MUNOC_GPARA_1)-1:0] munoc_port_00;

output reg munoc_port_04;
input wire [`MUNOC_GDEF_23-1:0] munoc_port_09;
input wire munoc_port_02;
output wire [`BW_RCHANNEL(MUNOC_GPARA_4,MUNOC_GPARA_1)-1:0] munoc_port_07;

genvar i,k;
integer j;

wire [MUNOC_GPARA_1/MUNOC_GPARA_3-1:0] munoc_signal_03;
wire [MUNOC_GPARA_2-1:0] munoc_signal_09 [MUNOC_GPARA_1/MUNOC_GPARA_3-1:0];
wire munoc_signal_08;
wire [MUNOC_GPARA_2-1:0] munoc_signal_02;
reg [MUNOC_GPARA_1/MUNOC_GPARA_3-1:0] munoc_signal_00;
reg [MUNOC_GPARA_1/MUNOC_GPARA_3-1:0] munoc_signal_04;
reg munoc_signal_07;
reg munoc_signal_06;

wire [`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_3-1:0] munoc_signal_01;
wire [MUNOC_GPARA_1/MUNOC_GPARA_3-1:0] munoc_signal_05 [MUNOC_GPARA_2-1:0];

generate
	for(i=0; i<MUNOC_GPARA_1/MUNOC_GPARA_3; i=i+1)
	begin : i_gen_rdata_buffer
		ERVP_ASYNCH_FIFO
		#(
			.BW_DATA(MUNOC_GPARA_3),
			.DEPTH(MUNOC_GPARA_0),
			.WRITE_READY_SIZE(MUNOC_GPARA_2)
		)
		i_munoc_instance_1
		(
			.wclk(munoc_port_03),
			.wrstnn(munoc_port_01),
			.wready(munoc_signal_09[i]),
			.wrequest(munoc_signal_04[i]),
			.wdata(munoc_port_00[(i+1)*MUNOC_GPARA_3-1-:MUNOC_GPARA_3]),
			.rclk(munoc_port_08),
			.rrstnn(munoc_port_12),
			.rready(munoc_signal_03[i]),
			.rrequest(munoc_signal_00[i]),
			.rdata(munoc_port_07[(i+1)*MUNOC_GPARA_3-1-:MUNOC_GPARA_3]),
			.wfull(),
			.rempty()
		);
	end
endgenerate

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(MUNOC_LPARA_0),
	.DEPTH(MUNOC_GPARA_0),
	.WRITE_READY_SIZE(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.wclk(munoc_port_03),
	.wrstnn(munoc_port_01),
	.wready(munoc_signal_02),
	.wrequest(munoc_signal_06),
	.wdata(munoc_port_00[`BW_RCHANNEL(MUNOC_GPARA_4,MUNOC_GPARA_1)-1-:MUNOC_LPARA_0]),
	.rclk(munoc_port_08),
	.rrstnn(munoc_port_12),
	.rready(munoc_signal_08),
	.rrequest(munoc_signal_07),
	.rdata(munoc_port_07[`BW_RCHANNEL(MUNOC_GPARA_4,MUNOC_GPARA_1)-1-:MUNOC_LPARA_0]),
	.wfull(),
	.rempty()
);

assign munoc_signal_01 = $unsigned(munoc_signal_03);

always@(*)
begin
	munoc_port_04 = 0;
	if(munoc_signal_08)
	begin
		case(munoc_port_09)
			`MUNOC_GDEF_85:
				if(MUNOC_GPARA_1>=32)
					munoc_port_04 = `IS_ALL_ONE(munoc_signal_01[32/MUNOC_GPARA_3-1:0]);
			`MUNOC_GDEF_43:
				if(MUNOC_GPARA_1>=64)
					munoc_port_04 = `IS_ALL_ONE(munoc_signal_01[64/MUNOC_GPARA_3-1:0]);
			`MUNOC_GDEF_00:
				if(MUNOC_GPARA_1>=128)
					munoc_port_04 = `IS_ALL_ONE(munoc_signal_01[128/MUNOC_GPARA_3-1:0]);
		endcase
	end
end

always@(*)
begin
	munoc_signal_07 = 0;
	munoc_signal_00 = 0;
	if(munoc_port_02)
	begin
		munoc_signal_07 = 1;
		case(munoc_port_09)
			`MUNOC_GDEF_85:
				if(MUNOC_GPARA_1>=32)
					for(j=0; j<32/MUNOC_GPARA_3; j=j+1)
						munoc_signal_00[j] = 1;
			`MUNOC_GDEF_43:
				if(MUNOC_GPARA_1>=64)
					for(j=0; j<64/MUNOC_GPARA_3; j=j+1)
						munoc_signal_00[j] = 1;
			`MUNOC_GDEF_00:
				if(MUNOC_GPARA_1>=128)
					for(j=0; j<128/MUNOC_GPARA_3; j=j+1)
						munoc_signal_00[j] = 1;
		endcase
	end
end

generate
for(k=0; k<MUNOC_GPARA_2; k=k+1)
begin : i_gen_k_rdata_wready
	for(i=0; i<MUNOC_GPARA_1/MUNOC_GPARA_3; i=i+1)
	begin : i_gen_i_rdata_wready
		assign munoc_signal_05[k][i] = munoc_signal_09[i][k];
	end
end
endgenerate

always@(*)
begin
	munoc_port_11 = 0;
	for(j=0; j<MUNOC_GPARA_2; j=j+1)
		if(munoc_signal_02[j])
			if(`IS_ALL_ONE((munoc_signal_05[j] & munoc_port_05) | (~munoc_port_05)))
				munoc_port_11[j] = 1;
end

always@(*)
begin
	munoc_signal_06 = 0;
	munoc_signal_04 = 0;
	if(munoc_port_11[0] && munoc_port_06)
	begin
		munoc_signal_04 = munoc_port_05;
		munoc_signal_06 = munoc_port_10;
	end
end

endmodule
