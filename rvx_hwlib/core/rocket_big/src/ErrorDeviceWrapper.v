`default_nettype wire
module ErrorDeviceWrapper(
  input         clock,
  input         reset,
  output        auto_buffer_in_a_ready,
  input         auto_buffer_in_a_valid,
  input  [2:0]  auto_buffer_in_a_bits_opcode,
  input  [2:0]  auto_buffer_in_a_bits_param,
  input  [3:0]  auto_buffer_in_a_bits_size,
  input  [4:0]  auto_buffer_in_a_bits_source,
  input  [13:0] auto_buffer_in_a_bits_address,
  input  [3:0]  auto_buffer_in_a_bits_mask,
  input         auto_buffer_in_a_bits_corrupt,
  input         auto_buffer_in_d_ready,
  output        auto_buffer_in_d_valid,
  output [2:0]  auto_buffer_in_d_bits_opcode,
  output [1:0]  auto_buffer_in_d_bits_param,
  output [3:0]  auto_buffer_in_d_bits_size,
  output [4:0]  auto_buffer_in_d_bits_source,
  output        auto_buffer_in_d_bits_sink,
  output        auto_buffer_in_d_bits_denied,
  output [31:0] auto_buffer_in_d_bits_data,
  output        auto_buffer_in_d_bits_corrupt
);
  wire  error_clock;
  wire  error_reset;
  wire  error_auto_in_a_ready;
  wire  error_auto_in_a_valid;
  wire [2:0] error_auto_in_a_bits_opcode;
  wire [2:0] error_auto_in_a_bits_param;
  wire [3:0] error_auto_in_a_bits_size;
  wire [4:0] error_auto_in_a_bits_source;
  wire [13:0] error_auto_in_a_bits_address;
  wire [3:0] error_auto_in_a_bits_mask;
  wire  error_auto_in_a_bits_corrupt;
  wire  error_auto_in_d_ready;
  wire  error_auto_in_d_valid;
  wire [2:0] error_auto_in_d_bits_opcode;
  wire [3:0] error_auto_in_d_bits_size;
  wire [4:0] error_auto_in_d_bits_source;
  wire  error_auto_in_d_bits_corrupt;
  wire  buffer_clock;
  wire  buffer_reset;
  wire  buffer_auto_in_a_ready;
  wire  buffer_auto_in_a_valid;
  wire [2:0] buffer_auto_in_a_bits_opcode;
  wire [2:0] buffer_auto_in_a_bits_param;
  wire [3:0] buffer_auto_in_a_bits_size;
  wire [4:0] buffer_auto_in_a_bits_source;
  wire [13:0] buffer_auto_in_a_bits_address;
  wire [3:0] buffer_auto_in_a_bits_mask;
  wire  buffer_auto_in_a_bits_corrupt;
  wire  buffer_auto_in_d_ready;
  wire  buffer_auto_in_d_valid;
  wire [2:0] buffer_auto_in_d_bits_opcode;
  wire [1:0] buffer_auto_in_d_bits_param;
  wire [3:0] buffer_auto_in_d_bits_size;
  wire [4:0] buffer_auto_in_d_bits_source;
  wire  buffer_auto_in_d_bits_sink;
  wire  buffer_auto_in_d_bits_denied;
  wire [31:0] buffer_auto_in_d_bits_data;
  wire  buffer_auto_in_d_bits_corrupt;
  wire  buffer_auto_out_a_ready;
  wire  buffer_auto_out_a_valid;
  wire [2:0] buffer_auto_out_a_bits_opcode;
  wire [2:0] buffer_auto_out_a_bits_param;
  wire [3:0] buffer_auto_out_a_bits_size;
  wire [4:0] buffer_auto_out_a_bits_source;
  wire [13:0] buffer_auto_out_a_bits_address;
  wire [3:0] buffer_auto_out_a_bits_mask;
  wire  buffer_auto_out_a_bits_corrupt;
  wire  buffer_auto_out_d_ready;
  wire  buffer_auto_out_d_valid;
  wire [2:0] buffer_auto_out_d_bits_opcode;
  wire [3:0] buffer_auto_out_d_bits_size;
  wire [4:0] buffer_auto_out_d_bits_source;
  wire  buffer_auto_out_d_bits_corrupt;
  TLError error (
    .clock(error_clock),
    .reset(error_reset),
    .auto_in_a_ready(error_auto_in_a_ready),
    .auto_in_a_valid(error_auto_in_a_valid),
    .auto_in_a_bits_opcode(error_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(error_auto_in_a_bits_param),
    .auto_in_a_bits_size(error_auto_in_a_bits_size),
    .auto_in_a_bits_source(error_auto_in_a_bits_source),
    .auto_in_a_bits_address(error_auto_in_a_bits_address),
    .auto_in_a_bits_mask(error_auto_in_a_bits_mask),
    .auto_in_a_bits_corrupt(error_auto_in_a_bits_corrupt),
    .auto_in_d_ready(error_auto_in_d_ready),
    .auto_in_d_valid(error_auto_in_d_valid),
    .auto_in_d_bits_opcode(error_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(error_auto_in_d_bits_size),
    .auto_in_d_bits_source(error_auto_in_d_bits_source),
    .auto_in_d_bits_corrupt(error_auto_in_d_bits_corrupt)
  );
  TLBuffer_5 buffer (
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  assign auto_buffer_in_a_ready = buffer_auto_in_a_ready;
  assign auto_buffer_in_d_valid = buffer_auto_in_d_valid;
  assign auto_buffer_in_d_bits_opcode = buffer_auto_in_d_bits_opcode;
  assign auto_buffer_in_d_bits_param = buffer_auto_in_d_bits_param;
  assign auto_buffer_in_d_bits_size = buffer_auto_in_d_bits_size;
  assign auto_buffer_in_d_bits_source = buffer_auto_in_d_bits_source;
  assign auto_buffer_in_d_bits_sink = buffer_auto_in_d_bits_sink;
  assign auto_buffer_in_d_bits_denied = buffer_auto_in_d_bits_denied;
  assign auto_buffer_in_d_bits_data = buffer_auto_in_d_bits_data;
  assign auto_buffer_in_d_bits_corrupt = buffer_auto_in_d_bits_corrupt;
  assign error_clock = clock;
  assign error_reset = reset;
  assign error_auto_in_a_valid = buffer_auto_out_a_valid;
  assign error_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode;
  assign error_auto_in_a_bits_param = buffer_auto_out_a_bits_param;
  assign error_auto_in_a_bits_size = buffer_auto_out_a_bits_size;
  assign error_auto_in_a_bits_source = buffer_auto_out_a_bits_source;
  assign error_auto_in_a_bits_address = buffer_auto_out_a_bits_address;
  assign error_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask;
  assign error_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt;
  assign error_auto_in_d_ready = buffer_auto_out_d_ready;
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_auto_in_a_valid = auto_buffer_in_a_valid;
  assign buffer_auto_in_a_bits_opcode = auto_buffer_in_a_bits_opcode;
  assign buffer_auto_in_a_bits_param = auto_buffer_in_a_bits_param;
  assign buffer_auto_in_a_bits_size = auto_buffer_in_a_bits_size;
  assign buffer_auto_in_a_bits_source = auto_buffer_in_a_bits_source;
  assign buffer_auto_in_a_bits_address = auto_buffer_in_a_bits_address;
  assign buffer_auto_in_a_bits_mask = auto_buffer_in_a_bits_mask;
  assign buffer_auto_in_a_bits_corrupt = auto_buffer_in_a_bits_corrupt;
  assign buffer_auto_in_d_ready = auto_buffer_in_d_ready;
  assign buffer_auto_out_a_ready = error_auto_in_a_ready;
  assign buffer_auto_out_d_valid = error_auto_in_d_valid;
  assign buffer_auto_out_d_bits_opcode = error_auto_in_d_bits_opcode;
  assign buffer_auto_out_d_bits_size = error_auto_in_d_bits_size;
  assign buffer_auto_out_d_bits_source = error_auto_in_d_bits_source;
  assign buffer_auto_out_d_bits_corrupt = error_auto_in_d_bits_corrupt;
endmodule