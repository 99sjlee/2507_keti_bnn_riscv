`default_nettype wire
module IntSyncAsyncCrossingSink(
  input   clock,
  input   auto_in_sync_0,
  input   auto_in_sync_1,
  output  auto_out_0,
  output  auto_out_1
);
  wire  chain_clock;
  wire [1:0] chain_io_d;
  wire [1:0] chain_io_q;
  wire [1:0] _WIRE_1 = chain_io_q;
  SynchronizerShiftReg_w2_d3 chain (
    .clock(chain_clock),
    .io_d(chain_io_d),
    .io_q(chain_io_q)
  );
  assign auto_out_0 = _WIRE_1[0];
  assign auto_out_1 = _WIRE_1[1];
  assign chain_clock = clock;
  assign chain_io_d = {auto_in_sync_1,auto_in_sync_0};
endmodule