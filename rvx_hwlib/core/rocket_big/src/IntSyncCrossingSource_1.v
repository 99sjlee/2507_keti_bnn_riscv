`default_nettype wire
module IntSyncCrossingSource_1(
  input   clock,
  input   reset,
  input   auto_in_0,
  output  auto_out_sync_0
);
  wire  reg__clock;
  wire  reg__reset;
  wire  reg__io_d;
  wire  reg__io_q;
  AsyncResetRegVec_w1_i0 reg_ (
    .clock(reg__clock),
    .reset(reg__reset),
    .io_d(reg__io_d),
    .io_q(reg__io_q)
  );
  assign auto_out_sync_0 = reg__io_q;
  assign reg__clock = clock;
  assign reg__reset = reset;
  assign reg__io_d = auto_in_0;
endmodule