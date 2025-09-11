/*****************/
/* Custom Region */
/*****************/

// wire clk_system;
// wire clk_core;
// wire clk_system_external;
// wire clk_system_debug;
// wire clk_local_access;
// wire clk_process_000;
// wire clk_dram_if;
// wire clk_dram_sys;
// wire clk_dram_ref;
// wire clk_noc;
// wire gclk_system;
// wire gclk_core;
// wire gclk_system_external;
// wire gclk_system_debug;
// wire gclk_local_access;
// wire gclk_process_000;
// wire gclk_noc;
// wire tick_1us;
// wire tick_62d5ms;
// wire tick_gpio;
// wire spi_common_sclk;
// wire spi_common_sdq0;
// wire global_rstnn;
// wire global_rstpp;
// wire [(6)-1:0] rstnn_seqeunce;
// wire [(6)-1:0] rstpp_seqeunce;
// wire rstnn_user;
// wire rstpp_user;
// wire U_BNN_TOP_slave_clk;
// wire U_BNN_TOP_slave_rstnn;
// wire U_BNN_TOP_slave_rpsel;
// wire U_BNN_TOP_slave_rpenable;
// wire U_BNN_TOP_slave_rpwrite;
// wire [(32)-1:0] U_BNN_TOP_slave_rpaddr;
// wire [(32)-1:0] U_BNN_TOP_slave_rpwdata;
// wire U_BNN_TOP_slave_rpready;
// wire [(32)-1:0] U_BNN_TOP_slave_rprdata;
// wire U_BNN_TOP_slave_rpslverr;
// wire U_BNN_TOP_master_clk;
// wire U_BNN_TOP_master_rstnn;
// wire U_BNN_TOP_master_sxawready;
// wire U_BNN_TOP_master_sxawvalid;
// wire [(32)-1:0] U_BNN_TOP_master_sxawaddr;
// wire [(2)-1:0] U_BNN_TOP_master_sxawid;
// wire [(8)-1:0] U_BNN_TOP_master_sxawlen;
// wire [(3)-1:0] U_BNN_TOP_master_sxawsize;
// wire [(2)-1:0] U_BNN_TOP_master_sxawburst;
// wire U_BNN_TOP_master_sxwready;
// wire U_BNN_TOP_master_sxwvalid;
// wire [(2)-1:0] U_BNN_TOP_master_sxwid;
// wire [(64)-1:0] U_BNN_TOP_master_sxwdata;
// wire [(64/8)-1:0] U_BNN_TOP_master_sxwstrb;
// wire U_BNN_TOP_master_sxwlast;
// wire U_BNN_TOP_master_sxbready;
// wire U_BNN_TOP_master_sxbvalid;
// wire [(2)-1:0] U_BNN_TOP_master_sxbid;
// wire [(2)-1:0] U_BNN_TOP_master_sxbresp;
// wire U_BNN_TOP_master_sxarready;
// wire U_BNN_TOP_master_sxarvalid;
// wire [(32)-1:0] U_BNN_TOP_master_sxaraddr;
// wire [(2)-1:0] U_BNN_TOP_master_sxarid;
// wire [(8)-1:0] U_BNN_TOP_master_sxarlen;
// wire [(3)-1:0] U_BNN_TOP_master_sxarsize;
// wire [(2)-1:0] U_BNN_TOP_master_sxarburst;
// wire U_BNN_TOP_master_sxrready;
// wire U_BNN_TOP_master_sxrvalid;
// wire [(2)-1:0] U_BNN_TOP_master_sxrid;
// wire [(64)-1:0] U_BNN_TOP_master_sxrdata;
// wire U_BNN_TOP_master_sxrlast;
// wire [(2)-1:0] U_BNN_TOP_master_sxrresp;

/* DO NOT MODIFY THE ABOVE */
/* MUST MODIFY THE BELOW   */

bnn_top U_BNN_TOP(
           .clk                    ( U_BNN_TOP_master_clk     )
          ,.rst_n                  ( U_BNN_TOP_master_rstnn      )
          ,.i_en                   ( 1'b1              )
          ,.i_IntClr               ( 1'b0              )
          ,.o_interrupt            ( 1'b0              )

          ,.ACLK                   ( U_BNN_TOP_master_clk        )
          ,.ARESETN                ( U_BNN_TOP_master_rstnn     )
          // Master Interface Write Address
          ,.M_AXI_AWID             ( U_BNN_TOP_master_sxawid        )
          ,.M_AXI_AWADDR           ( U_BNN_TOP_master_sxawaddr      )
          ,.M_AXI_AWLEN            ( U_BNN_TOP_master_sxawlen       )
          ,.M_AXI_AWSIZE           ( U_BNN_TOP_master_sxawsize      )
          ,.M_AXI_AWBURST          ( U_BNN_TOP_master_sxawburst     )
          ,.M_AXI_AWLOCK           ( U_BNN_TOP_master_sxawlock      )
          ,.M_AXI_AWCACHE          ( U_BNN_TOP_master_sxawcache     )
          ,.M_AXI_AWPROT           ( U_BNN_TOP_master_sxawprot      )
          ,.M_AXI_AWQOS            ( U_BNN_TOP_master_sxawqos       )
          ,.M_AXI_AWUSER           ( U_BNN_TOP_master_sxawuser      )
          ,.M_AXI_AWVALID          ( U_BNN_TOP_master_sxawvalid     )
          ,.M_AXI_AWREADY          ( U_BNN_TOP_master_sxawready     )
                                                       
          // Master Interface Write Data               
          ,.M_AXI_WDATA            ( U_BNN_TOP_master_sxwdata       )
          ,.M_AXI_WSTRB            ( U_BNN_TOP_master_sxwstrb       )
          ,.M_AXI_WLAST            ( U_BNN_TOP_master_sxwlast       )
          ,.M_AXI_WUSER            ( U_BNN_TOP_master_sxwuser       )
          ,.M_AXI_WVALID           ( U_BNN_TOP_master_sxwvalid      )
          ,.M_AXI_WREADY           ( U_BNN_TOP_master_sxwready      )
                                                       
          // Master Interface Write Response           
          ,.M_AXI_BID              ( U_BNN_TOP_master_sxbid         )
          ,.M_AXI_BRESP            ( U_BNN_TOP_master_sxbresp       )
          ,.M_AXI_BUSER            ( U_BNN_TOP_master_sxbuser       )
          ,.M_AXI_BVALID           ( U_BNN_TOP_master_sxbvalid      )
          ,.M_AXI_BREADY           ( U_BNN_TOP_master_sxbready      )
                                                       
          // Master Interface Read Address             
          ,.M_AXI_ARID             ( U_BNN_TOP_master_sxarid        )
          ,.M_AXI_ARADDR           ( U_BNN_TOP_master_sxaraddr      )
          ,.M_AXI_ARLEN            ( U_BNN_TOP_master_sxarlen       )
          ,.M_AXI_ARSIZE           ( U_BNN_TOP_master_sxarsize      )
          ,.M_AXI_ARBURST          ( U_BNN_TOP_master_sxarburst     )
          ,.M_AXI_ARLOCK           ( U_BNN_TOP_master_sxarlock      )
          ,.M_AXI_ARCACHE          ( U_BNN_TOP_master_sxarcache     )
          ,.M_AXI_ARPROT           ( U_BNN_TOP_master_sxarprot      )
          ,.M_AXI_ARQOS            ( U_BNN_TOP_master_sxarqos       )
          ,.M_AXI_ARUSER           ( U_BNN_TOP_master_sxaruser      )
          ,.M_AXI_ARVALID          ( U_BNN_TOP_master_sxarvalid     )
          ,.M_AXI_ARREADY          ( U_BNN_TOP_master_sxarready     )
                                                        
          // Master Interface Read Data                 
          ,.M_AXI_RID              ( U_BNN_TOP_master_sxrid         )
          ,.M_AXI_RDATA            ( U_BNN_TOP_master_sxrdata       )
          ,.M_AXI_RRESP            ( U_BNN_TOP_master_sxrresp       )
          ,.M_AXI_RLAST            ( U_BNN_TOP_master_sxrlast       )
          ,.M_AXI_RUSER            ( U_BNN_TOP_master_sxruser       )
          ,.M_AXI_RVALID           ( U_BNN_TOP_master_sxrvalid      )
          ,.M_AXI_RREADY           ( U_BNN_TOP_master_sxrready      )

          ,.PCLK                   ( U_BNN_TOP_slave_clk		)
          ,.PRESETn                ( U_BNN_TOP_slave_rstnn		)
          ,.PSEL                   ( U_BNN_TOP_slave_rpsel		)
          ,.PENABLE                ( U_BNN_TOP_slave_rpenable	)
          ,.PWRITE                 ( U_BNN_TOP_slave_rpwrite	)
          ,.PADDR                  ( U_BNN_TOP_slave_rpaddr		)
          ,.PRDATA                 ( U_BNN_TOP_slave_rprdata	)
          ,.PWDATA                 ( U_BNN_TOP_slave_rpwdata	)
          ,.PREADY				( U_BNN_TOP_slave_rpready	)
          ,.PSLVERR				( U_BNN_TOP_slave_rpslverr	)

     );

assign U_BNN_TOP_master_sxawqos = 0;
assign U_BNN_TOP_master_sxawuser = 0;
assign U_BNN_TOP_master_sxwuser = 0;
assign U_BNN_TOP_master_sxbuser = 0;
assign U_BNN_TOP_master_sxarqos = 0;
assign U_BNN_TOP_master_sxaruser = 0;
assign U_BNN_TOP_master_sxruser = 0;

/*
ila_0 u_ila0 (
      .clk (U_BNN_TOP_master_clk)
     ,.probe0 (U_BNN_TOP_master_sxawaddr)
     ,.probe1 (U_BNN_TOP_master_sxwdata)
     ,.probe2 (U_BNN_TOP_master_sxaraddr)
     ,.probe3 (U_BNN_TOP_master_sxrdata)
     ,.probe4 (U_BNN_TOP_slave_rprdata)
     ,.probe5 (U_BNN_TOP_master_sxarvalid)
);*/