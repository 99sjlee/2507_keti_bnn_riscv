`default_nettype wire
module ClockSinkDomain(
  input         auto_plic_int_in_0,
  input         auto_plic_int_in_1,
  output        auto_plic_int_out_1_0,
  output        auto_plic_int_out_0_0,
  output        auto_plic_in_a_ready,
  input         auto_plic_in_a_valid,
  input  [2:0]  auto_plic_in_a_bits_opcode,
  input  [2:0]  auto_plic_in_a_bits_param,
  input  [1:0]  auto_plic_in_a_bits_size,
  input  [9:0]  auto_plic_in_a_bits_source,
  input  [27:0] auto_plic_in_a_bits_address,
  input  [3:0]  auto_plic_in_a_bits_mask,
  input  [31:0] auto_plic_in_a_bits_data,
  input         auto_plic_in_a_bits_corrupt,
  input         auto_plic_in_d_ready,
  output        auto_plic_in_d_valid,
  output [2:0]  auto_plic_in_d_bits_opcode,
  output [1:0]  auto_plic_in_d_bits_size,
  output [9:0]  auto_plic_in_d_bits_source,
  output [31:0] auto_plic_in_d_bits_data,
  input         auto_clock_in_clock,
  input         auto_clock_in_reset
);
  wire  plic_clock;
  wire  plic_reset;
  wire  plic_auto_int_in_0;
  wire  plic_auto_int_in_1;
  wire  plic_auto_int_out_1_0;
  wire  plic_auto_int_out_0_0;
  wire  plic_auto_in_a_ready;
  wire  plic_auto_in_a_valid;
  wire [2:0] plic_auto_in_a_bits_opcode;
  wire [2:0] plic_auto_in_a_bits_param;
  wire [1:0] plic_auto_in_a_bits_size;
  wire [9:0] plic_auto_in_a_bits_source;
  wire [27:0] plic_auto_in_a_bits_address;
  wire [3:0] plic_auto_in_a_bits_mask;
  wire [31:0] plic_auto_in_a_bits_data;
  wire  plic_auto_in_a_bits_corrupt;
  wire  plic_auto_in_d_ready;
  wire  plic_auto_in_d_valid;
  wire [2:0] plic_auto_in_d_bits_opcode;
  wire [1:0] plic_auto_in_d_bits_size;
  wire [9:0] plic_auto_in_d_bits_source;
  wire [31:0] plic_auto_in_d_bits_data;
  TLPLIC plic (
    .clock(plic_clock),
    .reset(plic_reset),
    .auto_int_in_0(plic_auto_int_in_0),
    .auto_int_in_1(plic_auto_int_in_1),
    .auto_int_out_1_0(plic_auto_int_out_1_0),
    .auto_int_out_0_0(plic_auto_int_out_0_0),
    .auto_in_a_ready(plic_auto_in_a_ready),
    .auto_in_a_valid(plic_auto_in_a_valid),
    .auto_in_a_bits_opcode(plic_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(plic_auto_in_a_bits_param),
    .auto_in_a_bits_size(plic_auto_in_a_bits_size),
    .auto_in_a_bits_source(plic_auto_in_a_bits_source),
    .auto_in_a_bits_address(plic_auto_in_a_bits_address),
    .auto_in_a_bits_mask(plic_auto_in_a_bits_mask),
    .auto_in_a_bits_data(plic_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(plic_auto_in_a_bits_corrupt),
    .auto_in_d_ready(plic_auto_in_d_ready),
    .auto_in_d_valid(plic_auto_in_d_valid),
    .auto_in_d_bits_opcode(plic_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(plic_auto_in_d_bits_size),
    .auto_in_d_bits_source(plic_auto_in_d_bits_source),
    .auto_in_d_bits_data(plic_auto_in_d_bits_data)
  );
  assign auto_plic_int_out_1_0 = plic_auto_int_out_1_0;
  assign auto_plic_int_out_0_0 = plic_auto_int_out_0_0;
  assign auto_plic_in_a_ready = plic_auto_in_a_ready;
  assign auto_plic_in_d_valid = plic_auto_in_d_valid;
  assign auto_plic_in_d_bits_opcode = plic_auto_in_d_bits_opcode;
  assign auto_plic_in_d_bits_size = plic_auto_in_d_bits_size;
  assign auto_plic_in_d_bits_source = plic_auto_in_d_bits_source;
  assign auto_plic_in_d_bits_data = plic_auto_in_d_bits_data;
  assign plic_clock = auto_clock_in_clock;
  assign plic_reset = auto_clock_in_reset;
  assign plic_auto_int_in_0 = auto_plic_int_in_0;
  assign plic_auto_int_in_1 = auto_plic_int_in_1;
  assign plic_auto_in_a_valid = auto_plic_in_a_valid;
  assign plic_auto_in_a_bits_opcode = auto_plic_in_a_bits_opcode;
  assign plic_auto_in_a_bits_param = auto_plic_in_a_bits_param;
  assign plic_auto_in_a_bits_size = auto_plic_in_a_bits_size;
  assign plic_auto_in_a_bits_source = auto_plic_in_a_bits_source;
  assign plic_auto_in_a_bits_address = auto_plic_in_a_bits_address;
  assign plic_auto_in_a_bits_mask = auto_plic_in_a_bits_mask;
  assign plic_auto_in_a_bits_data = auto_plic_in_a_bits_data;
  assign plic_auto_in_a_bits_corrupt = auto_plic_in_a_bits_corrupt;
  assign plic_auto_in_d_ready = auto_plic_in_d_ready;
endmodule