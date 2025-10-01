`default_nettype wire
module TLBuffer_8(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [1:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  output        auto_in_c_ready,
  input         auto_in_c_valid,
  input  [2:0]  auto_in_c_bits_opcode,
  input  [2:0]  auto_in_c_bits_param,
  input  [3:0]  auto_in_c_bits_size,
  input  [31:0] auto_in_c_bits_address,
  input  [31:0] auto_in_c_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [1:0]  auto_in_d_bits_source,
  output [2:0]  auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  output        auto_in_e_ready,
  input         auto_in_e_valid,
  input  [2:0]  auto_in_e_bits_sink,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [1:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  input         auto_out_c_ready,
  output        auto_out_c_valid,
  output [2:0]  auto_out_c_bits_opcode,
  output [2:0]  auto_out_c_bits_param,
  output [3:0]  auto_out_c_bits_size,
  output [1:0]  auto_out_c_bits_source,
  output [31:0] auto_out_c_bits_address,
  output [31:0] auto_out_c_bits_data,
  output        auto_out_c_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [1:0]  auto_out_d_bits_source,
  input  [2:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [31:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  output        auto_out_e_valid,
  output [2:0]  auto_out_e_bits_sink
);
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [3:0] monitor_io_in_a_bits_size;
  wire [1:0] monitor_io_in_a_bits_source;
  wire [31:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_b_valid;
  wire [2:0] monitor_io_in_b_bits_opcode;
  wire [1:0] monitor_io_in_b_bits_param;
  wire [3:0] monitor_io_in_b_bits_size;
  wire [1:0] monitor_io_in_b_bits_source;
  wire [31:0] monitor_io_in_b_bits_address;
  wire [3:0] monitor_io_in_b_bits_mask;
  wire  monitor_io_in_b_bits_corrupt;
  wire  monitor_io_in_c_ready;
  wire  monitor_io_in_c_valid;
  wire [2:0] monitor_io_in_c_bits_opcode;
  wire [2:0] monitor_io_in_c_bits_param;
  wire [3:0] monitor_io_in_c_bits_size;
  wire [31:0] monitor_io_in_c_bits_address;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [1:0] monitor_io_in_d_bits_source;
  wire [2:0] monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  monitor_io_in_e_ready;
  wire  monitor_io_in_e_valid;
  wire [2:0] monitor_io_in_e_bits_sink;
  wire  bundleOut_0_a_q_clock;
  wire  bundleOut_0_a_q_reset;
  wire  bundleOut_0_a_q_io_enq_ready;
  wire  bundleOut_0_a_q_io_enq_valid;
  wire [2:0] bundleOut_0_a_q_io_enq_bits_opcode;
  wire [2:0] bundleOut_0_a_q_io_enq_bits_param;
  wire [3:0] bundleOut_0_a_q_io_enq_bits_size;
  wire [1:0] bundleOut_0_a_q_io_enq_bits_source;
  wire [31:0] bundleOut_0_a_q_io_enq_bits_address;
  wire [3:0] bundleOut_0_a_q_io_enq_bits_mask;
  wire [31:0] bundleOut_0_a_q_io_enq_bits_data;
  wire  bundleOut_0_a_q_io_deq_ready;
  wire  bundleOut_0_a_q_io_deq_valid;
  wire [2:0] bundleOut_0_a_q_io_deq_bits_opcode;
  wire [2:0] bundleOut_0_a_q_io_deq_bits_param;
  wire [3:0] bundleOut_0_a_q_io_deq_bits_size;
  wire [1:0] bundleOut_0_a_q_io_deq_bits_source;
  wire [31:0] bundleOut_0_a_q_io_deq_bits_address;
  wire [3:0] bundleOut_0_a_q_io_deq_bits_mask;
  wire [31:0] bundleOut_0_a_q_io_deq_bits_data;
  wire  bundleOut_0_a_q_io_deq_bits_corrupt;
  wire  bundleIn_0_d_q_clock;
  wire  bundleIn_0_d_q_reset;
  wire  bundleIn_0_d_q_io_enq_ready;
  wire  bundleIn_0_d_q_io_enq_valid;
  wire [2:0] bundleIn_0_d_q_io_enq_bits_opcode;
  wire [1:0] bundleIn_0_d_q_io_enq_bits_param;
  wire [3:0] bundleIn_0_d_q_io_enq_bits_size;
  wire [1:0] bundleIn_0_d_q_io_enq_bits_source;
  wire [2:0] bundleIn_0_d_q_io_enq_bits_sink;
  wire  bundleIn_0_d_q_io_enq_bits_denied;
  wire [31:0] bundleIn_0_d_q_io_enq_bits_data;
  wire  bundleIn_0_d_q_io_enq_bits_corrupt;
  wire  bundleIn_0_d_q_io_deq_ready;
  wire  bundleIn_0_d_q_io_deq_valid;
  wire [2:0] bundleIn_0_d_q_io_deq_bits_opcode;
  wire [1:0] bundleIn_0_d_q_io_deq_bits_param;
  wire [3:0] bundleIn_0_d_q_io_deq_bits_size;
  wire [1:0] bundleIn_0_d_q_io_deq_bits_source;
  wire [2:0] bundleIn_0_d_q_io_deq_bits_sink;
  wire  bundleIn_0_d_q_io_deq_bits_denied;
  wire [31:0] bundleIn_0_d_q_io_deq_bits_data;
  wire  bundleIn_0_d_q_io_deq_bits_corrupt;
  wire  bundleIn_0_b_q_clock;
  wire  bundleIn_0_b_q_reset;
  wire  bundleIn_0_b_q_io_deq_valid;
  wire [2:0] bundleIn_0_b_q_io_deq_bits_opcode;
  wire [1:0] bundleIn_0_b_q_io_deq_bits_param;
  wire [3:0] bundleIn_0_b_q_io_deq_bits_size;
  wire [1:0] bundleIn_0_b_q_io_deq_bits_source;
  wire [31:0] bundleIn_0_b_q_io_deq_bits_address;
  wire [3:0] bundleIn_0_b_q_io_deq_bits_mask;
  wire  bundleIn_0_b_q_io_deq_bits_corrupt;
  wire  bundleOut_0_c_q_clock;
  wire  bundleOut_0_c_q_reset;
  wire  bundleOut_0_c_q_io_enq_ready;
  wire  bundleOut_0_c_q_io_enq_valid;
  wire [2:0] bundleOut_0_c_q_io_enq_bits_opcode;
  wire [2:0] bundleOut_0_c_q_io_enq_bits_param;
  wire [3:0] bundleOut_0_c_q_io_enq_bits_size;
  wire [31:0] bundleOut_0_c_q_io_enq_bits_address;
  wire [31:0] bundleOut_0_c_q_io_enq_bits_data;
  wire  bundleOut_0_c_q_io_deq_ready;
  wire  bundleOut_0_c_q_io_deq_valid;
  wire [2:0] bundleOut_0_c_q_io_deq_bits_opcode;
  wire [2:0] bundleOut_0_c_q_io_deq_bits_param;
  wire [3:0] bundleOut_0_c_q_io_deq_bits_size;
  wire [1:0] bundleOut_0_c_q_io_deq_bits_source;
  wire [31:0] bundleOut_0_c_q_io_deq_bits_address;
  wire [31:0] bundleOut_0_c_q_io_deq_bits_data;
  wire  bundleOut_0_c_q_io_deq_bits_corrupt;
  wire  bundleOut_0_e_q_clock;
  wire  bundleOut_0_e_q_reset;
  wire  bundleOut_0_e_q_io_enq_ready;
  wire  bundleOut_0_e_q_io_enq_valid;
  wire [2:0] bundleOut_0_e_q_io_enq_bits_sink;
  wire  bundleOut_0_e_q_io_deq_valid;
  wire [2:0] bundleOut_0_e_q_io_deq_bits_sink;
  
  Queue_32 bundleOut_0_a_q (
    .clock(bundleOut_0_a_q_clock),
    .reset(bundleOut_0_a_q_reset),
    .io_enq_ready(bundleOut_0_a_q_io_enq_ready),
    .io_enq_valid(bundleOut_0_a_q_io_enq_valid),
    .io_enq_bits_opcode(bundleOut_0_a_q_io_enq_bits_opcode),
    .io_enq_bits_param(bundleOut_0_a_q_io_enq_bits_param),
    .io_enq_bits_size(bundleOut_0_a_q_io_enq_bits_size),
    .io_enq_bits_source(bundleOut_0_a_q_io_enq_bits_source),
    .io_enq_bits_address(bundleOut_0_a_q_io_enq_bits_address),
    .io_enq_bits_mask(bundleOut_0_a_q_io_enq_bits_mask),
    .io_enq_bits_data(bundleOut_0_a_q_io_enq_bits_data),
    .io_deq_ready(bundleOut_0_a_q_io_deq_ready),
    .io_deq_valid(bundleOut_0_a_q_io_deq_valid),
    .io_deq_bits_opcode(bundleOut_0_a_q_io_deq_bits_opcode),
    .io_deq_bits_param(bundleOut_0_a_q_io_deq_bits_param),
    .io_deq_bits_size(bundleOut_0_a_q_io_deq_bits_size),
    .io_deq_bits_source(bundleOut_0_a_q_io_deq_bits_source),
    .io_deq_bits_address(bundleOut_0_a_q_io_deq_bits_address),
    .io_deq_bits_mask(bundleOut_0_a_q_io_deq_bits_mask),
    .io_deq_bits_data(bundleOut_0_a_q_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleOut_0_a_q_io_deq_bits_corrupt)
  );
  Queue bundleIn_0_d_q (
    .clock(bundleIn_0_d_q_clock),
    .reset(bundleIn_0_d_q_reset),
    .io_enq_ready(bundleIn_0_d_q_io_enq_ready),
    .io_enq_valid(bundleIn_0_d_q_io_enq_valid),
    .io_enq_bits_opcode(bundleIn_0_d_q_io_enq_bits_opcode),
    .io_enq_bits_param(bundleIn_0_d_q_io_enq_bits_param),
    .io_enq_bits_size(bundleIn_0_d_q_io_enq_bits_size),
    .io_enq_bits_source(bundleIn_0_d_q_io_enq_bits_source),
    .io_enq_bits_sink(bundleIn_0_d_q_io_enq_bits_sink),
    .io_enq_bits_denied(bundleIn_0_d_q_io_enq_bits_denied),
    .io_enq_bits_data(bundleIn_0_d_q_io_enq_bits_data),
    .io_enq_bits_corrupt(bundleIn_0_d_q_io_enq_bits_corrupt),
    .io_deq_ready(bundleIn_0_d_q_io_deq_ready),
    .io_deq_valid(bundleIn_0_d_q_io_deq_valid),
    .io_deq_bits_opcode(bundleIn_0_d_q_io_deq_bits_opcode),
    .io_deq_bits_param(bundleIn_0_d_q_io_deq_bits_param),
    .io_deq_bits_size(bundleIn_0_d_q_io_deq_bits_size),
    .io_deq_bits_source(bundleIn_0_d_q_io_deq_bits_source),
    .io_deq_bits_sink(bundleIn_0_d_q_io_deq_bits_sink),
    .io_deq_bits_denied(bundleIn_0_d_q_io_deq_bits_denied),
    .io_deq_bits_data(bundleIn_0_d_q_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleIn_0_d_q_io_deq_bits_corrupt)
  );
  Queue_34 bundleIn_0_b_q (
    .clock(bundleIn_0_b_q_clock),
    .reset(bundleIn_0_b_q_reset),
    .io_deq_valid(bundleIn_0_b_q_io_deq_valid),
    .io_deq_bits_opcode(bundleIn_0_b_q_io_deq_bits_opcode),
    .io_deq_bits_param(bundleIn_0_b_q_io_deq_bits_param),
    .io_deq_bits_size(bundleIn_0_b_q_io_deq_bits_size),
    .io_deq_bits_source(bundleIn_0_b_q_io_deq_bits_source),
    .io_deq_bits_address(bundleIn_0_b_q_io_deq_bits_address),
    .io_deq_bits_mask(bundleIn_0_b_q_io_deq_bits_mask),
    .io_deq_bits_corrupt(bundleIn_0_b_q_io_deq_bits_corrupt)
  );
  Queue_35 bundleOut_0_c_q (
    .clock(bundleOut_0_c_q_clock),
    .reset(bundleOut_0_c_q_reset),
    .io_enq_ready(bundleOut_0_c_q_io_enq_ready),
    .io_enq_valid(bundleOut_0_c_q_io_enq_valid),
    .io_enq_bits_opcode(bundleOut_0_c_q_io_enq_bits_opcode),
    .io_enq_bits_param(bundleOut_0_c_q_io_enq_bits_param),
    .io_enq_bits_size(bundleOut_0_c_q_io_enq_bits_size),
    .io_enq_bits_address(bundleOut_0_c_q_io_enq_bits_address),
    .io_enq_bits_data(bundleOut_0_c_q_io_enq_bits_data),
    .io_deq_ready(bundleOut_0_c_q_io_deq_ready),
    .io_deq_valid(bundleOut_0_c_q_io_deq_valid),
    .io_deq_bits_opcode(bundleOut_0_c_q_io_deq_bits_opcode),
    .io_deq_bits_param(bundleOut_0_c_q_io_deq_bits_param),
    .io_deq_bits_size(bundleOut_0_c_q_io_deq_bits_size),
    .io_deq_bits_source(bundleOut_0_c_q_io_deq_bits_source),
    .io_deq_bits_address(bundleOut_0_c_q_io_deq_bits_address),
    .io_deq_bits_data(bundleOut_0_c_q_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleOut_0_c_q_io_deq_bits_corrupt)
  );
  Queue_36 bundleOut_0_e_q (
    .clock(bundleOut_0_e_q_clock),
    .reset(bundleOut_0_e_q_reset),
    .io_enq_ready(bundleOut_0_e_q_io_enq_ready),
    .io_enq_valid(bundleOut_0_e_q_io_enq_valid),
    .io_enq_bits_sink(bundleOut_0_e_q_io_enq_bits_sink),
    .io_deq_valid(bundleOut_0_e_q_io_deq_valid),
    .io_deq_bits_sink(bundleOut_0_e_q_io_deq_bits_sink)
  );
  assign auto_in_a_ready = bundleOut_0_a_q_io_enq_ready;
  assign auto_in_c_ready = bundleOut_0_c_q_io_enq_ready;
  assign auto_in_d_valid = bundleIn_0_d_q_io_deq_valid;
  assign auto_in_d_bits_opcode = bundleIn_0_d_q_io_deq_bits_opcode;
  assign auto_in_d_bits_param = bundleIn_0_d_q_io_deq_bits_param;
  assign auto_in_d_bits_size = bundleIn_0_d_q_io_deq_bits_size;
  assign auto_in_d_bits_source = bundleIn_0_d_q_io_deq_bits_source;
  assign auto_in_d_bits_sink = bundleIn_0_d_q_io_deq_bits_sink;
  assign auto_in_d_bits_denied = bundleIn_0_d_q_io_deq_bits_denied;
  assign auto_in_d_bits_data = bundleIn_0_d_q_io_deq_bits_data;
  assign auto_in_d_bits_corrupt = bundleIn_0_d_q_io_deq_bits_corrupt;
  assign auto_in_e_ready = bundleOut_0_e_q_io_enq_ready;
  assign auto_out_a_valid = bundleOut_0_a_q_io_deq_valid;
  assign auto_out_a_bits_opcode = bundleOut_0_a_q_io_deq_bits_opcode;
  assign auto_out_a_bits_param = bundleOut_0_a_q_io_deq_bits_param;
  assign auto_out_a_bits_size = bundleOut_0_a_q_io_deq_bits_size;
  assign auto_out_a_bits_source = bundleOut_0_a_q_io_deq_bits_source;
  assign auto_out_a_bits_address = bundleOut_0_a_q_io_deq_bits_address;
  assign auto_out_a_bits_mask = bundleOut_0_a_q_io_deq_bits_mask;
  assign auto_out_a_bits_data = bundleOut_0_a_q_io_deq_bits_data;
  assign auto_out_a_bits_corrupt = bundleOut_0_a_q_io_deq_bits_corrupt;
  assign auto_out_c_valid = bundleOut_0_c_q_io_deq_valid;
  assign auto_out_c_bits_opcode = bundleOut_0_c_q_io_deq_bits_opcode;
  assign auto_out_c_bits_param = bundleOut_0_c_q_io_deq_bits_param;
  assign auto_out_c_bits_size = bundleOut_0_c_q_io_deq_bits_size;
  assign auto_out_c_bits_source = bundleOut_0_c_q_io_deq_bits_source;
  assign auto_out_c_bits_address = bundleOut_0_c_q_io_deq_bits_address;
  assign auto_out_c_bits_data = bundleOut_0_c_q_io_deq_bits_data;
  assign auto_out_c_bits_corrupt = bundleOut_0_c_q_io_deq_bits_corrupt;
  assign auto_out_d_ready = bundleIn_0_d_q_io_enq_ready;
  assign auto_out_e_valid = bundleOut_0_e_q_io_deq_valid;
  assign auto_out_e_bits_sink = bundleOut_0_e_q_io_deq_bits_sink;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = bundleOut_0_a_q_io_enq_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_b_valid = bundleIn_0_b_q_io_deq_valid;
  assign monitor_io_in_b_bits_opcode = bundleIn_0_b_q_io_deq_bits_opcode;
  assign monitor_io_in_b_bits_param = bundleIn_0_b_q_io_deq_bits_param;
  assign monitor_io_in_b_bits_size = bundleIn_0_b_q_io_deq_bits_size;
  assign monitor_io_in_b_bits_source = bundleIn_0_b_q_io_deq_bits_source;
  assign monitor_io_in_b_bits_address = bundleIn_0_b_q_io_deq_bits_address;
  assign monitor_io_in_b_bits_mask = bundleIn_0_b_q_io_deq_bits_mask;
  assign monitor_io_in_b_bits_corrupt = bundleIn_0_b_q_io_deq_bits_corrupt;
  assign monitor_io_in_c_ready = bundleOut_0_c_q_io_enq_ready;
  assign monitor_io_in_c_valid = auto_in_c_valid;
  assign monitor_io_in_c_bits_opcode = auto_in_c_bits_opcode;
  assign monitor_io_in_c_bits_param = auto_in_c_bits_param;
  assign monitor_io_in_c_bits_size = auto_in_c_bits_size;
  assign monitor_io_in_c_bits_address = auto_in_c_bits_address;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = bundleIn_0_d_q_io_deq_valid;
  assign monitor_io_in_d_bits_opcode = bundleIn_0_d_q_io_deq_bits_opcode;
  assign monitor_io_in_d_bits_param = bundleIn_0_d_q_io_deq_bits_param;
  assign monitor_io_in_d_bits_size = bundleIn_0_d_q_io_deq_bits_size;
  assign monitor_io_in_d_bits_source = bundleIn_0_d_q_io_deq_bits_source;
  assign monitor_io_in_d_bits_sink = bundleIn_0_d_q_io_deq_bits_sink;
  assign monitor_io_in_d_bits_denied = bundleIn_0_d_q_io_deq_bits_denied;
  assign monitor_io_in_d_bits_corrupt = bundleIn_0_d_q_io_deq_bits_corrupt;
  assign monitor_io_in_e_ready = bundleOut_0_e_q_io_enq_ready;
  assign monitor_io_in_e_valid = auto_in_e_valid;
  assign monitor_io_in_e_bits_sink = auto_in_e_bits_sink;
  assign bundleOut_0_a_q_clock = clock;
  assign bundleOut_0_a_q_reset = reset;
  assign bundleOut_0_a_q_io_enq_valid = auto_in_a_valid;
  assign bundleOut_0_a_q_io_enq_bits_opcode = auto_in_a_bits_opcode;
  assign bundleOut_0_a_q_io_enq_bits_param = auto_in_a_bits_param;
  assign bundleOut_0_a_q_io_enq_bits_size = auto_in_a_bits_size;
  assign bundleOut_0_a_q_io_enq_bits_source = auto_in_a_bits_source;
  assign bundleOut_0_a_q_io_enq_bits_address = auto_in_a_bits_address;
  assign bundleOut_0_a_q_io_enq_bits_mask = auto_in_a_bits_mask;
  assign bundleOut_0_a_q_io_enq_bits_data = auto_in_a_bits_data;
  assign bundleOut_0_a_q_io_deq_ready = auto_out_a_ready;
  assign bundleIn_0_d_q_clock = clock;
  assign bundleIn_0_d_q_reset = reset;
  assign bundleIn_0_d_q_io_enq_valid = auto_out_d_valid;
  assign bundleIn_0_d_q_io_enq_bits_opcode = auto_out_d_bits_opcode;
  assign bundleIn_0_d_q_io_enq_bits_param = auto_out_d_bits_param;
  assign bundleIn_0_d_q_io_enq_bits_size = auto_out_d_bits_size;
  assign bundleIn_0_d_q_io_enq_bits_source = auto_out_d_bits_source;
  assign bundleIn_0_d_q_io_enq_bits_sink = auto_out_d_bits_sink;
  assign bundleIn_0_d_q_io_enq_bits_denied = auto_out_d_bits_denied;
  assign bundleIn_0_d_q_io_enq_bits_data = auto_out_d_bits_data;
  assign bundleIn_0_d_q_io_enq_bits_corrupt = auto_out_d_bits_corrupt;
  assign bundleIn_0_d_q_io_deq_ready = auto_in_d_ready;
  assign bundleIn_0_b_q_clock = clock;
  assign bundleIn_0_b_q_reset = reset;
  assign bundleOut_0_c_q_clock = clock;
  assign bundleOut_0_c_q_reset = reset;
  assign bundleOut_0_c_q_io_enq_valid = auto_in_c_valid;
  assign bundleOut_0_c_q_io_enq_bits_opcode = auto_in_c_bits_opcode;
  assign bundleOut_0_c_q_io_enq_bits_param = auto_in_c_bits_param;
  assign bundleOut_0_c_q_io_enq_bits_size = auto_in_c_bits_size;
  assign bundleOut_0_c_q_io_enq_bits_address = auto_in_c_bits_address;
  assign bundleOut_0_c_q_io_enq_bits_data = auto_in_c_bits_data;
  assign bundleOut_0_c_q_io_deq_ready = auto_out_c_ready;
  assign bundleOut_0_e_q_clock = clock;
  assign bundleOut_0_e_q_reset = reset;
  assign bundleOut_0_e_q_io_enq_valid = auto_in_e_valid;
  assign bundleOut_0_e_q_io_enq_bits_sink = auto_in_e_bits_sink;
endmodule