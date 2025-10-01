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





module RVX_MODULE_068
(
	rvx_port_0,
	rvx_port_4,
	rvx_port_3,
	rvx_port_1,
	rvx_port_6,
	rvx_port_5,
	rvx_port_2
);





parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 0;
parameter RVX_GPARA_0 = 0;
parameter RVX_GPARA_4 = 0;

localparam  RVX_LPARA_0 = (4**RVX_GPARA_3);

input wire rvx_port_0, rvx_port_4, rvx_port_3;
input wire rvx_port_1;
input wire [RVX_GPARA_2-1:0] rvx_port_6;
output wire rvx_port_5;
output wire [RVX_GPARA_2-1:0] rvx_port_2;

genvar i,k;
integer j;

reg [0:RVX_LPARA_0-1] rvx_signal_5;
reg [RVX_GPARA_2-1:0] rvx_signal_6 [0:RVX_LPARA_0-1];
reg [RVX_GPARA_3*2-1:0] rvx_signal_3;

wire [0:RVX_LPARA_0-1] rvx_signal_1 [0:RVX_GPARA_3-1];
wire [0:RVX_LPARA_0-1] rvx_signal_0 [0:RVX_GPARA_3-1];
wire [RVX_GPARA_2-1:0] rvx_signal_4 [0:RVX_GPARA_3-1][0:RVX_LPARA_0-1];
wire [RVX_GPARA_2-1:0] rvx_signal_2 [0:RVX_GPARA_3-1][0:RVX_LPARA_0-1];

always@(posedge rvx_port_0, negedge rvx_port_4)
begin
	if(rvx_port_4==0)
		rvx_signal_3 <= 0;
	else if(rvx_port_3 && rvx_port_1)
		rvx_signal_3 <= rvx_signal_3 + 1;
end

always@(posedge rvx_port_0, negedge rvx_port_4)
begin
	if(rvx_port_4==0)
	begin
		for(j=0; j<RVX_LPARA_0; j=j+1)
			if(RVX_GPARA_1)
			begin
				rvx_signal_5[j] <= 1;
				rvx_signal_6[j] <= RVX_GPARA_0;
			end
			else
			begin
				rvx_signal_5 <= 0;
				rvx_signal_6[j] <= 0;
			end
	end
	else if(rvx_port_3 && rvx_port_1)
	begin
		rvx_signal_5[rvx_signal_3] <= 1;
		rvx_signal_6[rvx_signal_3] <= rvx_port_6;
	end
end

generate
	for(i=0; i<RVX_GPARA_3; i=i+1)
	begin : i_step_depth
		for(k=0; k<(4**(RVX_GPARA_3-1-i)); k=k+1)
		begin : i_step_width
			RVX_MODULE_059
			#(
				.RVX_GPARA_1(RVX_GPARA_2),
				.UNSIGNED(1),
				.RVX_GPARA_0(RVX_GPARA_4)
				)
			i_rvx_instance_0
			(
				.rvx_port_2(rvx_port_0),
				.rvx_port_5(rvx_port_4),
				.rvx_port_4(rvx_port_3),
				.rvx_port_1({rvx_signal_1[i][(4*k)+0],rvx_signal_1[i][(4*k)+1],rvx_signal_1[i][(4*k)+2],rvx_signal_1[i][(4*k)+3]}),
				.rvx_port_6({rvx_signal_4[i][(4*k)+0],rvx_signal_4[i][(4*k)+1],rvx_signal_4[i][(4*k)+2],rvx_signal_4[i][(4*k)+3]}),
				.rvx_port_0(rvx_signal_0[i][k]),
				.rvx_port_3(rvx_signal_2[i][k])
			);
		end
	end
endgenerate

generate
for(k=0; k<RVX_LPARA_0; k=k+1)
begin : i_first_step_initial_width
	assign rvx_signal_1[0][k] = rvx_signal_5[k];
	assign rvx_signal_4[0][k] = rvx_signal_6[k];
end
endgenerate

generate
for(i=1; i<RVX_GPARA_3; i=i+1)
begin : i_step_initial_depth
	for(k=0; k<(4**(RVX_GPARA_3-i)); k=k+1)
	begin : i_step_initial_width
		assign rvx_signal_1[i][k] = rvx_signal_0[i-1][k];
		assign rvx_signal_4[i][k] = rvx_signal_2[i-1][k];
	end
end
endgenerate

assign rvx_port_5 = rvx_signal_0[RVX_GPARA_3-1][0];
assign rvx_port_2 = rvx_signal_2[RVX_GPARA_3-1][0];

endmodule
