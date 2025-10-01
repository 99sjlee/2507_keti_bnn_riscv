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
`include "ervp_axi_define.vh"



module MUNOC_LPI_SERIALIZER
(
	clk,
	rstnn,
  clear,
  enable,
  busy,
  
  rlqdready_list,
  rlqvalid_list,
  rlqhint_list,
  rlqlast_list,  
  rlqafy_list,
  rlqdata_list,

  rlydready_list,
  rlyvalid_list,
  rlyhint_list,
  rlylast_list,
  rlydata_list,
  
  slqdready,
  slqvalid,
  slqhint,
  slqafy,
  slqlast,
  slqdata,

  slydready,
  slyvalid,
  slyhint,
  slylast,
  slydata
);



parameter BW_LPI_QPARCEL = 32;
parameter BW_LPI_YPARCEL = 32;
parameter RCV_BW_LPI_BURDEN = 0;
parameter NUM_INTERFACE = 1;

localparam  SND_BW_LPI_BURDEN = (NUM_INTERFACE<=1)? RCV_BW_LPI_BURDEN : (RCV_BW_LPI_BURDEN+NUM_INTERFACE);

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;
output wire busy;

`include "lpi_conv.vb"

output wire [2*NUM_INTERFACE-1:0] rlqdready_list;
input wire [NUM_INTERFACE-1:0] rlqvalid_list;
input wire [NUM_INTERFACE-1:0] rlqhint_list;
input wire [NUM_INTERFACE-1:0] rlqlast_list;
input wire [NUM_INTERFACE-1:0] rlqafy_list;
input wire [RCV_BW_LPI_QDATA*NUM_INTERFACE-1:0] rlqdata_list;

input wire [2*NUM_INTERFACE-1:0] rlydready_list;
output wire [NUM_INTERFACE-1:0] rlyvalid_list;
output wire [NUM_INTERFACE-1:0] rlyhint_list;
output wire [NUM_INTERFACE-1:0] rlylast_list;
output wire [RCV_BW_LPI_YDATA*NUM_INTERFACE-1:0] rlydata_list;

input wire [2-1:0] slqdready;
output wire slqvalid;
output wire slqhint;
output wire slqlast;
output wire slqafy;
output wire [SND_BW_LPI_QDATA-1:0] slqdata;

output wire [2-1:0] slydready;
input wire slyvalid;
input wire slyhint;
input wire slylast;
input wire [SND_BW_LPI_YDATA-1:0] slydata;

genvar i;

localparam  RVX_LPARA_1 = NUM_INTERFACE;

wire [RVX_LPARA_1-1:0] rvx_signal_20;
wire [RVX_LPARA_1-1:0] rvx_signal_21;
wire [RVX_LPARA_1-1:0] rvx_signal_04;
wire [RVX_LPARA_1-1:0] rvx_signal_07;
wire [RVX_LPARA_1-1:0] rvx_signal_22;
wire rvx_signal_15;
wire rvx_signal_18;
wire rvx_signal_23;

wire [NUM_INTERFACE+RCV_BW_LPI_QDATA-1:0] rvx_signal_05;
wire [NUM_INTERFACE+RCV_BW_LPI_YDATA-1:0] rvx_signal_19;

localparam  RVX_LPARA_0 = 1;

wire [2-1:0] rvx_signal_13;
wire rvx_signal_10;
wire [RVX_LPARA_0-1:0] rvx_signal_02;
wire rvx_signal_14;
wire rvx_signal_06;
wire [RVX_LPARA_0-1:0] rvx_signal_08;

localparam  RVX_LPARA_2 = SND_BW_LPI_YDATA;

wire [2-1:0] rvx_signal_01;
wire rvx_signal_17;
wire [RVX_LPARA_2-1:0] rvx_signal_12;
wire rvx_signal_09;
wire rvx_signal_11;
wire [RVX_LPARA_2-1:0] rvx_signal_16;

wire [NUM_INTERFACE-1:0] rvx_signal_00;
wire [NUM_INTERFACE-1:0] rvx_signal_03;

ERVP_GRANTER
#(
  .NUM_CANDIDATE(RVX_LPARA_1)
)
i_rvx_instance_5
(
  .clk(clk),
  .rstnn(rstnn),
  .clear(clear),
  .enable(enable),
  .candidate_ready_list(rvx_signal_20),
  .candidate_hint_list(rvx_signal_21),
  .candidate_valid_list(rvx_signal_04),
  .candidate_last_list(rvx_signal_07),
  .grant_list(rvx_signal_22),
  .granted_ready(rvx_signal_15),
  .granted_valid(rvx_signal_18),
  .granted_last(rvx_signal_23)
);

assign rvx_signal_15 = slqdready[0];

generate
for(i=0; i<NUM_INTERFACE; i=i+1)
begin : i_gen_dready
  assign rlqdready_list[2*(i+1)-1-:2]  = {1'b 0, rvx_signal_20[i]};
end
endgenerate

assign rvx_signal_21 = rlqhint_list;
assign rvx_signal_04 = rlqvalid_list;
assign rvx_signal_07 = rlqlast_list;

assign slqvalid = rvx_signal_18;
assign slqhint = (rvx_signal_21!=0);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(1),
  .NUM_DATA(NUM_INTERFACE)
 )
i_rvx_instance_0
(
	.data_input_list(rlqlast_list),
	.select(rvx_signal_22),
	.data_output(slqlast)
);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(1),
  .NUM_DATA(NUM_INTERFACE)
 )
i_rvx_instance_2
(
	.data_input_list(rlqafy_list),
	.select(rvx_signal_22),
	.data_output(slqafy)
);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(RCV_BW_LPI_QDATA),
  .NUM_DATA(NUM_INTERFACE)
 )
i_rvx_instance_3
(
	.data_input_list(rlqdata_list),
	.select(rvx_signal_22),
	.data_output(rvx_signal_05[RCV_BW_LPI_QDATA-1:0])
);

assign rvx_signal_05[NUM_INTERFACE+RCV_BW_LPI_QDATA-1:RCV_BW_LPI_QDATA] = rvx_signal_22;
assign slqdata = rvx_signal_05;

ERVP_SMALL_FIFO
#(
  .BW_DATA(RVX_LPARA_0),
  .DEPTH(3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_1
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(enable),
  .clear(clear),
	.wready(rvx_signal_13),
	.wfull(),
	.wrequest(rvx_signal_10),
	.wdata(rvx_signal_02),
	.rready(rvx_signal_14),
	.rempty(),
	.rrequest(rvx_signal_06),
	.rdata(rvx_signal_08)
);

assign rvx_signal_10 = slyvalid;
assign rvx_signal_02 = slylast;
assign rvx_signal_06 = rvx_signal_11;

ERVP_SMALL_FIFO
#(
  .BW_DATA(RVX_LPARA_2),
  .DEPTH(3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_4
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(enable),
  .clear(clear),
	.wready(rvx_signal_01),
	.wfull(),
	.wrequest(rvx_signal_17),
	.wdata(rvx_signal_12),
	.rready(rvx_signal_09),
	.rempty(),
	.rrequest(rvx_signal_11),
	.rdata(rvx_signal_16)
);

assign rvx_signal_17 = slyvalid;
assign rvx_signal_12 = slydata;
assign rvx_signal_11 = ((rvx_signal_03 & rvx_signal_00)!=0);

assign rvx_signal_19 = rvx_signal_16;
assign rvx_signal_03 = (NUM_INTERFACE==1)? 1 : rvx_signal_19[NUM_INTERFACE+RCV_BW_LPI_YDATA-1-:NUM_INTERFACE];

assign slydready = rvx_signal_01;

generate
for(i=0; i<NUM_INTERFACE; i=i+1)
begin : i_gen_rly
  assign rvx_signal_00[i] = rlydready_list[i*2];
  assign rlylast_list[i] = rvx_signal_08;
  assign rlydata_list[RCV_BW_LPI_YDATA*(i+1)-1-:RCV_BW_LPI_YDATA] = rvx_signal_16;
end
endgenerate
assign rlyhint_list = 0;
assign rlyvalid_list = rvx_signal_09? rvx_signal_03 : 0;

assign busy = rvx_signal_09;

endmodule
