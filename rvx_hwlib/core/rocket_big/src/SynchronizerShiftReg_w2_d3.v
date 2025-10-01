`default_nettype wire
module SynchronizerShiftReg_w2_d3(
  input        clock,
  input  [1:0] io_d,
  output [1:0] io_q
);
  wire  output_chain_clock;
  wire  output_chain_io_d;
  wire  output_chain_io_q;
  wire  output_chain_1_clock;
  wire  output_chain_1_io_d;
  wire  output_chain_1_io_q;
  wire  output_1 = output_chain_1_io_q;
  wire  output_0 = output_chain_io_q;
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain (
    .clock(output_chain_clock),
    .io_d(output_chain_io_d),
    .io_q(output_chain_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_1 (
    .clock(output_chain_1_clock),
    .io_d(output_chain_1_io_d),
    .io_q(output_chain_1_io_q)
  );
  assign io_q = {output_1,output_0};
  assign output_chain_clock = clock;
  assign output_chain_io_d = io_d[0];
  assign output_chain_1_clock = clock;
  assign output_chain_1_io_d = io_d[1];
endmodule