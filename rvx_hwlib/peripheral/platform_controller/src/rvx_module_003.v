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
`include "ervp_platform_controller_memorymap_offset.vh"





module RVX_MODULE_003
(
	rvx_port_14,
	rvx_port_04,
	rvx_port_06,
	rvx_port_11,
	rvx_port_05,
	rvx_port_00,
	rvx_port_07,
	rvx_port_03,
	rvx_port_02,
	rvx_port_09,

	rvx_port_01,
	rvx_port_13,
	rvx_port_17,
	rvx_port_10,
	rvx_port_08,
	rvx_port_16,
	rvx_port_15,
	rvx_port_12
);





parameter RVX_GPARA_1 = 0;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_3 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"

localparam  RVX_LPARA_0 = 32;
localparam  RVX_LPARA_1 = 6;
localparam  RVX_LPARA_2 = RVX_GPARA_0 + 1;

input wire rvx_port_14, rvx_port_04;
input wire [`BW_BOOT_MODE-1:0] rvx_port_06;
input wire rvx_port_11; 
input wire rvx_port_05;

output wire rvx_port_00;
output wire rvx_port_07;
output wire [RVX_GPARA_0-1:0] rvx_port_03;
output wire [RVX_GPARA_0-1:0] rvx_port_02;
output wire rvx_port_09;

input wire rvx_port_01;
input wire rvx_port_13;
input wire [RVX_LPARA_0-1:0] rvx_port_17;
input wire rvx_port_10;
input wire [RVX_GPARA_4-1:0] rvx_port_08;
output wire [RVX_GPARA_4-1:0] rvx_port_16;
output wire rvx_port_15;
output reg rvx_port_12;

genvar i,j;
integer k;

wire rvx_signal_00;
wire rvx_signal_06;

`define RVX_LDEF_0 2
`define RVX_LDEF_1 0
`define RVX_LDEF_3 1
`define RVX_LDEF_2 2
reg [`RVX_LDEF_0-1:0] rvx_signal_24;

wire rvx_signal_03;
wire rvx_signal_09;
wire rvx_signal_02;
wire rvx_signal_10;

reg [RVX_LPARA_2-1:0] rvx_signal_23;
wire [RVX_GPARA_0-1:0] rvx_signal_07;
wire [RVX_GPARA_0-1:0] rvx_signal_11;
wire rvx_signal_01;
wire rvx_signal_12;
wire rvx_signal_21;
wire rvx_signal_20;
wire rvx_signal_14;

reg [RVX_GPARA_0-1:0] rvx_signal_15;

reg [`BW_RESET_CMD-1:0] rvx_signal_04;
reg rvx_signal_17;
reg rvx_signal_18;
wire rvx_signal_22;

wire [RVX_GPARA_4-1:0] rvx_signal_16;
reg [RVX_GPARA_4-1:0] rvx_signal_08;

wire [`BW_MMAP_SUBOFFSET_RESET-1:0] rvx_signal_13;
wire rvx_signal_19;
reg rvx_signal_05;
reg rvx_signal_25;

assign rvx_signal_00 = (RVX_GPARA_1==1)? (~rvx_port_04) : rvx_port_04;

RESET_BUF
i_rvx_instance_2
(
  .I(rvx_signal_00),
  .O(rvx_port_00)
);

assign rvx_port_07 = ~rvx_port_00;
assign rvx_signal_06 =  rvx_port_00 & (rvx_port_05);

always@(posedge rvx_port_14, negedge rvx_signal_06)
begin
	if(rvx_signal_06==0)
	begin
		rvx_signal_24 <= `RVX_LDEF_1;
		rvx_signal_23 <= {RVX_LPARA_2{1'b 1}};
	end
	else if(rvx_signal_12)
	begin
		rvx_signal_24 <= `RVX_LDEF_1;
		rvx_signal_23 <= {RVX_LPARA_2{1'b 1}};
	end
	else
		case(rvx_signal_24)
			`RVX_LDEF_1:
			begin
				rvx_signal_24 <= `RVX_LDEF_3;
				rvx_signal_23 <= {RVX_LPARA_2{1'b 0}};
			end
			`RVX_LDEF_3:
				rvx_signal_24 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
				if(rvx_signal_01)
					rvx_signal_23 <= {rvx_signal_23,1'b1};
		endcase
end

assign {rvx_signal_14,rvx_signal_07} = rvx_signal_23;
assign rvx_signal_20 = rvx_signal_07[RVX_GPARA_0-1];
assign rvx_signal_12 = rvx_signal_22;
assign rvx_signal_01 = rvx_signal_18 & rvx_signal_10;
assign rvx_signal_21 = ~rvx_signal_07[RVX_GPARA_2-1];

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_1),
	.CIRCULAR(0)
)
i_rvx_instance_0
(
	.clk(rvx_port_14),
	.rstnn(rvx_signal_06),
	.enable(1'b 1),
	.init(rvx_signal_09),
	.count(rvx_signal_03),
	.value(),
	.is_first_count(rvx_signal_02),
	.is_last_count(rvx_signal_10)
);

assign rvx_signal_09 = rvx_signal_17 | rvx_signal_01;
assign rvx_signal_03 = rvx_signal_18 & (~rvx_signal_01);

`ifdef SIM_ENV
initial
begin
	wait(rvx_signal_14==0);
	wait(rvx_signal_14==1);
	$display("[RESET CONTROLLER] all resets are released");
end
`endif

always@(posedge rvx_port_14, negedge rvx_signal_06)
begin
	if(rvx_signal_06==0)
		rvx_signal_04 <= `RESET_CMD_IDLE;
	else if(rvx_signal_05)
		rvx_signal_04 <= $unsigned(rvx_signal_16);
	else if(rvx_signal_17)
		rvx_signal_04 <= `RESET_CMD_IDLE_WITH_ERROR;
	else
		case(rvx_signal_04)
			`RESET_CMD_INIT:
				rvx_signal_04 <= `RESET_CMD_IDLE;
			`RESET_CMD_AUTO_INCR:
				if(rvx_signal_01 && rvx_signal_20)
					rvx_signal_04 <= `RESET_CMD_IDLE;
			`RESET_CMD_NEXT_STEP:
				if(rvx_signal_01)
					rvx_signal_04 <= `RESET_CMD_IDLE;
		endcase
end

assign rvx_signal_22 = (rvx_signal_04==`RESET_CMD_INIT);

always@(*)
begin
	rvx_signal_17 = 0;
	case(rvx_signal_04)
		`RESET_CMD_NEXT_STEP:
			if(rvx_signal_14)
				rvx_signal_17 = 1;
	endcase
end

assign rvx_signal_11 = rvx_signal_07 | rvx_signal_15;

always@(*)
begin
	rvx_signal_18 = 0;
	if((!rvx_signal_14) & (!rvx_signal_17))
	begin
		if(rvx_port_11==1)
			rvx_signal_18 = 1;
		else
			case(rvx_signal_04)
				`RESET_CMD_NEXT_STEP,
				`RESET_CMD_AUTO_INCR:
					rvx_signal_18 = 1;
				`RESET_CMD_IDLE:
					case(rvx_port_06)
						`BOOT_MODE_STAND_ALONE:
							rvx_signal_18 = 1;
						`BOOT_MODE_OCD:
							rvx_signal_18 = rvx_signal_21;
					endcase
			endcase
	end
end

generate
for(i=0; i<RVX_GPARA_0; i=i+1)
begin : i_gen_buf
  RESET_BUF
  i_rvx_instance_1
  (
    .I(rvx_signal_11[i]),
    .O(rvx_port_03[i])
  );
  RESET_NOT
  i_rvx_instance_3
  (
    .I(rvx_port_03[i]),
    .O(rvx_port_02[i])
  );
end
endgenerate

always@(posedge rvx_port_14, negedge rvx_signal_06)
begin
	if(rvx_signal_06==0)
		rvx_signal_15 <= 0;
	else if(rvx_signal_25)
		rvx_signal_15 <= rvx_signal_16;
end

assign rvx_signal_16 = CHANGE_ENDIAN_BUS2MAN(32,RVX_GPARA_3,rvx_port_08);
assign rvx_port_16 = CHANGE_ENDIAN_MAN2BUS(32,RVX_GPARA_3,rvx_signal_08);

assign rvx_signal_13 = {rvx_port_17[`BW_MMAP_SUBOFFSET_RESET-1:2],2'b 00};
assign rvx_signal_19 = rvx_port_01 & rvx_port_13 & rvx_port_10;
always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_08 = $unsigned(rvx_signal_04);
	rvx_signal_05 = 0;
	rvx_signal_25 = 0;
	
	case(rvx_signal_13)
		`MMAP_SUBOFFSET_RESET_CMD:
		begin
			rvx_signal_08 = $unsigned(rvx_signal_04);
			rvx_signal_05 = rvx_signal_19;
		end
		`MMAP_SUBOFFSET_RESET_MASK:
		begin
			rvx_signal_08 = $unsigned(rvx_signal_15);
			rvx_signal_25 = rvx_signal_19;
		end
		`MMAP_SUBOFFSET_RESET_SEQUENCE:
		begin
			rvx_signal_08 = -1;
			rvx_signal_08[RVX_GPARA_0-1:0] = rvx_signal_07;
		end
		default:
			rvx_port_12 = 1;
	endcase
end

assign rvx_port_15 = 1;
assign rvx_port_09 = rvx_signal_14;

`undef RVX_LDEF_3
`undef RVX_LDEF_1
`undef RVX_LDEF_2
`undef RVX_LDEF_0
endmodule
