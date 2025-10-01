`default_nettype wire
module ClockSinkDomain_1(
  output        auto_bootrom_in_a_ready,
  input         auto_bootrom_in_a_valid,
  input  [2:0]  auto_bootrom_in_a_bits_opcode,
  input  [2:0]  auto_bootrom_in_a_bits_param,
  input  [1:0]  auto_bootrom_in_a_bits_size,
  input  [9:0]  auto_bootrom_in_a_bits_source,
  input  [16:0] auto_bootrom_in_a_bits_address,
  input  [3:0]  auto_bootrom_in_a_bits_mask,
  input         auto_bootrom_in_a_bits_corrupt,
  input         auto_bootrom_in_d_ready,
  output        auto_bootrom_in_d_valid,
  output [1:0]  auto_bootrom_in_d_bits_size,
  output [9:0]  auto_bootrom_in_d_bits_source,
  output [31:0] auto_bootrom_in_d_bits_data,
  input         auto_clock_in_clock,
  input         auto_clock_in_reset
);
  wire  bootrom_clock;
  wire  bootrom_reset;
  wire  bootrom_auto_in_a_ready;
  wire  bootrom_auto_in_a_valid;
  wire [2:0] bootrom_auto_in_a_bits_opcode;
  wire [2:0] bootrom_auto_in_a_bits_param;
  wire [1:0] bootrom_auto_in_a_bits_size;
  wire [9:0] bootrom_auto_in_a_bits_source;
  wire [16:0] bootrom_auto_in_a_bits_address;
  wire [3:0] bootrom_auto_in_a_bits_mask;
  wire  bootrom_auto_in_a_bits_corrupt;
  wire  bootrom_auto_in_d_ready;
  wire  bootrom_auto_in_d_valid;
  wire [1:0] bootrom_auto_in_d_bits_size;
  wire [9:0] bootrom_auto_in_d_bits_source;
  wire [31:0] bootrom_auto_in_d_bits_data;
  TLROM bootrom (
    .clock(bootrom_clock),
    .reset(bootrom_reset),
    .auto_in_a_ready(bootrom_auto_in_a_ready),
    .auto_in_a_valid(bootrom_auto_in_a_valid),
    .auto_in_a_bits_opcode(bootrom_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(bootrom_auto_in_a_bits_param),
    .auto_in_a_bits_size(bootrom_auto_in_a_bits_size),
    .auto_in_a_bits_source(bootrom_auto_in_a_bits_source),
    .auto_in_a_bits_address(bootrom_auto_in_a_bits_address),
    .auto_in_a_bits_mask(bootrom_auto_in_a_bits_mask),
    .auto_in_a_bits_corrupt(bootrom_auto_in_a_bits_corrupt),
    .auto_in_d_ready(bootrom_auto_in_d_ready),
    .auto_in_d_valid(bootrom_auto_in_d_valid),
    .auto_in_d_bits_size(bootrom_auto_in_d_bits_size),
    .auto_in_d_bits_source(bootrom_auto_in_d_bits_source),
    .auto_in_d_bits_data(bootrom_auto_in_d_bits_data)
  );
  assign auto_bootrom_in_a_ready = bootrom_auto_in_a_ready;
  assign auto_bootrom_in_d_valid = bootrom_auto_in_d_valid;
  assign auto_bootrom_in_d_bits_size = bootrom_auto_in_d_bits_size;
  assign auto_bootrom_in_d_bits_source = bootrom_auto_in_d_bits_source;
  assign auto_bootrom_in_d_bits_data = bootrom_auto_in_d_bits_data;
  assign bootrom_clock = auto_clock_in_clock;
  assign bootrom_reset = auto_clock_in_reset;
  assign bootrom_auto_in_a_valid = auto_bootrom_in_a_valid;
  assign bootrom_auto_in_a_bits_opcode = auto_bootrom_in_a_bits_opcode;
  assign bootrom_auto_in_a_bits_param = auto_bootrom_in_a_bits_param;
  assign bootrom_auto_in_a_bits_size = auto_bootrom_in_a_bits_size;
  assign bootrom_auto_in_a_bits_source = auto_bootrom_in_a_bits_source;
  assign bootrom_auto_in_a_bits_address = auto_bootrom_in_a_bits_address;
  assign bootrom_auto_in_a_bits_mask = auto_bootrom_in_a_bits_mask;
  assign bootrom_auto_in_a_bits_corrupt = auto_bootrom_in_a_bits_corrupt;
  assign bootrom_auto_in_d_ready = auto_bootrom_in_d_ready;
endmodule