`default_nettype wire
module SimpleClockGroupSource(
  input   clock,
  input   reset,
  output  auto_out_member_subsystem_sbus_3_clock,
  output  auto_out_member_subsystem_sbus_3_reset,
  output  auto_out_member_subsystem_sbus_2_clock,
  output  auto_out_member_subsystem_sbus_2_reset,
  output  auto_out_member_subsystem_sbus_1_clock,
  output  auto_out_member_subsystem_sbus_1_reset,
  output  auto_out_member_subsystem_sbus_0_clock,
  output  auto_out_member_subsystem_sbus_0_reset
);
  assign auto_out_member_subsystem_sbus_3_clock = clock;
  assign auto_out_member_subsystem_sbus_3_reset = reset;
  assign auto_out_member_subsystem_sbus_2_clock = clock;
  assign auto_out_member_subsystem_sbus_2_reset = reset;
  assign auto_out_member_subsystem_sbus_1_clock = clock;
  assign auto_out_member_subsystem_sbus_1_reset = reset;
  assign auto_out_member_subsystem_sbus_0_clock = clock;
  assign auto_out_member_subsystem_sbus_0_reset = reset;
endmodule