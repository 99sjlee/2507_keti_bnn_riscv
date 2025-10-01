`default_nettype wire
module TLCacheCork(
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
  input         auto_in_a_bits_corrupt,
  output        auto_in_c_ready,
  input         auto_in_c_valid,
  input  [2:0]  auto_in_c_bits_opcode,
  input  [2:0]  auto_in_c_bits_param,
  input  [3:0]  auto_in_c_bits_size,
  input  [1:0]  auto_in_c_bits_source,
  input  [31:0] auto_in_c_bits_address,
  input  [31:0] auto_in_c_bits_data,
  input         auto_in_c_bits_corrupt,
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
  input         auto_in_e_valid,
  input  [2:0]  auto_in_e_bits_sink,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [2:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [2:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_denied,
  input  [31:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
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
`endif // RANDOMIZE_REG_INIT
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
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_c_ready;
  wire  monitor_io_in_c_valid;
  wire [2:0] monitor_io_in_c_bits_opcode;
  wire [2:0] monitor_io_in_c_bits_param;
  wire [3:0] monitor_io_in_c_bits_size;
  wire [1:0] monitor_io_in_c_bits_source;
  wire [31:0] monitor_io_in_c_bits_address;
  wire  monitor_io_in_c_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [1:0] monitor_io_in_d_bits_source;
  wire [2:0] monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  monitor_io_in_e_valid;
  wire [2:0] monitor_io_in_e_bits_sink;
  wire  pool_clock;
  wire  pool_reset;
  wire  pool_io_free_valid;
  wire [2:0] pool_io_free_bits;
  wire  pool_io_alloc_ready;
  wire  pool_io_alloc_valid;
  wire [2:0] pool_io_alloc_bits;
  wire  q_clock;
  wire  q_reset;
  wire  q_io_enq_ready;
  wire  q_io_enq_valid;
  wire [2:0] q_io_enq_bits_opcode;
  wire [1:0] q_io_enq_bits_param;
  wire [3:0] q_io_enq_bits_size;
  wire [1:0] q_io_enq_bits_source;
  wire [2:0] q_io_enq_bits_sink;
  wire  q_io_enq_bits_denied;
  wire [31:0] q_io_enq_bits_data;
  wire  q_io_enq_bits_corrupt;
  wire  q_io_deq_ready;
  wire  q_io_deq_valid;
  wire [2:0] q_io_deq_bits_opcode;
  wire [1:0] q_io_deq_bits_param;
  wire [3:0] q_io_deq_bits_size;
  wire [1:0] q_io_deq_bits_source;
  wire [2:0] q_io_deq_bits_sink;
  wire  q_io_deq_bits_denied;
  wire [31:0] q_io_deq_bits_data;
  wire  q_io_deq_bits_corrupt;
  wire  q_1_clock;
  wire  q_1_reset;
  wire  q_1_io_enq_ready;
  wire  q_1_io_enq_valid;
  wire [2:0] q_1_io_enq_bits_opcode;
  wire [1:0] q_1_io_enq_bits_param;
  wire [3:0] q_1_io_enq_bits_size;
  wire [1:0] q_1_io_enq_bits_source;
  wire [2:0] q_1_io_enq_bits_sink;
  wire  q_1_io_enq_bits_denied;
  wire [31:0] q_1_io_enq_bits_data;
  wire  q_1_io_enq_bits_corrupt;
  wire  q_1_io_deq_ready;
  wire  q_1_io_deq_valid;
  wire [2:0] q_1_io_deq_bits_opcode;
  wire [1:0] q_1_io_deq_bits_param;
  wire [3:0] q_1_io_deq_bits_size;
  wire [1:0] q_1_io_deq_bits_source;
  wire [2:0] q_1_io_deq_bits_sink;
  wire  q_1_io_deq_bits_denied;
  wire [31:0] q_1_io_deq_bits_data;
  wire  q_1_io_deq_bits_corrupt;
  wire  isPut = auto_in_a_bits_opcode == 3'h0 | auto_in_a_bits_opcode == 3'h1;
  wire  _toD_T = auto_in_a_bits_opcode == 3'h6;
  wire  _toD_T_3 = auto_in_a_bits_opcode == 3'h7;
  wire  toD = auto_in_a_bits_opcode == 3'h6 & auto_in_a_bits_param == 3'h2 | _toD_T_3;
  wire  a_d_ready = q_1_io_enq_ready;
  reg [9:0] beatsLeft;
  wire  idle = beatsLeft == 10'h0;
  wire  a_a_valid = auto_in_a_valid & ~toD;
  wire  _c_a_valid_T = auto_in_c_bits_opcode == 3'h7;
  wire  c_a_valid = auto_in_c_valid & auto_in_c_bits_opcode == 3'h7;
  wire [1:0] _readys_T = {a_a_valid,c_a_valid};
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0};
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0];
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0};
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0];
  wire  readys__1 = _readys_T_7[1];
  reg  state__1;
  wire  allowed__1 = idle ? readys__1 : state__1;
  wire  out_1_ready = auto_out_a_ready & allowed__1;
  wire  bundleIn_0_a_ready = toD ? a_d_ready : out_1_ready;
  wire [2:0] _a_a_bits_source_T = {auto_in_a_bits_source, 1'h0};
  wire [2:0] _GEN_18 = {{2'd0}, isPut};
  wire [2:0] _a_a_bits_source_T_2 = _a_a_bits_source_T | _GEN_18;
  wire [2:0] _a_a_bits_source_T_4 = _a_a_bits_source_T | 3'h1;
  wire [2:0] a_a_bits_opcode = _toD_T | _toD_T_3 ? 3'h4 : auto_in_a_bits_opcode;
  wire [2:0] a_a_bits_param = _toD_T | _toD_T_3 ? 3'h0 : auto_in_a_bits_param;
  wire [2:0] a_a_bits_source = _toD_T | _toD_T_3 ? _a_a_bits_source_T_4 : _a_a_bits_source_T_2;
  wire [2:0] c_a_bits_a_source = {auto_in_c_bits_source, 1'h0};
  wire  c_a_bits_a_mask_sizeOH_shiftAmount = auto_in_c_bits_size[0];
  wire [1:0] _c_a_bits_a_mask_sizeOH_T_1 = 2'h1 << c_a_bits_a_mask_sizeOH_shiftAmount;
  wire [1:0] c_a_bits_a_mask_sizeOH = _c_a_bits_a_mask_sizeOH_T_1 | 2'h1;
  wire  _c_a_bits_a_mask_T = auto_in_c_bits_size >= 4'h2;
  wire  c_a_bits_a_mask_size = c_a_bits_a_mask_sizeOH[1];
  wire  c_a_bits_a_mask_bit = auto_in_c_bits_address[1];
  wire  c_a_bits_a_mask_nbit = ~c_a_bits_a_mask_bit;
  wire  c_a_bits_a_mask_acc = _c_a_bits_a_mask_T | c_a_bits_a_mask_size & c_a_bits_a_mask_nbit;
  wire  c_a_bits_a_mask_acc_1 = _c_a_bits_a_mask_T | c_a_bits_a_mask_size & c_a_bits_a_mask_bit;
  wire  c_a_bits_a_mask_size_1 = c_a_bits_a_mask_sizeOH[0];
  wire  c_a_bits_a_mask_bit_1 = auto_in_c_bits_address[0];
  wire  c_a_bits_a_mask_nbit_1 = ~c_a_bits_a_mask_bit_1;
  wire  c_a_bits_a_mask_eq_2 = c_a_bits_a_mask_nbit & c_a_bits_a_mask_nbit_1;
  wire  c_a_bits_a_mask_acc_2 = c_a_bits_a_mask_acc | c_a_bits_a_mask_size_1 & c_a_bits_a_mask_eq_2;
  wire  c_a_bits_a_mask_eq_3 = c_a_bits_a_mask_nbit & c_a_bits_a_mask_bit_1;
  wire  c_a_bits_a_mask_acc_3 = c_a_bits_a_mask_acc | c_a_bits_a_mask_size_1 & c_a_bits_a_mask_eq_3;
  wire  c_a_bits_a_mask_eq_4 = c_a_bits_a_mask_bit & c_a_bits_a_mask_nbit_1;
  wire  c_a_bits_a_mask_acc_4 = c_a_bits_a_mask_acc_1 | c_a_bits_a_mask_size_1 & c_a_bits_a_mask_eq_4;
  wire  c_a_bits_a_mask_eq_5 = c_a_bits_a_mask_bit & c_a_bits_a_mask_bit_1;
  wire  c_a_bits_a_mask_acc_5 = c_a_bits_a_mask_acc_1 | c_a_bits_a_mask_size_1 & c_a_bits_a_mask_eq_5;
  wire [3:0] c_a_bits_a_mask = {c_a_bits_a_mask_acc_5,c_a_bits_a_mask_acc_4,c_a_bits_a_mask_acc_3,c_a_bits_a_mask_acc_2}
    ;
  wire  _c_d_valid_T = auto_in_c_bits_opcode == 3'h6;
  wire  _T_9 = ~reset;
  wire  c_d_ready = q_io_enq_ready;
  wire  readys__0 = _readys_T_7[0];
  reg  state__0;
  wire  allowed__0 = idle ? readys__0 : state__0;
  wire  out_ready = auto_out_a_ready & allowed__0;
  reg [9:0] d_first_counter;
  wire  d_first = d_first_counter == 10'h0;
  reg [9:0] beatsLeft_1;
  wire  idle_1 = beatsLeft_1 == 10'h0;
  wire  out_5_earlyValid = q_1_io_deq_valid;
  wire  out_4_earlyValid = q_io_deq_valid;
  wire [2:0] _readys_T_10 = {out_5_earlyValid,out_4_earlyValid,auto_out_d_valid};
  wire [3:0] _readys_T_11 = {_readys_T_10, 1'h0};
  wire [2:0] _readys_T_13 = _readys_T_10 | _readys_T_11[2:0];
  wire [4:0] _readys_T_14 = {_readys_T_13, 2'h0};
  wire [2:0] _readys_T_16 = _readys_T_13 | _readys_T_14[2:0];
  wire [3:0] _readys_T_18 = {_readys_T_16, 1'h0};
  wire [2:0] _readys_T_20 = ~_readys_T_18[2:0];
  wire  readys_1_0 = _readys_T_20[0];
  wire  earlyWinner_1_0 = readys_1_0 & auto_out_d_valid;
  reg  state_1_0;
  wire  muxStateEarly_1_0 = idle_1 ? earlyWinner_1_0 : state_1_0;
  wire [2:0] _GEN_15 = auto_out_d_bits_opcode == 3'h1 & auto_out_d_bits_source[0] ? 3'h5 : auto_out_d_bits_opcode;
  wire [2:0] d_d_bits_opcode = auto_out_d_bits_opcode == 3'h0 & ~auto_out_d_bits_source[0] ? 3'h6 : _GEN_15;
  wire [2:0] _T_141 = muxStateEarly_1_0 ? d_d_bits_opcode : 3'h0;
  wire  readys_1_1 = _readys_T_20[1];
  wire  earlyWinner_1_1 = readys_1_1 & out_4_earlyValid;
  reg  state_1_1;
  wire  muxStateEarly_1_1 = idle_1 ? earlyWinner_1_1 : state_1_1;
  wire [2:0] out_4_bits_opcode = q_io_deq_bits_opcode;
  wire [2:0] _T_142 = muxStateEarly_1_1 ? out_4_bits_opcode : 3'h0;
  wire [2:0] _T_144 = _T_141 | _T_142;
  wire  readys_1_2 = _readys_T_20[2];
  wire  earlyWinner_1_2 = readys_1_2 & out_5_earlyValid;
  reg  state_1_2;
  wire  muxStateEarly_1_2 = idle_1 ? earlyWinner_1_2 : state_1_2;
  wire [2:0] out_5_bits_opcode = q_1_io_deq_bits_opcode;
  wire [2:0] _T_143 = muxStateEarly_1_2 ? out_5_bits_opcode : 3'h0;
  wire [2:0] sink_ACancel_1_bits_opcode = _T_144 | _T_143;
  wire  d_grant = sink_ACancel_1_bits_opcode == 3'h5 | sink_ACancel_1_bits_opcode == 3'h4;
  wire  _in_d_ready_T_3 = pool_io_alloc_valid | ~d_first | ~d_grant;
  wire  in_d_ready = auto_in_d_ready & (pool_io_alloc_valid | ~d_first | ~d_grant);
  wire  _sink_ACancel_earlyValid_T_6 = auto_out_d_valid | out_4_earlyValid | out_5_earlyValid;
  wire  _sink_ACancel_earlyValid_T_11 = state_1_0 & auto_out_d_valid | state_1_1 & out_4_earlyValid | state_1_2 &
    out_5_earlyValid;
  wire  sink_ACancel_1_earlyValid = idle_1 ? auto_out_d_valid | out_4_earlyValid | out_5_earlyValid :
    _sink_ACancel_earlyValid_T_11;
  wire  _d_first_T = in_d_ready & sink_ACancel_1_earlyValid;
  wire [3:0] _T_131 = muxStateEarly_1_0 ? auto_out_d_bits_size : 4'h0;
  wire [3:0] out_4_bits_size = q_io_deq_bits_size;
  wire [3:0] _T_132 = muxStateEarly_1_1 ? out_4_bits_size : 4'h0;
  wire [3:0] _T_134 = _T_131 | _T_132;
  wire [3:0] out_5_bits_size = q_1_io_deq_bits_size;
  wire [3:0] _T_133 = muxStateEarly_1_2 ? out_5_bits_size : 4'h0;
  wire [3:0] sink_ACancel_1_bits_size = _T_134 | _T_133;
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hfff << sink_ACancel_1_bits_size;
  wire [11:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[11:0];
  wire [9:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[11:2];
  wire  d_first_beats1_opdata = sink_ACancel_1_bits_opcode[0];
  wire [9:0] d_first_counter1 = d_first_counter - 10'h1;
  wire  bundleIn_0_d_valid = sink_ACancel_1_earlyValid & _in_d_ready_T_3;
  wire  _pool_io_alloc_ready_T = auto_in_d_ready & bundleIn_0_d_valid;
  reg [2:0] bundleIn_0_d_bits_sink_r;
  wire [1:0] d_d_bits_source = auto_out_d_bits_source[2:1];
  reg  wSourceVec_0;
  reg  wSourceVec_1;
  reg  wSourceVec_2;
  wire [32:0] _aWOk_T_1 = {1'b0,$signed(auto_in_a_bits_address)};
  wire [32:0] _aWOk_T_3 = $signed(_aWOk_T_1) & 33'shf8010000;
  wire  _aWOk_T_4 = $signed(_aWOk_T_3) == 33'sh0;
  wire [31:0] _aWOk_T_5 = auto_in_a_bits_address ^ 32'h8000000;
  wire [32:0] _aWOk_T_6 = {1'b0,$signed(_aWOk_T_5)};
  wire [32:0] _aWOk_T_8 = $signed(_aWOk_T_6) & 33'shf8000000;
  wire  _aWOk_T_9 = $signed(_aWOk_T_8) == 33'sh0;
  wire [31:0] _aWOk_T_10 = auto_in_a_bits_address ^ 32'h10000000;
  wire [32:0] _aWOk_T_11 = {1'b0,$signed(_aWOk_T_10)};
  wire [32:0] _aWOk_T_13 = $signed(_aWOk_T_11) & 33'shf0000000;
  wire  _aWOk_T_14 = $signed(_aWOk_T_13) == 33'sh0;
  wire [31:0] _aWOk_T_15 = auto_in_a_bits_address ^ 32'h20000000;
  wire [32:0] _aWOk_T_16 = {1'b0,$signed(_aWOk_T_15)};
  wire [32:0] _aWOk_T_18 = $signed(_aWOk_T_16) & 33'she0000000;
  wire  _aWOk_T_19 = $signed(_aWOk_T_18) == 33'sh0;
  wire [31:0] _aWOk_T_20 = auto_in_a_bits_address ^ 32'h40000000;
  wire [32:0] _aWOk_T_21 = {1'b0,$signed(_aWOk_T_20)};
  wire [32:0] _aWOk_T_23 = $signed(_aWOk_T_21) & 33'shc0000000;
  wire  _aWOk_T_24 = $signed(_aWOk_T_23) == 33'sh0;
  wire [31:0] _aWOk_T_25 = auto_in_a_bits_address ^ 32'h80000000;
  wire [32:0] _aWOk_T_26 = {1'b0,$signed(_aWOk_T_25)};
  wire [32:0] _aWOk_T_28 = $signed(_aWOk_T_26) & 33'sh80000000;
  wire  _aWOk_T_29 = $signed(_aWOk_T_28) == 33'sh0;
  wire  aWOk = _aWOk_T_4 | _aWOk_T_9 | _aWOk_T_14 | _aWOk_T_19 | _aWOk_T_24 | _aWOk_T_29;
  wire  _GEN_6 = 2'h1 == d_d_bits_source ? wSourceVec_1 : wSourceVec_0;
  wire  _GEN_7 = 2'h2 == d_d_bits_source ? wSourceVec_2 : _GEN_6;
  reg  dWHeld_r;
  wire  _GEN_8 = d_first ? _GEN_7 : dWHeld_r;
  wire  _T_15 = bundleIn_0_a_ready & auto_in_a_valid;
  wire [1:0] _d_d_bits_param_T = _GEN_8 ? 2'h0 : 2'h1;
  wire [1:0] d_d_bits_param = auto_out_d_bits_opcode == 3'h1 & auto_out_d_bits_source[0] ? _d_d_bits_param_T :
    auto_out_d_bits_param;
  wire [26:0] _decode_T_1 = 27'hfff << auto_in_c_bits_size;
  wire [11:0] _decode_T_3 = ~_decode_T_1[11:0];
  wire [9:0] decode = _decode_T_3[11:2];
  wire [26:0] _decode_T_5 = 27'hfff << auto_in_a_bits_size;
  wire [11:0] _decode_T_7 = ~_decode_T_5[11:0];
  wire [9:0] decode_1 = _decode_T_7[11:2];
  wire  opdata_1 = ~a_a_bits_opcode[2];
  wire [9:0] _T_24 = opdata_1 ? decode_1 : 10'h0;
  wire  latch = idle & auto_out_a_ready;
  wire  earlyWinner__0 = readys__0 & c_a_valid;
  wire  earlyWinner__1 = readys__1 & a_a_valid;
  wire  _prefixOR_T = earlyWinner__0 | earlyWinner__1;
  wire  _T_35 = c_a_valid | a_a_valid;
  wire  _T_36 = ~(c_a_valid | a_a_valid);
  wire [9:0] maskedBeats_0 = earlyWinner__0 ? decode : 10'h0;
  wire [9:0] maskedBeats_1 = earlyWinner__1 ? _T_24 : 10'h0;
  wire [9:0] initBeats = maskedBeats_0 | maskedBeats_1;
  wire  muxStateEarly__0 = idle ? earlyWinner__0 : state__0;
  wire  muxStateEarly__1 = idle ? earlyWinner__1 : state__1;
  wire  _sink_ACancel_earlyValid_T_3 = state__0 & c_a_valid | state__1 & a_a_valid;
  wire  sink_ACancel_earlyValid = idle ? _T_35 : _sink_ACancel_earlyValid_T_3;
  wire  _beatsLeft_T_2 = auto_out_a_ready & sink_ACancel_earlyValid;
  wire [9:0] _GEN_19 = {{9'd0}, _beatsLeft_T_2};
  wire [9:0] _beatsLeft_T_4 = beatsLeft - _GEN_19;
  wire [31:0] _T_52 = muxStateEarly__0 ? auto_in_c_bits_data : 32'h0;
  wire [31:0] _T_53 = muxStateEarly__1 ? auto_in_a_bits_data : 32'h0;
  wire [3:0] _T_55 = muxStateEarly__0 ? c_a_bits_a_mask : 4'h0;
  wire [3:0] _T_56 = muxStateEarly__1 ? auto_in_a_bits_mask : 4'h0;
  wire [31:0] _T_58 = muxStateEarly__0 ? auto_in_c_bits_address : 32'h0;
  wire [31:0] _T_59 = muxStateEarly__1 ? auto_in_a_bits_address : 32'h0;
  wire [2:0] _T_61 = muxStateEarly__0 ? c_a_bits_a_source : 3'h0;
  wire [2:0] _T_62 = muxStateEarly__1 ? a_a_bits_source : 3'h0;
  wire [3:0] _T_64 = muxStateEarly__0 ? auto_in_c_bits_size : 4'h0;
  wire [3:0] _T_65 = muxStateEarly__1 ? auto_in_a_bits_size : 4'h0;
  wire [26:0] _decode_T_9 = 27'hfff << auto_out_d_bits_size;
  wire [11:0] _decode_T_11 = ~_decode_T_9[11:0];
  wire [9:0] decode_2 = _decode_T_11[11:2];
  wire  opdata_2 = d_d_bits_opcode[0];
  wire  latch_1 = idle_1 & in_d_ready;
  wire  prefixOR_2 = earlyWinner_1_0 | earlyWinner_1_1;
  wire  _prefixOR_T_1 = prefixOR_2 | earlyWinner_1_2;
  wire  _T_90 = ~_sink_ACancel_earlyValid_T_6;
  wire [9:0] _GEN_20 = {{9'd0}, _d_first_T};
  wire [9:0] _beatsLeft_T_10 = beatsLeft_1 - _GEN_20;
  wire  allowed_1_0 = idle_1 ? readys_1_0 : state_1_0;
  wire  allowed_1_1 = idle_1 ? readys_1_1 : state_1_1;
  wire  allowed_1_2 = idle_1 ? readys_1_2 : state_1_2;
  wire  out_4_bits_corrupt = q_io_deq_bits_corrupt;
  wire  out_5_bits_corrupt = q_1_io_deq_bits_corrupt;
  wire [31:0] _T_111 = muxStateEarly_1_0 ? auto_out_d_bits_data : 32'h0;
  wire [31:0] out_4_bits_data = q_io_deq_bits_data;
  wire [31:0] _T_112 = muxStateEarly_1_1 ? out_4_bits_data : 32'h0;
  wire [31:0] out_5_bits_data = q_1_io_deq_bits_data;
  wire [31:0] _T_113 = muxStateEarly_1_2 ? out_5_bits_data : 32'h0;
  wire [31:0] _T_114 = _T_111 | _T_112;
  wire  out_4_bits_denied = q_io_deq_bits_denied;
  wire  out_5_bits_denied = q_1_io_deq_bits_denied;
  wire [1:0] _T_126 = muxStateEarly_1_0 ? d_d_bits_source : 2'h0;
  wire [1:0] out_4_bits_source = q_io_deq_bits_source;
  wire [1:0] _T_127 = muxStateEarly_1_1 ? out_4_bits_source : 2'h0;
  wire [1:0] out_5_bits_source = q_1_io_deq_bits_source;
  wire [1:0] _T_128 = muxStateEarly_1_2 ? out_5_bits_source : 2'h0;
  wire [1:0] _T_129 = _T_126 | _T_127;
  wire [1:0] _T_136 = muxStateEarly_1_0 ? d_d_bits_param : 2'h0;
  wire [1:0] out_4_bits_param = q_io_deq_bits_param;
  wire [1:0] _T_137 = muxStateEarly_1_1 ? out_4_bits_param : 2'h0;
  wire [1:0] out_5_bits_param = q_1_io_deq_bits_param;
  wire [1:0] _T_138 = muxStateEarly_1_2 ? out_5_bits_param : 2'h0;
  wire [1:0] _T_139 = _T_136 | _T_137;
  
  IDPool pool (
    .clock(pool_clock),
    .reset(pool_reset),
    .io_free_valid(pool_io_free_valid),
    .io_free_bits(pool_io_free_bits),
    .io_alloc_ready(pool_io_alloc_ready),
    .io_alloc_valid(pool_io_alloc_valid),
    .io_alloc_bits(pool_io_alloc_bits)
  );
  Queue q (
    .clock(q_clock),
    .reset(q_reset),
    .io_enq_ready(q_io_enq_ready),
    .io_enq_valid(q_io_enq_valid),
    .io_enq_bits_opcode(q_io_enq_bits_opcode),
    .io_enq_bits_param(q_io_enq_bits_param),
    .io_enq_bits_size(q_io_enq_bits_size),
    .io_enq_bits_source(q_io_enq_bits_source),
    .io_enq_bits_sink(q_io_enq_bits_sink),
    .io_enq_bits_denied(q_io_enq_bits_denied),
    .io_enq_bits_data(q_io_enq_bits_data),
    .io_enq_bits_corrupt(q_io_enq_bits_corrupt),
    .io_deq_ready(q_io_deq_ready),
    .io_deq_valid(q_io_deq_valid),
    .io_deq_bits_opcode(q_io_deq_bits_opcode),
    .io_deq_bits_param(q_io_deq_bits_param),
    .io_deq_bits_size(q_io_deq_bits_size),
    .io_deq_bits_source(q_io_deq_bits_source),
    .io_deq_bits_sink(q_io_deq_bits_sink),
    .io_deq_bits_denied(q_io_deq_bits_denied),
    .io_deq_bits_data(q_io_deq_bits_data),
    .io_deq_bits_corrupt(q_io_deq_bits_corrupt)
  );
  Queue q_1 (
    .clock(q_1_clock),
    .reset(q_1_reset),
    .io_enq_ready(q_1_io_enq_ready),
    .io_enq_valid(q_1_io_enq_valid),
    .io_enq_bits_opcode(q_1_io_enq_bits_opcode),
    .io_enq_bits_param(q_1_io_enq_bits_param),
    .io_enq_bits_size(q_1_io_enq_bits_size),
    .io_enq_bits_source(q_1_io_enq_bits_source),
    .io_enq_bits_sink(q_1_io_enq_bits_sink),
    .io_enq_bits_denied(q_1_io_enq_bits_denied),
    .io_enq_bits_data(q_1_io_enq_bits_data),
    .io_enq_bits_corrupt(q_1_io_enq_bits_corrupt),
    .io_deq_ready(q_1_io_deq_ready),
    .io_deq_valid(q_1_io_deq_valid),
    .io_deq_bits_opcode(q_1_io_deq_bits_opcode),
    .io_deq_bits_param(q_1_io_deq_bits_param),
    .io_deq_bits_size(q_1_io_deq_bits_size),
    .io_deq_bits_source(q_1_io_deq_bits_source),
    .io_deq_bits_sink(q_1_io_deq_bits_sink),
    .io_deq_bits_denied(q_1_io_deq_bits_denied),
    .io_deq_bits_data(q_1_io_deq_bits_data),
    .io_deq_bits_corrupt(q_1_io_deq_bits_corrupt)
  );
  assign auto_in_a_ready = toD ? a_d_ready : out_1_ready;
  assign auto_in_c_ready = _c_d_valid_T ? c_d_ready : out_ready;
  assign auto_in_d_valid = sink_ACancel_1_earlyValid & _in_d_ready_T_3;
  assign auto_in_d_bits_opcode = _T_144 | _T_143;
  assign auto_in_d_bits_param = _T_139 | _T_138;
  assign auto_in_d_bits_size = _T_134 | _T_133;
  assign auto_in_d_bits_source = _T_129 | _T_128;
  assign auto_in_d_bits_sink = d_first ? pool_io_alloc_bits : bundleIn_0_d_bits_sink_r;
  assign auto_in_d_bits_denied = muxStateEarly_1_0 & auto_out_d_bits_denied | muxStateEarly_1_1 & out_4_bits_denied |
    muxStateEarly_1_2 & out_5_bits_denied;
  assign auto_in_d_bits_data = _T_114 | _T_113;
  assign auto_in_d_bits_corrupt = muxStateEarly_1_0 & auto_out_d_bits_corrupt | muxStateEarly_1_1 & out_4_bits_corrupt
     | muxStateEarly_1_2 & out_5_bits_corrupt;
  assign auto_out_a_valid = idle ? _T_35 : _sink_ACancel_earlyValid_T_3;
  assign auto_out_a_bits_opcode = muxStateEarly__1 ? a_a_bits_opcode : 3'h0;
  assign auto_out_a_bits_param = muxStateEarly__1 ? a_a_bits_param : 3'h0;
  assign auto_out_a_bits_size = _T_64 | _T_65;
  assign auto_out_a_bits_source = _T_61 | _T_62;
  assign auto_out_a_bits_address = _T_58 | _T_59;
  assign auto_out_a_bits_mask = _T_55 | _T_56;
  assign auto_out_a_bits_data = _T_52 | _T_53;
  assign auto_out_a_bits_corrupt = muxStateEarly__0 & auto_in_c_bits_corrupt | muxStateEarly__1 & auto_in_a_bits_corrupt
    ;
  assign auto_out_d_ready = in_d_ready & allowed_1_0;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = toD ? a_d_ready : out_1_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_c_ready = _c_d_valid_T ? c_d_ready : out_ready;
  assign monitor_io_in_c_valid = auto_in_c_valid;
  assign monitor_io_in_c_bits_opcode = auto_in_c_bits_opcode;
  assign monitor_io_in_c_bits_param = auto_in_c_bits_param;
  assign monitor_io_in_c_bits_size = auto_in_c_bits_size;
  assign monitor_io_in_c_bits_source = auto_in_c_bits_source;
  assign monitor_io_in_c_bits_address = auto_in_c_bits_address;
  assign monitor_io_in_c_bits_corrupt = auto_in_c_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = sink_ACancel_1_earlyValid & _in_d_ready_T_3;
  assign monitor_io_in_d_bits_opcode = _T_144 | _T_143;
  assign monitor_io_in_d_bits_param = _T_139 | _T_138;
  assign monitor_io_in_d_bits_size = _T_134 | _T_133;
  assign monitor_io_in_d_bits_source = _T_129 | _T_128;
  assign monitor_io_in_d_bits_sink = d_first ? pool_io_alloc_bits : bundleIn_0_d_bits_sink_r;
  assign monitor_io_in_d_bits_denied = muxStateEarly_1_0 & auto_out_d_bits_denied | muxStateEarly_1_1 &
    out_4_bits_denied | muxStateEarly_1_2 & out_5_bits_denied;
  assign monitor_io_in_d_bits_corrupt = muxStateEarly_1_0 & auto_out_d_bits_corrupt | muxStateEarly_1_1 &
    out_4_bits_corrupt | muxStateEarly_1_2 & out_5_bits_corrupt;
  assign monitor_io_in_e_valid = auto_in_e_valid;
  assign monitor_io_in_e_bits_sink = auto_in_e_bits_sink;
  assign pool_clock = clock;
  assign pool_reset = reset;
  assign pool_io_free_valid = auto_in_e_valid;
  assign pool_io_free_bits = auto_in_e_bits_sink;
  assign pool_io_alloc_ready = _pool_io_alloc_ready_T & d_first & d_grant;
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = auto_in_c_valid & auto_in_c_bits_opcode == 3'h6;
  assign q_io_enq_bits_opcode = 3'h6;
  assign q_io_enq_bits_param = 2'h0;
  assign q_io_enq_bits_size = auto_in_c_bits_size;
  assign q_io_enq_bits_source = auto_in_c_bits_source;
  assign q_io_enq_bits_sink = 3'h0;
  assign q_io_enq_bits_denied = 1'h0;
  assign q_io_enq_bits_data = 32'h0;
  assign q_io_enq_bits_corrupt = 1'h0;
  assign q_io_deq_ready = in_d_ready & allowed_1_1;
  assign q_1_clock = clock;
  assign q_1_reset = reset;
  assign q_1_io_enq_valid = auto_in_a_valid & toD;
  assign q_1_io_enq_bits_opcode = 3'h4;
  assign q_1_io_enq_bits_param = 2'h0;
  assign q_1_io_enq_bits_size = auto_in_a_bits_size;
  assign q_1_io_enq_bits_source = auto_in_a_bits_source;
  assign q_1_io_enq_bits_sink = 3'h0;
  assign q_1_io_enq_bits_denied = 1'h0;
  assign q_1_io_enq_bits_data = 32'h0;
  assign q_1_io_enq_bits_corrupt = 1'h0;
  assign q_1_io_deq_ready = in_d_ready & allowed_1_2;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 10'h0;
    end else if (latch) begin
      beatsLeft <= initBeats;
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin
      state__1 <= 1'h0;
    end else if (idle) begin
      state__1 <= earlyWinner__1;
    end
    if (reset) begin
      state__0 <= 1'h0;
    end else if (idle) begin
      state__0 <= earlyWinner__0;
    end
    if (reset) begin
      d_first_counter <= 10'h0;
    end else if (_d_first_T) begin
      if (d_first) begin
        if (d_first_beats1_opdata) begin
          d_first_counter <= d_first_beats1_decode;
        end else begin
          d_first_counter <= 10'h0;
        end
      end else begin
        d_first_counter <= d_first_counter1;
      end
    end
    if (reset) begin
      beatsLeft_1 <= 10'h0;
    end else if (latch_1) begin
      if (earlyWinner_1_0) begin
        if (opdata_2) begin
          beatsLeft_1 <= decode_2;
        end else begin
          beatsLeft_1 <= 10'h0;
        end
      end else begin
        beatsLeft_1 <= 10'h0;
      end
    end else begin
      beatsLeft_1 <= _beatsLeft_T_10;
    end
    if (reset) begin
      state_1_0 <= 1'h0;
    end else if (idle_1) begin
      state_1_0 <= earlyWinner_1_0;
    end
    if (reset) begin
      state_1_1 <= 1'h0;
    end else if (idle_1) begin
      state_1_1 <= earlyWinner_1_1;
    end
    if (reset) begin
      state_1_2 <= 1'h0;
    end else if (idle_1) begin
      state_1_2 <= earlyWinner_1_2;
    end
    if (d_first) begin
      bundleIn_0_d_bits_sink_r <= pool_io_alloc_bits;
    end
    if (_T_15) begin
      if (2'h0 == auto_in_a_bits_source) begin
        wSourceVec_0 <= aWOk;
      end
    end
    if (_T_15) begin
      if (2'h1 == auto_in_a_bits_source) begin
        wSourceVec_1 <= aWOk;
      end
    end
    if (_T_15) begin
      if (2'h2 == auto_in_a_bits_source) begin
        wSourceVec_2 <= aWOk;
      end
    end
    if (d_first) begin
      if (2'h2 == d_d_bits_source) begin
        dWHeld_r <= wSourceVec_2;
      end else if (2'h1 == d_d_bits_source) begin
        dWHeld_r <= wSourceVec_1;
      end else begin
        dWHeld_r <= wSourceVec_0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~auto_in_c_valid | _c_d_valid_T | _c_a_valid_T) & ~reset) begin
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
        if (~reset & ~(~auto_in_c_valid | _c_d_valid_T | _c_a_valid_T)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at CacheCork.scala:106 assert (!in.c.valid || in.c.bits.opcode === Release || in.c.bits.opcode === ReleaseData)\n"
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
        if (~(~earlyWinner__0 | ~earlyWinner__1) & _T_9) begin
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
        if (_T_9 & ~(~earlyWinner__0 | ~earlyWinner__1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
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
        if (~(~(c_a_valid | a_a_valid) | _prefixOR_T) & _T_9) begin
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
        if (_T_9 & ~(~(c_a_valid | a_a_valid) | _prefixOR_T)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
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
        if (~(_T_36 | _T_35) & _T_9) begin
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
        if (_T_9 & ~(_T_36 | _T_35)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
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
        if (~((~earlyWinner_1_0 | ~earlyWinner_1_1) & (~prefixOR_2 | ~earlyWinner_1_2)) & _T_9) begin
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
        if (_T_9 & ~((~earlyWinner_1_0 | ~earlyWinner_1_1) & (~prefixOR_2 | ~earlyWinner_1_2))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
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
        if (~(~_sink_ACancel_earlyValid_T_6 | _prefixOR_T_1) & _T_9) begin
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
        if (_T_9 & ~(~_sink_ACancel_earlyValid_T_6 | _prefixOR_T_1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
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
        if (~(_T_90 | _sink_ACancel_earlyValid_T_6) & _T_9) begin
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
        if (_T_9 & ~(_T_90 | _sink_ACancel_earlyValid_T_6)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            );
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
  beatsLeft = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  state__1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state__0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  d_first_counter = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  beatsLeft_1 = _RAND_4[9:0];
  _RAND_5 = {1{`RANDOM}};
  state_1_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  state_1_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state_1_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  bundleIn_0_d_bits_sink_r = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  wSourceVec_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  wSourceVec_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  wSourceVec_2 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  dWHeld_r = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule