`include "global.vh"

module swerv_top (
   input  wire                        clk,
   input  wire                        rst_l,
   input  wire                        dbg_rst_l,
   input  wire [31:1]                 rst_vec,
   input  wire                        nmi_int,
   input  wire [31:1]                 nmi_vec,

   output wire [63:0]                 trace_rv_i_insn_ip,
   output wire [63:0]                 trace_rv_i_address_ip,
   output wire [2:0]                  trace_rv_i_valid_ip,
   output wire [2:0]                  trace_rv_i_exception_ip,
   output wire [4:0]                  trace_rv_i_ecause_ip,
   output wire [2:0]                  trace_rv_i_interrupt_ip,
   output wire [31:0]                 trace_rv_i_tval_ip,

   //-------------------------- LSU AXI signals--------------------------
   // AXI Write Channels
   output wire                        lsu_axi_awvalid,
   input  wire                        lsu_axi_awready,
   output wire [`RV_LSU_BUS_TAG-1:0]  lsu_axi_awid,
   output wire [31:0]                 lsu_axi_awaddr,
   output wire [3:0]                  lsu_axi_awregion,
   output wire [7:0]                  lsu_axi_awlen,
   output wire [2:0]                  lsu_axi_awsize,
   output wire [1:0]                  lsu_axi_awburst,
   output wire                        lsu_axi_awlock,
   output wire [3:0]                  lsu_axi_awcache,
   output wire [2:0]                  lsu_axi_awprot,
   output wire [3:0]                  lsu_axi_awqos,

   output wire                        lsu_axi_wvalid,
   input  wire                        lsu_axi_wready,
   output wire [63:0]                 lsu_axi_wdata,
   output wire [7:0]                  lsu_axi_wstrb,
   output wire                        lsu_axi_wlast,

   input  wire                        lsu_axi_bvalid,
   output wire                        lsu_axi_bready,
   input  wire [1:0]                  lsu_axi_bresp,
   input  wire [`RV_LSU_BUS_TAG-1:0]  lsu_axi_bid,

   // AXI Read Channels
   output wire                        lsu_axi_arvalid,
   input  wire                        lsu_axi_arready,
   output wire [`RV_LSU_BUS_TAG-1:0]  lsu_axi_arid,
   output wire [31:0]                 lsu_axi_araddr,
   output wire [3:0]                  lsu_axi_arregion,
   output wire [7:0]                  lsu_axi_arlen,
   output wire [2:0]                  lsu_axi_arsize,
   output wire [1:0]                  lsu_axi_arburst,
   output wire                        lsu_axi_arlock,
   output wire [3:0]                  lsu_axi_arcache,
   output wire [2:0]                  lsu_axi_arprot,
   output wire [3:0]                  lsu_axi_arqos,

   input  wire                        lsu_axi_rvalid,
   output wire                        lsu_axi_rready,
   input  wire [`RV_LSU_BUS_TAG-1:0]  lsu_axi_rid,
   input  wire [63:0]                 lsu_axi_rdata,
   input  wire [1:0]                  lsu_axi_rresp,
   input  wire                        lsu_axi_rlast,

   //-------------------------- IFU AXI signals--------------------------
   // AXI Write Channels
   output wire                        ifu_axi_awvalid,
   input  wire                        ifu_axi_awready,
   output wire [`RV_IFU_BUS_TAG-1:0]  ifu_axi_awid,
   output wire [31:0]                 ifu_axi_awaddr,
   output wire [3:0]                  ifu_axi_awregion,
   output wire [7:0]                  ifu_axi_awlen,
   output wire [2:0]                  ifu_axi_awsize,
   output wire [1:0]                  ifu_axi_awburst,
   output wire                        ifu_axi_awlock,
   output wire [3:0]                  ifu_axi_awcache,
   output wire [2:0]                  ifu_axi_awprot,
   output wire [3:0]                  ifu_axi_awqos,

   output wire                        ifu_axi_wvalid,
   input  wire                        ifu_axi_wready,
   output wire [63:0]                 ifu_axi_wdata,
   output wire [7:0]                  ifu_axi_wstrb,
   output wire                        ifu_axi_wlast,

   input  wire                        ifu_axi_bvalid,
   output wire                        ifu_axi_bready,
   input  wire [1:0]                  ifu_axi_bresp,
   input  wire [`RV_IFU_BUS_TAG-1:0]  ifu_axi_bid,

   // AXI Read Channels
   output wire                        ifu_axi_arvalid,
   input  wire                        ifu_axi_arready,
   output wire [`RV_IFU_BUS_TAG-1:0]  ifu_axi_arid,
   output wire [31:0]                 ifu_axi_araddr,
   output wire [3:0]                  ifu_axi_arregion,
   output wire [7:0]                  ifu_axi_arlen,
   output wire [2:0]                  ifu_axi_arsize,
   output wire [1:0]                  ifu_axi_arburst,
   output wire                        ifu_axi_arlock,
   output wire [3:0]                  ifu_axi_arcache,
   output wire [2:0]                  ifu_axi_arprot,
   output wire [3:0]                  ifu_axi_arqos,

   input  wire                        ifu_axi_rvalid,
   output wire                        ifu_axi_rready,
   input  wire [`RV_IFU_BUS_TAG-1:0]  ifu_axi_rid,
   input  wire [63:0]                 ifu_axi_rdata,
   input  wire [1:0]                  ifu_axi_rresp,
   input  wire                        ifu_axi_rlast,

   //-------------------------- SB AXI signals--------------------------
   // AXI Write Channels
   output wire                        sb_axi_awvalid,
   input  wire                        sb_axi_awready,
   output wire [`RV_SB_BUS_TAG-1:0]   sb_axi_awid,
   output wire [31:0]                 sb_axi_awaddr,
   output wire [3:0]                  sb_axi_awregion,
   output wire [7:0]                  sb_axi_awlen,
   output wire [2:0]                  sb_axi_awsize,
   output wire [1:0]                  sb_axi_awburst,
   output wire                        sb_axi_awlock,
   output wire [3:0]                  sb_axi_awcache,
   output wire [2:0]                  sb_axi_awprot,
   output wire [3:0]                  sb_axi_awqos,

   output wire                        sb_axi_wvalid,
   input  wire                        sb_axi_wready,
   output wire [63:0]                 sb_axi_wdata,
   output wire [7:0]                  sb_axi_wstrb,
   output wire                        sb_axi_wlast,

   input  wire                        sb_axi_bvalid,
   output wire                        sb_axi_bready,
   input  wire [1:0]                  sb_axi_bresp,
   input  wire [`RV_SB_BUS_TAG-1:0]   sb_axi_bid,

   // AXI Read Channels
   output wire                        sb_axi_arvalid,
   input  wire                        sb_axi_arready,
   output wire [`RV_SB_BUS_TAG-1:0]   sb_axi_arid,
   output wire [31:0]                 sb_axi_araddr,
   output wire [3:0]                  sb_axi_arregion,
   output wire [7:0]                  sb_axi_arlen,
   output wire [2:0]                  sb_axi_arsize,
   output wire [1:0]                  sb_axi_arburst,
   output wire                        sb_axi_arlock,
   output wire [3:0]                  sb_axi_arcache,
   output wire [2:0]                  sb_axi_arprot,
   output wire [3:0]                  sb_axi_arqos,

   input  wire                        sb_axi_rvalid,
   output wire                        sb_axi_rready,
   input  wire [`RV_SB_BUS_TAG-1:0]   sb_axi_rid,
   input  wire [63:0]                 sb_axi_rdata,
   input  wire [1:0]                  sb_axi_rresp,
   input  wire                        sb_axi_rlast,

   //-------------------------- DMA AXI signals--------------------------
   // AXI Write Channels
   input  wire                        dma_axi_awvalid,
   output wire                        dma_axi_awready,
   input  wire [`RV_DMA_BUS_TAG-1:0]  dma_axi_awid,
   input  wire [31:0]                 dma_axi_awaddr,
   input  wire [2:0]                  dma_axi_awsize,
   input  wire [2:0]                  dma_axi_awprot,
   input  wire [7:0]                  dma_axi_awlen,
   input  wire [1:0]                  dma_axi_awburst,

   input  wire                        dma_axi_wvalid,
   output wire                        dma_axi_wready,
   input  wire [63:0]                 dma_axi_wdata,
   input  wire [7:0]                  dma_axi_wstrb,
   input  wire                        dma_axi_wlast,

   output wire                        dma_axi_bvalid,
   input  wire                        dma_axi_bready,
   output wire [1:0]                  dma_axi_bresp,
   output wire [`RV_DMA_BUS_TAG-1:0]  dma_axi_bid,

   // AXI Read Channels
   input  wire                        dma_axi_arvalid,
   output wire                        dma_axi_arready,
   input  wire [`RV_DMA_BUS_TAG-1:0]  dma_axi_arid,
   input  wire [31:0]                 dma_axi_araddr,
   input  wire [2:0]                  dma_axi_arsize,
   input  wire [2:0]                  dma_axi_arprot,
   input  wire [7:0]                  dma_axi_arlen,
   input  wire [1:0]                  dma_axi_arburst,

   output wire                        dma_axi_rvalid,
   input  wire                        dma_axi_rready,
   output wire [`RV_DMA_BUS_TAG-1:0]  dma_axi_rid,
   output wire [63:0]                 dma_axi_rdata,
   output wire [1:0]                  dma_axi_rresp,
   output wire                        dma_axi_rlast,

   //-------------------------- Clock signals-----------------------------
   input  wire                        lsu_bus_clk_en,
   input  wire                        ifu_bus_clk_en,
   input  wire                        dbg_bus_clk_en,
   input  wire                        dma_bus_clk_en,

   //-------------------------- Interrupt signals-------------------------
   input  wire                        timer_int,
   input  wire [`RV_PIC_TOTAL_INT:1]  extintsrc_req,

   //-------------------------- Performance counter-----------------------
   output wire [1:0]                  dec_tlu_perfcnt0,
   output wire [1:0]                  dec_tlu_perfcnt1,
   output wire [1:0]                  dec_tlu_perfcnt2,
   output wire [1:0]                  dec_tlu_perfcnt3,

   //-------------------------- Debug module------------------------------
   input  wire                        dmi_reg_en,
   input  wire [6:0]                  dmi_reg_addr,
   input  wire                        dmi_reg_wr_en,
   input  wire [31:0]                 dmi_reg_wdata,
   output wire [31:0]                 dmi_reg_rdata,
   input  wire                        dmi_hard_reset,

   //-------------------------- External MPC signals----------------------
   input  wire                        mpc_debug_halt_req,
   input  wire                        mpc_debug_run_req,
   input  wire                        mpc_reset_run_req,
   output wire                        mpc_debug_halt_ack,
   output wire                        mpc_debug_run_ack,
   output wire                        debug_brkpt_status,

   //-------------------------- CPU Halt signals--------------------------
   input  wire                        i_cpu_halt_req,
   output wire                        o_cpu_halt_ack,
   output wire                        o_cpu_halt_status,
   output wire                        o_debug_mode_status,
   input  wire                        i_cpu_run_req,
   output wire                        o_cpu_run_ack,

   //-------------------------- Miscellaneous-----------------------------
   input  wire                        scan_mode,
   input  wire                        mbist_mode
);

   // Instantiate swerv_wrapper_dmi
   swerv_wrapper_dmi swerv_wrapper_dmi (
      .clk(clk),
      .rst_l(rst_l),
      .dbg_rst_l(dbg_rst_l),
      .rst_vec(rst_vec),
      .nmi_int(nmi_int),
      .nmi_vec(nmi_vec),

      .trace_rv_i_insn_ip(trace_rv_i_insn_ip),
      .trace_rv_i_address_ip(trace_rv_i_address_ip),
      .trace_rv_i_valid_ip(trace_rv_i_valid_ip),
      .trace_rv_i_exception_ip(trace_rv_i_exception_ip),
      .trace_rv_i_ecause_ip(trace_rv_i_ecause_ip),
      .trace_rv_i_interrupt_ip(trace_rv_i_interrupt_ip),
      .trace_rv_i_tval_ip(trace_rv_i_tval_ip),

      //-------------------------- LSU AXI signals--------------------------
      .lsu_axi_awvalid(lsu_axi_awvalid),
      .lsu_axi_awready(lsu_axi_awready),
      .lsu_axi_awid(lsu_axi_awid),
      .lsu_axi_awaddr(lsu_axi_awaddr),
      .lsu_axi_awregion(lsu_axi_awregion),
      .lsu_axi_awlen(lsu_axi_awlen),
      .lsu_axi_awsize(lsu_axi_awsize),
      .lsu_axi_awburst(lsu_axi_awburst),
      .lsu_axi_awlock(lsu_axi_awlock),
      .lsu_axi_awcache(lsu_axi_awcache),
      .lsu_axi_awprot(lsu_axi_awprot),
      .lsu_axi_awqos(lsu_axi_awqos),

      .lsu_axi_wvalid(lsu_axi_wvalid),
      .lsu_axi_wready(lsu_axi_wready),
      .lsu_axi_wdata(lsu_axi_wdata),
      .lsu_axi_wstrb(lsu_axi_wstrb),
      .lsu_axi_wlast(lsu_axi_wlast),

      .lsu_axi_bvalid(lsu_axi_bvalid),
      .lsu_axi_bready(lsu_axi_bready),
      .lsu_axi_bresp(lsu_axi_bresp),
      .lsu_axi_bid(lsu_axi_bid),

      .lsu_axi_arvalid(lsu_axi_arvalid),
      .lsu_axi_arready(lsu_axi_arready),
      .lsu_axi_arid(lsu_axi_arid),
      .lsu_axi_araddr(lsu_axi_araddr),
      .lsu_axi_arregion(lsu_axi_arregion),
      .lsu_axi_arlen(lsu_axi_arlen),
      .lsu_axi_arsize(lsu_axi_arsize),
      .lsu_axi_arburst(lsu_axi_arburst),
      .lsu_axi_arlock(lsu_axi_arlock),
      .lsu_axi_arcache(lsu_axi_arcache),
      .lsu_axi_arprot(lsu_axi_arprot),
      .lsu_axi_arqos(lsu_axi_arqos),

      .lsu_axi_rvalid(lsu_axi_rvalid),
      .lsu_axi_rready(lsu_axi_rready),
      .lsu_axi_rid(lsu_axi_rid),
      .lsu_axi_rdata(lsu_axi_rdata),
      .lsu_axi_rresp(lsu_axi_rresp),
      .lsu_axi_rlast(lsu_axi_rlast),

      //-------------------------- IFU AXI signals--------------------------
      .ifu_axi_awvalid(ifu_axi_awvalid),
      .ifu_axi_awready(ifu_axi_awready),
      .ifu_axi_awid(ifu_axi_awid),
      .ifu_axi_awaddr(ifu_axi_awaddr),
      .ifu_axi_awregion(ifu_axi_awregion),
      .ifu_axi_awlen(ifu_axi_awlen),
      .ifu_axi_awsize(ifu_axi_awsize),
      .ifu_axi_awburst(ifu_axi_awburst),
      .ifu_axi_awlock(ifu_axi_awlock),
      .ifu_axi_awcache(ifu_axi_awcache),
      .ifu_axi_awprot(ifu_axi_awprot),
      .ifu_axi_awqos(ifu_axi_awqos),

      .ifu_axi_wvalid(ifu_axi_wvalid),
      .ifu_axi_wready(ifu_axi_wready),
      .ifu_axi_wdata(ifu_axi_wdata),
      .ifu_axi_wstrb(ifu_axi_wstrb),
      .ifu_axi_wlast(ifu_axi_wlast),

      .ifu_axi_bvalid(ifu_axi_bvalid),
      .ifu_axi_bready(ifu_axi_bready),
      .ifu_axi_bresp(ifu_axi_bresp),
      .ifu_axi_bid(ifu_axi_bid),

      .ifu_axi_arvalid(ifu_axi_arvalid),
      .ifu_axi_arready(ifu_axi_arready),
      .ifu_axi_arid(ifu_axi_arid),
      .ifu_axi_araddr(ifu_axi_araddr),
      .ifu_axi_arregion(ifu_axi_arregion),
      .ifu_axi_arlen(ifu_axi_arlen),
      .ifu_axi_arsize(ifu_axi_arsize),
      .ifu_axi_arburst(ifu_axi_arburst),
      .ifu_axi_arlock(ifu_axi_arlock),
      .ifu_axi_arcache(ifu_axi_arcache),
      .ifu_axi_arprot(ifu_axi_arprot),
      .ifu_axi_arqos(ifu_axi_arqos),

      .ifu_axi_rvalid(ifu_axi_rvalid),
      .ifu_axi_rready(ifu_axi_rready),
      .ifu_axi_rid(ifu_axi_rid),
      .ifu_axi_rdata(ifu_axi_rdata),
      .ifu_axi_rresp(ifu_axi_rresp),
      .ifu_axi_rlast(ifu_axi_rlast),

      //-------------------------- SB AXI signals--------------------------
      .sb_axi_awvalid(sb_axi_awvalid),
      .sb_axi_awready(sb_axi_awready),
      .sb_axi_awid(sb_axi_awid),
      .sb_axi_awaddr(sb_axi_awaddr),
      .sb_axi_awregion(sb_axi_awregion),
      .sb_axi_awlen(sb_axi_awlen),
      .sb_axi_awsize(sb_axi_awsize),
      .sb_axi_awburst(sb_axi_awburst),
      .sb_axi_awlock(sb_axi_awlock),
      .sb_axi_awcache(sb_axi_awcache),
      .sb_axi_awprot(sb_axi_awprot),
      .sb_axi_awqos(sb_axi_awqos),

      .sb_axi_wvalid(sb_axi_wvalid),
      .sb_axi_wready(sb_axi_wready),
      .sb_axi_wdata(sb_axi_wdata),
      .sb_axi_wstrb(sb_axi_wstrb),
      .sb_axi_wlast(sb_axi_wlast),

      .sb_axi_bvalid(sb_axi_bvalid),
      .sb_axi_bready(sb_axi_bready),
      .sb_axi_bresp(sb_axi_bresp),
      .sb_axi_bid(sb_axi_bid),

      .sb_axi_arvalid(sb_axi_arvalid),
      .sb_axi_arready(sb_axi_arready),
      .sb_axi_arid(sb_axi_arid),
      .sb_axi_araddr(sb_axi_araddr),
      .sb_axi_arregion(sb_axi_arregion),
      .sb_axi_arlen(sb_axi_arlen),
      .sb_axi_arsize(sb_axi_arsize),
      .sb_axi_arburst(sb_axi_arburst),
      .sb_axi_arlock(sb_axi_arlock),
      .sb_axi_arcache(sb_axi_arcache),
      .sb_axi_arprot(sb_axi_arprot),
      .sb_axi_arqos(sb_axi_arqos),

      .sb_axi_rvalid(sb_axi_rvalid),
      .sb_axi_rready(sb_axi_rready),
      .sb_axi_rid(sb_axi_rid),
      .sb_axi_rdata(sb_axi_rdata),
      .sb_axi_rresp(sb_axi_rresp),
      .sb_axi_rlast(sb_axi_rlast),

      //-------------------------- DMA AXI signals--------------------------
      .dma_axi_awvalid(dma_axi_awvalid),
      .dma_axi_awready(dma_axi_awready),
      .dma_axi_awid(dma_axi_awid),
      .dma_axi_awaddr(dma_axi_awaddr),
      .dma_axi_awsize(dma_axi_awsize),
      .dma_axi_awprot(dma_axi_awprot),
      .dma_axi_awlen(dma_axi_awlen),
      .dma_axi_awburst(dma_axi_awburst),

      .dma_axi_wvalid(dma_axi_wvalid),
      .dma_axi_wready(dma_axi_wready),
      .dma_axi_wdata(dma_axi_wdata),
      .dma_axi_wstrb(dma_axi_wstrb),
      .dma_axi_wlast(dma_axi_wlast),

      .dma_axi_bvalid(dma_axi_bvalid),
      .dma_axi_bready(dma_axi_bready),
      .dma_axi_bresp(dma_axi_bresp),
      .dma_axi_bid(dma_axi_bid),

      .dma_axi_arvalid(dma_axi_arvalid),
      .dma_axi_arready(dma_axi_arready),
      .dma_axi_arid(dma_axi_arid),
      .dma_axi_araddr(dma_axi_araddr),
      .dma_axi_arsize(dma_axi_arsize),
      .dma_axi_arprot(dma_axi_arprot),
      .dma_axi_arlen(dma_axi_arlen),
      .dma_axi_arburst(dma_axi_arburst),

      .dma_axi_rvalid(dma_axi_rvalid),
      .dma_axi_rready(dma_axi_rready),
      .dma_axi_rid(dma_axi_rid),
      .dma_axi_rdata(dma_axi_rdata),
      .dma_axi_rresp(dma_axi_rresp),
      .dma_axi_rlast(dma_axi_rlast),

      //-------------------------- Clock signals-----------------------------
      .lsu_bus_clk_en(lsu_bus_clk_en),
      .ifu_bus_clk_en(ifu_bus_clk_en),
      .dbg_bus_clk_en(dbg_bus_clk_en),
      .dma_bus_clk_en(dma_bus_clk_en),

      //-------------------------- Interrupt signals-------------------------
      .timer_int(timer_int),
      .extintsrc_req(extintsrc_req),

      //-------------------------- Performance counter-----------------------
      .dec_tlu_perfcnt0(dec_tlu_perfcnt0),
      .dec_tlu_perfcnt1(dec_tlu_perfcnt1),
      .dec_tlu_perfcnt2(dec_tlu_perfcnt2),
      .dec_tlu_perfcnt3(dec_tlu_perfcnt3),

      //-------------------------- Debug module------------------------------
      .dmi_reg_en(dmi_reg_en),
      .dmi_reg_addr(dmi_reg_addr),
      .dmi_reg_wr_en(dmi_reg_wr_en),
      .dmi_reg_wdata(dmi_reg_wdata),
      .dmi_reg_rdata(dmi_reg_rdata),
      .dmi_hard_reset(dmi_hard_reset),

      //-------------------------- External MPC signals----------------------
      .mpc_debug_halt_req(mpc_debug_halt_req),
      .mpc_debug_run_req(mpc_debug_run_req),
      .mpc_reset_run_req(mpc_reset_run_req),
      .mpc_debug_halt_ack(mpc_debug_halt_ack),
      .mpc_debug_run_ack(mpc_debug_run_ack),
      .debug_brkpt_status(debug_brkpt_status),

      //-------------------------- CPU Halt signals--------------------------
      .i_cpu_halt_req(i_cpu_halt_req),
      .o_cpu_halt_ack(o_cpu_halt_ack),
      .o_cpu_halt_status(o_cpu_halt_status),
      .o_debug_mode_status(o_debug_mode_status),
      .i_cpu_run_req(i_cpu_run_req),
      .o_cpu_run_ack(o_cpu_run_ack),

      //-------------------------- Miscellaneous-----------------------------
      .scan_mode(scan_mode),
      .mbist_mode(mbist_mode)
   );

endmodule
