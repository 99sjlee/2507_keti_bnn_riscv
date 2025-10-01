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

module CLOCK_GENERATOR
(
	clk,
	rstnn,
	rst
);

parameter CLK_INITIAL_DELAY = 0.1;
parameter CLK_PERIOD  = 20;

localparam  RVX_LPARA_0 = (CLK_PERIOD/2);

output reg clk;
output reg rstnn;
output wire rst;

initial #CLK_INITIAL_DELAY clk = 1;
always #RVX_LPARA_0 clk = ~clk;

initial
begin
	rstnn = 1;
	#RVX_LPARA_0;
	rstnn = 0;
	wait(clk==1);
	wait(clk==0);
	wait(clk==1);
	wait(clk==0);
	wait(clk==1);
	wait(clk==0);
	wait(clk==1);
	wait(clk==0);
	wait(clk==1);
	wait(clk==0);
	rstnn = 1;
end

assign rst = ~rstnn;

endmodule

