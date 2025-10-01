`default_nettype wire
module IntSyncCrossingSource_5(
  input   clock,
  input   reset,
  input   auto_in_0,
  input   auto_in_1,
  output  auto_out_sync_0,
  output  auto_out_sync_1
);
  wire  reg__clock;
  wire  reg__reset;
  wire [1:0] reg__io_d;
  wire [1:0] reg__io_q;
  AsyncResetRegVec_w2_i0 reg_ (
    .clock(reg__clock),
    .reset(reg__reset),
    .io_d(reg__io_d),
    .io_q(reg__io_q)
  );
  assign auto_out_sync_0 = reg__io_q[0];
  assign auto_out_sync_1 = reg__io_q[1];
  assign reg__clock = clock;
  assign reg__reset = reset;
  assign reg__io_d = {auto_in_1,auto_in_0};
endmodule