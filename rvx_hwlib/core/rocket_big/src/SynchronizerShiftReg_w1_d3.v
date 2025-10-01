`default_nettype wire
module SynchronizerShiftReg_w1_d3(
  input   clock,
  input   io_d,
  output  io_q
);
  wire  output_chain_clock;
  wire  output_chain_io_d;
  wire  output_chain_io_q;
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain (
    .clock(output_chain_clock),
    .io_d(output_chain_io_d),
    .io_q(output_chain_io_q)
  );
  assign io_q = output_chain_io_q;
  assign output_chain_clock = clock;
  assign output_chain_io_d = io_d;
endmodule