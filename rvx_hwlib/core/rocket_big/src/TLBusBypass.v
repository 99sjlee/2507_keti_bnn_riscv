`default_nettype wire
module TLBusBypass(
  input         clock,
  input         reset,
  input         auto_node_out_out_a_ready,
  output        auto_node_out_out_a_valid,
  output [2:0]  auto_node_out_out_a_bits_opcode,
  output [8:0]  auto_node_out_out_a_bits_address,
  output [31:0] auto_node_out_out_a_bits_data,
  output        auto_node_out_out_d_ready,
  input         auto_node_out_out_d_valid,
  input  [2:0]  auto_node_out_out_d_bits_opcode,
  input  [1:0]  auto_node_out_out_d_bits_param,
  input  [1:0]  auto_node_out_out_d_bits_size,
  input         auto_node_out_out_d_bits_source,
  input         auto_node_out_out_d_bits_sink,
  input         auto_node_out_out_d_bits_denied,
  input  [31:0] auto_node_out_out_d_bits_data,
  input         auto_node_out_out_d_bits_corrupt,
  output        auto_node_in_in_a_ready,
  input         auto_node_in_in_a_valid,
  input  [2:0]  auto_node_in_in_a_bits_opcode,
  input  [8:0]  auto_node_in_in_a_bits_address,
  input  [31:0] auto_node_in_in_a_bits_data,
  input         auto_node_in_in_d_ready,
  output        auto_node_in_in_d_valid,
  output [2:0]  auto_node_in_in_d_bits_opcode,
  output [1:0]  auto_node_in_in_d_bits_param,
  output [1:0]  auto_node_in_in_d_bits_size,
  output        auto_node_in_in_d_bits_sink,
  output        auto_node_in_in_d_bits_denied,
  output [31:0] auto_node_in_in_d_bits_data,
  output        auto_node_in_in_d_bits_corrupt,
  input         io_bypass
);
  wire  bar_clock;
  wire  bar_reset;
  wire  bar_auto_in_a_ready;
  wire  bar_auto_in_a_valid;
  wire [2:0] bar_auto_in_a_bits_opcode;
  wire [8:0] bar_auto_in_a_bits_address;
  wire [31:0] bar_auto_in_a_bits_data;
  wire  bar_auto_in_d_ready;
  wire  bar_auto_in_d_valid;
  wire [2:0] bar_auto_in_d_bits_opcode;
  wire [1:0] bar_auto_in_d_bits_param;
  wire [1:0] bar_auto_in_d_bits_size;
  wire  bar_auto_in_d_bits_sink;
  wire  bar_auto_in_d_bits_denied;
  wire [31:0] bar_auto_in_d_bits_data;
  wire  bar_auto_in_d_bits_corrupt;
  wire  bar_auto_out_1_a_ready;
  wire  bar_auto_out_1_a_valid;
  wire [2:0] bar_auto_out_1_a_bits_opcode;
  wire [8:0] bar_auto_out_1_a_bits_address;
  wire [31:0] bar_auto_out_1_a_bits_data;
  wire  bar_auto_out_1_d_ready;
  wire  bar_auto_out_1_d_valid;
  wire [2:0] bar_auto_out_1_d_bits_opcode;
  wire [1:0] bar_auto_out_1_d_bits_param;
  wire [1:0] bar_auto_out_1_d_bits_size;
  wire  bar_auto_out_1_d_bits_source;
  wire  bar_auto_out_1_d_bits_sink;
  wire  bar_auto_out_1_d_bits_denied;
  wire [31:0] bar_auto_out_1_d_bits_data;
  wire  bar_auto_out_1_d_bits_corrupt;
  wire  bar_auto_out_0_a_ready;
  wire  bar_auto_out_0_a_valid;
  wire [2:0] bar_auto_out_0_a_bits_opcode;
  wire [127:0] bar_auto_out_0_a_bits_address;
  wire  bar_auto_out_0_d_ready;
  wire  bar_auto_out_0_d_valid;
  wire [2:0] bar_auto_out_0_d_bits_opcode;
  wire [1:0] bar_auto_out_0_d_bits_size;
  wire  bar_auto_out_0_d_bits_denied;
  wire  bar_auto_out_0_d_bits_corrupt;
  wire  bar_io_bypass;
  wire  error_clock;
  wire  error_reset;
  wire  error_auto_in_a_ready;
  wire  error_auto_in_a_valid;
  wire [2:0] error_auto_in_a_bits_opcode;
  wire [127:0] error_auto_in_a_bits_address;
  wire  error_auto_in_d_ready;
  wire  error_auto_in_d_valid;
  wire [2:0] error_auto_in_d_bits_opcode;
  wire [1:0] error_auto_in_d_bits_size;
  wire  error_auto_in_d_bits_denied;
  wire  error_auto_in_d_bits_corrupt;
  TLBusBypassBar bar (
    .clock(bar_clock),
    .reset(bar_reset),
    .auto_in_a_ready(bar_auto_in_a_ready),
    .auto_in_a_valid(bar_auto_in_a_valid),
    .auto_in_a_bits_opcode(bar_auto_in_a_bits_opcode),
    .auto_in_a_bits_address(bar_auto_in_a_bits_address),
    .auto_in_a_bits_data(bar_auto_in_a_bits_data),
    .auto_in_d_ready(bar_auto_in_d_ready),
    .auto_in_d_valid(bar_auto_in_d_valid),
    .auto_in_d_bits_opcode(bar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(bar_auto_in_d_bits_param),
    .auto_in_d_bits_size(bar_auto_in_d_bits_size),
    .auto_in_d_bits_sink(bar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(bar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(bar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(bar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready(bar_auto_out_1_a_ready),
    .auto_out_1_a_valid(bar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(bar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_address(bar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_data(bar_auto_out_1_a_bits_data),
    .auto_out_1_d_ready(bar_auto_out_1_d_ready),
    .auto_out_1_d_valid(bar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(bar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(bar_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(bar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(bar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(bar_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(bar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(bar_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(bar_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(bar_auto_out_0_a_ready),
    .auto_out_0_a_valid(bar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(bar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_address(bar_auto_out_0_a_bits_address),
    .auto_out_0_d_ready(bar_auto_out_0_d_ready),
    .auto_out_0_d_valid(bar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(bar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_size(bar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_denied(bar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_corrupt(bar_auto_out_0_d_bits_corrupt),
    .io_bypass(bar_io_bypass)
  );
  TLError_1 error (
    .clock(error_clock),
    .reset(error_reset),
    .auto_in_a_ready(error_auto_in_a_ready),
    .auto_in_a_valid(error_auto_in_a_valid),
    .auto_in_a_bits_opcode(error_auto_in_a_bits_opcode),
    .auto_in_a_bits_address(error_auto_in_a_bits_address),
    .auto_in_d_ready(error_auto_in_d_ready),
    .auto_in_d_valid(error_auto_in_d_valid),
    .auto_in_d_bits_opcode(error_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(error_auto_in_d_bits_size),
    .auto_in_d_bits_denied(error_auto_in_d_bits_denied),
    .auto_in_d_bits_corrupt(error_auto_in_d_bits_corrupt)
  );
  assign auto_node_out_out_a_valid = bar_auto_out_1_a_valid;
  assign auto_node_out_out_a_bits_opcode = bar_auto_out_1_a_bits_opcode;
  assign auto_node_out_out_a_bits_address = bar_auto_out_1_a_bits_address;
  assign auto_node_out_out_a_bits_data = bar_auto_out_1_a_bits_data;
  assign auto_node_out_out_d_ready = bar_auto_out_1_d_ready;
  assign auto_node_in_in_a_ready = bar_auto_in_a_ready;
  assign auto_node_in_in_d_valid = bar_auto_in_d_valid;
  assign auto_node_in_in_d_bits_opcode = bar_auto_in_d_bits_opcode;
  assign auto_node_in_in_d_bits_param = bar_auto_in_d_bits_param;
  assign auto_node_in_in_d_bits_size = bar_auto_in_d_bits_size;
  assign auto_node_in_in_d_bits_sink = bar_auto_in_d_bits_sink;
  assign auto_node_in_in_d_bits_denied = bar_auto_in_d_bits_denied;
  assign auto_node_in_in_d_bits_data = bar_auto_in_d_bits_data;
  assign auto_node_in_in_d_bits_corrupt = bar_auto_in_d_bits_corrupt;
  assign bar_clock = clock;
  assign bar_reset = reset;
  assign bar_auto_in_a_valid = auto_node_in_in_a_valid;
  assign bar_auto_in_a_bits_opcode = auto_node_in_in_a_bits_opcode;
  assign bar_auto_in_a_bits_address = auto_node_in_in_a_bits_address;
  assign bar_auto_in_a_bits_data = auto_node_in_in_a_bits_data;
  assign bar_auto_in_d_ready = auto_node_in_in_d_ready;
  assign bar_auto_out_1_a_ready = auto_node_out_out_a_ready;
  assign bar_auto_out_1_d_valid = auto_node_out_out_d_valid;
  assign bar_auto_out_1_d_bits_opcode = auto_node_out_out_d_bits_opcode;
  assign bar_auto_out_1_d_bits_param = auto_node_out_out_d_bits_param;
  assign bar_auto_out_1_d_bits_size = auto_node_out_out_d_bits_size;
  assign bar_auto_out_1_d_bits_source = auto_node_out_out_d_bits_source;
  assign bar_auto_out_1_d_bits_sink = auto_node_out_out_d_bits_sink;
  assign bar_auto_out_1_d_bits_denied = auto_node_out_out_d_bits_denied;
  assign bar_auto_out_1_d_bits_data = auto_node_out_out_d_bits_data;
  assign bar_auto_out_1_d_bits_corrupt = auto_node_out_out_d_bits_corrupt;
  assign bar_auto_out_0_a_ready = error_auto_in_a_ready;
  assign bar_auto_out_0_d_valid = error_auto_in_d_valid;
  assign bar_auto_out_0_d_bits_opcode = error_auto_in_d_bits_opcode;
  assign bar_auto_out_0_d_bits_size = error_auto_in_d_bits_size;
  assign bar_auto_out_0_d_bits_denied = error_auto_in_d_bits_denied;
  assign bar_auto_out_0_d_bits_corrupt = error_auto_in_d_bits_corrupt;
  assign bar_io_bypass = io_bypass;
  assign error_clock = clock;
  assign error_reset = reset;
  assign error_auto_in_a_valid = bar_auto_out_0_a_valid;
  assign error_auto_in_a_bits_opcode = bar_auto_out_0_a_bits_opcode;
  assign error_auto_in_a_bits_address = bar_auto_out_0_a_bits_address;
  assign error_auto_in_d_ready = bar_auto_out_0_d_ready;
endmodule