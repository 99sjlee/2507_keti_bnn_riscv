`default_nettype wire
module AXI4Deinterleaver(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [1:0]  auto_in_aw_bits_burst,
  input         auto_in_aw_bits_lock,
  input  [3:0]  auto_in_aw_bits_cache,
  input  [2:0]  auto_in_aw_bits_prot,
  input  [3:0]  auto_in_aw_bits_qos,
  input  [3:0]  auto_in_aw_bits_echo_tl_state_size,
  input  [4:0]  auto_in_aw_bits_echo_tl_state_source,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [31:0] auto_in_w_bits_data,
  input  [3:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output [3:0]  auto_in_b_bits_echo_tl_state_size,
  output [4:0]  auto_in_b_bits_echo_tl_state_source,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input         auto_in_ar_bits_lock,
  input  [3:0]  auto_in_ar_bits_cache,
  input  [2:0]  auto_in_ar_bits_prot,
  input  [3:0]  auto_in_ar_bits_qos,
  input  [3:0]  auto_in_ar_bits_echo_tl_state_size,
  input  [4:0]  auto_in_ar_bits_echo_tl_state_source,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [31:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output [3:0]  auto_in_r_bits_echo_tl_state_size,
  output [4:0]  auto_in_r_bits_echo_tl_state_source,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [3:0]  auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output [7:0]  auto_out_aw_bits_len,
  output [2:0]  auto_out_aw_bits_size,
  output [1:0]  auto_out_aw_bits_burst,
  output        auto_out_aw_bits_lock,
  output [3:0]  auto_out_aw_bits_cache,
  output [2:0]  auto_out_aw_bits_prot,
  output [3:0]  auto_out_aw_bits_qos,
  output [3:0]  auto_out_aw_bits_echo_tl_state_size,
  output [4:0]  auto_out_aw_bits_echo_tl_state_source,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [31:0] auto_out_w_bits_data,
  output [3:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [3:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input  [3:0]  auto_out_b_bits_echo_tl_state_size,
  input  [4:0]  auto_out_b_bits_echo_tl_state_source,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [3:0]  auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output [7:0]  auto_out_ar_bits_len,
  output [2:0]  auto_out_ar_bits_size,
  output [1:0]  auto_out_ar_bits_burst,
  output        auto_out_ar_bits_lock,
  output [3:0]  auto_out_ar_bits_cache,
  output [2:0]  auto_out_ar_bits_prot,
  output [3:0]  auto_out_ar_bits_qos,
  output [3:0]  auto_out_ar_bits_echo_tl_state_size,
  output [4:0]  auto_out_ar_bits_echo_tl_state_source,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [3:0]  auto_out_r_bits_id,
  input  [31:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input  [3:0]  auto_out_r_bits_echo_tl_state_size,
  input  [4:0]  auto_out_r_bits_echo_tl_state_source,
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
`endif // RANDOMIZE_REG_INIT
  wire  qs_queue_0_clock;
  wire  qs_queue_0_reset;
  wire  qs_queue_0_io_enq_ready;
  wire  qs_queue_0_io_enq_valid;
  wire [3:0] qs_queue_0_io_enq_bits_id;
  wire [31:0] qs_queue_0_io_enq_bits_data;
  wire [1:0] qs_queue_0_io_enq_bits_resp;
  wire [3:0] qs_queue_0_io_enq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_0_io_enq_bits_echo_tl_state_source;
  wire  qs_queue_0_io_enq_bits_last;
  wire  qs_queue_0_io_deq_ready;
  wire  qs_queue_0_io_deq_valid;
  wire [3:0] qs_queue_0_io_deq_bits_id;
  wire [31:0] qs_queue_0_io_deq_bits_data;
  wire [1:0] qs_queue_0_io_deq_bits_resp;
  wire [3:0] qs_queue_0_io_deq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_0_io_deq_bits_echo_tl_state_source;
  wire  qs_queue_0_io_deq_bits_last;
  wire  qs_queue_1_clock;
  wire  qs_queue_1_reset;
  wire  qs_queue_1_io_enq_ready;
  wire  qs_queue_1_io_enq_valid;
  wire [3:0] qs_queue_1_io_enq_bits_id;
  wire [31:0] qs_queue_1_io_enq_bits_data;
  wire [1:0] qs_queue_1_io_enq_bits_resp;
  wire [3:0] qs_queue_1_io_enq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_1_io_enq_bits_echo_tl_state_source;
  wire  qs_queue_1_io_enq_bits_last;
  wire  qs_queue_1_io_deq_ready;
  wire  qs_queue_1_io_deq_valid;
  wire [3:0] qs_queue_1_io_deq_bits_id;
  wire [31:0] qs_queue_1_io_deq_bits_data;
  wire [1:0] qs_queue_1_io_deq_bits_resp;
  wire [3:0] qs_queue_1_io_deq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_1_io_deq_bits_echo_tl_state_source;
  wire  qs_queue_1_io_deq_bits_last;
  wire  qs_queue_2_clock;
  wire  qs_queue_2_reset;
  wire  qs_queue_2_io_enq_ready;
  wire  qs_queue_2_io_enq_valid;
  wire [3:0] qs_queue_2_io_enq_bits_id;
  wire [31:0] qs_queue_2_io_enq_bits_data;
  wire [1:0] qs_queue_2_io_enq_bits_resp;
  wire [3:0] qs_queue_2_io_enq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_2_io_enq_bits_echo_tl_state_source;
  wire  qs_queue_2_io_enq_bits_last;
  wire  qs_queue_2_io_deq_ready;
  wire  qs_queue_2_io_deq_valid;
  wire [3:0] qs_queue_2_io_deq_bits_id;
  wire [31:0] qs_queue_2_io_deq_bits_data;
  wire [1:0] qs_queue_2_io_deq_bits_resp;
  wire [3:0] qs_queue_2_io_deq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_2_io_deq_bits_echo_tl_state_source;
  wire  qs_queue_2_io_deq_bits_last;
  wire  qs_queue_3_clock;
  wire  qs_queue_3_reset;
  wire  qs_queue_3_io_enq_ready;
  wire  qs_queue_3_io_enq_valid;
  wire [3:0] qs_queue_3_io_enq_bits_id;
  wire [31:0] qs_queue_3_io_enq_bits_data;
  wire [1:0] qs_queue_3_io_enq_bits_resp;
  wire [3:0] qs_queue_3_io_enq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_3_io_enq_bits_echo_tl_state_source;
  wire  qs_queue_3_io_enq_bits_last;
  wire  qs_queue_3_io_deq_ready;
  wire  qs_queue_3_io_deq_valid;
  wire [3:0] qs_queue_3_io_deq_bits_id;
  wire [31:0] qs_queue_3_io_deq_bits_data;
  wire [1:0] qs_queue_3_io_deq_bits_resp;
  wire [3:0] qs_queue_3_io_deq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_3_io_deq_bits_echo_tl_state_source;
  wire  qs_queue_3_io_deq_bits_last;
  wire  qs_queue_4_clock;
  wire  qs_queue_4_reset;
  wire  qs_queue_4_io_enq_ready;
  wire  qs_queue_4_io_enq_valid;
  wire [3:0] qs_queue_4_io_enq_bits_id;
  wire [31:0] qs_queue_4_io_enq_bits_data;
  wire [1:0] qs_queue_4_io_enq_bits_resp;
  wire [3:0] qs_queue_4_io_enq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_4_io_enq_bits_echo_tl_state_source;
  wire  qs_queue_4_io_enq_bits_last;
  wire  qs_queue_4_io_deq_ready;
  wire  qs_queue_4_io_deq_valid;
  wire [3:0] qs_queue_4_io_deq_bits_id;
  wire [31:0] qs_queue_4_io_deq_bits_data;
  wire [1:0] qs_queue_4_io_deq_bits_resp;
  wire [3:0] qs_queue_4_io_deq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_4_io_deq_bits_echo_tl_state_source;
  wire  qs_queue_4_io_deq_bits_last;
  wire  qs_queue_5_clock;
  wire  qs_queue_5_reset;
  wire  qs_queue_5_io_enq_ready;
  wire  qs_queue_5_io_enq_valid;
  wire [3:0] qs_queue_5_io_enq_bits_id;
  wire [31:0] qs_queue_5_io_enq_bits_data;
  wire [1:0] qs_queue_5_io_enq_bits_resp;
  wire [3:0] qs_queue_5_io_enq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_5_io_enq_bits_echo_tl_state_source;
  wire  qs_queue_5_io_enq_bits_last;
  wire  qs_queue_5_io_deq_ready;
  wire  qs_queue_5_io_deq_valid;
  wire [3:0] qs_queue_5_io_deq_bits_id;
  wire [31:0] qs_queue_5_io_deq_bits_data;
  wire [1:0] qs_queue_5_io_deq_bits_resp;
  wire [3:0] qs_queue_5_io_deq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_5_io_deq_bits_echo_tl_state_source;
  wire  qs_queue_5_io_deq_bits_last;
  wire  qs_queue_6_clock;
  wire  qs_queue_6_reset;
  wire  qs_queue_6_io_enq_ready;
  wire  qs_queue_6_io_enq_valid;
  wire [3:0] qs_queue_6_io_enq_bits_id;
  wire [31:0] qs_queue_6_io_enq_bits_data;
  wire [1:0] qs_queue_6_io_enq_bits_resp;
  wire [3:0] qs_queue_6_io_enq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_6_io_enq_bits_echo_tl_state_source;
  wire  qs_queue_6_io_enq_bits_last;
  wire  qs_queue_6_io_deq_ready;
  wire  qs_queue_6_io_deq_valid;
  wire [3:0] qs_queue_6_io_deq_bits_id;
  wire [31:0] qs_queue_6_io_deq_bits_data;
  wire [1:0] qs_queue_6_io_deq_bits_resp;
  wire [3:0] qs_queue_6_io_deq_bits_echo_tl_state_size;
  wire [4:0] qs_queue_6_io_deq_bits_echo_tl_state_source;
  wire  qs_queue_6_io_deq_bits_last;
  wire [15:0] enq_OH = 16'h1 << auto_out_r_bits_id;
  wire  enq_OH_bools_7 = enq_OH[7];
  wire  queue_wire_7_enq_valid = enq_OH_bools_7 & auto_out_r_valid;
  wire  _qs_T_2 = ~reset;
  wire  enq_OH_bools_8 = enq_OH[8];
  wire  queue_wire_8_enq_valid = enq_OH_bools_8 & auto_out_r_valid;
  wire  enq_OH_bools_9 = enq_OH[9];
  wire  queue_wire_9_enq_valid = enq_OH_bools_9 & auto_out_r_valid;
  wire  enq_OH_bools_10 = enq_OH[10];
  wire  queue_wire_10_enq_valid = enq_OH_bools_10 & auto_out_r_valid;
  wire  enq_OH_bools_11 = enq_OH[11];
  wire  queue_wire_11_enq_valid = enq_OH_bools_11 & auto_out_r_valid;
  wire  enq_OH_bools_12 = enq_OH[12];
  wire  queue_wire_12_enq_valid = enq_OH_bools_12 & auto_out_r_valid;
  wire  enq_OH_bools_13 = enq_OH[13];
  wire  queue_wire_13_enq_valid = enq_OH_bools_13 & auto_out_r_valid;
  wire  enq_OH_bools_14 = enq_OH[14];
  wire  queue_wire_14_enq_valid = enq_OH_bools_14 & auto_out_r_valid;
  wire  enq_OH_bools_15 = enq_OH[15];
  wire  queue_wire_15_enq_valid = enq_OH_bools_15 & auto_out_r_valid;
  reg  locked;
  reg [3:0] deq_id;
  wire [15:0] deq_OH = 16'h1 << deq_id;
  reg [4:0] pending_count;
  wire  enq_readys_6 = qs_queue_6_io_enq_ready;
  wire  enq_readys_5 = qs_queue_5_io_enq_ready;
  wire  enq_readys_4 = qs_queue_4_io_enq_ready;
  wire  enq_readys_3 = qs_queue_3_io_enq_ready;
  wire  enq_readys_2 = qs_queue_2_io_enq_ready;
  wire  enq_readys_1 = qs_queue_1_io_enq_ready;
  wire  enq_readys_0 = qs_queue_0_io_enq_ready;
  wire  _GEN_99 = 4'h1 == auto_out_r_bits_id ? enq_readys_1 : enq_readys_0;
  wire  _GEN_100 = 4'h2 == auto_out_r_bits_id ? enq_readys_2 : _GEN_99;
  wire  _GEN_101 = 4'h3 == auto_out_r_bits_id ? enq_readys_3 : _GEN_100;
  wire  _GEN_102 = 4'h4 == auto_out_r_bits_id ? enq_readys_4 : _GEN_101;
  wire  _GEN_103 = 4'h5 == auto_out_r_bits_id ? enq_readys_5 : _GEN_102;
  wire  _GEN_104 = 4'h6 == auto_out_r_bits_id ? enq_readys_6 : _GEN_103;
  wire  _GEN_105 = 4'h7 == auto_out_r_bits_id ? 1'h0 : _GEN_104;
  wire  _GEN_106 = 4'h8 == auto_out_r_bits_id ? 1'h0 : _GEN_105;
  wire  _GEN_107 = 4'h9 == auto_out_r_bits_id ? 1'h0 : _GEN_106;
  wire  _GEN_108 = 4'ha == auto_out_r_bits_id ? 1'h0 : _GEN_107;
  wire  _GEN_109 = 4'hb == auto_out_r_bits_id ? 1'h0 : _GEN_108;
  wire  _GEN_110 = 4'hc == auto_out_r_bits_id ? 1'h0 : _GEN_109;
  wire  _GEN_111 = 4'hd == auto_out_r_bits_id ? 1'h0 : _GEN_110;
  wire  _GEN_112 = 4'he == auto_out_r_bits_id ? 1'h0 : _GEN_111;
  wire  bundleOut_0_r_ready = 4'hf == auto_out_r_bits_id ? 1'h0 : _GEN_112;
  wire  _pending_inc_T_1 = bundleOut_0_r_ready & auto_out_r_valid;
  wire  pending_inc = enq_OH[0] & _pending_inc_T_1 & auto_out_r_bits_last;
  wire  _pending_dec_T_1 = auto_in_r_ready & locked;
  wire  deq_bits_6_last = qs_queue_6_io_deq_bits_last;
  wire  deq_bits_5_last = qs_queue_5_io_deq_bits_last;
  wire  deq_bits_4_last = qs_queue_4_io_deq_bits_last;
  wire  deq_bits_3_last = qs_queue_3_io_deq_bits_last;
  wire  deq_bits_2_last = qs_queue_2_io_deq_bits_last;
  wire  deq_bits_1_last = qs_queue_1_io_deq_bits_last;
  wire  deq_bits_0_last = qs_queue_0_io_deq_bits_last;
  wire  _GEN_3 = 4'h1 == deq_id ? deq_bits_1_last : deq_bits_0_last;
  wire  _GEN_4 = 4'h2 == deq_id ? deq_bits_2_last : _GEN_3;
  wire  _GEN_5 = 4'h3 == deq_id ? deq_bits_3_last : _GEN_4;
  wire  _GEN_6 = 4'h4 == deq_id ? deq_bits_4_last : _GEN_5;
  wire  _GEN_7 = 4'h5 == deq_id ? deq_bits_5_last : _GEN_6;
  wire  _GEN_8 = 4'h6 == deq_id ? deq_bits_6_last : _GEN_7;
  wire  _GEN_9 = 4'h7 == deq_id ? 1'h0 : _GEN_8;
  wire  _GEN_10 = 4'h8 == deq_id ? 1'h0 : _GEN_9;
  wire  _GEN_11 = 4'h9 == deq_id ? 1'h0 : _GEN_10;
  wire  _GEN_12 = 4'ha == deq_id ? 1'h0 : _GEN_11;
  wire  _GEN_13 = 4'hb == deq_id ? 1'h0 : _GEN_12;
  wire  _GEN_14 = 4'hc == deq_id ? 1'h0 : _GEN_13;
  wire  _GEN_15 = 4'hd == deq_id ? 1'h0 : _GEN_14;
  wire  _GEN_16 = 4'he == deq_id ? 1'h0 : _GEN_15;
  wire  bundleIn_0_r_bits_last = 4'hf == deq_id ? 1'h0 : _GEN_16;
  wire  pending_dec = deq_OH[0] & _pending_dec_T_1 & bundleIn_0_r_bits_last;
  wire [4:0] _GEN_114 = {{4'd0}, pending_inc};
  wire [4:0] _pending_next_T_1 = pending_count + _GEN_114;
  wire [4:0] _GEN_115 = {{4'd0}, pending_dec};
  wire [4:0] pending_next = _pending_next_T_1 - _GEN_115;
  wire  _pending_T_12 = pending_next != 5'h0;
  reg [4:0] pending_count_1;
  wire  pending_inc_1 = enq_OH[1] & _pending_inc_T_1 & auto_out_r_bits_last;
  wire  pending_dec_1 = deq_OH[1] & _pending_dec_T_1 & bundleIn_0_r_bits_last;
  wire [4:0] _GEN_116 = {{4'd0}, pending_inc_1};
  wire [4:0] _pending_next_T_5 = pending_count_1 + _GEN_116;
  wire [4:0] _GEN_117 = {{4'd0}, pending_dec_1};
  wire [4:0] pending_next_1 = _pending_next_T_5 - _GEN_117;
  wire  _pending_T_25 = pending_next_1 != 5'h0;
  reg [4:0] pending_count_2;
  wire  pending_inc_2 = enq_OH[2] & _pending_inc_T_1 & auto_out_r_bits_last;
  wire  pending_dec_2 = deq_OH[2] & _pending_dec_T_1 & bundleIn_0_r_bits_last;
  wire [4:0] _GEN_118 = {{4'd0}, pending_inc_2};
  wire [4:0] _pending_next_T_9 = pending_count_2 + _GEN_118;
  wire [4:0] _GEN_119 = {{4'd0}, pending_dec_2};
  wire [4:0] pending_next_2 = _pending_next_T_9 - _GEN_119;
  wire  _pending_T_38 = pending_next_2 != 5'h0;
  reg [4:0] pending_count_3;
  wire  pending_inc_3 = enq_OH[3] & _pending_inc_T_1 & auto_out_r_bits_last;
  wire  pending_dec_3 = deq_OH[3] & _pending_dec_T_1 & bundleIn_0_r_bits_last;
  wire [4:0] _GEN_120 = {{4'd0}, pending_inc_3};
  wire [4:0] _pending_next_T_13 = pending_count_3 + _GEN_120;
  wire [4:0] _GEN_121 = {{4'd0}, pending_dec_3};
  wire [4:0] pending_next_3 = _pending_next_T_13 - _GEN_121;
  wire  _pending_T_51 = pending_next_3 != 5'h0;
  reg [4:0] pending_count_4;
  wire  pending_inc_4 = enq_OH[4] & _pending_inc_T_1 & auto_out_r_bits_last;
  wire  pending_dec_4 = deq_OH[4] & _pending_dec_T_1 & bundleIn_0_r_bits_last;
  wire [4:0] _GEN_122 = {{4'd0}, pending_inc_4};
  wire [4:0] _pending_next_T_17 = pending_count_4 + _GEN_122;
  wire [4:0] _GEN_123 = {{4'd0}, pending_dec_4};
  wire [4:0] pending_next_4 = _pending_next_T_17 - _GEN_123;
  wire  _pending_T_64 = pending_next_4 != 5'h0;
  reg [4:0] pending_count_5;
  wire  pending_inc_5 = enq_OH[5] & _pending_inc_T_1 & auto_out_r_bits_last;
  wire  pending_dec_5 = deq_OH[5] & _pending_dec_T_1 & bundleIn_0_r_bits_last;
  wire [4:0] _GEN_124 = {{4'd0}, pending_inc_5};
  wire [4:0] _pending_next_T_21 = pending_count_5 + _GEN_124;
  wire [4:0] _GEN_125 = {{4'd0}, pending_dec_5};
  wire [4:0] pending_next_5 = _pending_next_T_21 - _GEN_125;
  wire  _pending_T_77 = pending_next_5 != 5'h0;
  reg [4:0] pending_count_6;
  wire  pending_inc_6 = enq_OH[6] & _pending_inc_T_1 & auto_out_r_bits_last;
  wire  pending_dec_6 = deq_OH[6] & _pending_dec_T_1 & bundleIn_0_r_bits_last;
  wire [4:0] _GEN_126 = {{4'd0}, pending_inc_6};
  wire [4:0] _pending_next_T_25 = pending_count_6 + _GEN_126;
  wire [4:0] _GEN_127 = {{4'd0}, pending_dec_6};
  wire [4:0] pending_next_6 = _pending_next_T_25 - _GEN_127;
  wire  _pending_T_90 = pending_next_6 != 5'h0;
  wire [15:0] pending = {8'h0,1'h0,_pending_T_90,_pending_T_77,_pending_T_64,_pending_T_51,_pending_T_38,_pending_T_25,
    _pending_T_12};
  wire [16:0] _winner_T = {pending, 1'h0};
  wire [15:0] _winner_T_2 = pending | _winner_T[15:0];
  wire [17:0] _winner_T_3 = {_winner_T_2, 2'h0};
  wire [15:0] _winner_T_5 = _winner_T_2 | _winner_T_3[15:0];
  wire [19:0] _winner_T_6 = {_winner_T_5, 4'h0};
  wire [15:0] _winner_T_8 = _winner_T_5 | _winner_T_6[15:0];
  wire [23:0] _winner_T_9 = {_winner_T_8, 8'h0};
  wire [15:0] _winner_T_11 = _winner_T_8 | _winner_T_9[15:0];
  wire [16:0] _winner_T_13 = {_winner_T_11, 1'h0};
  wire [16:0] _winner_T_14 = ~_winner_T_13;
  wire [16:0] _GEN_128 = {{1'd0}, pending};
  wire [16:0] winner = _GEN_128 & _winner_T_14;
  wire  deq_id_hi = winner[16];
  wire [15:0] deq_id_lo = winner[15:0];
  wire  _deq_id_T = |deq_id_hi;
  wire [15:0] _GEN_129 = {{15'd0}, deq_id_hi};
  wire [15:0] _deq_id_T_1 = _GEN_129 | deq_id_lo;
  wire [7:0] deq_id_hi_1 = _deq_id_T_1[15:8];
  wire [7:0] deq_id_lo_1 = _deq_id_T_1[7:0];
  wire  _deq_id_T_2 = |deq_id_hi_1;
  wire [7:0] _deq_id_T_3 = deq_id_hi_1 | deq_id_lo_1;
  wire [3:0] deq_id_hi_2 = _deq_id_T_3[7:4];
  wire [3:0] deq_id_lo_2 = _deq_id_T_3[3:0];
  wire  _deq_id_T_4 = |deq_id_hi_2;
  wire [3:0] _deq_id_T_5 = deq_id_hi_2 | deq_id_lo_2;
  wire [1:0] deq_id_hi_3 = _deq_id_T_5[3:2];
  wire [1:0] deq_id_lo_3 = _deq_id_T_5[1:0];
  wire  _deq_id_T_6 = |deq_id_hi_3;
  wire [1:0] _deq_id_T_7 = deq_id_hi_3 | deq_id_lo_3;
  wire [4:0] _deq_id_T_12 = {_deq_id_T,_deq_id_T_2,_deq_id_T_4,_deq_id_T_6,_deq_id_T_7[1]};
  wire [4:0] _GEN_1 = ~locked | _pending_dec_T_1 & bundleIn_0_r_bits_last ? _deq_id_T_12 : {{1'd0}, deq_id};
  wire [4:0] deq_bits_0_echo_tl_state_source = qs_queue_0_io_deq_bits_echo_tl_state_source;
  wire [4:0] deq_bits_1_echo_tl_state_source = qs_queue_1_io_deq_bits_echo_tl_state_source;
  wire [4:0] _GEN_19 = 4'h1 == deq_id ? deq_bits_1_echo_tl_state_source : deq_bits_0_echo_tl_state_source;
  wire [4:0] deq_bits_2_echo_tl_state_source = qs_queue_2_io_deq_bits_echo_tl_state_source;
  wire [4:0] _GEN_20 = 4'h2 == deq_id ? deq_bits_2_echo_tl_state_source : _GEN_19;
  wire [4:0] deq_bits_3_echo_tl_state_source = qs_queue_3_io_deq_bits_echo_tl_state_source;
  wire [4:0] _GEN_21 = 4'h3 == deq_id ? deq_bits_3_echo_tl_state_source : _GEN_20;
  wire [4:0] deq_bits_4_echo_tl_state_source = qs_queue_4_io_deq_bits_echo_tl_state_source;
  wire [4:0] _GEN_22 = 4'h4 == deq_id ? deq_bits_4_echo_tl_state_source : _GEN_21;
  wire [4:0] deq_bits_5_echo_tl_state_source = qs_queue_5_io_deq_bits_echo_tl_state_source;
  wire [4:0] _GEN_23 = 4'h5 == deq_id ? deq_bits_5_echo_tl_state_source : _GEN_22;
  wire [4:0] deq_bits_6_echo_tl_state_source = qs_queue_6_io_deq_bits_echo_tl_state_source;
  wire [4:0] _GEN_24 = 4'h6 == deq_id ? deq_bits_6_echo_tl_state_source : _GEN_23;
  wire [4:0] _GEN_25 = 4'h7 == deq_id ? 5'h0 : _GEN_24;
  wire [4:0] _GEN_26 = 4'h8 == deq_id ? 5'h0 : _GEN_25;
  wire [4:0] _GEN_27 = 4'h9 == deq_id ? 5'h0 : _GEN_26;
  wire [4:0] _GEN_28 = 4'ha == deq_id ? 5'h0 : _GEN_27;
  wire [4:0] _GEN_29 = 4'hb == deq_id ? 5'h0 : _GEN_28;
  wire [4:0] _GEN_30 = 4'hc == deq_id ? 5'h0 : _GEN_29;
  wire [4:0] _GEN_31 = 4'hd == deq_id ? 5'h0 : _GEN_30;
  wire [4:0] _GEN_32 = 4'he == deq_id ? 5'h0 : _GEN_31;
  wire [3:0] deq_bits_0_echo_tl_state_size = qs_queue_0_io_deq_bits_echo_tl_state_size;
  wire [3:0] deq_bits_1_echo_tl_state_size = qs_queue_1_io_deq_bits_echo_tl_state_size;
  wire [3:0] _GEN_35 = 4'h1 == deq_id ? deq_bits_1_echo_tl_state_size : deq_bits_0_echo_tl_state_size;
  wire [3:0] deq_bits_2_echo_tl_state_size = qs_queue_2_io_deq_bits_echo_tl_state_size;
  wire [3:0] _GEN_36 = 4'h2 == deq_id ? deq_bits_2_echo_tl_state_size : _GEN_35;
  wire [3:0] deq_bits_3_echo_tl_state_size = qs_queue_3_io_deq_bits_echo_tl_state_size;
  wire [3:0] _GEN_37 = 4'h3 == deq_id ? deq_bits_3_echo_tl_state_size : _GEN_36;
  wire [3:0] deq_bits_4_echo_tl_state_size = qs_queue_4_io_deq_bits_echo_tl_state_size;
  wire [3:0] _GEN_38 = 4'h4 == deq_id ? deq_bits_4_echo_tl_state_size : _GEN_37;
  wire [3:0] deq_bits_5_echo_tl_state_size = qs_queue_5_io_deq_bits_echo_tl_state_size;
  wire [3:0] _GEN_39 = 4'h5 == deq_id ? deq_bits_5_echo_tl_state_size : _GEN_38;
  wire [3:0] deq_bits_6_echo_tl_state_size = qs_queue_6_io_deq_bits_echo_tl_state_size;
  wire [3:0] _GEN_40 = 4'h6 == deq_id ? deq_bits_6_echo_tl_state_size : _GEN_39;
  wire [3:0] _GEN_41 = 4'h7 == deq_id ? 4'h0 : _GEN_40;
  wire [3:0] _GEN_42 = 4'h8 == deq_id ? 4'h0 : _GEN_41;
  wire [3:0] _GEN_43 = 4'h9 == deq_id ? 4'h0 : _GEN_42;
  wire [3:0] _GEN_44 = 4'ha == deq_id ? 4'h0 : _GEN_43;
  wire [3:0] _GEN_45 = 4'hb == deq_id ? 4'h0 : _GEN_44;
  wire [3:0] _GEN_46 = 4'hc == deq_id ? 4'h0 : _GEN_45;
  wire [3:0] _GEN_47 = 4'hd == deq_id ? 4'h0 : _GEN_46;
  wire [3:0] _GEN_48 = 4'he == deq_id ? 4'h0 : _GEN_47;
  wire [1:0] deq_bits_0_resp = qs_queue_0_io_deq_bits_resp;
  wire [1:0] deq_bits_1_resp = qs_queue_1_io_deq_bits_resp;
  wire [1:0] _GEN_51 = 4'h1 == deq_id ? deq_bits_1_resp : deq_bits_0_resp;
  wire [1:0] deq_bits_2_resp = qs_queue_2_io_deq_bits_resp;
  wire [1:0] _GEN_52 = 4'h2 == deq_id ? deq_bits_2_resp : _GEN_51;
  wire [1:0] deq_bits_3_resp = qs_queue_3_io_deq_bits_resp;
  wire [1:0] _GEN_53 = 4'h3 == deq_id ? deq_bits_3_resp : _GEN_52;
  wire [1:0] deq_bits_4_resp = qs_queue_4_io_deq_bits_resp;
  wire [1:0] _GEN_54 = 4'h4 == deq_id ? deq_bits_4_resp : _GEN_53;
  wire [1:0] deq_bits_5_resp = qs_queue_5_io_deq_bits_resp;
  wire [1:0] _GEN_55 = 4'h5 == deq_id ? deq_bits_5_resp : _GEN_54;
  wire [1:0] deq_bits_6_resp = qs_queue_6_io_deq_bits_resp;
  wire [1:0] _GEN_56 = 4'h6 == deq_id ? deq_bits_6_resp : _GEN_55;
  wire [1:0] _GEN_57 = 4'h7 == deq_id ? 2'h0 : _GEN_56;
  wire [1:0] _GEN_58 = 4'h8 == deq_id ? 2'h0 : _GEN_57;
  wire [1:0] _GEN_59 = 4'h9 == deq_id ? 2'h0 : _GEN_58;
  wire [1:0] _GEN_60 = 4'ha == deq_id ? 2'h0 : _GEN_59;
  wire [1:0] _GEN_61 = 4'hb == deq_id ? 2'h0 : _GEN_60;
  wire [1:0] _GEN_62 = 4'hc == deq_id ? 2'h0 : _GEN_61;
  wire [1:0] _GEN_63 = 4'hd == deq_id ? 2'h0 : _GEN_62;
  wire [1:0] _GEN_64 = 4'he == deq_id ? 2'h0 : _GEN_63;
  wire [31:0] deq_bits_0_data = qs_queue_0_io_deq_bits_data;
  wire [31:0] deq_bits_1_data = qs_queue_1_io_deq_bits_data;
  wire [31:0] _GEN_67 = 4'h1 == deq_id ? deq_bits_1_data : deq_bits_0_data;
  wire [31:0] deq_bits_2_data = qs_queue_2_io_deq_bits_data;
  wire [31:0] _GEN_68 = 4'h2 == deq_id ? deq_bits_2_data : _GEN_67;
  wire [31:0] deq_bits_3_data = qs_queue_3_io_deq_bits_data;
  wire [31:0] _GEN_69 = 4'h3 == deq_id ? deq_bits_3_data : _GEN_68;
  wire [31:0] deq_bits_4_data = qs_queue_4_io_deq_bits_data;
  wire [31:0] _GEN_70 = 4'h4 == deq_id ? deq_bits_4_data : _GEN_69;
  wire [31:0] deq_bits_5_data = qs_queue_5_io_deq_bits_data;
  wire [31:0] _GEN_71 = 4'h5 == deq_id ? deq_bits_5_data : _GEN_70;
  wire [31:0] deq_bits_6_data = qs_queue_6_io_deq_bits_data;
  wire [31:0] _GEN_72 = 4'h6 == deq_id ? deq_bits_6_data : _GEN_71;
  wire [31:0] _GEN_73 = 4'h7 == deq_id ? 32'h0 : _GEN_72;
  wire [31:0] _GEN_74 = 4'h8 == deq_id ? 32'h0 : _GEN_73;
  wire [31:0] _GEN_75 = 4'h9 == deq_id ? 32'h0 : _GEN_74;
  wire [31:0] _GEN_76 = 4'ha == deq_id ? 32'h0 : _GEN_75;
  wire [31:0] _GEN_77 = 4'hb == deq_id ? 32'h0 : _GEN_76;
  wire [31:0] _GEN_78 = 4'hc == deq_id ? 32'h0 : _GEN_77;
  wire [31:0] _GEN_79 = 4'hd == deq_id ? 32'h0 : _GEN_78;
  wire [31:0] _GEN_80 = 4'he == deq_id ? 32'h0 : _GEN_79;
  wire [3:0] deq_bits_0_id = qs_queue_0_io_deq_bits_id;
  wire [3:0] deq_bits_1_id = qs_queue_1_io_deq_bits_id;
  wire [3:0] _GEN_83 = 4'h1 == deq_id ? deq_bits_1_id : deq_bits_0_id;
  wire [3:0] deq_bits_2_id = qs_queue_2_io_deq_bits_id;
  wire [3:0] _GEN_84 = 4'h2 == deq_id ? deq_bits_2_id : _GEN_83;
  wire [3:0] deq_bits_3_id = qs_queue_3_io_deq_bits_id;
  wire [3:0] _GEN_85 = 4'h3 == deq_id ? deq_bits_3_id : _GEN_84;
  wire [3:0] deq_bits_4_id = qs_queue_4_io_deq_bits_id;
  wire [3:0] _GEN_86 = 4'h4 == deq_id ? deq_bits_4_id : _GEN_85;
  wire [3:0] deq_bits_5_id = qs_queue_5_io_deq_bits_id;
  wire [3:0] _GEN_87 = 4'h5 == deq_id ? deq_bits_5_id : _GEN_86;
  wire [3:0] deq_bits_6_id = qs_queue_6_io_deq_bits_id;
  wire [3:0] _GEN_88 = 4'h6 == deq_id ? deq_bits_6_id : _GEN_87;
  wire [3:0] _GEN_89 = 4'h7 == deq_id ? 4'h0 : _GEN_88;
  wire [3:0] _GEN_90 = 4'h8 == deq_id ? 4'h0 : _GEN_89;
  wire [3:0] _GEN_91 = 4'h9 == deq_id ? 4'h0 : _GEN_90;
  wire [3:0] _GEN_92 = 4'ha == deq_id ? 4'h0 : _GEN_91;
  wire [3:0] _GEN_93 = 4'hb == deq_id ? 4'h0 : _GEN_92;
  wire [3:0] _GEN_94 = 4'hc == deq_id ? 4'h0 : _GEN_93;
  wire [3:0] _GEN_95 = 4'hd == deq_id ? 4'h0 : _GEN_94;
  wire [3:0] _GEN_96 = 4'he == deq_id ? 4'h0 : _GEN_95;
  Queue_9 qs_queue_0 (
    .clock(qs_queue_0_clock),
    .reset(qs_queue_0_reset),
    .io_enq_ready(qs_queue_0_io_enq_ready),
    .io_enq_valid(qs_queue_0_io_enq_valid),
    .io_enq_bits_id(qs_queue_0_io_enq_bits_id),
    .io_enq_bits_data(qs_queue_0_io_enq_bits_data),
    .io_enq_bits_resp(qs_queue_0_io_enq_bits_resp),
    .io_enq_bits_echo_tl_state_size(qs_queue_0_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(qs_queue_0_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_last(qs_queue_0_io_enq_bits_last),
    .io_deq_ready(qs_queue_0_io_deq_ready),
    .io_deq_valid(qs_queue_0_io_deq_valid),
    .io_deq_bits_id(qs_queue_0_io_deq_bits_id),
    .io_deq_bits_data(qs_queue_0_io_deq_bits_data),
    .io_deq_bits_resp(qs_queue_0_io_deq_bits_resp),
    .io_deq_bits_echo_tl_state_size(qs_queue_0_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(qs_queue_0_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_last(qs_queue_0_io_deq_bits_last)
  );
  Queue_9 qs_queue_1 (
    .clock(qs_queue_1_clock),
    .reset(qs_queue_1_reset),
    .io_enq_ready(qs_queue_1_io_enq_ready),
    .io_enq_valid(qs_queue_1_io_enq_valid),
    .io_enq_bits_id(qs_queue_1_io_enq_bits_id),
    .io_enq_bits_data(qs_queue_1_io_enq_bits_data),
    .io_enq_bits_resp(qs_queue_1_io_enq_bits_resp),
    .io_enq_bits_echo_tl_state_size(qs_queue_1_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(qs_queue_1_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_last(qs_queue_1_io_enq_bits_last),
    .io_deq_ready(qs_queue_1_io_deq_ready),
    .io_deq_valid(qs_queue_1_io_deq_valid),
    .io_deq_bits_id(qs_queue_1_io_deq_bits_id),
    .io_deq_bits_data(qs_queue_1_io_deq_bits_data),
    .io_deq_bits_resp(qs_queue_1_io_deq_bits_resp),
    .io_deq_bits_echo_tl_state_size(qs_queue_1_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(qs_queue_1_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_last(qs_queue_1_io_deq_bits_last)
  );
  Queue_9 qs_queue_2 (
    .clock(qs_queue_2_clock),
    .reset(qs_queue_2_reset),
    .io_enq_ready(qs_queue_2_io_enq_ready),
    .io_enq_valid(qs_queue_2_io_enq_valid),
    .io_enq_bits_id(qs_queue_2_io_enq_bits_id),
    .io_enq_bits_data(qs_queue_2_io_enq_bits_data),
    .io_enq_bits_resp(qs_queue_2_io_enq_bits_resp),
    .io_enq_bits_echo_tl_state_size(qs_queue_2_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(qs_queue_2_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_last(qs_queue_2_io_enq_bits_last),
    .io_deq_ready(qs_queue_2_io_deq_ready),
    .io_deq_valid(qs_queue_2_io_deq_valid),
    .io_deq_bits_id(qs_queue_2_io_deq_bits_id),
    .io_deq_bits_data(qs_queue_2_io_deq_bits_data),
    .io_deq_bits_resp(qs_queue_2_io_deq_bits_resp),
    .io_deq_bits_echo_tl_state_size(qs_queue_2_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(qs_queue_2_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_last(qs_queue_2_io_deq_bits_last)
  );
  Queue_9 qs_queue_3 (
    .clock(qs_queue_3_clock),
    .reset(qs_queue_3_reset),
    .io_enq_ready(qs_queue_3_io_enq_ready),
    .io_enq_valid(qs_queue_3_io_enq_valid),
    .io_enq_bits_id(qs_queue_3_io_enq_bits_id),
    .io_enq_bits_data(qs_queue_3_io_enq_bits_data),
    .io_enq_bits_resp(qs_queue_3_io_enq_bits_resp),
    .io_enq_bits_echo_tl_state_size(qs_queue_3_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(qs_queue_3_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_last(qs_queue_3_io_enq_bits_last),
    .io_deq_ready(qs_queue_3_io_deq_ready),
    .io_deq_valid(qs_queue_3_io_deq_valid),
    .io_deq_bits_id(qs_queue_3_io_deq_bits_id),
    .io_deq_bits_data(qs_queue_3_io_deq_bits_data),
    .io_deq_bits_resp(qs_queue_3_io_deq_bits_resp),
    .io_deq_bits_echo_tl_state_size(qs_queue_3_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(qs_queue_3_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_last(qs_queue_3_io_deq_bits_last)
  );
  Queue_9 qs_queue_4 (
    .clock(qs_queue_4_clock),
    .reset(qs_queue_4_reset),
    .io_enq_ready(qs_queue_4_io_enq_ready),
    .io_enq_valid(qs_queue_4_io_enq_valid),
    .io_enq_bits_id(qs_queue_4_io_enq_bits_id),
    .io_enq_bits_data(qs_queue_4_io_enq_bits_data),
    .io_enq_bits_resp(qs_queue_4_io_enq_bits_resp),
    .io_enq_bits_echo_tl_state_size(qs_queue_4_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(qs_queue_4_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_last(qs_queue_4_io_enq_bits_last),
    .io_deq_ready(qs_queue_4_io_deq_ready),
    .io_deq_valid(qs_queue_4_io_deq_valid),
    .io_deq_bits_id(qs_queue_4_io_deq_bits_id),
    .io_deq_bits_data(qs_queue_4_io_deq_bits_data),
    .io_deq_bits_resp(qs_queue_4_io_deq_bits_resp),
    .io_deq_bits_echo_tl_state_size(qs_queue_4_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(qs_queue_4_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_last(qs_queue_4_io_deq_bits_last)
  );
  Queue_9 qs_queue_5 (
    .clock(qs_queue_5_clock),
    .reset(qs_queue_5_reset),
    .io_enq_ready(qs_queue_5_io_enq_ready),
    .io_enq_valid(qs_queue_5_io_enq_valid),
    .io_enq_bits_id(qs_queue_5_io_enq_bits_id),
    .io_enq_bits_data(qs_queue_5_io_enq_bits_data),
    .io_enq_bits_resp(qs_queue_5_io_enq_bits_resp),
    .io_enq_bits_echo_tl_state_size(qs_queue_5_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(qs_queue_5_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_last(qs_queue_5_io_enq_bits_last),
    .io_deq_ready(qs_queue_5_io_deq_ready),
    .io_deq_valid(qs_queue_5_io_deq_valid),
    .io_deq_bits_id(qs_queue_5_io_deq_bits_id),
    .io_deq_bits_data(qs_queue_5_io_deq_bits_data),
    .io_deq_bits_resp(qs_queue_5_io_deq_bits_resp),
    .io_deq_bits_echo_tl_state_size(qs_queue_5_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(qs_queue_5_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_last(qs_queue_5_io_deq_bits_last)
  );
  Queue_9 qs_queue_6 (
    .clock(qs_queue_6_clock),
    .reset(qs_queue_6_reset),
    .io_enq_ready(qs_queue_6_io_enq_ready),
    .io_enq_valid(qs_queue_6_io_enq_valid),
    .io_enq_bits_id(qs_queue_6_io_enq_bits_id),
    .io_enq_bits_data(qs_queue_6_io_enq_bits_data),
    .io_enq_bits_resp(qs_queue_6_io_enq_bits_resp),
    .io_enq_bits_echo_tl_state_size(qs_queue_6_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(qs_queue_6_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_last(qs_queue_6_io_enq_bits_last),
    .io_deq_ready(qs_queue_6_io_deq_ready),
    .io_deq_valid(qs_queue_6_io_deq_valid),
    .io_deq_bits_id(qs_queue_6_io_deq_bits_id),
    .io_deq_bits_data(qs_queue_6_io_deq_bits_data),
    .io_deq_bits_resp(qs_queue_6_io_deq_bits_resp),
    .io_deq_bits_echo_tl_state_size(qs_queue_6_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(qs_queue_6_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_last(qs_queue_6_io_deq_bits_last)
  );
  assign auto_in_aw_ready = auto_out_aw_ready;
  assign auto_in_w_ready = auto_out_w_ready;
  assign auto_in_b_valid = auto_out_b_valid;
  assign auto_in_b_bits_id = auto_out_b_bits_id;
  assign auto_in_b_bits_resp = auto_out_b_bits_resp;
  assign auto_in_b_bits_echo_tl_state_size = auto_out_b_bits_echo_tl_state_size;
  assign auto_in_b_bits_echo_tl_state_source = auto_out_b_bits_echo_tl_state_source;
  assign auto_in_ar_ready = auto_out_ar_ready;
  assign auto_in_r_valid = locked;
  assign auto_in_r_bits_id = 4'hf == deq_id ? 4'h0 : _GEN_96;
  assign auto_in_r_bits_data = 4'hf == deq_id ? 32'h0 : _GEN_80;
  assign auto_in_r_bits_resp = 4'hf == deq_id ? 2'h0 : _GEN_64;
  assign auto_in_r_bits_echo_tl_state_size = 4'hf == deq_id ? 4'h0 : _GEN_48;
  assign auto_in_r_bits_echo_tl_state_source = 4'hf == deq_id ? 5'h0 : _GEN_32;
  assign auto_in_r_bits_last = 4'hf == deq_id ? 1'h0 : _GEN_16;
  assign auto_out_aw_valid = auto_in_aw_valid;
  assign auto_out_aw_bits_id = auto_in_aw_bits_id;
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr;
  assign auto_out_aw_bits_len = auto_in_aw_bits_len;
  assign auto_out_aw_bits_size = auto_in_aw_bits_size;
  assign auto_out_aw_bits_burst = auto_in_aw_bits_burst;
  assign auto_out_aw_bits_lock = auto_in_aw_bits_lock;
  assign auto_out_aw_bits_cache = auto_in_aw_bits_cache;
  assign auto_out_aw_bits_prot = auto_in_aw_bits_prot;
  assign auto_out_aw_bits_qos = auto_in_aw_bits_qos;
  assign auto_out_aw_bits_echo_tl_state_size = auto_in_aw_bits_echo_tl_state_size;
  assign auto_out_aw_bits_echo_tl_state_source = auto_in_aw_bits_echo_tl_state_source;
  assign auto_out_w_valid = auto_in_w_valid;
  assign auto_out_w_bits_data = auto_in_w_bits_data;
  assign auto_out_w_bits_strb = auto_in_w_bits_strb;
  assign auto_out_w_bits_last = auto_in_w_bits_last;
  assign auto_out_b_ready = auto_in_b_ready;
  assign auto_out_ar_valid = auto_in_ar_valid;
  assign auto_out_ar_bits_id = auto_in_ar_bits_id;
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr;
  assign auto_out_ar_bits_len = auto_in_ar_bits_len;
  assign auto_out_ar_bits_size = auto_in_ar_bits_size;
  assign auto_out_ar_bits_burst = auto_in_ar_bits_burst;
  assign auto_out_ar_bits_lock = auto_in_ar_bits_lock;
  assign auto_out_ar_bits_cache = auto_in_ar_bits_cache;
  assign auto_out_ar_bits_prot = auto_in_ar_bits_prot;
  assign auto_out_ar_bits_qos = auto_in_ar_bits_qos;
  assign auto_out_ar_bits_echo_tl_state_size = auto_in_ar_bits_echo_tl_state_size;
  assign auto_out_ar_bits_echo_tl_state_source = auto_in_ar_bits_echo_tl_state_source;
  assign auto_out_r_ready = 4'hf == auto_out_r_bits_id ? 1'h0 : _GEN_112;
  assign qs_queue_0_clock = clock;
  assign qs_queue_0_reset = reset;
  assign qs_queue_0_io_enq_valid = enq_OH[0] & auto_out_r_valid;
  assign qs_queue_0_io_enq_bits_id = auto_out_r_bits_id;
  assign qs_queue_0_io_enq_bits_data = auto_out_r_bits_data;
  assign qs_queue_0_io_enq_bits_resp = auto_out_r_bits_resp;
  assign qs_queue_0_io_enq_bits_echo_tl_state_size = auto_out_r_bits_echo_tl_state_size;
  assign qs_queue_0_io_enq_bits_echo_tl_state_source = auto_out_r_bits_echo_tl_state_source;
  assign qs_queue_0_io_enq_bits_last = auto_out_r_bits_last;
  assign qs_queue_0_io_deq_ready = deq_OH[0] & _pending_dec_T_1;
  assign qs_queue_1_clock = clock;
  assign qs_queue_1_reset = reset;
  assign qs_queue_1_io_enq_valid = enq_OH[1] & auto_out_r_valid;
  assign qs_queue_1_io_enq_bits_id = auto_out_r_bits_id;
  assign qs_queue_1_io_enq_bits_data = auto_out_r_bits_data;
  assign qs_queue_1_io_enq_bits_resp = auto_out_r_bits_resp;
  assign qs_queue_1_io_enq_bits_echo_tl_state_size = auto_out_r_bits_echo_tl_state_size;
  assign qs_queue_1_io_enq_bits_echo_tl_state_source = auto_out_r_bits_echo_tl_state_source;
  assign qs_queue_1_io_enq_bits_last = auto_out_r_bits_last;
  assign qs_queue_1_io_deq_ready = deq_OH[1] & _pending_dec_T_1;
  assign qs_queue_2_clock = clock;
  assign qs_queue_2_reset = reset;
  assign qs_queue_2_io_enq_valid = enq_OH[2] & auto_out_r_valid;
  assign qs_queue_2_io_enq_bits_id = auto_out_r_bits_id;
  assign qs_queue_2_io_enq_bits_data = auto_out_r_bits_data;
  assign qs_queue_2_io_enq_bits_resp = auto_out_r_bits_resp;
  assign qs_queue_2_io_enq_bits_echo_tl_state_size = auto_out_r_bits_echo_tl_state_size;
  assign qs_queue_2_io_enq_bits_echo_tl_state_source = auto_out_r_bits_echo_tl_state_source;
  assign qs_queue_2_io_enq_bits_last = auto_out_r_bits_last;
  assign qs_queue_2_io_deq_ready = deq_OH[2] & _pending_dec_T_1;
  assign qs_queue_3_clock = clock;
  assign qs_queue_3_reset = reset;
  assign qs_queue_3_io_enq_valid = enq_OH[3] & auto_out_r_valid;
  assign qs_queue_3_io_enq_bits_id = auto_out_r_bits_id;
  assign qs_queue_3_io_enq_bits_data = auto_out_r_bits_data;
  assign qs_queue_3_io_enq_bits_resp = auto_out_r_bits_resp;
  assign qs_queue_3_io_enq_bits_echo_tl_state_size = auto_out_r_bits_echo_tl_state_size;
  assign qs_queue_3_io_enq_bits_echo_tl_state_source = auto_out_r_bits_echo_tl_state_source;
  assign qs_queue_3_io_enq_bits_last = auto_out_r_bits_last;
  assign qs_queue_3_io_deq_ready = deq_OH[3] & _pending_dec_T_1;
  assign qs_queue_4_clock = clock;
  assign qs_queue_4_reset = reset;
  assign qs_queue_4_io_enq_valid = enq_OH[4] & auto_out_r_valid;
  assign qs_queue_4_io_enq_bits_id = auto_out_r_bits_id;
  assign qs_queue_4_io_enq_bits_data = auto_out_r_bits_data;
  assign qs_queue_4_io_enq_bits_resp = auto_out_r_bits_resp;
  assign qs_queue_4_io_enq_bits_echo_tl_state_size = auto_out_r_bits_echo_tl_state_size;
  assign qs_queue_4_io_enq_bits_echo_tl_state_source = auto_out_r_bits_echo_tl_state_source;
  assign qs_queue_4_io_enq_bits_last = auto_out_r_bits_last;
  assign qs_queue_4_io_deq_ready = deq_OH[4] & _pending_dec_T_1;
  assign qs_queue_5_clock = clock;
  assign qs_queue_5_reset = reset;
  assign qs_queue_5_io_enq_valid = enq_OH[5] & auto_out_r_valid;
  assign qs_queue_5_io_enq_bits_id = auto_out_r_bits_id;
  assign qs_queue_5_io_enq_bits_data = auto_out_r_bits_data;
  assign qs_queue_5_io_enq_bits_resp = auto_out_r_bits_resp;
  assign qs_queue_5_io_enq_bits_echo_tl_state_size = auto_out_r_bits_echo_tl_state_size;
  assign qs_queue_5_io_enq_bits_echo_tl_state_source = auto_out_r_bits_echo_tl_state_source;
  assign qs_queue_5_io_enq_bits_last = auto_out_r_bits_last;
  assign qs_queue_5_io_deq_ready = deq_OH[5] & _pending_dec_T_1;
  assign qs_queue_6_clock = clock;
  assign qs_queue_6_reset = reset;
  assign qs_queue_6_io_enq_valid = enq_OH[6] & auto_out_r_valid;
  assign qs_queue_6_io_enq_bits_id = auto_out_r_bits_id;
  assign qs_queue_6_io_enq_bits_data = auto_out_r_bits_data;
  assign qs_queue_6_io_enq_bits_resp = auto_out_r_bits_resp;
  assign qs_queue_6_io_enq_bits_echo_tl_state_size = auto_out_r_bits_echo_tl_state_size;
  assign qs_queue_6_io_enq_bits_echo_tl_state_source = auto_out_r_bits_echo_tl_state_source;
  assign qs_queue_6_io_enq_bits_last = auto_out_r_bits_last;
  assign qs_queue_6_io_deq_ready = deq_OH[6] & _pending_dec_T_1;
  always @(posedge clock) begin
    if (reset) begin
      locked <= 1'h0;
    end else if (~locked | _pending_dec_T_1 & bundleIn_0_r_bits_last) begin
      locked <= |pending;
    end
    deq_id <= _GEN_1[3:0];
    if (reset) begin
      pending_count <= 5'h0;
    end else begin
      pending_count <= pending_next;
    end
    if (reset) begin
      pending_count_1 <= 5'h0;
    end else begin
      pending_count_1 <= pending_next_1;
    end
    if (reset) begin
      pending_count_2 <= 5'h0;
    end else begin
      pending_count_2 <= pending_next_2;
    end
    if (reset) begin
      pending_count_3 <= 5'h0;
    end else begin
      pending_count_3 <= pending_next_3;
    end
    if (reset) begin
      pending_count_4 <= 5'h0;
    end else begin
      pending_count_4 <= pending_next_4;
    end
    if (reset) begin
      pending_count_5 <= 5'h0;
    end else begin
      pending_count_5 <= pending_next_5;
    end
    if (reset) begin
      pending_count_6 <= 5'h0;
    end else begin
      pending_count_6 <= pending_next_6;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~queue_wire_7_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_7_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 7 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~queue_wire_8_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_8_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 8 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~queue_wire_9_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_9_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 9 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~queue_wire_10_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_10_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 10 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~queue_wire_11_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_11_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 11 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~queue_wire_12_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_12_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 12 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~queue_wire_13_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_13_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 13 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~queue_wire_14_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_14_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 14 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~queue_wire_15_enq_valid) & ~reset) begin
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
        if (~reset & ~(~queue_wire_15_enq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ID 15 should not be used\n    at Deinterleaver.scala:75 assert(!q.enq.valid, s\"ID ${i} should not be used\")\n"
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
        if (~(~pending_dec | pending_count != 5'h0) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_dec | pending_count != 5'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:99 assert (!dec || count =/= 0.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_inc | pending_count != 5'h10) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_inc | pending_count != 5'h10)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:100 assert (!inc || count =/= beats.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_dec_1 | pending_count_1 != 5'h0) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_dec_1 | pending_count_1 != 5'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:99 assert (!dec || count =/= 0.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_inc_1 | pending_count_1 != 5'h10) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_inc_1 | pending_count_1 != 5'h10)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:100 assert (!inc || count =/= beats.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_dec_2 | pending_count_2 != 5'h0) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_dec_2 | pending_count_2 != 5'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:99 assert (!dec || count =/= 0.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_inc_2 | pending_count_2 != 5'h10) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_inc_2 | pending_count_2 != 5'h10)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:100 assert (!inc || count =/= beats.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_dec_3 | pending_count_3 != 5'h0) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_dec_3 | pending_count_3 != 5'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:99 assert (!dec || count =/= 0.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_inc_3 | pending_count_3 != 5'h10) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_inc_3 | pending_count_3 != 5'h10)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:100 assert (!inc || count =/= beats.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_dec_4 | pending_count_4 != 5'h0) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_dec_4 | pending_count_4 != 5'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:99 assert (!dec || count =/= 0.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_inc_4 | pending_count_4 != 5'h10) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_inc_4 | pending_count_4 != 5'h10)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:100 assert (!inc || count =/= beats.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_dec_5 | pending_count_5 != 5'h0) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_dec_5 | pending_count_5 != 5'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:99 assert (!dec || count =/= 0.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_inc_5 | pending_count_5 != 5'h10) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_inc_5 | pending_count_5 != 5'h10)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:100 assert (!inc || count =/= beats.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_dec_6 | pending_count_6 != 5'h0) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_dec_6 | pending_count_6 != 5'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:99 assert (!dec || count =/= 0.U)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~pending_inc_6 | pending_count_6 != 5'h10) & _qs_T_2) begin
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
        if (_qs_T_2 & ~(~pending_inc_6 | pending_count_6 != 5'h10)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Deinterleaver.scala:100 assert (!inc || count =/= beats.U)\n");
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
  locked = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  deq_id = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  pending_count = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  pending_count_1 = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  pending_count_2 = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  pending_count_3 = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  pending_count_4 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  pending_count_5 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  pending_count_6 = _RAND_8[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule