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



module PRVP_C2C_SLAVE01
(
  clk_axi,
  rstnn_axi,

  sx4awvalid,
  sx4awaddr,
  sx4awlen,
  sx4awsize,
  sx4awburst,
  sx4awid,
  sx4awready,

  sx4wvalid,
  sx4wdata,
  sx4wstrb,
  sx4wlast,
  sx4wready,

  sx4bvalid,
  sx4bresp,
  sx4bid,
  sx4bready,

  sx4arvalid,
  sx4araddr,
  sx4arlen,
  sx4arsize,
  sx4arburst,
  sx4arid,
  sx4arready,

  sx4rvalid,
  sx4rdata,
  sx4rresp,
  sx4rlast,
  sx4rid,
  sx4rready,

  c2cs01_clk,
  c2cs01_csn,
  c2cs01_dq_sod,
  c2cs01_dq_soval,
  c2cs01_dq_sival
);



parameter BW_ADDR = 32;
parameter BW_AXI_DATA = 32;
parameter BW_AXI_TID   = 4;
parameter DUMMY_CYCLES   = 32;

localparam  RVX_LPARA_1 = 1;
localparam  RVX_LPARA_3 = 2'b00;
localparam  RVX_LPARA_4 = 2'b01;
localparam  RVX_LPARA_0 = 2'b10;
localparam  RVX_LPARA_2 = 2'b11;

input  wire                        clk_axi;
input  wire                        rstnn_axi;

output wire                        sx4awvalid;
output wire [BW_ADDR-1:0]   sx4awaddr;
output wire [7:0]                  sx4awlen;
output wire [2:0]                  sx4awsize;
output wire [1:0]                  sx4awburst;
output wire [BW_AXI_TID-1:0]     sx4awid;
input  wire                        sx4awready;

output wire                        sx4wvalid;
output wire [BW_AXI_DATA-1:0]   sx4wdata;
output wire [BW_AXI_DATA/8-1:0] sx4wstrb;
output wire                        sx4wlast;
input  wire                        sx4wready;

input  wire                        sx4bvalid;
input  wire [1:0]                  sx4bresp;
input  wire [BW_AXI_TID-1:0]     sx4bid;
output wire                        sx4bready;

output wire                        sx4arvalid;
output wire [BW_ADDR-1:0]   sx4araddr;
output wire [7:0]                  sx4arlen;
output wire [2:0]                  sx4arsize;
output wire [1:0]                  sx4arburst;
output wire [BW_AXI_TID-1:0]     sx4arid;
input  wire                        sx4arready;

input  wire                        sx4rvalid;
input  wire [BW_AXI_DATA-1:0]   sx4rdata;
input  wire [1:0]                  sx4rresp;
input  wire                        sx4rlast;
input  wire [BW_AXI_TID-1:0]      sx4rid;
output wire                        sx4rready;

input  wire                        c2cs01_clk;
input  wire                        c2cs01_csn;
output wire  [3:0]                 c2cs01_dq_sod;
output wire  [3:0]                 c2cs01_dq_soval;
input  wire  [3:0]                 c2cs01_dq_sival;

wire         [3:0]                 rvx_signal_0;
wire         [3:0]                 rvx_signal_3;

wire         [1:0]                 rvx_signal_4;
wire         [3:0]                 rvx_signal_5;
wire         [3:0]                 rvx_signal_2;

reg                                rvx_signal_1;

prvp_axi_spi_slave
#(
  .AXI_ADDR_WIDTH (BW_ADDR),
  .AXI_DATA_WIDTH (BW_AXI_DATA),
  .AXI_USER_WIDTH (RVX_LPARA_1),
  .AXI_ID_WIDTH   (BW_AXI_TID),
  .DUMMY_CYCLES   (DUMMY_CYCLES)
)
i_rvx_instance_0
(
  .test_mode(1'b 0),
  .spi_sclk(c2cs01_clk),
  .spi_cs(c2cs01_csn),
  .spi_mode(rvx_signal_4),
  .spi_sod(c2cs01_dq_sod),
  .spi_sdi0(rvx_signal_2[0]),
  .spi_sdi1(rvx_signal_2[1]),
  .spi_sdi2(rvx_signal_2[2]),
  .spi_sdi3(rvx_signal_2[3]),
  .spi_sdo0(rvx_signal_5[0]),
  .spi_sdo1(rvx_signal_5[1]),
  .spi_sdo2(rvx_signal_5[2]),
  .spi_sdo3(rvx_signal_5[3]),

  .axi_aclk(clk_axi),
  .axi_aresetn(rstnn_axi),
  .axi_master_aw_valid(sx4awvalid),
  .axi_master_aw_addr(sx4awaddr),
  .axi_master_aw_prot(),
  .axi_master_aw_region(),
  .axi_master_aw_len(sx4awlen),
  .axi_master_aw_size(sx4awsize),
  .axi_master_aw_burst(sx4awburst),
  .axi_master_aw_lock(),
  .axi_master_aw_cache(),
  .axi_master_aw_qos(),
  .axi_master_aw_id(sx4awid),
  .axi_master_aw_user(),
  .axi_master_aw_ready(sx4awready),
  .axi_master_ar_valid(sx4arvalid),
  .axi_master_ar_addr(sx4araddr),
  .axi_master_ar_prot(),
  .axi_master_ar_region(),
  .axi_master_ar_len(sx4arlen),
  .axi_master_ar_size(sx4arsize),
  .axi_master_ar_burst(sx4arburst),
  .axi_master_ar_lock(),
  .axi_master_ar_cache(),
  .axi_master_ar_qos(),
  .axi_master_ar_id(sx4arid),
  .axi_master_ar_user(),
  .axi_master_ar_ready(sx4arready),
  .axi_master_w_valid(sx4wvalid),
  .axi_master_w_data(sx4wdata),
  .axi_master_w_strb(sx4wstrb),
  .axi_master_w_user(),
  .axi_master_w_last(sx4wlast),
  .axi_master_w_ready(sx4wready),
  .axi_master_r_valid(sx4rvalid),
  .axi_master_r_data(sx4rdata),
  .axi_master_r_resp(sx4rresp),
  .axi_master_r_last(sx4rlast),
  .axi_master_r_id(sx4rid),
  .axi_master_r_user(1'b 0),
  .axi_master_r_ready(sx4rready),
  .axi_master_b_valid(sx4bvalid),
  .axi_master_b_resp(sx4bresp),
  .axi_master_b_id(sx4bid),
  .axi_master_b_user(1'b 0),
  .axi_master_b_ready(sx4bready)
);

always@(*)
begin
  rvx_signal_1 = 1;
  case(rvx_signal_4)
    RVX_LPARA_3,
    RVX_LPARA_4:
      rvx_signal_1 = 0;
    RVX_LPARA_0,
    RVX_LPARA_2:
      rvx_signal_1 = 1;
  endcase
end

assign rvx_signal_0 = (rvx_signal_1 == 1'b1)? rvx_signal_5: {2'b00, rvx_signal_5[0], 1'b0};
assign c2cs01_dq_soval = (c2cs01_csn == 1'b1)? 4'bzzzz: rvx_signal_0;
assign rvx_signal_3 = (rvx_signal_1 == 1'b1)? c2cs01_dq_sival: {3'b000, c2cs01_dq_sival[0]};
assign rvx_signal_2 = (c2cs01_csn == 1'b1)? 4'bzzzz: rvx_signal_3;

endmodule
