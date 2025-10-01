assign global_rstnn = fpga_rstnn & rstnn_from_core_jtag;
`ifdef INCLUDE_CORE_JTAG
assign noc_jtag_trstnn = fpga_rstnn & ((jtag_select==`JTAG_SELECT_NOC)? 1'b 1 : rstnn_from_core_jtag);
`else
assign noc_jtag_trstnn = fpga_rstnn;
`endif
assign core_jtag_trstnn = fpga_rstnn & jtag_trstnn;
