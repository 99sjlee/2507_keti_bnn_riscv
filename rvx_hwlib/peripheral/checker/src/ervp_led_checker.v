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



module ERVP_LED_CHECKER
(
	clk,
	tick_62d5ms,
	rstnn,
	app_finished,
	led_list
);



parameter NUM_LED = 1;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_2 = 1;
localparam  RVX_LPARA_1 = 16;
localparam  RVX_LPARA_0 = RVX_LPARA_1/RVX_LPARA_2;
localparam  RVX_LPARA_3 = LOG2RU(RVX_LPARA_0);

input wire clk;
input wire tick_62d5ms;
input wire rstnn;
input wire app_finished;
output reg [NUM_LED-1:0] led_list;

wire [RVX_LPARA_3-1:0] rvx_signal_1;
wire rvx_signal_0;

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_3),
	.CIRCULAR(1)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(tick_62d5ms),
	.value(rvx_signal_1),
	.is_first_count(),
	.is_last_count()
);

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_3+1)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(tick_62d5ms),
	.value(),
	.is_first_count(),
	.is_last_count(rvx_signal_0)
);

always@(*)
begin
	led_list = 0;
  if(rvx_signal_0)
  begin
    if(app_finished==1)
      led_list[0] = 1;
    else
      led_list[0] = rvx_signal_1[RVX_LPARA_3-1];
  end
end

endmodule
