`default_nettype wire
module AXI4Fragmenter_2(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [29:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [1:0]  auto_in_aw_bits_burst,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [31:0] auto_in_w_bits_data,
  input  [3:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [29:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [31:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [3:0]  auto_out_aw_bits_id,
  output [29:0] auto_out_aw_bits_addr,
  output        auto_out_aw_bits_echo_real_last,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [31:0] auto_out_w_bits_data,
  output [3:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [3:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input         auto_out_b_bits_echo_real_last,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [3:0]  auto_out_ar_bits_id,
  output [29:0] auto_out_ar_bits_addr,
  output        auto_out_ar_bits_echo_real_last,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [3:0]  auto_out_r_bits_id,
  input  [31:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input         auto_out_r_bits_echo_real_last,
  input         auto_out_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  wire  deq_clock;
  wire  deq_reset;
  wire  deq_io_enq_ready;
  wire  deq_io_enq_valid;
  wire [3:0] deq_io_enq_bits_id;
  wire [29:0] deq_io_enq_bits_addr;
  wire [7:0] deq_io_enq_bits_len;
  wire [2:0] deq_io_enq_bits_size;
  wire [1:0] deq_io_enq_bits_burst;
  wire  deq_io_deq_ready;
  wire  deq_io_deq_valid;
  wire [3:0] deq_io_deq_bits_id;
  wire [29:0] deq_io_deq_bits_addr;
  wire [7:0] deq_io_deq_bits_len;
  wire [2:0] deq_io_deq_bits_size;
  wire [1:0] deq_io_deq_bits_burst;
  wire  deq_1_clock;
  wire  deq_1_reset;
  wire  deq_1_io_enq_ready;
  wire  deq_1_io_enq_valid;
  wire [3:0] deq_1_io_enq_bits_id;
  wire [29:0] deq_1_io_enq_bits_addr;
  wire [7:0] deq_1_io_enq_bits_len;
  wire [2:0] deq_1_io_enq_bits_size;
  wire [1:0] deq_1_io_enq_bits_burst;
  wire  deq_1_io_deq_ready;
  wire  deq_1_io_deq_valid;
  wire [3:0] deq_1_io_deq_bits_id;
  wire [29:0] deq_1_io_deq_bits_addr;
  wire [7:0] deq_1_io_deq_bits_len;
  wire [2:0] deq_1_io_deq_bits_size;
  wire [1:0] deq_1_io_deq_bits_burst;
  wire  in_w_deq_clock;
  wire  in_w_deq_reset;
  wire  in_w_deq_io_enq_ready;
  wire  in_w_deq_io_enq_valid;
  wire [31:0] in_w_deq_io_enq_bits_data;
  wire [3:0] in_w_deq_io_enq_bits_strb;
  wire  in_w_deq_io_enq_bits_last;
  wire  in_w_deq_io_deq_ready;
  wire  in_w_deq_io_deq_valid;
  wire [31:0] in_w_deq_io_deq_bits_data;
  wire [3:0] in_w_deq_io_deq_bits_strb;
  wire  in_w_deq_io_deq_bits_last;
  reg  busy;
  reg [29:0] r_addr;
  reg [7:0] r_len;
  wire [7:0] irr_bits_len = deq_io_deq_bits_len;
  wire [7:0] len = busy ? r_len : irr_bits_len;
  wire [29:0] irr_bits_addr = deq_io_deq_bits_addr;
  wire [29:0] addr = busy ? r_addr : irr_bits_addr;
  wire [1:0] irr_bits_burst = deq_io_deq_bits_burst;
  wire  fixed = irr_bits_burst == 2'h0;
  wire [2:0] irr_bits_size = deq_io_deq_bits_size;
  wire [15:0] _inc_addr_T = 16'h1 << irr_bits_size;
  wire [29:0] _GEN_48 = {{14'd0}, _inc_addr_T};
  wire [29:0] inc_addr = addr + _GEN_48;
  wire [15:0] _wrapMask_T = {irr_bits_len,8'hff};
  wire [22:0] _GEN_1 = {{7'd0}, _wrapMask_T};
  wire [22:0] _wrapMask_T_1 = _GEN_1 << irr_bits_size;
  wire [14:0] wrapMask = _wrapMask_T_1[22:8];
  wire [29:0] _GEN_49 = {{15'd0}, wrapMask};
  wire [29:0] _mux_addr_T = inc_addr & _GEN_49;
  wire [29:0] _mux_addr_T_1 = ~irr_bits_addr;
  wire [29:0] _mux_addr_T_2 = _mux_addr_T_1 | _GEN_49;
  wire [29:0] _mux_addr_T_3 = ~_mux_addr_T_2;
  wire [29:0] _mux_addr_T_4 = _mux_addr_T | _mux_addr_T_3;
  wire  ar_last = 8'h0 == len;
  wire [29:0] _out_bits_addr_T = ~addr;
  wire [8:0] _out_bits_addr_T_2 = 9'h3 << irr_bits_size;
  wire [1:0] _out_bits_addr_T_4 = ~_out_bits_addr_T_2[1:0];
  wire [29:0] _GEN_51 = {{28'd0}, _out_bits_addr_T_4};
  wire [29:0] _out_bits_addr_T_5 = _out_bits_addr_T | _GEN_51;
  wire  irr_valid = deq_io_deq_valid;
  wire  _T_2 = auto_out_ar_ready & irr_valid;
  wire [8:0] _GEN_52 = {{1'd0}, len};
  wire [8:0] _r_len_T_1 = _GEN_52 - 9'h1;
  wire [8:0] _GEN_4 = _T_2 ? _r_len_T_1 : {{1'd0}, r_len};
  reg  busy_1;
  reg [29:0] r_addr_1;
  reg [7:0] r_len_1;
  wire [7:0] irr_1_bits_len = deq_1_io_deq_bits_len;
  wire [7:0] len_1 = busy_1 ? r_len_1 : irr_1_bits_len;
  wire [29:0] irr_1_bits_addr = deq_1_io_deq_bits_addr;
  wire [29:0] addr_1 = busy_1 ? r_addr_1 : irr_1_bits_addr;
  wire [1:0] irr_1_bits_burst = deq_1_io_deq_bits_burst;
  wire  fixed_1 = irr_1_bits_burst == 2'h0;
  wire [2:0] irr_1_bits_size = deq_1_io_deq_bits_size;
  wire [15:0] _inc_addr_T_2 = 16'h1 << irr_1_bits_size;
  wire [29:0] _GEN_57 = {{14'd0}, _inc_addr_T_2};
  wire [29:0] inc_addr_1 = addr_1 + _GEN_57;
  wire [15:0] _wrapMask_T_2 = {irr_1_bits_len,8'hff};
  wire [22:0] _GEN_3 = {{7'd0}, _wrapMask_T_2};
  wire [22:0] _wrapMask_T_3 = _GEN_3 << irr_1_bits_size;
  wire [14:0] wrapMask_1 = _wrapMask_T_3[22:8];
  wire [29:0] _GEN_58 = {{15'd0}, wrapMask_1};
  wire [29:0] _mux_addr_T_5 = inc_addr_1 & _GEN_58;
  wire [29:0] _mux_addr_T_6 = ~irr_1_bits_addr;
  wire [29:0] _mux_addr_T_7 = _mux_addr_T_6 | _GEN_58;
  wire [29:0] _mux_addr_T_8 = ~_mux_addr_T_7;
  wire [29:0] _mux_addr_T_9 = _mux_addr_T_5 | _mux_addr_T_8;
  wire  aw_last = 8'h0 == len_1;
  reg [8:0] w_counter;
  wire  w_idle = w_counter == 9'h0;
  reg  wbeats_latched;
  wire  _in_aw_ready_T = w_idle | wbeats_latched;
  wire  in_aw_ready = auto_out_aw_ready & (w_idle | wbeats_latched);
  wire [29:0] _out_bits_addr_T_7 = ~addr_1;
  wire [8:0] _out_bits_addr_T_9 = 9'h3 << irr_1_bits_size;
  wire [1:0] _out_bits_addr_T_11 = ~_out_bits_addr_T_9[1:0];
  wire [29:0] _GEN_60 = {{28'd0}, _out_bits_addr_T_11};
  wire [29:0] _out_bits_addr_T_12 = _out_bits_addr_T_7 | _GEN_60;
  wire  irr_1_valid = deq_1_io_deq_valid;
  wire  _T_5 = in_aw_ready & irr_1_valid;
  wire [8:0] _GEN_61 = {{1'd0}, len_1};
  wire [8:0] _r_len_T_3 = _GEN_61 - 9'h1;
  wire [8:0] _GEN_9 = _T_5 ? _r_len_T_3 : {{1'd0}, r_len_1};
  wire  wbeats_valid = irr_1_valid & ~wbeats_latched;
  wire  _GEN_10 = wbeats_valid & w_idle | wbeats_latched;
  wire  bundleOut_0_aw_valid = irr_1_valid & _in_aw_ready_T;
  wire  _T_7 = auto_out_aw_ready & bundleOut_0_aw_valid;
  wire [8:0] _w_todo_T = wbeats_valid ? 9'h1 : 9'h0;
  wire [8:0] w_todo = w_idle ? _w_todo_T : w_counter;
  wire  w_last = w_todo == 9'h1;
  wire  in_w_valid = in_w_deq_io_deq_valid;
  wire  _bundleOut_0_w_valid_T_1 = ~w_idle | wbeats_valid;
  wire  bundleOut_0_w_valid = in_w_valid & (~w_idle | wbeats_valid);
  wire  _w_counter_T = auto_out_w_ready & bundleOut_0_w_valid;
  wire [8:0] _GEN_62 = {{8'd0}, _w_counter_T};
  wire [8:0] _w_counter_T_2 = w_todo - _GEN_62;
  wire  _T_13 = ~reset;
  wire  in_w_bits_last = in_w_deq_io_deq_bits_last;
  wire  bundleOut_0_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last;
  reg [1:0] error_0;
  reg [1:0] error_1;
  reg [1:0] error_2;
  reg [1:0] error_3;
  reg [1:0] error_4;
  reg [1:0] error_5;
  reg [1:0] error_6;
  reg [1:0] error_7;
  reg [1:0] error_8;
  reg [1:0] error_9;
  reg [1:0] error_10;
  reg [1:0] error_11;
  reg [1:0] error_12;
  reg [1:0] error_13;
  reg [1:0] error_14;
  reg [1:0] error_15;
  wire [1:0] _GEN_13 = 4'h1 == auto_out_b_bits_id ? error_1 : error_0;
  wire [1:0] _GEN_14 = 4'h2 == auto_out_b_bits_id ? error_2 : _GEN_13;
  wire [1:0] _GEN_15 = 4'h3 == auto_out_b_bits_id ? error_3 : _GEN_14;
  wire [1:0] _GEN_16 = 4'h4 == auto_out_b_bits_id ? error_4 : _GEN_15;
  wire [1:0] _GEN_17 = 4'h5 == auto_out_b_bits_id ? error_5 : _GEN_16;
  wire [1:0] _GEN_18 = 4'h6 == auto_out_b_bits_id ? error_6 : _GEN_17;
  wire [1:0] _GEN_19 = 4'h7 == auto_out_b_bits_id ? error_7 : _GEN_18;
  wire [1:0] _GEN_20 = 4'h8 == auto_out_b_bits_id ? error_8 : _GEN_19;
  wire [1:0] _GEN_21 = 4'h9 == auto_out_b_bits_id ? error_9 : _GEN_20;
  wire [1:0] _GEN_22 = 4'ha == auto_out_b_bits_id ? error_10 : _GEN_21;
  wire [1:0] _GEN_23 = 4'hb == auto_out_b_bits_id ? error_11 : _GEN_22;
  wire [1:0] _GEN_24 = 4'hc == auto_out_b_bits_id ? error_12 : _GEN_23;
  wire [1:0] _GEN_25 = 4'hd == auto_out_b_bits_id ? error_13 : _GEN_24;
  wire [1:0] _GEN_26 = 4'he == auto_out_b_bits_id ? error_14 : _GEN_25;
  wire [1:0] _GEN_27 = 4'hf == auto_out_b_bits_id ? error_15 : _GEN_26;
  wire [15:0] _T_22 = 16'h1 << auto_out_b_bits_id;
  wire  _T_40 = bundleOut_0_b_ready & auto_out_b_valid;
  wire [1:0] _error_0_T = error_0 | auto_out_b_bits_resp;
  wire [1:0] _error_1_T = error_1 | auto_out_b_bits_resp;
  wire [1:0] _error_2_T = error_2 | auto_out_b_bits_resp;
  wire [1:0] _error_3_T = error_3 | auto_out_b_bits_resp;
  wire [1:0] _error_4_T = error_4 | auto_out_b_bits_resp;
  wire [1:0] _error_5_T = error_5 | auto_out_b_bits_resp;
  wire [1:0] _error_6_T = error_6 | auto_out_b_bits_resp;
  wire [1:0] _error_7_T = error_7 | auto_out_b_bits_resp;
  wire [1:0] _error_8_T = error_8 | auto_out_b_bits_resp;
  wire [1:0] _error_9_T = error_9 | auto_out_b_bits_resp;
  wire [1:0] _error_10_T = error_10 | auto_out_b_bits_resp;
  wire [1:0] _error_11_T = error_11 | auto_out_b_bits_resp;
  wire [1:0] _error_12_T = error_12 | auto_out_b_bits_resp;
  wire [1:0] _error_13_T = error_13 | auto_out_b_bits_resp;
  wire [1:0] _error_14_T = error_14 | auto_out_b_bits_resp;
  wire [1:0] _error_15_T = error_15 | auto_out_b_bits_resp;
  Queue_51 deq (
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_id(deq_io_enq_bits_id),
    .io_enq_bits_addr(deq_io_enq_bits_addr),
    .io_enq_bits_len(deq_io_enq_bits_len),
    .io_enq_bits_size(deq_io_enq_bits_size),
    .io_enq_bits_burst(deq_io_enq_bits_burst),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_id(deq_io_deq_bits_id),
    .io_deq_bits_addr(deq_io_deq_bits_addr),
    .io_deq_bits_len(deq_io_deq_bits_len),
    .io_deq_bits_size(deq_io_deq_bits_size),
    .io_deq_bits_burst(deq_io_deq_bits_burst)
  );
  Queue_51 deq_1 (
    .clock(deq_1_clock),
    .reset(deq_1_reset),
    .io_enq_ready(deq_1_io_enq_ready),
    .io_enq_valid(deq_1_io_enq_valid),
    .io_enq_bits_id(deq_1_io_enq_bits_id),
    .io_enq_bits_addr(deq_1_io_enq_bits_addr),
    .io_enq_bits_len(deq_1_io_enq_bits_len),
    .io_enq_bits_size(deq_1_io_enq_bits_size),
    .io_enq_bits_burst(deq_1_io_enq_bits_burst),
    .io_deq_ready(deq_1_io_deq_ready),
    .io_deq_valid(deq_1_io_deq_valid),
    .io_deq_bits_id(deq_1_io_deq_bits_id),
    .io_deq_bits_addr(deq_1_io_deq_bits_addr),
    .io_deq_bits_len(deq_1_io_deq_bits_len),
    .io_deq_bits_size(deq_1_io_deq_bits_size),
    .io_deq_bits_burst(deq_1_io_deq_bits_burst)
  );
  Queue_2 in_w_deq (
    .clock(in_w_deq_clock),
    .reset(in_w_deq_reset),
    .io_enq_ready(in_w_deq_io_enq_ready),
    .io_enq_valid(in_w_deq_io_enq_valid),
    .io_enq_bits_data(in_w_deq_io_enq_bits_data),
    .io_enq_bits_strb(in_w_deq_io_enq_bits_strb),
    .io_enq_bits_last(in_w_deq_io_enq_bits_last),
    .io_deq_ready(in_w_deq_io_deq_ready),
    .io_deq_valid(in_w_deq_io_deq_valid),
    .io_deq_bits_data(in_w_deq_io_deq_bits_data),
    .io_deq_bits_strb(in_w_deq_io_deq_bits_strb),
    .io_deq_bits_last(in_w_deq_io_deq_bits_last)
  );
  assign auto_in_aw_ready = deq_1_io_enq_ready;
  assign auto_in_w_ready = in_w_deq_io_enq_ready;
  assign auto_in_b_valid = auto_out_b_valid & auto_out_b_bits_echo_real_last;
  assign auto_in_b_bits_id = auto_out_b_bits_id;
  assign auto_in_b_bits_resp = auto_out_b_bits_resp | _GEN_27;
  assign auto_in_ar_ready = deq_io_enq_ready;
  assign auto_in_r_valid = auto_out_r_valid;
  assign auto_in_r_bits_id = auto_out_r_bits_id;
  assign auto_in_r_bits_data = auto_out_r_bits_data;
  assign auto_in_r_bits_resp = auto_out_r_bits_resp;
  assign auto_in_r_bits_last = auto_out_r_bits_last & auto_out_r_bits_echo_real_last;
  assign auto_out_aw_valid = irr_1_valid & _in_aw_ready_T;
  assign auto_out_aw_bits_id = deq_1_io_deq_bits_id;
  assign auto_out_aw_bits_addr = ~_out_bits_addr_T_12;
  assign auto_out_aw_bits_echo_real_last = 8'h0 == len_1;
  assign auto_out_w_valid = in_w_valid & (~w_idle | wbeats_valid);
  assign auto_out_w_bits_data = in_w_deq_io_deq_bits_data;
  assign auto_out_w_bits_strb = in_w_deq_io_deq_bits_strb;
  assign auto_out_w_bits_last = w_todo == 9'h1;
  assign auto_out_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last;
  assign auto_out_ar_valid = deq_io_deq_valid;
  assign auto_out_ar_bits_id = deq_io_deq_bits_id;
  assign auto_out_ar_bits_addr = ~_out_bits_addr_T_5;
  assign auto_out_ar_bits_echo_real_last = 8'h0 == len;
  assign auto_out_r_ready = auto_in_r_ready;
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = auto_in_ar_valid;
  assign deq_io_enq_bits_id = auto_in_ar_bits_id;
  assign deq_io_enq_bits_addr = auto_in_ar_bits_addr;
  assign deq_io_enq_bits_len = auto_in_ar_bits_len;
  assign deq_io_enq_bits_size = auto_in_ar_bits_size;
  assign deq_io_enq_bits_burst = auto_in_ar_bits_burst;
  assign deq_io_deq_ready = auto_out_ar_ready & ar_last;
  assign deq_1_clock = clock;
  assign deq_1_reset = reset;
  assign deq_1_io_enq_valid = auto_in_aw_valid;
  assign deq_1_io_enq_bits_id = auto_in_aw_bits_id;
  assign deq_1_io_enq_bits_addr = auto_in_aw_bits_addr;
  assign deq_1_io_enq_bits_len = auto_in_aw_bits_len;
  assign deq_1_io_enq_bits_size = auto_in_aw_bits_size;
  assign deq_1_io_enq_bits_burst = auto_in_aw_bits_burst;
  assign deq_1_io_deq_ready = in_aw_ready & aw_last;
  assign in_w_deq_clock = clock;
  assign in_w_deq_reset = reset;
  assign in_w_deq_io_enq_valid = auto_in_w_valid;
  assign in_w_deq_io_enq_bits_data = auto_in_w_bits_data;
  assign in_w_deq_io_enq_bits_strb = auto_in_w_bits_strb;
  assign in_w_deq_io_enq_bits_last = auto_in_w_bits_last;
  assign in_w_deq_io_deq_ready = auto_out_w_ready & _bundleOut_0_w_valid_T_1;
  always @(posedge clock) begin
    if (reset) begin
      busy <= 1'h0;
    end else if (_T_2) begin
      busy <= ~ar_last;
    end
    if (_T_2) begin
      if (fixed) begin
        r_addr <= irr_bits_addr;
      end else if (irr_bits_burst == 2'h2) begin
        r_addr <= _mux_addr_T_4;
      end else begin
        r_addr <= inc_addr;
      end
    end
    r_len <= _GEN_4[7:0];
    if (reset) begin
      busy_1 <= 1'h0;
    end else if (_T_5) begin
      busy_1 <= ~aw_last;
    end
    if (_T_5) begin
      if (fixed_1) begin
        r_addr_1 <= irr_1_bits_addr;
      end else if (irr_1_bits_burst == 2'h2) begin
        r_addr_1 <= _mux_addr_T_9;
      end else begin
        r_addr_1 <= inc_addr_1;
      end
    end
    r_len_1 <= _GEN_9[7:0];
    if (reset) begin
      w_counter <= 9'h0;
    end else begin
      w_counter <= _w_counter_T_2;
    end
    if (reset) begin
      wbeats_latched <= 1'h0;
    end else if (_T_7) begin
      wbeats_latched <= 1'h0;
    end else begin
      wbeats_latched <= _GEN_10;
    end
    if (reset) begin
      error_0 <= 2'h0;
    end else if (_T_22[0] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_0 <= 2'h0;
      end else begin
        error_0 <= _error_0_T;
      end
    end
    if (reset) begin
      error_1 <= 2'h0;
    end else if (_T_22[1] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_1 <= 2'h0;
      end else begin
        error_1 <= _error_1_T;
      end
    end
    if (reset) begin
      error_2 <= 2'h0;
    end else if (_T_22[2] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_2 <= 2'h0;
      end else begin
        error_2 <= _error_2_T;
      end
    end
    if (reset) begin
      error_3 <= 2'h0;
    end else if (_T_22[3] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_3 <= 2'h0;
      end else begin
        error_3 <= _error_3_T;
      end
    end
    if (reset) begin
      error_4 <= 2'h0;
    end else if (_T_22[4] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_4 <= 2'h0;
      end else begin
        error_4 <= _error_4_T;
      end
    end
    if (reset) begin
      error_5 <= 2'h0;
    end else if (_T_22[5] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_5 <= 2'h0;
      end else begin
        error_5 <= _error_5_T;
      end
    end
    if (reset) begin
      error_6 <= 2'h0;
    end else if (_T_22[6] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_6 <= 2'h0;
      end else begin
        error_6 <= _error_6_T;
      end
    end
    if (reset) begin
      error_7 <= 2'h0;
    end else if (_T_22[7] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_7 <= 2'h0;
      end else begin
        error_7 <= _error_7_T;
      end
    end
    if (reset) begin
      error_8 <= 2'h0;
    end else if (_T_22[8] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_8 <= 2'h0;
      end else begin
        error_8 <= _error_8_T;
      end
    end
    if (reset) begin
      error_9 <= 2'h0;
    end else if (_T_22[9] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_9 <= 2'h0;
      end else begin
        error_9 <= _error_9_T;
      end
    end
    if (reset) begin
      error_10 <= 2'h0;
    end else if (_T_22[10] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_10 <= 2'h0;
      end else begin
        error_10 <= _error_10_T;
      end
    end
    if (reset) begin
      error_11 <= 2'h0;
    end else if (_T_22[11] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_11 <= 2'h0;
      end else begin
        error_11 <= _error_11_T;
      end
    end
    if (reset) begin
      error_12 <= 2'h0;
    end else if (_T_22[12] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_12 <= 2'h0;
      end else begin
        error_12 <= _error_12_T;
      end
    end
    if (reset) begin
      error_13 <= 2'h0;
    end else if (_T_22[13] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_13 <= 2'h0;
      end else begin
        error_13 <= _error_13_T;
      end
    end
    if (reset) begin
      error_14 <= 2'h0;
    end else if (_T_22[14] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_14 <= 2'h0;
      end else begin
        error_14 <= _error_14_T;
      end
    end
    if (reset) begin
      error_15 <= 2'h0;
    end else if (_T_22[15] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_15 <= 2'h0;
      end else begin
        error_15 <= _error_15_T;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_w_counter_T | w_todo != 9'h0) & ~reset) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~_w_counter_T | w_todo != 9'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Fragmenter.scala:172 assert (!out.w.fire() || w_todo =/= UInt(0)) // underflow impossible\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~bundleOut_0_w_valid | ~in_w_bits_last | w_last) & _T_13) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13 & ~(~bundleOut_0_w_valid | ~in_w_bits_last | w_last)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Fragmenter.scala:181 assert (!out.w.valid || !in_w.bits.last || w_last)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  r_addr = _RAND_1[29:0];
  _RAND_2 = {1{`RANDOM}};
  r_len = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  busy_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  r_addr_1 = _RAND_4[29:0];
  _RAND_5 = {1{`RANDOM}};
  r_len_1 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  w_counter = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  wbeats_latched = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  error_0 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  error_1 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  error_2 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  error_3 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  error_4 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  error_5 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  error_6 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  error_7 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  error_8 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  error_9 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  error_10 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  error_11 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  error_12 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  error_13 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  error_14 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  error_15 = _RAND_23[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule