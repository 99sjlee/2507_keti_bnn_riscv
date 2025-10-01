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



module ERVP_APB_BUS
(
	clk,
	rstnn,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr,
	rpbaseaddr_list,
	
	spsel_list,
	spenable_list,
	spaddr_list,
	spwrite_list,
	spwdata_list,
	sprdata_list,
	spready_list,
	spslverr_list
);



parameter NUM_MODULE = 1;
parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter SEL_UPPER_INDEX = 31;
parameter BW_SEL_INDEX = 4;

input wire clk, rstnn;

input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;
input wire [NUM_MODULE*BW_ADDR-1:0] rpbaseaddr_list;

output wire [NUM_MODULE-1:0] spsel_list;
output wire [NUM_MODULE-1:0] spenable_list;
output wire [NUM_MODULE*BW_ADDR-1:0] spaddr_list;
output wire [NUM_MODULE-1:0] spwrite_list;
output wire [NUM_MODULE*BW_DATA-1:0] spwdata_list;
input wire [NUM_MODULE*BW_DATA-1:0] sprdata_list;
input wire [NUM_MODULE-1:0] spready_list;
input wire [NUM_MODULE-1:0] spslverr_list;

genvar i,j;
integer k;

wire [BW_ADDR-1:0] rvx_signal_0 [NUM_MODULE-1:0];
wire [NUM_MODULE-1:0] rvx_signal_1;

generate
	for(i=0; i<NUM_MODULE; i=i+1)
	begin : i_split
		assign rvx_signal_0[i] = rpbaseaddr_list[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_1[i] = (rpaddr[SEL_UPPER_INDEX-:BW_SEL_INDEX]==rvx_signal_0[i][SEL_UPPER_INDEX-:BW_SEL_INDEX]);
	end
endgenerate

RVX_MODULE_088
#(
	.RVX_GPARA_1(NUM_MODULE),
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_2(BW_DATA)
)
i_rvx_instance_0
(
	.rvx_port_17(clk),
	.rvx_port_04(rstnn),

	.rvx_port_02(rpsel),
	.rvx_port_12(rpenable),
	.rvx_port_08(rpaddr),
	.rvx_port_16(rpwrite),
	.rvx_port_10(rpwdata),
	.rvx_port_13(rprdata),
	.rvx_port_11(rpready),
	.rvx_port_07(rpslverr),

	.rvx_port_14(rvx_signal_1),
	
	.rvx_port_06(spsel_list),
	.rvx_port_03(spenable_list),
	.rvx_port_15(spaddr_list),
	.rvx_port_05(spwrite_list),
	.rvx_port_18(spwdata_list),
	.rvx_port_00(sprdata_list),
	.rvx_port_01(spready_list),
	.rvx_port_09(spslverr_list)
);

endmodule

