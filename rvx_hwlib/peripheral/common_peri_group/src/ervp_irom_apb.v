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
`include "irom_capacity.vh"
`include "platform_info.vh"


module ERVP_IROM_APB
(
	clk,
	rstnn,

	rpaddr,
	rpwrite,
	rpsel,
	rpenable,
	rpwdata,
	rprdata,
	rpready,
	rpslverr
);


parameter BW_ADDR = 32;
parameter BASE_ADDR = 0;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_1 = 32;
localparam  RVX_LPARA_4 = (LOG2RU_MIN1(`NUM_BYTE(RVX_LPARA_1)));

localparam  RVX_LPARA_0 = (`IROM_CAPACITY < 4096)? `IROM_CAPACITY : 1;		
localparam  RVX_LPARA_2 = `DIVIDERU(RVX_LPARA_0,`NUM_BYTE(RVX_LPARA_1));
localparam  RVX_LPARA_3 = LOG2RU_MIN1(RVX_LPARA_2);

input wire clk, rstnn;

input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire rpsel;
input wire rpenable;
input wire [RVX_LPARA_1-1:0] rpwdata;
output wire [RVX_LPARA_1-1:0] rprdata;
output wire rpready;
output wire rpslverr;

genvar i;
integer j;

integer file_pointer, read_status;
reg [32-1:0] rvx_signal_0;

wire [RVX_LPARA_3-1:0] rom_index;
`ifdef INCLUDE_IROM
reg [RVX_LPARA_1-1:0] rom_data;
`else
wire [RVX_LPARA_1-1:0] rom_data;
`endif

assign rom_index = $unsigned(rpaddr-BASE_ADDR) >> RVX_LPARA_4;
assign rprdata = rom_data;
assign rpready = 1;
assign rpslverr = rpsel & rpenable & rpwrite;

`ifdef INCLUDE_IROM
`include "irom_contents.vh"
`else
	assign rom_data = 0;
`endif

endmodule
