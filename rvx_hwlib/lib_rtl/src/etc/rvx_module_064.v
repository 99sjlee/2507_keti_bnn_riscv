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




module RVX_MODULE_064
(
	rvx_port_1,
	rvx_port_2,
  rvx_port_0
);




parameter RVX_GPARA_2 = 16;
parameter RVX_GPARA_1 = 3;
parameter UNSIGNED = 0;
parameter RVX_GPARA_0 = 0;

input wire [RVX_GPARA_2-1:0] rvx_port_1;
output wire [RVX_GPARA_2-1:0] rvx_port_2;
output reg rvx_port_0;

localparam  RVX_LPARA_1 = 1 - UNSIGNED;

localparam  RVX_LPARA_0 = RVX_GPARA_1 + 2 ;
localparam  RVX_LPARA_3 = RVX_GPARA_2 - RVX_GPARA_1 + 1;
localparam  RVX_LPARA_2 = RVX_LPARA_0 + RVX_LPARA_3;

wire [RVX_LPARA_2-1:0] rvx_signal_3;
wire [RVX_LPARA_2-1:0] rvx_signal_8;

wire [RVX_LPARA_3-1:0] rvx_signal_4;
wire [RVX_LPARA_0-1:0] rvx_signal_1;

wire rvx_signal_7;
wire rvx_signal_6;
reg rvx_signal_5;

wire [RVX_LPARA_3-1:0] rvx_signal_0;
wire [RVX_LPARA_0-1:0] rvx_signal_2;

assign rvx_signal_3[RVX_LPARA_2-2:0] = rvx_port_1 << 2;
assign rvx_signal_3[RVX_LPARA_2-1] = (RVX_LPARA_1==1)? rvx_port_1[RVX_GPARA_2-1] : 0;

assign {rvx_signal_4, rvx_signal_1} = rvx_signal_3;

assign rvx_signal_6 = rvx_signal_4[0];
assign rvx_signal_7 = (rvx_signal_1[RVX_LPARA_0-2:0]==0);

always@(*)
begin
	rvx_signal_5 = 0;
	if(rvx_signal_1[RVX_LPARA_0-1])
	begin
		if(rvx_signal_7)
			rvx_signal_5 = rvx_signal_6;
		else
			rvx_signal_5 = 1;
	end
end

assign rvx_signal_0 = rvx_signal_4 + rvx_signal_5;
assign rvx_signal_2 = 0;

assign rvx_signal_8 = {rvx_signal_0,rvx_signal_2};
assign rvx_port_2 = rvx_signal_8 >> 2;

always@(*)
begin
  rvx_port_0 = 0;
  if(RVX_LPARA_1==1)
    rvx_port_0 = rvx_signal_3[RVX_LPARA_2-1] & (~rvx_signal_8[RVX_LPARA_2-1]);
  else
    rvx_port_0 = (~rvx_signal_3[RVX_LPARA_2-1]) & rvx_signal_8[RVX_LPARA_2-1];
end

endmodule
