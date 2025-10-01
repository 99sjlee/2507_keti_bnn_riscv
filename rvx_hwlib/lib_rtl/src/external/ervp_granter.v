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



module ERVP_GRANTER
(
  clk,
  rstnn,
  clear,
  enable,
  candidate_ready_list,
  candidate_hint_list,
  candidate_valid_list,
  candidate_last_list,
  grant_list,
  granted_ready,
  granted_valid,
  granted_last
);



parameter NUM_CANDIDATE = 1;
parameter POLICY = 0;

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

output wire [NUM_CANDIDATE-1:0] candidate_ready_list;
input wire [NUM_CANDIDATE-1:0] candidate_hint_list;
input wire [NUM_CANDIDATE-1:0] candidate_valid_list;
input wire [NUM_CANDIDATE-1:0] candidate_last_list;
output wire [NUM_CANDIDATE-1:0] grant_list;
input wire granted_ready;
output wire granted_valid;
output wire granted_last;

reg [NUM_CANDIDATE-1:0] rvx_signal_2, rvx_signal_7;
wire [NUM_CANDIDATE-1:0] rvx_signal_1;
wire [NUM_CANDIDATE-1:0] rvx_signal_3, rvx_signal_4;

wire rvx_signal_5;
wire rvx_signal_0;
wire rvx_signal_6;
reg rvx_signal_8;

always @(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_2 <= 1;
  else if(clear)
    rvx_signal_2 <= 1;
  else if(enable && rvx_signal_8)
    rvx_signal_2 <= rvx_signal_7;
end

always@(*)
begin
  rvx_signal_7 = rvx_signal_3;
  if(rvx_signal_3==0)
    rvx_signal_7 = rvx_signal_4;
end

always@(*)
begin
  rvx_signal_8 = 0;
  if(granted_valid)
    rvx_signal_8 = rvx_signal_0 & rvx_signal_6;
  else
    rvx_signal_8 = rvx_signal_6;
end

RVX_MODULE_070
#(
  .RVX_GPARA_0(NUM_CANDIDATE),
  .RVX_GPARA_1(1)
)
i_rvx_instance_0
(
  .rvx_port_1(candidate_valid_list),
  .rvx_port_0(rvx_signal_3)
);

RVX_MODULE_070
#(
  .RVX_GPARA_0(NUM_CANDIDATE),
  .RVX_GPARA_1(1)
)
i_rvx_instance_1
(
  .rvx_port_1(candidate_hint_list),
  .rvx_port_0(rvx_signal_4)
);

assign granted_last = ((grant_list & candidate_last_list)!=0);
assign rvx_signal_5 = granted_valid & granted_ready;
assign rvx_signal_0 = rvx_signal_5 & granted_last;

assign rvx_signal_1 = (candidate_valid_list | candidate_hint_list) & (~rvx_signal_2);
assign rvx_signal_6 = (rvx_signal_1!=0);

assign grant_list = rvx_signal_2;
assign granted_valid = ((candidate_valid_list & grant_list)!=0);

assign candidate_ready_list = granted_ready? grant_list : 0;

endmodule
