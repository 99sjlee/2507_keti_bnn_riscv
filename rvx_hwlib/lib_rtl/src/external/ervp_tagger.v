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


module ERVP_TAGGER
(
	clk,
  rstnn,
	enable,

  wready,
  wissue,
	wrecord,
	wtag,
	rready,
	rrequest,
	rtag
);


parameter BW_TAG = 1;
parameter DEPTH = 4;

input wire clk, rstnn;
input wire enable;

output wire wready;
input wire wissue;
input wire wrecord;
output wire [BW_TAG-1:0] wtag;

output wire rready;
input wire rrequest;
output wire [BW_TAG-1:0] rtag;

ERVP_COUNTER
#(
  .BW_COUNTER(BW_TAG),
  .CIRCULAR(1)
)
i_rvx_instance_1
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(enable),
	.init(1'b 0),
  .count(wready&wissue),
	.value(wtag),
	.is_first_count(),
	.is_last_count()
);

ERVP_SMALL_FIFO
#(
  .BW_DATA(BW_TAG),
  .DEPTH(DEPTH)
)
i_rvx_instance_0
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(enable),
  .clear(1'b 0),
	.wready(wready),
	.wfull(),
	.wrequest(wissue&wrecord),
	.wdata(wtag),
	.rready(rready),
	.rempty(),
	.rrequest(rrequest),
	.rdata(rtag)
);

endmodule
