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
`include "munoc_network_link.vh"
`include "munoc_include_06.vh"
`include "munoc_include_00.vh"
`include "munoc_include_01.vh"





module MUNOC_MODULE_16
(
	munoc_port_07,
	munoc_port_12,

	munoc_port_03,
	munoc_port_05,
	munoc_port_04,

	munoc_port_00,
	munoc_port_06,
	munoc_port_01,
	munoc_port_02,
	munoc_port_08,
	munoc_port_13,
	
	munoc_port_09,
	munoc_port_14,
	munoc_port_11,
	munoc_port_15,
	munoc_port_10
);





parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_4 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_2 = `LLIMIT_OF_DATA_WIDTH;
parameter MUNOC_GPARA_3 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_1 = 1;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_88(MUNOC_GPARA_0);
localparam  MUNOC_LPARA_1 = `GET_AXI_SIZE(MUNOC_GPARA_0);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_07, munoc_port_12;

output wire munoc_port_03;
input wire munoc_port_05;
input wire [`MUNOC_GDEF_13-1:0] munoc_port_04;

input wire [MUNOC_GPARA_4-1:0] munoc_port_00;
input wire [MUNOC_GPARA_0-1:0] munoc_port_06;
input wire [`BW_AXI_RRESP-1:0] munoc_port_01;
input wire munoc_port_02;
input wire munoc_port_08;
output wire munoc_port_13;

output wire [MUNOC_GPARA_3/MUNOC_GPARA_2-1:0] munoc_port_09;
input wire munoc_port_14;
output wire munoc_port_11;
output wire munoc_port_15;
output wire [`BW_RCHANNEL(MUNOC_GPARA_4,MUNOC_GPARA_3)-1:0] munoc_port_10;

genvar i;
integer j;

wire [`MUNOC_GDEF_13-1:0] munoc_signal_09;
wire munoc_signal_34;
wire munoc_signal_11;

wire [`MUNOC_GDEF_23-1:0] munoc_signal_31;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_22;
wire [`BW_ADDR_OFFSET-1:0] munoc_signal_15;
wire [`MUNOC_GDEF_75-1:0] munoc_signal_28;

reg [`MUNOC_GDEF_75-1:0] munoc_signal_27, munoc_signal_24;

wire munoc_signal_30;
wire munoc_signal_01;
wire munoc_signal_20;

`define MUNOC_LDEF_01 2
`define MUNOC_LDEF_04 0
`define MUNOC_LDEF_11 1
`define MUNOC_LDEF_12 2

reg [`MUNOC_LDEF_01-1:0] munoc_signal_29;
wire munoc_signal_08;
wire munoc_signal_05;
wire munoc_signal_36;

wire munoc_signal_35;
wire munoc_signal_37;
wire munoc_signal_33;
reg [`MUNOC_GDEF_75-1:0] munoc_signal_25;

`define MUNOC_LDEF_17 4
`define MUNOC_LDEF_05 4'b 0001
`define MUNOC_LDEF_20 4'b 0010
`define MUNOC_LDEF_19 4'b 0100
`define MUNOC_LDEF_10 4'b 1000
`define MUNOC_LDEF_15 4'b 0011
`define MUNOC_LDEF_21 4'b 1100
`define MUNOC_LDEF_02 4'b 1111

reg [`MUNOC_LDEF_17-1:0] munoc_signal_14; 
wire munoc_signal_10;

`define MUNOC_LDEF_07 1
`define MUNOC_LDEF_09 0
`define MUNOC_LDEF_14 1

reg [`MUNOC_LDEF_07-1:0] munoc_signal_04;
wire munoc_signal_32;
wire munoc_signal_26;
wire munoc_signal_06;

reg [`BW_AXI_RRESP-1:0] munoc_signal_17, munoc_signal_07;

wire [MUNOC_GPARA_3-1:0] munoc_signal_19;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_21;

`define MUNOC_LDEF_16 3
`define MUNOC_LDEF_13 0
`define MUNOC_LDEF_00 1
`define MUNOC_LDEF_03 2
`define MUNOC_LDEF_08 3
`define MUNOC_LDEF_22 4
`define MUNOC_LDEF_18 5
`define MUNOC_LDEF_06 6

reg [`MUNOC_LDEF_16-1:0] munoc_signal_00;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_13;
reg [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_18;

reg [MUNOC_GPARA_3/MUNOC_GPARA_2-1:0] munoc_signal_23, munoc_signal_03;

reg [`MUNOC_GDEF_75-1:0] munoc_signal_02, munoc_signal_16;
wire munoc_signal_12;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_13),
	.DEPTH(MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.clk(munoc_port_07),
	.rstnn(munoc_port_12),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_port_03),
	.wrequest(munoc_port_05),
	.wdata(munoc_port_04),
	.rready(munoc_signal_34),
	.rrequest(munoc_signal_11),
	.rdata(munoc_signal_09),
	.wfull(),
	.rempty()
);

assign {munoc_signal_31,munoc_signal_22,munoc_signal_15,munoc_signal_28} = munoc_signal_09;

assign munoc_signal_35 = munoc_port_13 & munoc_port_08;
assign munoc_signal_37 = munoc_signal_35 & munoc_signal_33;
assign munoc_signal_11 = munoc_signal_37;

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		munoc_signal_25 <= 0;
	else if(munoc_signal_35)
  begin
    if(munoc_signal_33)
      munoc_signal_25 <= 0;
    else
      munoc_signal_25 <= munoc_signal_25 + 1'b 1;
  end
end

assign munoc_signal_33 = (munoc_signal_25==munoc_signal_28);

`ifndef __MUNOC_USE_SINGLE_DATA_WIDTH

assign munoc_signal_30 = ($unsigned(munoc_signal_22) < $unsigned(MUNOC_LPARA_1));
assign munoc_signal_01 = ($unsigned(munoc_signal_22) == $unsigned(MUNOC_LPARA_1));
assign munoc_signal_20 = ($unsigned(munoc_signal_22) > $unsigned(MUNOC_LPARA_1));

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		munoc_signal_29 <= `MUNOC_LDEF_04;
	else if(munoc_signal_08)
		munoc_signal_29 <= `MUNOC_LDEF_11;
	else if(munoc_signal_05)
		munoc_signal_29 <= `MUNOC_LDEF_12;
	else if(munoc_signal_37)
		munoc_signal_29 <= `MUNOC_LDEF_04;
end

assign munoc_signal_08 = (munoc_signal_29==`MUNOC_LDEF_04)  & munoc_signal_34 & munoc_signal_20;
assign munoc_signal_05 = (munoc_signal_29==`MUNOC_LDEF_04) & munoc_signal_34 & (munoc_signal_30|munoc_signal_01);
assign munoc_signal_36 = munoc_signal_08 | munoc_signal_05;

assign munoc_port_13 = (munoc_signal_29!=`MUNOC_LDEF_04) & munoc_port_14;

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_85: munoc_signal_14 <= `MUNOC_LDEF_05;
			`MUNOC_GDEF_43: munoc_signal_14 <= `MUNOC_LDEF_15;
			`MUNOC_GDEF_00: munoc_signal_14 <= `MUNOC_LDEF_02;
		endcase
	else if(munoc_signal_36)
	begin
		if(munoc_signal_05)
			case(munoc_signal_31)
				`MUNOC_GDEF_85: munoc_signal_14 <= `MUNOC_LDEF_05;
				`MUNOC_GDEF_43: munoc_signal_14 <= `MUNOC_LDEF_15;
				`MUNOC_GDEF_00: munoc_signal_14 <= `MUNOC_LDEF_02;
			endcase
		else
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_85: munoc_signal_14 <= `MUNOC_LDEF_05;
				`MUNOC_GDEF_43: munoc_signal_14 <= `MUNOC_LDEF_15;
				`MUNOC_GDEF_00: ;
			endcase
	end
	else if((munoc_signal_29==`MUNOC_LDEF_11) && munoc_signal_35 && (!munoc_signal_33))
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_85:
				case(munoc_signal_31)
					`MUNOC_GDEF_85:
						;
					`MUNOC_GDEF_43:
						case(munoc_signal_14)
							`MUNOC_LDEF_05: munoc_signal_14 <= `MUNOC_LDEF_20;
							`MUNOC_LDEF_20: munoc_signal_14 <= `MUNOC_LDEF_05;
						endcase
					`MUNOC_GDEF_00:
						case(munoc_signal_14)
							`MUNOC_LDEF_05: munoc_signal_14 <= `MUNOC_LDEF_20;
							`MUNOC_LDEF_20: munoc_signal_14 <= `MUNOC_LDEF_19;
							`MUNOC_LDEF_19: munoc_signal_14 <= `MUNOC_LDEF_10;
							`MUNOC_LDEF_10: munoc_signal_14 <= `MUNOC_LDEF_05;
						endcase
				endcase
			`MUNOC_GDEF_43:
				case(munoc_signal_31)
					`MUNOC_GDEF_85,
					`MUNOC_GDEF_43:
						;
					`MUNOC_GDEF_00:
						case(munoc_signal_14)
							`MUNOC_LDEF_15: munoc_signal_14 <= `MUNOC_LDEF_21;
							`MUNOC_LDEF_21: munoc_signal_14 <= `MUNOC_LDEF_15;
						endcase
				endcase
			`MUNOC_GDEF_00:
				;
		endcase
end

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		munoc_signal_27 <= 0;
	else if(munoc_signal_36)
		munoc_signal_27 <= munoc_signal_24;
end

always@(*)
begin
	munoc_signal_24 = -1;
	if(munoc_signal_22 <= MUNOC_LPARA_1)
		;
	else
		for(j=0; j<`MUNOC_GDEF_75; j=j+1)
			if(j<($unsigned(munoc_signal_22)-MUNOC_LPARA_1))
				munoc_signal_24[j] = 0;
end

assign munoc_port_11 = ($signed((munoc_signal_25|munoc_signal_27))==(-1));
assign munoc_signal_10 = munoc_signal_35 & munoc_port_11;

always@(*)
begin
	munoc_signal_03 = 0;
	for(j=0; j<(MUNOC_GPARA_3/MUNOC_GPARA_2); j=j+1)
		case(munoc_signal_31)
			`MUNOC_GDEF_85:
				if(j<(32/MUNOC_GPARA_2))
					munoc_signal_03[j] = 1;
			`MUNOC_GDEF_43:
				if(j<(64/MUNOC_GPARA_2))
					munoc_signal_03[j] = 1;
			`MUNOC_GDEF_00:
				if(j<(128/MUNOC_GPARA_2))
					munoc_signal_03[j] = 1;
		endcase
end

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		munoc_signal_23 <= 0;
	else if(munoc_signal_36)
		munoc_signal_23 <= munoc_signal_03;
	else if(munoc_port_15)
	begin
		if(munoc_port_11)
			munoc_signal_23 <= munoc_signal_03;
		else
			munoc_signal_23 <= munoc_signal_23 & (~munoc_port_09);
	end
end

generate
	for(i=0; i<MUNOC_GPARA_3/MUNOC_GPARA_2; i=i+1)
	begin: i_gen_rdata_write_request
		assign munoc_port_09[i] = (munoc_port_11)? munoc_signal_23[i] : munoc_signal_14[i/(32/MUNOC_GPARA_2)];
	end
endgenerate
assign munoc_port_15 = munoc_signal_35;

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		munoc_signal_17 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_10)
		munoc_signal_17 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_35)
		munoc_signal_17 <= munoc_signal_07;
end

always@(*)
begin
	munoc_signal_07 = munoc_port_01;
	case(munoc_signal_17)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			munoc_signal_07 = munoc_port_01;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			munoc_signal_07 = munoc_signal_17;
	endcase
end

assign munoc_port_10 = {munoc_port_00,munoc_signal_33,munoc_signal_07,munoc_signal_19};

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		munoc_signal_04 <= `MUNOC_LDEF_09;
	else if(munoc_signal_36)
	begin
		if(munoc_signal_32)
			munoc_signal_04 <= `MUNOC_LDEF_14;
		else
			munoc_signal_04 <= `MUNOC_LDEF_09;
	end
end

assign munoc_signal_32 = ($unsigned(munoc_signal_31) < $unsigned(MUNOC_LPARA_0));
assign munoc_signal_26 = ($unsigned(munoc_signal_31) == $unsigned(MUNOC_LPARA_0));
assign munoc_signal_06 = ($unsigned(munoc_signal_31) > $unsigned(MUNOC_LPARA_0));

generate
	for(i=0; i<`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_0; i=i+1)
	begin: i_duplicate_rdata
		assign munoc_signal_21[(i+1)*MUNOC_GPARA_0-1-:MUNOC_GPARA_0] = munoc_port_06;
	end
endgenerate

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		munoc_signal_00 <= `MUNOC_LDEF_13;
	else if(munoc_signal_36 && munoc_signal_32)
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_85:
				munoc_signal_00 <= `MUNOC_LDEF_13;
			`MUNOC_GDEF_43:
				case(munoc_signal_31)
					`MUNOC_GDEF_85:
						case(munoc_signal_15[2])
							0: munoc_signal_00 <= `MUNOC_LDEF_13;
							1: munoc_signal_00 <= `MUNOC_LDEF_00;
						endcase
					`MUNOC_GDEF_43,
					`MUNOC_GDEF_00: munoc_signal_00 <= `MUNOC_LDEF_22;
				endcase
			`MUNOC_GDEF_00:
				case(munoc_signal_31)
					`MUNOC_GDEF_85:
						case(munoc_signal_15[3:2])
							0: munoc_signal_00 <= `MUNOC_LDEF_13;
							1: munoc_signal_00 <= `MUNOC_LDEF_00;
							2: munoc_signal_00 <= `MUNOC_LDEF_03;
							3: munoc_signal_00 <= `MUNOC_LDEF_08;
						endcase
					`MUNOC_GDEF_43:
						case(munoc_signal_15[3])
							0: munoc_signal_00 <= `MUNOC_LDEF_22;
							1: munoc_signal_00 <= `MUNOC_LDEF_18;
						endcase
					`MUNOC_GDEF_00: munoc_signal_00 <= `MUNOC_LDEF_06;
				endcase
		endcase
	else if((munoc_signal_04==`MUNOC_LDEF_14)&&munoc_signal_12)
	begin
		if(munoc_signal_35 && (!munoc_signal_33))
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_85:
					;
				`MUNOC_GDEF_43:
					case(munoc_signal_00)
						`MUNOC_LDEF_13: munoc_signal_00 <= `MUNOC_LDEF_00;
						`MUNOC_LDEF_00: munoc_signal_00 <= `MUNOC_LDEF_13;
					endcase
				`MUNOC_GDEF_00:
					case(munoc_signal_00)
						`MUNOC_LDEF_13: munoc_signal_00 <= `MUNOC_LDEF_00;
						`MUNOC_LDEF_00: munoc_signal_00 <= `MUNOC_LDEF_03;
						`MUNOC_LDEF_03: munoc_signal_00 <= `MUNOC_LDEF_08;
						`MUNOC_LDEF_08: munoc_signal_00 <= `MUNOC_LDEF_13;
						`MUNOC_LDEF_22: munoc_signal_00 <= `MUNOC_LDEF_18;
						`MUNOC_LDEF_18: munoc_signal_00 <= `MUNOC_LDEF_22;
					endcase
			endcase
	end
end

always@(posedge munoc_port_07, negedge munoc_port_12)
begin
	if(munoc_port_12==0)
		munoc_signal_02 <= 0;
	else if(munoc_signal_36 && munoc_signal_32)
		munoc_signal_02 <= munoc_signal_16;
end

always@(*)
begin
	munoc_signal_16 = -1;
	for(j=0; j<`MUNOC_GDEF_75; j=j+1)
		if(j<($unsigned(munoc_signal_31)-`MUNOC_GDEF_85 - ($unsigned(munoc_signal_22)-`AXI_SIZE_004BYTE)))
			munoc_signal_16[j] = 0;
end

assign munoc_signal_12 = ($signed((munoc_signal_25|munoc_signal_02))==(-1));

assign munoc_signal_13 = $unsigned(munoc_port_06);

always@(*)
begin
	munoc_signal_18 = munoc_signal_13;
	case(munoc_signal_00)
		`MUNOC_LDEF_13: munoc_signal_18[32-1:0] = $unsigned(munoc_signal_13[32*(1+0)-1-:32]);
		`MUNOC_LDEF_00: munoc_signal_18[32-1:0] = $unsigned(munoc_signal_13[32*(1+1)-1-:32]);
		`MUNOC_LDEF_03: munoc_signal_18[32-1:0] = $unsigned(munoc_signal_13[32*(1+2)-1-:32]);
		`MUNOC_LDEF_08: munoc_signal_18[32-1:0] = $unsigned(munoc_signal_13[32*(1+3)-1-:32]);
		`MUNOC_LDEF_22: munoc_signal_18[64-1:0] = $unsigned(munoc_signal_13[64*(1+0)-1-:64]);
		`MUNOC_LDEF_18: munoc_signal_18[64-1:0] = $unsigned(munoc_signal_13[64*(1+1)-1-:64]);
		`MUNOC_LDEF_06: munoc_signal_18[128-1:0] = $unsigned(munoc_signal_13[128*(1+0)-1-:128]);
	endcase
end

assign munoc_signal_19 = (munoc_signal_04==`MUNOC_LDEF_14)? munoc_signal_18 : munoc_signal_21;

`else

assign munoc_port_13 = munoc_signal_34 & munoc_port_14;
assign munoc_port_09 = -1;
assign munoc_port_11 = 1;
assign munoc_port_15 = munoc_port_13 & munoc_port_08;
assign munoc_port_10 = {munoc_port_00, munoc_signal_33, munoc_port_01, munoc_port_06};

`endif

`undef MUNOC_LDEF_07
`undef MUNOC_LDEF_01
`undef MUNOC_LDEF_19
`undef MUNOC_LDEF_20
`undef MUNOC_LDEF_22
`undef MUNOC_LDEF_09
`undef MUNOC_LDEF_03
`undef MUNOC_LDEF_11
`undef MUNOC_LDEF_10
`undef MUNOC_LDEF_12
`undef MUNOC_LDEF_13
`undef MUNOC_LDEF_05
`undef MUNOC_LDEF_15
`undef MUNOC_LDEF_18
`undef MUNOC_LDEF_02
`undef MUNOC_LDEF_06
`undef MUNOC_LDEF_16
`undef MUNOC_LDEF_21
`undef MUNOC_LDEF_17
`undef MUNOC_LDEF_04
`undef MUNOC_LDEF_00
`undef MUNOC_LDEF_14
`undef MUNOC_LDEF_08
endmodule
