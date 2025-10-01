`default_nettype wire
module IntSyncAsyncCrossingSink_1(
  input   clock,
  input   auto_in_sync_0,
  output  auto_out_0
);
  wire  chain_clock;
  wire  chain_io_d;
  wire  chain_io_q;
  SynchronizerShiftReg_w1_d3 chain (
    .clock(chain_clock),
    .io_d(chain_io_d),
    .io_q(chain_io_q)
  );
  assign auto_out_0 = chain_io_q;
  assign chain_clock = clock;
  assign chain_io_d = auto_in_sync_0;
endmodule