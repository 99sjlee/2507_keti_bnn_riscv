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


module MUNOC_INTER_ROUTER_FIFO
(
	clk,
	rstnn,

	rfni_link,
	rfni_ready,
	rbni_link,
	rbni_ready,
	
	sfni_link,
	sfni_ready,
	sbni_link,
	sbni_ready
);


parameter BW_FNI_PHIT = 8;
parameter BW_BNI_PHIT = 8;
parameter NUM_BUFFER = 2;

localparam  MUNOC_LPARA_0 = `BW_FNI_LINK(BW_FNI_PHIT);
localparam  MUNOC_LPARA_1 = `BW_BNI_LINK(BW_BNI_PHIT);

input wire clk, rstnn;

input wire [MUNOC_LPARA_0-1:0] rfni_link;
output wire rfni_ready;
output wire [MUNOC_LPARA_1-1:0] rbni_link;
input wire rbni_ready;

output wire [MUNOC_LPARA_0-1:0] sfni_link;
input wire sfni_ready;
input wire [MUNOC_LPARA_1-1:0] sbni_link;
output wire sbni_ready;

ERVP_SMALL_FIFO
#(
	.BW_DATA(MUNOC_LPARA_0-1),
	.DEPTH(NUM_BUFFER)
)
i_munoc_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rfni_ready),
	.wrequest(rfni_link[MUNOC_LPARA_0-1]),
	.wdata(rfni_link[MUNOC_LPARA_0-2:0]),
	.rready(sfni_link[MUNOC_LPARA_0-1]),
	.rrequest(sfni_ready),
	.rdata(sfni_link[MUNOC_LPARA_0-2:0]),
	.wfull(),
	.rempty()
);

ERVP_SMALL_FIFO
#(
	.BW_DATA(MUNOC_LPARA_1-1),
	.DEPTH(NUM_BUFFER)
)
i_munoc_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(sbni_ready),
	.wrequest(sbni_link[MUNOC_LPARA_1-1]),
	.wdata(sbni_link[MUNOC_LPARA_1-2:0]),

	.rready(rbni_link[MUNOC_LPARA_1-1]),
	.rrequest(rbni_ready),
	.rdata(rbni_link[MUNOC_LPARA_1-2:0]),
	.wfull(),
	.rempty()
);

endmodule
