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




module RVX_MODULE_112
(
	rvx_port_1,
	rvx_port_2,
	rvx_port_0
);




parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 0;
parameter SIGNED = 1;

input wire [RVX_GPARA_1-1:0] rvx_port_1;
input wire [RVX_GPARA_1-1:0] rvx_port_2;
output reg [RVX_GPARA_1-1:0] rvx_port_0;

wire [RVX_GPARA_1+1-1:0] rvx_signal_1;
wire [RVX_GPARA_1+1-1:0] rvx_signal_0;

assign rvx_signal_1 = (SIGNED)? $signed(rvx_port_1) : $unsigned(rvx_port_1);
assign rvx_signal_0 = (SIGNED)? $signed(rvx_port_2) : $unsigned(rvx_port_2);

always@(*)
begin
	rvx_port_0 = rvx_port_1;
	if(RVX_GPARA_0)
	begin
		if($signed(rvx_signal_1) > $signed(rvx_signal_0))
			rvx_port_0 = rvx_port_2;
	end
	else
	begin
		if($signed(rvx_signal_1) < $signed(rvx_signal_0))
			rvx_port_0 = rvx_port_2;
	end
end

endmodule
