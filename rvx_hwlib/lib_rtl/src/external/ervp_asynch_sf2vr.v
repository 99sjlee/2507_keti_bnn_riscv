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



module ERVP_ASYNCH_SF2VR
(
	wclk,
	wrstnn,
	wstart,
  wbusy,
	wfinish,

	rclk,
	rrstnn,
	rvalid,
	rready
);



input wire wclk;
input wire wrstnn;
input wire wstart;
output wire wbusy;
output wire wfinish;

input wire rclk;
input wire rrstnn;
output wire rvalid;
input wire rready;

wire rvx_signal_2;
wire rvx_signal_3;
wire rvx_signal_1;
wire rvx_signal_4;

localparam  RVX_LPARA_0 = 1;
localparam  RVX_LPARA_2 = 0;
localparam  RVX_LPARA_1 = 1;

reg [RVX_LPARA_0-1:0] rvx_signal_0;

always@(posedge wclk, negedge wrstnn)
begin
  if(wrstnn==0)
    rvx_signal_0 <= RVX_LPARA_2;
  else
    case(rvx_signal_0)
      RVX_LPARA_2:
        if(rvx_signal_3)
          rvx_signal_0 <= RVX_LPARA_1;
      RVX_LPARA_1:
        if(wfinish)
          rvx_signal_0 <= RVX_LPARA_2;
    endcase
end

assign rvx_signal_3 = (rvx_signal_0==RVX_LPARA_2) & wstart;
assign wbusy = (rvx_signal_0==RVX_LPARA_1);
assign wfinish = (rvx_signal_0==RVX_LPARA_1) & rvx_signal_2;

ERVP_ASYNCH_REGISTER
#(
	.BW_DATA(1)
)
i_rvx_instance_0
(
	.wclk(wclk),
	.wrstnn(wrstnn),
	.wready(rvx_signal_2),
	.wrequest(rvx_signal_3),
	.wdata(1'b 0),
	.rclk(rclk),
	.rrstnn(rrstnn),
	.rready(rvx_signal_4),
	.rrequest(rvx_signal_1),
	.rdata()
);

assign rvalid = rvx_signal_4;
assign rvx_signal_1 = rready;

endmodule
