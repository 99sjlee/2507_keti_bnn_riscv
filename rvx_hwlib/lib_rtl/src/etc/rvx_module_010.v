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




module RVX_MODULE_010
(
	rvx_port_0,
	rvx_port_1,
	rvx_port_4,
	rvx_port_5,
	rvx_port_2,
	rvx_port_3
);




parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 4;
parameter RVX_GPARA_1 = 0;

input wire [RVX_GPARA_2-1:0] rvx_port_0;
input wire rvx_port_1;
input wire rvx_port_4;
input wire rvx_port_5;
input wire rvx_port_2;
output reg [RVX_GPARA_2-1:0] rvx_port_3;

genvar i;
integer k;

wire [RVX_GPARA_2*(RVX_GPARA_0+1)-1:0] rvx_signal_0;

generate
	for(i=0; i<(RVX_GPARA_0+1); i=i+1)
	begin : i_extend
		assign rvx_signal_0[(i+1)*RVX_GPARA_2-1-:RVX_GPARA_2] = rvx_port_0;
	end
endgenerate

always@(*)
begin
	rvx_port_3 = rvx_port_0;
	if(rvx_port_1==1)
	begin
		if(rvx_port_4==0)
		begin
			rvx_port_3 = rvx_signal_0[RVX_GPARA_2*(RVX_GPARA_0+1)-1-RVX_GPARA_0-:RVX_GPARA_2];
			if(RVX_GPARA_1==0)
				for(k=0; k<RVX_GPARA_0; k=k+1)
					if(k<RVX_GPARA_2)
						rvx_port_3[k] = rvx_port_2;
		end
		else
		begin
			rvx_port_3 = rvx_signal_0[RVX_GPARA_2-1+RVX_GPARA_0-:RVX_GPARA_2];
			if(RVX_GPARA_1==0)
				for(k=0; k<RVX_GPARA_0; k=k+1)
					if((RVX_GPARA_2-1-k)>=0)
						rvx_port_3[RVX_GPARA_2-1-k] = rvx_port_5;
		end
	end
end

endmodule
