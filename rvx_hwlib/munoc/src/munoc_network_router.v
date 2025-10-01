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
`include "munoc_network_type.vh"
`include "munoc_network_link.vh"
`include "munoc_arbitration_type.vh"



module MUNOC_NETWORK_ROUTER
(
	clk,
	rstnn,
	input_ready_list,
	input_port_list,
	output_ready_list,
	output_port_list
);



parameter NETWORK_TYPE = `NOT_SELECTED; 
parameter ROUTER_ID = -1;
parameter BW_PHIT = 8;
parameter NUM_INPUT = 1;
parameter NUM_OUTPUT = 1;
parameter ARBITRATION_TYPE = `QOS_ARBITRATION;

localparam  MUNOC_LPARA_0 = (NETWORK_TYPE==`FORWARD_NETWORK)? `BW_FNI_LINK(BW_PHIT) : `BW_BNI_LINK(BW_PHIT);

input wire clk, rstnn;
output wire [NUM_INPUT-1:0] input_ready_list;
input wire [MUNOC_LPARA_0*NUM_INPUT-1:0] input_port_list;
input wire [NUM_OUTPUT-1:0] output_ready_list;
output wire [MUNOC_LPARA_0*NUM_OUTPUT-1:0] output_port_list;

genvar i,j;
wire [MUNOC_LPARA_0-1:0] munoc_signal_07[NUM_INPUT-1:0];
wire [MUNOC_LPARA_0-1:0] munoc_signal_02[NUM_OUTPUT-1:0];
wire [MUNOC_LPARA_0*NUM_INPUT-1:0] munoc_signal_06;
wire [NUM_OUTPUT-1:0] munoc_signal_09[NUM_INPUT-1:0];
wire [NUM_INPUT-1:0] munoc_signal_05[NUM_OUTPUT-1:0];
wire [NUM_INPUT-1:0] munoc_signal_01 [NUM_OUTPUT-1:0];
wire [NUM_INPUT-1:0] munoc_signal_04[NUM_OUTPUT-1:0];
wire [NUM_OUTPUT-1:0] munoc_signal_00[NUM_INPUT-1:0];
wire [NUM_OUTPUT-1:0] munoc_signal_03;
wire [NUM_INPUT-1:0] munoc_signal_08;

generate
for(i=0;i<NUM_INPUT;i=i+1)
begin : i_input_separation
	assign munoc_signal_07[i] = input_port_list[MUNOC_LPARA_0*(i+1)-1-:MUNOC_LPARA_0];
end
endgenerate

generate
for(i=0;i<NUM_OUTPUT;i=i+1)
begin : i_output_separation
	assign output_port_list[MUNOC_LPARA_0*(i+1)-1-:MUNOC_LPARA_0] = {munoc_signal_03[i],munoc_signal_02[i][MUNOC_LPARA_0-2:0]};
end
endgenerate

generate
for(i=0;i<NUM_INPUT;i=i+1)
begin : i_input_port_with_routinhg_info
	MUNOC_MODULE_04
	#(
		.MUNOC_GPARA_0(NETWORK_TYPE),
		.MUNOC_GPARA_3(ROUTER_ID),
		.MUNOC_GPARA_1(BW_PHIT),
		.MUNOC_GPARA_2(NUM_OUTPUT)
	)
	i_munoc_instance_1
	(
		.munoc_port_0(clk),
		.munoc_port_4(rstnn),
		.munoc_port_5(input_ready_list[i]),
		.munoc_port_2(munoc_signal_07[i]),
		.munoc_port_6(munoc_signal_08[i]),
		.munoc_port_1(munoc_signal_06[MUNOC_LPARA_0*(i+1)-1-:MUNOC_LPARA_0]),
		.munoc_port_3(munoc_signal_09[i])
	);
end
endgenerate

generate
for(i=0;i<NUM_INPUT;i=i+1)
begin : i_input_iter
	for(j=0;j<NUM_OUTPUT;j=j+1)
	begin : i_output_iter
		assign munoc_signal_05[j][i] = munoc_signal_09[i][j];
		assign munoc_signal_00[i][j] = munoc_signal_04[j][i];
	end
end
endgenerate

generate
for(i=0;i<NUM_INPUT;i=i+1)
begin : i_read_request_merging
	assign munoc_signal_08[i] = (munoc_signal_00[i]!=0);
end
endgenerate

generate
for(i=0;i<NUM_OUTPUT;i=i+1)
begin : i_arbiter_gen
	MUNOC_MODULE_38
	#(
		.MUNOC_GPARA_2(NETWORK_TYPE),
		.MUNOC_GPARA_3(BW_PHIT),
		.MUNOC_GPARA_0(NUM_INPUT),
		.MUNOC_GPARA_1(ARBITRATION_TYPE)
	)
	i_munoc_instance_2
	(
		.munoc_port_3(clk),
		.munoc_port_1(rstnn),
		.munoc_port_4(munoc_signal_06),
		.munoc_port_5(munoc_signal_05[i]),
		.munoc_port_0(output_ready_list[i]),
		.munoc_port_2(munoc_signal_01[i]),
		.munoc_port_6(munoc_signal_04[i]),
		.munoc_port_7(munoc_signal_03[i])
	);
end
endgenerate

generate
for(i=0;i<NUM_OUTPUT;i=i+1)
begin : i_output_mux_gen
	ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
	#(
		.BW_DATA(MUNOC_LPARA_0),
		.NUM_DATA(NUM_INPUT)
	)
	i_munoc_instance_0
	(
		.data_input_list(munoc_signal_06),
		.select(munoc_signal_01[i]),
		.data_output(munoc_signal_02[i])
	);
end
endgenerate

endmodule
