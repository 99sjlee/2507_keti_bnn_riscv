`default_nettype wire
module TLInterconnectCoupler_2(
  input         clock,
  input         reset,
  output        auto_tl_master_clock_xing_in_a_ready,
  input         auto_tl_master_clock_xing_in_a_valid,
  input  [2:0]  auto_tl_master_clock_xing_in_a_bits_opcode,
  input  [2:0]  auto_tl_master_clock_xing_in_a_bits_param,
  input  [3:0]  auto_tl_master_clock_xing_in_a_bits_size,
  input  [1:0]  auto_tl_master_clock_xing_in_a_bits_source,
  input  [31:0] auto_tl_master_clock_xing_in_a_bits_address,
  input  [3:0]  auto_tl_master_clock_xing_in_a_bits_mask,
  input  [31:0] auto_tl_master_clock_xing_in_a_bits_data,
  input         auto_tl_master_clock_xing_in_a_bits_corrupt,
  output        auto_tl_master_clock_xing_in_c_ready,
  input         auto_tl_master_clock_xing_in_c_valid,
  input  [2:0]  auto_tl_master_clock_xing_in_c_bits_opcode,
  input  [2:0]  auto_tl_master_clock_xing_in_c_bits_param,
  input  [3:0]  auto_tl_master_clock_xing_in_c_bits_size,
  input  [1:0]  auto_tl_master_clock_xing_in_c_bits_source,
  input  [31:0] auto_tl_master_clock_xing_in_c_bits_address,
  input  [31:0] auto_tl_master_clock_xing_in_c_bits_data,
  input         auto_tl_master_clock_xing_in_c_bits_corrupt,
  input         auto_tl_master_clock_xing_in_d_ready,
  output        auto_tl_master_clock_xing_in_d_valid,
  output [2:0]  auto_tl_master_clock_xing_in_d_bits_opcode,
  output [1:0]  auto_tl_master_clock_xing_in_d_bits_param,
  output [3:0]  auto_tl_master_clock_xing_in_d_bits_size,
  output [1:0]  auto_tl_master_clock_xing_in_d_bits_source,
  output [2:0]  auto_tl_master_clock_xing_in_d_bits_sink,
  output        auto_tl_master_clock_xing_in_d_bits_denied,
  output [31:0] auto_tl_master_clock_xing_in_d_bits_data,
  output        auto_tl_master_clock_xing_in_d_bits_corrupt,
  input         auto_tl_master_clock_xing_in_e_valid,
  input  [2:0]  auto_tl_master_clock_xing_in_e_bits_sink,
  input         auto_tl_out_a_ready,
  output        auto_tl_out_a_valid,
  output [2:0]  auto_tl_out_a_bits_opcode,
  output [2:0]  auto_tl_out_a_bits_param,
  output [3:0]  auto_tl_out_a_bits_size,
  output [2:0]  auto_tl_out_a_bits_source,
  output [31:0] auto_tl_out_a_bits_address,
  output [3:0]  auto_tl_out_a_bits_mask,
  output [31:0] auto_tl_out_a_bits_data,
  output        auto_tl_out_a_bits_corrupt,
  output        auto_tl_out_d_ready,
  input         auto_tl_out_d_valid,
  input  [2:0]  auto_tl_out_d_bits_opcode,
  input  [1:0]  auto_tl_out_d_bits_param,
  input  [3:0]  auto_tl_out_d_bits_size,
  input  [2:0]  auto_tl_out_d_bits_source,
  input         auto_tl_out_d_bits_denied,
  input  [31:0] auto_tl_out_d_bits_data,
  input         auto_tl_out_d_bits_corrupt
);
  wire  cork_clock;
  wire  cork_reset;
  wire  cork_auto_in_a_ready;
  wire  cork_auto_in_a_valid;
  wire [2:0] cork_auto_in_a_bits_opcode;
  wire [2:0] cork_auto_in_a_bits_param;
  wire [3:0] cork_auto_in_a_bits_size;
  wire [1:0] cork_auto_in_a_bits_source;
  wire [31:0] cork_auto_in_a_bits_address;
  wire [3:0] cork_auto_in_a_bits_mask;
  wire [31:0] cork_auto_in_a_bits_data;
  wire  cork_auto_in_a_bits_corrupt;
  wire  cork_auto_in_c_ready;
  wire  cork_auto_in_c_valid;
  wire [2:0] cork_auto_in_c_bits_opcode;
  wire [2:0] cork_auto_in_c_bits_param;
  wire [3:0] cork_auto_in_c_bits_size;
  wire [1:0] cork_auto_in_c_bits_source;
  wire [31:0] cork_auto_in_c_bits_address;
  wire [31:0] cork_auto_in_c_bits_data;
  wire  cork_auto_in_c_bits_corrupt;
  wire  cork_auto_in_d_ready;
  wire  cork_auto_in_d_valid;
  wire [2:0] cork_auto_in_d_bits_opcode;
  wire [1:0] cork_auto_in_d_bits_param;
  wire [3:0] cork_auto_in_d_bits_size;
  wire [1:0] cork_auto_in_d_bits_source;
  wire [2:0] cork_auto_in_d_bits_sink;
  wire  cork_auto_in_d_bits_denied;
  wire [31:0] cork_auto_in_d_bits_data;
  wire  cork_auto_in_d_bits_corrupt;
  wire  cork_auto_in_e_valid;
  wire [2:0] cork_auto_in_e_bits_sink;
  wire  cork_auto_out_a_ready;
  wire  cork_auto_out_a_valid;
  wire [2:0] cork_auto_out_a_bits_opcode;
  wire [2:0] cork_auto_out_a_bits_param;
  wire [3:0] cork_auto_out_a_bits_size;
  wire [2:0] cork_auto_out_a_bits_source;
  wire [31:0] cork_auto_out_a_bits_address;
  wire [3:0] cork_auto_out_a_bits_mask;
  wire [31:0] cork_auto_out_a_bits_data;
  wire  cork_auto_out_a_bits_corrupt;
  wire  cork_auto_out_d_ready;
  wire  cork_auto_out_d_valid;
  wire [2:0] cork_auto_out_d_bits_opcode;
  wire [1:0] cork_auto_out_d_bits_param;
  wire [3:0] cork_auto_out_d_bits_size;
  wire [2:0] cork_auto_out_d_bits_source;
  wire  cork_auto_out_d_bits_denied;
  wire [31:0] cork_auto_out_d_bits_data;
  wire  cork_auto_out_d_bits_corrupt;
  TLCacheCork cork (
    .clock(cork_clock),
    .reset(cork_reset),
    .auto_in_a_ready(cork_auto_in_a_ready),
    .auto_in_a_valid(cork_auto_in_a_valid),
    .auto_in_a_bits_opcode(cork_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(cork_auto_in_a_bits_param),
    .auto_in_a_bits_size(cork_auto_in_a_bits_size),
    .auto_in_a_bits_source(cork_auto_in_a_bits_source),
    .auto_in_a_bits_address(cork_auto_in_a_bits_address),
    .auto_in_a_bits_mask(cork_auto_in_a_bits_mask),
    .auto_in_a_bits_data(cork_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(cork_auto_in_a_bits_corrupt),
    .auto_in_c_ready(cork_auto_in_c_ready),
    .auto_in_c_valid(cork_auto_in_c_valid),
    .auto_in_c_bits_opcode(cork_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(cork_auto_in_c_bits_param),
    .auto_in_c_bits_size(cork_auto_in_c_bits_size),
    .auto_in_c_bits_source(cork_auto_in_c_bits_source),
    .auto_in_c_bits_address(cork_auto_in_c_bits_address),
    .auto_in_c_bits_data(cork_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(cork_auto_in_c_bits_corrupt),
    .auto_in_d_ready(cork_auto_in_d_ready),
    .auto_in_d_valid(cork_auto_in_d_valid),
    .auto_in_d_bits_opcode(cork_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(cork_auto_in_d_bits_param),
    .auto_in_d_bits_size(cork_auto_in_d_bits_size),
    .auto_in_d_bits_source(cork_auto_in_d_bits_source),
    .auto_in_d_bits_sink(cork_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(cork_auto_in_d_bits_denied),
    .auto_in_d_bits_data(cork_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(cork_auto_in_d_bits_corrupt),
    .auto_in_e_valid(cork_auto_in_e_valid),
    .auto_in_e_bits_sink(cork_auto_in_e_bits_sink),
    .auto_out_a_ready(cork_auto_out_a_ready),
    .auto_out_a_valid(cork_auto_out_a_valid),
    .auto_out_a_bits_opcode(cork_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(cork_auto_out_a_bits_param),
    .auto_out_a_bits_size(cork_auto_out_a_bits_size),
    .auto_out_a_bits_source(cork_auto_out_a_bits_source),
    .auto_out_a_bits_address(cork_auto_out_a_bits_address),
    .auto_out_a_bits_mask(cork_auto_out_a_bits_mask),
    .auto_out_a_bits_data(cork_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(cork_auto_out_a_bits_corrupt),
    .auto_out_d_ready(cork_auto_out_d_ready),
    .auto_out_d_valid(cork_auto_out_d_valid),
    .auto_out_d_bits_opcode(cork_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(cork_auto_out_d_bits_param),
    .auto_out_d_bits_size(cork_auto_out_d_bits_size),
    .auto_out_d_bits_source(cork_auto_out_d_bits_source),
    .auto_out_d_bits_denied(cork_auto_out_d_bits_denied),
    .auto_out_d_bits_data(cork_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(cork_auto_out_d_bits_corrupt)
  );
  assign auto_tl_master_clock_xing_in_a_ready = cork_auto_in_a_ready;
  assign auto_tl_master_clock_xing_in_c_ready = cork_auto_in_c_ready;
  assign auto_tl_master_clock_xing_in_d_valid = cork_auto_in_d_valid;
  assign auto_tl_master_clock_xing_in_d_bits_opcode = cork_auto_in_d_bits_opcode;
  assign auto_tl_master_clock_xing_in_d_bits_param = cork_auto_in_d_bits_param;
  assign auto_tl_master_clock_xing_in_d_bits_size = cork_auto_in_d_bits_size;
  assign auto_tl_master_clock_xing_in_d_bits_source = cork_auto_in_d_bits_source;
  assign auto_tl_master_clock_xing_in_d_bits_sink = cork_auto_in_d_bits_sink;
  assign auto_tl_master_clock_xing_in_d_bits_denied = cork_auto_in_d_bits_denied;
  assign auto_tl_master_clock_xing_in_d_bits_data = cork_auto_in_d_bits_data;
  assign auto_tl_master_clock_xing_in_d_bits_corrupt = cork_auto_in_d_bits_corrupt;
  assign auto_tl_out_a_valid = cork_auto_out_a_valid;
  assign auto_tl_out_a_bits_opcode = cork_auto_out_a_bits_opcode;
  assign auto_tl_out_a_bits_param = cork_auto_out_a_bits_param;
  assign auto_tl_out_a_bits_size = cork_auto_out_a_bits_size;
  assign auto_tl_out_a_bits_source = cork_auto_out_a_bits_source;
  assign auto_tl_out_a_bits_address = cork_auto_out_a_bits_address;
  assign auto_tl_out_a_bits_mask = cork_auto_out_a_bits_mask;
  assign auto_tl_out_a_bits_data = cork_auto_out_a_bits_data;
  assign auto_tl_out_a_bits_corrupt = cork_auto_out_a_bits_corrupt;
  assign auto_tl_out_d_ready = cork_auto_out_d_ready;
  assign cork_clock = clock;
  assign cork_reset = reset;
  assign cork_auto_in_a_valid = auto_tl_master_clock_xing_in_a_valid;
  assign cork_auto_in_a_bits_opcode = auto_tl_master_clock_xing_in_a_bits_opcode;
  assign cork_auto_in_a_bits_param = auto_tl_master_clock_xing_in_a_bits_param;
  assign cork_auto_in_a_bits_size = auto_tl_master_clock_xing_in_a_bits_size;
  assign cork_auto_in_a_bits_source = auto_tl_master_clock_xing_in_a_bits_source;
  assign cork_auto_in_a_bits_address = auto_tl_master_clock_xing_in_a_bits_address;
  assign cork_auto_in_a_bits_mask = auto_tl_master_clock_xing_in_a_bits_mask;
  assign cork_auto_in_a_bits_data = auto_tl_master_clock_xing_in_a_bits_data;
  assign cork_auto_in_a_bits_corrupt = auto_tl_master_clock_xing_in_a_bits_corrupt;
  assign cork_auto_in_c_valid = auto_tl_master_clock_xing_in_c_valid;
  assign cork_auto_in_c_bits_opcode = auto_tl_master_clock_xing_in_c_bits_opcode;
  assign cork_auto_in_c_bits_param = auto_tl_master_clock_xing_in_c_bits_param;
  assign cork_auto_in_c_bits_size = auto_tl_master_clock_xing_in_c_bits_size;
  assign cork_auto_in_c_bits_source = auto_tl_master_clock_xing_in_c_bits_source;
  assign cork_auto_in_c_bits_address = auto_tl_master_clock_xing_in_c_bits_address;
  assign cork_auto_in_c_bits_data = auto_tl_master_clock_xing_in_c_bits_data;
  assign cork_auto_in_c_bits_corrupt = auto_tl_master_clock_xing_in_c_bits_corrupt;
  assign cork_auto_in_d_ready = auto_tl_master_clock_xing_in_d_ready;
  assign cork_auto_in_e_valid = auto_tl_master_clock_xing_in_e_valid;
  assign cork_auto_in_e_bits_sink = auto_tl_master_clock_xing_in_e_bits_sink;
  assign cork_auto_out_a_ready = auto_tl_out_a_ready;
  assign cork_auto_out_d_valid = auto_tl_out_d_valid;
  assign cork_auto_out_d_bits_opcode = auto_tl_out_d_bits_opcode;
  assign cork_auto_out_d_bits_param = auto_tl_out_d_bits_param;
  assign cork_auto_out_d_bits_size = auto_tl_out_d_bits_size;
  assign cork_auto_out_d_bits_source = auto_tl_out_d_bits_source;
  assign cork_auto_out_d_bits_denied = auto_tl_out_d_bits_denied;
  assign cork_auto_out_d_bits_data = auto_tl_out_d_bits_data;
  assign cork_auto_out_d_bits_corrupt = auto_tl_out_d_bits_corrupt;
endmodule