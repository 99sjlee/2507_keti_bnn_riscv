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

`include "timescale.vh"
`include "ervp_global.vh"



module NCSIM_MANAGER
(
	finish_force,
  uart_rx,
  uart_tx,
  record_enable,
  simulation_stop
);



parameter UART_CLK_HZ = 1000;

input wire finish_force;
input wire uart_rx;
output wire uart_tx;

input wire record_enable;
output wire simulation_stop;

wire rvx_signal_0;

assign simulation_stop = finish_force | rvx_signal_0;

NCSIM_PRINTF
#(
	.UART_CLK_HZ(UART_CLK_HZ)
)
i_rvx_instance_0
(
	.uart_rx(uart_rx),
	.uart_tx(uart_tx),
	.core_finish(rvx_signal_0)
);

initial
begin
	#1000
	wait(simulation_stop==1);
	wait(record_enable==0);
	#1
	$finish;
end

endmodule
