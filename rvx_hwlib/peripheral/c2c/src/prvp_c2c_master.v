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



module PRVP_C2C_MASTER
(
  clk_apb,
  rstnn_apb,
  
  c2cm_clk,
  c2cm_csn,
  c2cm_dq_sod,
  c2cm_dq_soval,
  c2cm_dq_sival,

  rpaddr,
  rpwdata,
  rpwrite,
  rpsel,
  rpenable,
  rprdata,
  rpready,
  rpslverr
);



parameter NUM_MASTER = 1;
parameter BW_ADDR = 12;  
parameter BW_APB_DATA = 32;

localparam  RVX_LPARA_0 = 8;
localparam  RVX_LPARA_3 = 2'b00;
localparam  RVX_LPARA_1 = 2'b01;
localparam  RVX_LPARA_2 = 2'b10;

input  wire                                 clk_apb;
input  wire                                 rstnn_apb;

output wire                                 c2cm_clk;
output wire                [NUM_MASTER-1:0] c2cm_csn;
output wire                       [(4)-1:0] c2cm_dq_sod;
output wire                       [(4)-1:0] c2cm_dq_soval;
input wire                        [(4)-1:0] c2cm_dq_sival;

input  wire                   [BW_ADDR-1:0] rpaddr;
input  wire                          [31:0] rpwdata;
input  wire                                 rpwrite;
input  wire                                 rpsel;
input  wire                                 rpenable;
output wire                          [31:0] rprdata;
output wire                                 rpready;
output wire                                 rpslverr;

wire                                  [3:0] rvx_signal_3;
wire                                  [3:0] rvx_signal_0;
wire                                  [3:0] rvx_signal_4;
wire                                  [1:0] rvx_signal_1;

reg                                         rvx_signal_2;

assign c2cm_csn = rvx_signal_3[NUM_MASTER-1:0];

prvp_apb_spi_master
#(
  .BUFFER_DEPTH(RVX_LPARA_0),
  .APB_ADDR_WIDTH(BW_ADDR)
)
i_rvx_instance_0
(
  .HCLK(clk_apb),
  .HRESETn(rstnn_apb),
  .PADDR(rpaddr),
  .PWDATA(rpwdata),
  .PWRITE(rpwrite),
  .PSEL(rpsel),
  .PENABLE(rpenable),
  .PRDATA(rprdata),
  .PREADY(rpready),
  .PSLVERR(rpslverr),

  .events_o(),

  .spi_clk(c2cm_clk),
  .spi_csn0(rvx_signal_3[0]),
  .spi_csn1(rvx_signal_3[1]),
  .spi_csn2(rvx_signal_3[2]),
  .spi_csn3(rvx_signal_3[3]),
  .spi_mode(rvx_signal_1),
  .spi_sod(c2cm_dq_sod),
  .spi_sdo0(rvx_signal_0[0]),
  .spi_sdo1(rvx_signal_0[1]),
  .spi_sdo2(rvx_signal_0[2]),
  .spi_sdo3(rvx_signal_0[3]),
  .spi_sdi0(rvx_signal_4[0]),
  .spi_sdi1(rvx_signal_4[1]),
  .spi_sdi2(rvx_signal_4[2]),
  .spi_sdi3(rvx_signal_4[3])
);

always@(*)
begin
  rvx_signal_2 = 1;
  case(rvx_signal_1)
    RVX_LPARA_3:
      rvx_signal_2 = 0;
    RVX_LPARA_1,
    RVX_LPARA_2:
      rvx_signal_2 = 1;
  endcase
end

assign c2cm_dq_soval = (rvx_signal_2 == 1'b1)? rvx_signal_0: {3'b0, rvx_signal_0[0]};
assign rvx_signal_4 = (rvx_signal_2 == 1'b1)? c2cm_dq_sival: {3'b0, c2cm_dq_sival[1]};

endmodule
