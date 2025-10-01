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



module ERVP_SMALL_FIFO
(
	clk,
  rstnn,
	enable,
  clear,
	wready,
	wfull,
	wrequest,
	wdata,
	rready,
	rempty,
	rrequest,
	rdata
);



parameter BW_DATA = 1;
parameter DEPTH = 1;
parameter READ_READY_SIZE = 1;
parameter WRITE_READY_SIZE = 1;

input wire clk;
input wire rstnn;
input wire enable;
input wire clear;

output reg [WRITE_READY_SIZE-1:0] wready;
input wire wrequest;
output wire wfull;
input wire [BW_DATA-1:0] wdata;

output wire [READ_READY_SIZE-1:0] rready;
input wire rrequest;
output wire rempty;
output wire [BW_DATA-1:0] rdata;

genvar i;
integer j;

reg [BW_DATA-1:0] rvx_signal_6 [DEPTH-1:0];
wire [BW_DATA*DEPTH-1:0] rvx_signal_2;
wire [DEPTH-1:0] rvx_signal_3, rvx_signal_1;
wire rvx_signal_0, rvx_signal_5;
wire [DEPTH-1:0] rvx_signal_4;

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(DEPTH),
	.RESET_NUMBER(0)
)
i_rvx_instance_3
(
	.clk(clk),
	.rstnn(rstnn),
  .enable(enable),
	.set_value(),
	.right_insertion(1'b 1),
	.left_insertion(1'b 0),
	.init(clear),
	.set(1'b 0),
	.left_shift(rvx_signal_5),
	.right_shift(rvx_signal_0),
	.is_upper_limit(wfull),
	.is_lower_limit(rempty),
	.value(rvx_signal_4)
);

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(DEPTH),
	.CIRCULAR(1)
)
i_rvx_instance_2
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(enable),
	.init(clear),
	.count(rvx_signal_5),
	.value(rvx_signal_1),
	.is_first_count(),
	.is_last_count()
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		for (j=0; j<DEPTH; j=j+1)
			rvx_signal_6[j] <= 0;
	else if(enable && rvx_signal_5)
	begin
		for (j=0; j<DEPTH; j=j+1)
			if(rvx_signal_1[j])
				rvx_signal_6[j] <= wdata;
	end
end

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(DEPTH),
	.CIRCULAR(1)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(enable),
	.init(clear),
	.count(rvx_signal_0),
	.value(rvx_signal_3),
	.is_first_count(),
	.is_last_count()
);

generate
	for(i=0; i<DEPTH; i=i+1)
	begin : i_concatenation
		assign rvx_signal_2[BW_DATA*(i+1)-1-:BW_DATA] = rvx_signal_6[i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(BW_DATA),
	.NUM_DATA(DEPTH)
)
i_rvx_instance_0
(
	.data_input_list(rvx_signal_2),
	.select(rvx_signal_3),
	.data_output(rdata)
);

always@(*)
begin
	wready = 0;
	for(j=0; j<WRITE_READY_SIZE; j=j+1)
		if(j<DEPTH)
			wready[j] = (~clear) & (~rvx_signal_4[DEPTH-1-j]);
end

assign wfull = ~wready[0];
assign rvx_signal_5 = wready[0] && wrequest;

assign rready = rvx_signal_4;

assign rempty = ~rready[0];
assign rvx_signal_0 = rready[0] & rrequest;

endmodule
