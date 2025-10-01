// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE 
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS 
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE 
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL 
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE, 
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE 
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2022-11-22
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"

module ERVP_ORCA_CACHE_AXI_MASTER_OLD
(
  clk,
  rstnn,

  busy,
  
  c_oimm_address,
  c_oimm_burstlength_minus1,
  c_oimm_byteenable,
  c_oimm_requestvalid,
  c_oimm_readnotwrite,
  c_oimm_writedata,
  c_oimm_writelast,
  c_oimm_readdata,
  c_oimm_readdatavalid,
  c_oimm_waitrequest,

  sxrready,
  sxrvalid,
  sxrlast,
  sxrresp,
  sxrdata,
  sxrid,
  sxarready,
  sxarvalid,
  sxarburst,
  sxarsize,
  sxarlen,
  sxaraddr,
  sxarid,
  sxbready,
  sxbvalid,
  sxbresp,
  sxbid,
  sxwready,
  sxwvalid,
  sxwlast,
  sxwstrb,
  sxwdata,
  sxwid,
  sxawready,
  sxawvalid,
  sxawburst,
  sxawsize,
  sxawlen,
  sxawaddr,
  sxawid
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_AXI_TID = 1;
parameter BW_BURST_LENGTH = 4;
parameter CACHE_LINE_SIZE = 16; // in byte

localparam NUM_BYTE_IN_DATA = `NUM_BYTE(BW_DATA);
localparam NUM_TRANSFER = `DIVIDERU(CACHE_LINE_SIZE,NUM_BYTE_IN_DATA);

input wire clk;
input wire rstnn;
output wire busy;

input wire [BW_ADDR-1:0] c_oimm_address;
input wire [BW_BURST_LENGTH-1:0] c_oimm_burstlength_minus1;
input wire [`NUM_BYTE(BW_DATA)-1:0] c_oimm_byteenable;
input wire c_oimm_requestvalid;
input wire c_oimm_readnotwrite;
input wire [BW_DATA-1:0] c_oimm_writedata;
input wire c_oimm_writelast;
output wire [BW_DATA-1:0] c_oimm_readdata;
output wire c_oimm_readdatavalid;
output reg c_oimm_waitrequest;

output wire sxrready;
input wire sxrvalid;
input wire sxrlast;
input wire [`BW_AXI_RRESP-1:0] sxrresp;
input wire [BW_DATA-1:0] sxrdata;
input wire [BW_AXI_TID-1:0] sxrid;
input wire sxarready;
output wire sxarvalid;
output wire [`BW_AXI_ABURST-1:0] sxarburst;
output wire [`BW_AXI_ASIZE-1:0] sxarsize;
output wire [`BW_AXI_ALEN-1:0] sxarlen;
output wire [BW_ADDR-1:0] sxaraddr;
output wire [BW_AXI_TID-1:0] sxarid;
output wire sxbready;
input wire sxbvalid;
input wire [`BW_AXI_BRESP-1:0] sxbresp;
input wire [BW_AXI_TID-1:0] sxbid;
input wire sxwready;
output wire sxwvalid;
output wire sxwlast;
output wire [`BW_AXI_WSTRB(BW_DATA)-1:0] sxwstrb;
output wire [BW_DATA-1:0] sxwdata;
output wire [BW_AXI_TID-1:0] sxwid;
input wire sxawready;
output wire sxawvalid;
output wire [`BW_AXI_ABURST-1:0] sxawburst;
output wire [`BW_AXI_ASIZE-1:0] sxawsize;
output wire [`BW_AXI_ALEN-1:0] sxawlen;
output wire [BW_ADDR-1:0] sxawaddr;
output wire [BW_AXI_TID-1:0] sxawid;

/////////////
/* signals */
/////////////

localparam BW_WRITE_BUFFER = BW_DATA + `BW_AXI_WSTRB(BW_DATA) + 1;

wire i_write_buffer_wready;
reg i_write_buffer_wrequest;
wire [BW_WRITE_BUFFER-1:0] i_write_buffer_wdata;
wire i_write_buffer_rready;
wire i_write_buffer_rrequest;
wire [BW_WRITE_BUFFER-1:0] i_write_buffer_rdata;
wire i_write_buffer_rempty;

reg write_burst_state;
wire addr_is_transferred;

////////////
/* logics */
////////////

ERVP_SMALL_FIFO
#(
	.BW_DATA(BW_WRITE_BUFFER),
	.DEPTH(NUM_TRANSFER)
)
i_write_buffer
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(i_write_buffer_wready),
	.wrequest(i_write_buffer_wrequest),
	.wdata(i_write_buffer_wdata),
	.wfull(),
	.rready(i_write_buffer_rready),
	.rrequest(i_write_buffer_rrequest),
	.rdata(i_write_buffer_rdata),
	.rempty(i_write_buffer_rempty)
);

always@(*)
begin
  i_write_buffer_wrequest = 0;
  if(write_burst_state)
    i_write_buffer_wrequest = 1;
  else if(sxawvalid && sxawready)
    i_write_buffer_wrequest = 1;
end
assign i_write_buffer_wdata = {c_oimm_writedata,c_oimm_byteenable,c_oimm_writelast};
assign i_write_buffer_rrequest = sxwvalid & sxwready;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		write_burst_state <= 0;
	else if(write_burst_state==0)
  begin
    if(addr_is_transferred)
      if((~c_oimm_readnotwrite) & (~c_oimm_writelast))
        write_burst_state <= 1;
  end
  else if(write_burst_state==1)
  begin
    if(c_oimm_writelast)
      write_burst_state <= 0;
  end
end

assign addr_is_transferred = (~write_burst_state) & c_oimm_requestvalid & (~c_oimm_waitrequest);

always@(*)
begin
  c_oimm_waitrequest = 0;
  if(c_oimm_readnotwrite)
    c_oimm_waitrequest = ~sxarready;
  else if(write_burst_state)
    c_oimm_waitrequest = 0;
  else
    c_oimm_waitrequest = (~sxawready) | (~i_write_buffer_rempty);
end

assign c_oimm_readdatavalid = sxrvalid;
assign c_oimm_readdata = sxrdata;

assign sxarvalid = c_oimm_requestvalid & c_oimm_readnotwrite;
assign sxarburst = `AXI_BURST_INCR;
assign sxarsize = `GET_AXI_SIZE(BW_DATA);
assign sxarlen = c_oimm_burstlength_minus1;
assign sxaraddr = c_oimm_address;
assign sxarid = 0;

assign sxrready = 1;

assign sxawvalid = (~write_burst_state) & c_oimm_requestvalid & (~c_oimm_readnotwrite);
assign sxawburst = `AXI_BURST_INCR;
assign sxawsize = `GET_AXI_SIZE(BW_DATA);
assign sxawlen = c_oimm_burstlength_minus1;
assign sxawaddr = c_oimm_address;
assign sxawid = 0;

assign sxwvalid = i_write_buffer_rready;
assign {sxwdata,sxwstrb,sxwlast} = i_write_buffer_rdata;
assign sxwid = 0;

assign sxbready = 1;

assign busy = i_write_buffer_rready;

endmodule
