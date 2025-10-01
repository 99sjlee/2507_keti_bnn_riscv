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



module RVX_MODULE_118
(
	rvx_port_4,
	rvx_port_1,

	rvx_port_5,
	rvx_port_0,
	rvx_port_2,
	rvx_port_3
);



input wire rvx_port_4, rvx_port_1;

input wire rvx_port_5;
input wire rvx_port_0;
output wire rvx_port_2;
output wire rvx_port_3;

localparam  RVX_LPARA_1 = 0;
localparam  RVX_LPARA_0 = 1;

reg rvx_signal_0;

always@(posedge rvx_port_4, negedge rvx_port_1)
begin
	if(rvx_port_1==0)
		rvx_signal_0 <= RVX_LPARA_1;
	else
		case(rvx_signal_0)
			RVX_LPARA_1:
				if(rvx_port_5)
					rvx_signal_0 <= RVX_LPARA_0;
			RVX_LPARA_0:
				if(rvx_port_0)
					rvx_signal_0 <= RVX_LPARA_1;
		endcase
end

assign rvx_port_2 = (rvx_signal_0==RVX_LPARA_1);
assign rvx_port_3 = (rvx_signal_0==RVX_LPARA_0);

endmodule
