`default_nettype wire
module AXI4Buffer_3(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [30:0] auto_in_aw_bits_addr,
  input         auto_in_aw_bits_echo_real_last,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [31:0] auto_in_w_bits_data,
  input  [3:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_b_bits_echo_real_last,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [30:0] auto_in_ar_bits_addr,
  input         auto_in_ar_bits_echo_real_last,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [31:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_echo_real_last,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [3:0]  auto_out_aw_bits_id,
  output [30:0] auto_out_aw_bits_addr,
  output        auto_out_aw_bits_echo_real_last,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [31:0] auto_out_w_bits_data,
  output [3:0]  auto_out_w_bits_strb,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [3:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input         auto_out_b_bits_echo_real_last,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [3:0]  auto_out_ar_bits_id,
  output [30:0] auto_out_ar_bits_addr,
  output        auto_out_ar_bits_echo_real_last,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [3:0]  auto_out_r_bits_id,
  input  [31:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input         auto_out_r_bits_echo_real_last
);
  wire  bundleOut_0_aw_deq_clock;
  wire  bundleOut_0_aw_deq_reset;
  wire  bundleOut_0_aw_deq_io_enq_ready;
  wire  bundleOut_0_aw_deq_io_enq_valid;
  wire [3:0] bundleOut_0_aw_deq_io_enq_bits_id;
  wire [30:0] bundleOut_0_aw_deq_io_enq_bits_addr;
  wire  bundleOut_0_aw_deq_io_enq_bits_echo_real_last;
  wire  bundleOut_0_aw_deq_io_deq_ready;
  wire  bundleOut_0_aw_deq_io_deq_valid;
  wire [3:0] bundleOut_0_aw_deq_io_deq_bits_id;
  wire [30:0] bundleOut_0_aw_deq_io_deq_bits_addr;
  wire  bundleOut_0_aw_deq_io_deq_bits_echo_real_last;
  wire  bundleOut_0_w_deq_clock;
  wire  bundleOut_0_w_deq_reset;
  wire  bundleOut_0_w_deq_io_enq_ready;
  wire  bundleOut_0_w_deq_io_enq_valid;
  wire [31:0] bundleOut_0_w_deq_io_enq_bits_data;
  wire [3:0] bundleOut_0_w_deq_io_enq_bits_strb;
  wire  bundleOut_0_w_deq_io_enq_bits_last;
  wire  bundleOut_0_w_deq_io_deq_ready;
  wire  bundleOut_0_w_deq_io_deq_valid;
  wire [31:0] bundleOut_0_w_deq_io_deq_bits_data;
  wire [3:0] bundleOut_0_w_deq_io_deq_bits_strb;
  wire  bundleOut_0_w_deq_io_deq_bits_last;
  wire  bundleIn_0_b_deq_clock;
  wire  bundleIn_0_b_deq_reset;
  wire  bundleIn_0_b_deq_io_enq_ready;
  wire  bundleIn_0_b_deq_io_enq_valid;
  wire [3:0] bundleIn_0_b_deq_io_enq_bits_id;
  wire [1:0] bundleIn_0_b_deq_io_enq_bits_resp;
  wire  bundleIn_0_b_deq_io_enq_bits_echo_real_last;
  wire  bundleIn_0_b_deq_io_deq_ready;
  wire  bundleIn_0_b_deq_io_deq_valid;
  wire [3:0] bundleIn_0_b_deq_io_deq_bits_id;
  wire [1:0] bundleIn_0_b_deq_io_deq_bits_resp;
  wire  bundleIn_0_b_deq_io_deq_bits_echo_real_last;
  wire  bundleOut_0_ar_deq_clock;
  wire  bundleOut_0_ar_deq_reset;
  wire  bundleOut_0_ar_deq_io_enq_ready;
  wire  bundleOut_0_ar_deq_io_enq_valid;
  wire [3:0] bundleOut_0_ar_deq_io_enq_bits_id;
  wire [30:0] bundleOut_0_ar_deq_io_enq_bits_addr;
  wire  bundleOut_0_ar_deq_io_enq_bits_echo_real_last;
  wire  bundleOut_0_ar_deq_io_deq_ready;
  wire  bundleOut_0_ar_deq_io_deq_valid;
  wire [3:0] bundleOut_0_ar_deq_io_deq_bits_id;
  wire [30:0] bundleOut_0_ar_deq_io_deq_bits_addr;
  wire  bundleOut_0_ar_deq_io_deq_bits_echo_real_last;
  wire  bundleIn_0_r_deq_clock;
  wire  bundleIn_0_r_deq_reset;
  wire  bundleIn_0_r_deq_io_enq_ready;
  wire  bundleIn_0_r_deq_io_enq_valid;
  wire [3:0] bundleIn_0_r_deq_io_enq_bits_id;
  wire [31:0] bundleIn_0_r_deq_io_enq_bits_data;
  wire [1:0] bundleIn_0_r_deq_io_enq_bits_resp;
  wire  bundleIn_0_r_deq_io_enq_bits_echo_real_last;
  wire  bundleIn_0_r_deq_io_deq_ready;
  wire  bundleIn_0_r_deq_io_deq_valid;
  wire [3:0] bundleIn_0_r_deq_io_deq_bits_id;
  wire [31:0] bundleIn_0_r_deq_io_deq_bits_data;
  wire [1:0] bundleIn_0_r_deq_io_deq_bits_resp;
  wire  bundleIn_0_r_deq_io_deq_bits_echo_real_last;
  wire  bundleIn_0_r_deq_io_deq_bits_last;
  Queue_54 bundleOut_0_aw_deq (
    .clock(bundleOut_0_aw_deq_clock),
    .reset(bundleOut_0_aw_deq_reset),
    .io_enq_ready(bundleOut_0_aw_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_aw_deq_io_enq_valid),
    .io_enq_bits_id(bundleOut_0_aw_deq_io_enq_bits_id),
    .io_enq_bits_addr(bundleOut_0_aw_deq_io_enq_bits_addr),
    .io_enq_bits_echo_real_last(bundleOut_0_aw_deq_io_enq_bits_echo_real_last),
    .io_deq_ready(bundleOut_0_aw_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_aw_deq_io_deq_valid),
    .io_deq_bits_id(bundleOut_0_aw_deq_io_deq_bits_id),
    .io_deq_bits_addr(bundleOut_0_aw_deq_io_deq_bits_addr),
    .io_deq_bits_echo_real_last(bundleOut_0_aw_deq_io_deq_bits_echo_real_last)
  );
  Queue_5 bundleOut_0_w_deq (
    .clock(bundleOut_0_w_deq_clock),
    .reset(bundleOut_0_w_deq_reset),
    .io_enq_ready(bundleOut_0_w_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_w_deq_io_enq_valid),
    .io_enq_bits_data(bundleOut_0_w_deq_io_enq_bits_data),
    .io_enq_bits_strb(bundleOut_0_w_deq_io_enq_bits_strb),
    .io_enq_bits_last(bundleOut_0_w_deq_io_enq_bits_last),
    .io_deq_ready(bundleOut_0_w_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_w_deq_io_deq_valid),
    .io_deq_bits_data(bundleOut_0_w_deq_io_deq_bits_data),
    .io_deq_bits_strb(bundleOut_0_w_deq_io_deq_bits_strb),
    .io_deq_bits_last(bundleOut_0_w_deq_io_deq_bits_last)
  );
  Queue_40 bundleIn_0_b_deq (
    .clock(bundleIn_0_b_deq_clock),
    .reset(bundleIn_0_b_deq_reset),
    .io_enq_ready(bundleIn_0_b_deq_io_enq_ready),
    .io_enq_valid(bundleIn_0_b_deq_io_enq_valid),
    .io_enq_bits_id(bundleIn_0_b_deq_io_enq_bits_id),
    .io_enq_bits_resp(bundleIn_0_b_deq_io_enq_bits_resp),
    .io_enq_bits_echo_real_last(bundleIn_0_b_deq_io_enq_bits_echo_real_last),
    .io_deq_ready(bundleIn_0_b_deq_io_deq_ready),
    .io_deq_valid(bundleIn_0_b_deq_io_deq_valid),
    .io_deq_bits_id(bundleIn_0_b_deq_io_deq_bits_id),
    .io_deq_bits_resp(bundleIn_0_b_deq_io_deq_bits_resp),
    .io_deq_bits_echo_real_last(bundleIn_0_b_deq_io_deq_bits_echo_real_last)
  );
  Queue_54 bundleOut_0_ar_deq (
    .clock(bundleOut_0_ar_deq_clock),
    .reset(bundleOut_0_ar_deq_reset),
    .io_enq_ready(bundleOut_0_ar_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_ar_deq_io_enq_valid),
    .io_enq_bits_id(bundleOut_0_ar_deq_io_enq_bits_id),
    .io_enq_bits_addr(bundleOut_0_ar_deq_io_enq_bits_addr),
    .io_enq_bits_echo_real_last(bundleOut_0_ar_deq_io_enq_bits_echo_real_last),
    .io_deq_ready(bundleOut_0_ar_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_ar_deq_io_deq_valid),
    .io_deq_bits_id(bundleOut_0_ar_deq_io_deq_bits_id),
    .io_deq_bits_addr(bundleOut_0_ar_deq_io_deq_bits_addr),
    .io_deq_bits_echo_real_last(bundleOut_0_ar_deq_io_deq_bits_echo_real_last)
  );
  Queue_42 bundleIn_0_r_deq (
    .clock(bundleIn_0_r_deq_clock),
    .reset(bundleIn_0_r_deq_reset),
    .io_enq_ready(bundleIn_0_r_deq_io_enq_ready),
    .io_enq_valid(bundleIn_0_r_deq_io_enq_valid),
    .io_enq_bits_id(bundleIn_0_r_deq_io_enq_bits_id),
    .io_enq_bits_data(bundleIn_0_r_deq_io_enq_bits_data),
    .io_enq_bits_resp(bundleIn_0_r_deq_io_enq_bits_resp),
    .io_enq_bits_echo_real_last(bundleIn_0_r_deq_io_enq_bits_echo_real_last),
    .io_deq_ready(bundleIn_0_r_deq_io_deq_ready),
    .io_deq_valid(bundleIn_0_r_deq_io_deq_valid),
    .io_deq_bits_id(bundleIn_0_r_deq_io_deq_bits_id),
    .io_deq_bits_data(bundleIn_0_r_deq_io_deq_bits_data),
    .io_deq_bits_resp(bundleIn_0_r_deq_io_deq_bits_resp),
    .io_deq_bits_echo_real_last(bundleIn_0_r_deq_io_deq_bits_echo_real_last),
    .io_deq_bits_last(bundleIn_0_r_deq_io_deq_bits_last)
  );
  assign auto_in_aw_ready = bundleOut_0_aw_deq_io_enq_ready;
  assign auto_in_w_ready = bundleOut_0_w_deq_io_enq_ready;
  assign auto_in_b_valid = bundleIn_0_b_deq_io_deq_valid;
  assign auto_in_b_bits_id = bundleIn_0_b_deq_io_deq_bits_id;
  assign auto_in_b_bits_resp = bundleIn_0_b_deq_io_deq_bits_resp;
  assign auto_in_b_bits_echo_real_last = bundleIn_0_b_deq_io_deq_bits_echo_real_last;
  assign auto_in_ar_ready = bundleOut_0_ar_deq_io_enq_ready;
  assign auto_in_r_valid = bundleIn_0_r_deq_io_deq_valid;
  assign auto_in_r_bits_id = bundleIn_0_r_deq_io_deq_bits_id;
  assign auto_in_r_bits_data = bundleIn_0_r_deq_io_deq_bits_data;
  assign auto_in_r_bits_resp = bundleIn_0_r_deq_io_deq_bits_resp;
  assign auto_in_r_bits_echo_real_last = bundleIn_0_r_deq_io_deq_bits_echo_real_last;
  assign auto_in_r_bits_last = bundleIn_0_r_deq_io_deq_bits_last;
  assign auto_out_aw_valid = bundleOut_0_aw_deq_io_deq_valid;
  assign auto_out_aw_bits_id = bundleOut_0_aw_deq_io_deq_bits_id;
  assign auto_out_aw_bits_addr = bundleOut_0_aw_deq_io_deq_bits_addr;
  assign auto_out_aw_bits_echo_real_last = bundleOut_0_aw_deq_io_deq_bits_echo_real_last;
  assign auto_out_w_valid = bundleOut_0_w_deq_io_deq_valid;
  assign auto_out_w_bits_data = bundleOut_0_w_deq_io_deq_bits_data;
  assign auto_out_w_bits_strb = bundleOut_0_w_deq_io_deq_bits_strb;
  assign auto_out_b_ready = bundleIn_0_b_deq_io_enq_ready;
  assign auto_out_ar_valid = bundleOut_0_ar_deq_io_deq_valid;
  assign auto_out_ar_bits_id = bundleOut_0_ar_deq_io_deq_bits_id;
  assign auto_out_ar_bits_addr = bundleOut_0_ar_deq_io_deq_bits_addr;
  assign auto_out_ar_bits_echo_real_last = bundleOut_0_ar_deq_io_deq_bits_echo_real_last;
  assign auto_out_r_ready = bundleIn_0_r_deq_io_enq_ready;
  assign bundleOut_0_aw_deq_clock = clock;
  assign bundleOut_0_aw_deq_reset = reset;
  assign bundleOut_0_aw_deq_io_enq_valid = auto_in_aw_valid;
  assign bundleOut_0_aw_deq_io_enq_bits_id = auto_in_aw_bits_id;
  assign bundleOut_0_aw_deq_io_enq_bits_addr = auto_in_aw_bits_addr;
  assign bundleOut_0_aw_deq_io_enq_bits_echo_real_last = auto_in_aw_bits_echo_real_last;
  assign bundleOut_0_aw_deq_io_deq_ready = auto_out_aw_ready;
  assign bundleOut_0_w_deq_clock = clock;
  assign bundleOut_0_w_deq_reset = reset;
  assign bundleOut_0_w_deq_io_enq_valid = auto_in_w_valid;
  assign bundleOut_0_w_deq_io_enq_bits_data = auto_in_w_bits_data;
  assign bundleOut_0_w_deq_io_enq_bits_strb = auto_in_w_bits_strb;
  assign bundleOut_0_w_deq_io_enq_bits_last = auto_in_w_bits_last;
  assign bundleOut_0_w_deq_io_deq_ready = auto_out_w_ready;
  assign bundleIn_0_b_deq_clock = clock;
  assign bundleIn_0_b_deq_reset = reset;
  assign bundleIn_0_b_deq_io_enq_valid = auto_out_b_valid;
  assign bundleIn_0_b_deq_io_enq_bits_id = auto_out_b_bits_id;
  assign bundleIn_0_b_deq_io_enq_bits_resp = auto_out_b_bits_resp;
  assign bundleIn_0_b_deq_io_enq_bits_echo_real_last = auto_out_b_bits_echo_real_last;
  assign bundleIn_0_b_deq_io_deq_ready = auto_in_b_ready;
  assign bundleOut_0_ar_deq_clock = clock;
  assign bundleOut_0_ar_deq_reset = reset;
  assign bundleOut_0_ar_deq_io_enq_valid = auto_in_ar_valid;
  assign bundleOut_0_ar_deq_io_enq_bits_id = auto_in_ar_bits_id;
  assign bundleOut_0_ar_deq_io_enq_bits_addr = auto_in_ar_bits_addr;
  assign bundleOut_0_ar_deq_io_enq_bits_echo_real_last = auto_in_ar_bits_echo_real_last;
  assign bundleOut_0_ar_deq_io_deq_ready = auto_out_ar_ready;
  assign bundleIn_0_r_deq_clock = clock;
  assign bundleIn_0_r_deq_reset = reset;
  assign bundleIn_0_r_deq_io_enq_valid = auto_out_r_valid;
  assign bundleIn_0_r_deq_io_enq_bits_id = auto_out_r_bits_id;
  assign bundleIn_0_r_deq_io_enq_bits_data = auto_out_r_bits_data;
  assign bundleIn_0_r_deq_io_enq_bits_resp = auto_out_r_bits_resp;
  assign bundleIn_0_r_deq_io_enq_bits_echo_real_last = auto_out_r_bits_echo_real_last;
  assign bundleIn_0_r_deq_io_deq_ready = auto_in_r_ready;
endmodule