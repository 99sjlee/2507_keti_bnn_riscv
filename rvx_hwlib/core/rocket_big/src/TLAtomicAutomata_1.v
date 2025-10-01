`default_nettype wire
module TLAtomicAutomata_1(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [4:0]  auto_out_a_bits_source,
  output [27:0] auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [4:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
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
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [3:0] monitor_io_in_a_bits_size;
  wire [4:0] monitor_io_in_a_bits_source;
  wire [27:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [4:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  reg [1:0] cam_s_0_state;
  reg [2:0] cam_a_0_bits_opcode;
  reg [2:0] cam_a_0_bits_param;
  reg [3:0] cam_a_0_bits_size;
  reg [4:0] cam_a_0_bits_source;
  reg [27:0] cam_a_0_bits_address;
  reg [3:0] cam_a_0_bits_mask;
  reg [31:0] cam_a_0_bits_data;
  reg  cam_a_0_bits_corrupt;
  reg [3:0] cam_a_0_lut;
  reg [31:0] cam_d_0_data;
  reg  cam_d_0_denied;
  reg  cam_d_0_corrupt;
  wire  cam_free_0 = cam_s_0_state == 2'h0;
  wire  cam_amo_0 = cam_s_0_state == 2'h2;
  wire  cam_abusy_0 = cam_s_0_state == 2'h3 | cam_amo_0;
  wire  cam_dmatch_0 = cam_s_0_state != 2'h0;
  wire  _a_canLogical_T_1 = auto_in_a_bits_size <= 4'h2;
  wire [27:0] _a_canLogical_T_4 = auto_in_a_bits_address ^ 28'h2000;
  wire [28:0] _a_canLogical_T_5 = {1'b0,$signed(_a_canLogical_T_4)};
  wire [28:0] _a_canLogical_T_7 = $signed(_a_canLogical_T_5) & 29'sha012000;
  wire  _a_canLogical_T_8 = $signed(_a_canLogical_T_7) == 29'sh0;
  wire  a_canLogical = _a_canLogical_T_1 & _a_canLogical_T_8;
  wire  a_isLogical = auto_in_a_bits_opcode == 3'h3;
  wire  a_isArithmetic = auto_in_a_bits_opcode == 3'h2;
  wire  _a_isSupported_T = a_isArithmetic ? a_canLogical : 1'h1;
  wire  a_isSupported = a_isLogical ? a_canLogical : _a_isSupported_T;
  wire [1:0] indexes_0 = {cam_a_0_bits_data[0],cam_d_0_data[0]};
  wire [1:0] indexes_1 = {cam_a_0_bits_data[1],cam_d_0_data[1]};
  wire [1:0] indexes_2 = {cam_a_0_bits_data[2],cam_d_0_data[2]};
  wire [1:0] indexes_3 = {cam_a_0_bits_data[3],cam_d_0_data[3]};
  wire [1:0] indexes_4 = {cam_a_0_bits_data[4],cam_d_0_data[4]};
  wire [1:0] indexes_5 = {cam_a_0_bits_data[5],cam_d_0_data[5]};
  wire [1:0] indexes_6 = {cam_a_0_bits_data[6],cam_d_0_data[6]};
  wire [1:0] indexes_7 = {cam_a_0_bits_data[7],cam_d_0_data[7]};
  wire [1:0] indexes_8 = {cam_a_0_bits_data[8],cam_d_0_data[8]};
  wire [1:0] indexes_9 = {cam_a_0_bits_data[9],cam_d_0_data[9]};
  wire [1:0] indexes_10 = {cam_a_0_bits_data[10],cam_d_0_data[10]};
  wire [1:0] indexes_11 = {cam_a_0_bits_data[11],cam_d_0_data[11]};
  wire [1:0] indexes_12 = {cam_a_0_bits_data[12],cam_d_0_data[12]};
  wire [1:0] indexes_13 = {cam_a_0_bits_data[13],cam_d_0_data[13]};
  wire [1:0] indexes_14 = {cam_a_0_bits_data[14],cam_d_0_data[14]};
  wire [1:0] indexes_15 = {cam_a_0_bits_data[15],cam_d_0_data[15]};
  wire [1:0] indexes_16 = {cam_a_0_bits_data[16],cam_d_0_data[16]};
  wire [1:0] indexes_17 = {cam_a_0_bits_data[17],cam_d_0_data[17]};
  wire [1:0] indexes_18 = {cam_a_0_bits_data[18],cam_d_0_data[18]};
  wire [1:0] indexes_19 = {cam_a_0_bits_data[19],cam_d_0_data[19]};
  wire [1:0] indexes_20 = {cam_a_0_bits_data[20],cam_d_0_data[20]};
  wire [1:0] indexes_21 = {cam_a_0_bits_data[21],cam_d_0_data[21]};
  wire [1:0] indexes_22 = {cam_a_0_bits_data[22],cam_d_0_data[22]};
  wire [1:0] indexes_23 = {cam_a_0_bits_data[23],cam_d_0_data[23]};
  wire [1:0] indexes_24 = {cam_a_0_bits_data[24],cam_d_0_data[24]};
  wire [1:0] indexes_25 = {cam_a_0_bits_data[25],cam_d_0_data[25]};
  wire [1:0] indexes_26 = {cam_a_0_bits_data[26],cam_d_0_data[26]};
  wire [1:0] indexes_27 = {cam_a_0_bits_data[27],cam_d_0_data[27]};
  wire [1:0] indexes_28 = {cam_a_0_bits_data[28],cam_d_0_data[28]};
  wire [1:0] indexes_29 = {cam_a_0_bits_data[29],cam_d_0_data[29]};
  wire [1:0] indexes_30 = {cam_a_0_bits_data[30],cam_d_0_data[30]};
  wire [1:0] indexes_31 = {cam_a_0_bits_data[31],cam_d_0_data[31]};
  wire [3:0] _logic_out_T = cam_a_0_lut >> indexes_0;
  wire [3:0] _logic_out_T_2 = cam_a_0_lut >> indexes_1;
  wire [3:0] _logic_out_T_4 = cam_a_0_lut >> indexes_2;
  wire [3:0] _logic_out_T_6 = cam_a_0_lut >> indexes_3;
  wire [3:0] _logic_out_T_8 = cam_a_0_lut >> indexes_4;
  wire [3:0] _logic_out_T_10 = cam_a_0_lut >> indexes_5;
  wire [3:0] _logic_out_T_12 = cam_a_0_lut >> indexes_6;
  wire [3:0] _logic_out_T_14 = cam_a_0_lut >> indexes_7;
  wire [3:0] _logic_out_T_16 = cam_a_0_lut >> indexes_8;
  wire [3:0] _logic_out_T_18 = cam_a_0_lut >> indexes_9;
  wire [3:0] _logic_out_T_20 = cam_a_0_lut >> indexes_10;
  wire [3:0] _logic_out_T_22 = cam_a_0_lut >> indexes_11;
  wire [3:0] _logic_out_T_24 = cam_a_0_lut >> indexes_12;
  wire [3:0] _logic_out_T_26 = cam_a_0_lut >> indexes_13;
  wire [3:0] _logic_out_T_28 = cam_a_0_lut >> indexes_14;
  wire [3:0] _logic_out_T_30 = cam_a_0_lut >> indexes_15;
  wire [3:0] _logic_out_T_32 = cam_a_0_lut >> indexes_16;
  wire [3:0] _logic_out_T_34 = cam_a_0_lut >> indexes_17;
  wire [3:0] _logic_out_T_36 = cam_a_0_lut >> indexes_18;
  wire [3:0] _logic_out_T_38 = cam_a_0_lut >> indexes_19;
  wire [3:0] _logic_out_T_40 = cam_a_0_lut >> indexes_20;
  wire [3:0] _logic_out_T_42 = cam_a_0_lut >> indexes_21;
  wire [3:0] _logic_out_T_44 = cam_a_0_lut >> indexes_22;
  wire [3:0] _logic_out_T_46 = cam_a_0_lut >> indexes_23;
  wire [3:0] _logic_out_T_48 = cam_a_0_lut >> indexes_24;
  wire [3:0] _logic_out_T_50 = cam_a_0_lut >> indexes_25;
  wire [3:0] _logic_out_T_52 = cam_a_0_lut >> indexes_26;
  wire [3:0] _logic_out_T_54 = cam_a_0_lut >> indexes_27;
  wire [3:0] _logic_out_T_56 = cam_a_0_lut >> indexes_28;
  wire [3:0] _logic_out_T_58 = cam_a_0_lut >> indexes_29;
  wire [3:0] _logic_out_T_60 = cam_a_0_lut >> indexes_30;
  wire [3:0] _logic_out_T_62 = cam_a_0_lut >> indexes_31;
  wire [7:0] logic_out_lo_lo = {_logic_out_T_14[0],_logic_out_T_12[0],_logic_out_T_10[0],_logic_out_T_8[0],
    _logic_out_T_6[0],_logic_out_T_4[0],_logic_out_T_2[0],_logic_out_T[0]};
  wire [15:0] logic_out_lo = {_logic_out_T_30[0],_logic_out_T_28[0],_logic_out_T_26[0],_logic_out_T_24[0],
    _logic_out_T_22[0],_logic_out_T_20[0],_logic_out_T_18[0],_logic_out_T_16[0],logic_out_lo_lo};
  wire [7:0] logic_out_hi_lo = {_logic_out_T_46[0],_logic_out_T_44[0],_logic_out_T_42[0],_logic_out_T_40[0],
    _logic_out_T_38[0],_logic_out_T_36[0],_logic_out_T_34[0],_logic_out_T_32[0]};
  wire [31:0] logic_out = {_logic_out_T_62[0],_logic_out_T_60[0],_logic_out_T_58[0],_logic_out_T_56[0],_logic_out_T_54[0
    ],_logic_out_T_52[0],_logic_out_T_50[0],_logic_out_T_48[0],logic_out_hi_lo,logic_out_lo};
  wire  unsigned_ = cam_a_0_bits_param[1];
  wire  take_max = cam_a_0_bits_param[0];
  wire  adder = cam_a_0_bits_param[2];
  wire [3:0] _signSel_T = ~cam_a_0_bits_mask;
  wire [3:0] _GEN_39 = {{1'd0}, cam_a_0_bits_mask[3:1]};
  wire [3:0] _signSel_T_2 = _signSel_T | _GEN_39;
  wire [3:0] signSel = ~_signSel_T_2;
  wire [3:0] signbits_a = {cam_a_0_bits_data[31],cam_a_0_bits_data[23],cam_a_0_bits_data[15],cam_a_0_bits_data[7]};
  wire [3:0] signbits_d = {cam_d_0_data[31],cam_d_0_data[23],cam_d_0_data[15],cam_d_0_data[7]};
  wire [3:0] _signbit_a_T = signbits_a & signSel;
  wire [4:0] _signbit_a_T_1 = {_signbit_a_T, 1'h0};
  wire [3:0] signbit_a = _signbit_a_T_1[3:0];
  wire [3:0] _signbit_d_T = signbits_d & signSel;
  wire [4:0] _signbit_d_T_1 = {_signbit_d_T, 1'h0};
  wire [3:0] signbit_d = _signbit_d_T_1[3:0];
  wire [4:0] _signext_a_T = {signbit_a, 1'h0};
  wire [3:0] _signext_a_T_2 = signbit_a | _signext_a_T[3:0];
  wire [5:0] _signext_a_T_3 = {_signext_a_T_2, 2'h0};
  wire [3:0] _signext_a_T_5 = _signext_a_T_2 | _signext_a_T_3[3:0];
  wire [7:0] _signext_a_T_12 = _signext_a_T_5[0] ? 8'hff : 8'h0;
  wire [7:0] _signext_a_T_14 = _signext_a_T_5[1] ? 8'hff : 8'h0;
  wire [7:0] _signext_a_T_16 = _signext_a_T_5[2] ? 8'hff : 8'h0;
  wire [7:0] _signext_a_T_18 = _signext_a_T_5[3] ? 8'hff : 8'h0;
  wire [31:0] signext_a = {_signext_a_T_18,_signext_a_T_16,_signext_a_T_14,_signext_a_T_12};
  wire [4:0] _signext_d_T = {signbit_d, 1'h0};
  wire [3:0] _signext_d_T_2 = signbit_d | _signext_d_T[3:0];
  wire [5:0] _signext_d_T_3 = {_signext_d_T_2, 2'h0};
  wire [3:0] _signext_d_T_5 = _signext_d_T_2 | _signext_d_T_3[3:0];
  wire [7:0] _signext_d_T_12 = _signext_d_T_5[0] ? 8'hff : 8'h0;
  wire [7:0] _signext_d_T_14 = _signext_d_T_5[1] ? 8'hff : 8'h0;
  wire [7:0] _signext_d_T_16 = _signext_d_T_5[2] ? 8'hff : 8'h0;
  wire [7:0] _signext_d_T_18 = _signext_d_T_5[3] ? 8'hff : 8'h0;
  wire [31:0] signext_d = {_signext_d_T_18,_signext_d_T_16,_signext_d_T_14,_signext_d_T_12};
  wire [7:0] _wide_mask_T_5 = cam_a_0_bits_mask[0] ? 8'hff : 8'h0;
  wire [7:0] _wide_mask_T_7 = cam_a_0_bits_mask[1] ? 8'hff : 8'h0;
  wire [7:0] _wide_mask_T_9 = cam_a_0_bits_mask[2] ? 8'hff : 8'h0;
  wire [7:0] _wide_mask_T_11 = cam_a_0_bits_mask[3] ? 8'hff : 8'h0;
  wire [31:0] wide_mask = {_wide_mask_T_11,_wide_mask_T_9,_wide_mask_T_7,_wide_mask_T_5};
  wire [31:0] _a_a_ext_T = cam_a_0_bits_data & wide_mask;
  wire [31:0] a_a_ext = _a_a_ext_T | signext_a;
  wire [31:0] _a_d_ext_T = cam_d_0_data & wide_mask;
  wire [31:0] a_d_ext = _a_d_ext_T | signext_d;
  wire [31:0] _a_d_inv_T = ~a_d_ext;
  wire [31:0] a_d_inv = adder ? a_d_ext : _a_d_inv_T;
  wire [31:0] adder_out = a_a_ext + a_d_inv;
  wire  a_bigger_uneq = unsigned_ == a_a_ext[31];
  wire  a_bigger = a_a_ext[31] == a_d_ext[31] ? ~adder_out[31] : a_bigger_uneq;
  wire  pick_a = take_max == a_bigger;
  wire [31:0] _arith_out_T = pick_a ? cam_a_0_bits_data : cam_d_0_data;
  wire [31:0] arith_out = adder ? adder_out : _arith_out_T;
  wire [31:0] amo_data = cam_a_0_bits_opcode[0] ? logic_out : arith_out;
  wire  a_allow = ~cam_abusy_0 & (a_isSupported | cam_free_0);
  reg [9:0] beatsLeft;
  wire  idle = beatsLeft == 10'h0;
  wire  source_i_valid = auto_in_a_valid & a_allow;
  wire [1:0] _readys_T = {source_i_valid,cam_amo_0};
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0};
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0];
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0};
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0];
  wire  readys_1 = _readys_T_7[1];
  reg  state_1;
  wire  allowed_1 = idle ? readys_1 : state_1;
  wire  out_1_ready = auto_out_a_ready & allowed_1;
  wire  _T = ~a_isSupported;
  wire [2:0] source_i_bits_opcode = ~a_isSupported ? 3'h4 : auto_in_a_bits_opcode;
  wire [2:0] source_i_bits_param = ~a_isSupported ? 3'h0 : auto_in_a_bits_param;
  wire  source_c_bits_a_corrupt = cam_a_0_bits_corrupt | cam_d_0_corrupt;
  wire  source_c_bits_a_mask_sizeOH_shiftAmount = cam_a_0_bits_size[0];
  wire [1:0] _source_c_bits_a_mask_sizeOH_T_1 = 2'h1 << source_c_bits_a_mask_sizeOH_shiftAmount;
  wire [1:0] source_c_bits_a_mask_sizeOH = _source_c_bits_a_mask_sizeOH_T_1 | 2'h1;
  wire  _source_c_bits_a_mask_T = cam_a_0_bits_size >= 4'h2;
  wire  source_c_bits_a_mask_size = source_c_bits_a_mask_sizeOH[1];
  wire  source_c_bits_a_mask_bit = cam_a_0_bits_address[1];
  wire  source_c_bits_a_mask_nbit = ~source_c_bits_a_mask_bit;
  wire  source_c_bits_a_mask_acc = _source_c_bits_a_mask_T | source_c_bits_a_mask_size & source_c_bits_a_mask_nbit;
  wire  source_c_bits_a_mask_acc_1 = _source_c_bits_a_mask_T | source_c_bits_a_mask_size & source_c_bits_a_mask_bit;
  wire  source_c_bits_a_mask_size_1 = source_c_bits_a_mask_sizeOH[0];
  wire  source_c_bits_a_mask_bit_1 = cam_a_0_bits_address[0];
  wire  source_c_bits_a_mask_nbit_1 = ~source_c_bits_a_mask_bit_1;
  wire  source_c_bits_a_mask_eq_2 = source_c_bits_a_mask_nbit & source_c_bits_a_mask_nbit_1;
  wire  source_c_bits_a_mask_acc_2 = source_c_bits_a_mask_acc | source_c_bits_a_mask_size_1 & source_c_bits_a_mask_eq_2;
  wire  source_c_bits_a_mask_eq_3 = source_c_bits_a_mask_nbit & source_c_bits_a_mask_bit_1;
  wire  source_c_bits_a_mask_acc_3 = source_c_bits_a_mask_acc | source_c_bits_a_mask_size_1 & source_c_bits_a_mask_eq_3;
  wire  source_c_bits_a_mask_eq_4 = source_c_bits_a_mask_bit & source_c_bits_a_mask_nbit_1;
  wire  source_c_bits_a_mask_acc_4 = source_c_bits_a_mask_acc_1 | source_c_bits_a_mask_size_1 &
    source_c_bits_a_mask_eq_4;
  wire  source_c_bits_a_mask_eq_5 = source_c_bits_a_mask_bit & source_c_bits_a_mask_bit_1;
  wire  source_c_bits_a_mask_acc_5 = source_c_bits_a_mask_acc_1 | source_c_bits_a_mask_size_1 &
    source_c_bits_a_mask_eq_5;
  wire [3:0] source_c_bits_a_mask = {source_c_bits_a_mask_acc_5,source_c_bits_a_mask_acc_4,source_c_bits_a_mask_acc_3,
    source_c_bits_a_mask_acc_2};
  wire [26:0] _decode_T_1 = 27'hfff << auto_in_a_bits_size;
  wire [11:0] _decode_T_3 = ~_decode_T_1[11:0];
  wire [9:0] decode = _decode_T_3[11:2];
  wire  opdata = ~auto_in_a_bits_opcode[2];
  wire  latch = idle & auto_out_a_ready;
  wire  readys_0 = _readys_T_7[0];
  wire  earlyWinner_0 = readys_0 & cam_amo_0;
  wire  earlyWinner_1 = readys_1 & source_i_valid;
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1;
  wire  _T_10 = ~reset;
  wire  _T_12 = cam_amo_0 | source_i_valid;
  wire  _T_13 = ~(cam_amo_0 | source_i_valid);
  reg  state_0;
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0;
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1;
  wire  _sink_ACancel_earlyValid_T_3 = state_0 & cam_amo_0 | state_1 & source_i_valid;
  wire  sink_ACancel_earlyValid = idle ? _T_12 : _sink_ACancel_earlyValid_T_3;
  wire  _beatsLeft_T_2 = auto_out_a_ready & sink_ACancel_earlyValid;
  wire [9:0] _GEN_40 = {{9'd0}, _beatsLeft_T_2};
  wire [9:0] _beatsLeft_T_4 = beatsLeft - _GEN_40;
  wire  allowed_0 = idle ? readys_0 : state_0;
  wire  out_ready = auto_out_a_ready & allowed_0;
  wire [31:0] _T_29 = muxStateEarly_0 ? amo_data : 32'h0;
  wire [31:0] _T_30 = muxStateEarly_1 ? auto_in_a_bits_data : 32'h0;
  wire [3:0] _T_32 = muxStateEarly_0 ? source_c_bits_a_mask : 4'h0;
  wire [3:0] _T_33 = muxStateEarly_1 ? auto_in_a_bits_mask : 4'h0;
  wire [27:0] _T_35 = muxStateEarly_0 ? cam_a_0_bits_address : 28'h0;
  wire [27:0] _T_36 = muxStateEarly_1 ? auto_in_a_bits_address : 28'h0;
  wire [4:0] _T_38 = muxStateEarly_0 ? cam_a_0_bits_source : 5'h0;
  wire [4:0] _T_39 = muxStateEarly_1 ? auto_in_a_bits_source : 5'h0;
  wire [3:0] _T_41 = muxStateEarly_0 ? cam_a_0_bits_size : 4'h0;
  wire [3:0] _T_42 = muxStateEarly_1 ? auto_in_a_bits_size : 4'h0;
  wire  _T_50 = out_1_ready & source_i_valid;
  wire [2:0] _GEN_41 = {{1'd0}, auto_in_a_bits_param[1:0]};
  wire [3:0] _cam_a_0_lut_T_2 = 3'h1 == _GEN_41 ? 4'he : 4'h8;
  wire [1:0] _GEN_12 = cam_free_0 ? 2'h3 : cam_s_0_state;
  wire [1:0] _GEN_23 = _T_50 & _T ? _GEN_12 : cam_s_0_state;
  wire  _T_53 = out_ready & cam_amo_0;
  wire [1:0] _GEN_24 = cam_amo_0 ? 2'h1 : _GEN_23;
  wire [1:0] _GEN_25 = _T_53 ? _GEN_24 : _GEN_23;
  reg [9:0] d_first_counter;
  wire  d_first = d_first_counter == 10'h0;
  wire  d_ackd = auto_out_d_bits_opcode == 3'h1;
  wire  d_cam_sel_raw_0 = cam_a_0_bits_source == auto_out_d_bits_source;
  wire  d_cam_sel_match_0 = d_cam_sel_raw_0 & cam_dmatch_0;
  wire  d_drop = d_first & d_ackd & d_cam_sel_match_0;
  wire  bundleOut_0_d_ready = auto_in_d_ready | d_drop;
  wire  _d_first_T = bundleOut_0_d_ready & auto_out_d_valid;
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hfff << auto_out_d_bits_size;
  wire [11:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[11:0];
  wire [9:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[11:2];
  wire  d_first_beats1_opdata = auto_out_d_bits_opcode[0];
  wire [9:0] d_first_counter1 = d_first_counter - 10'h1;
  wire  d_ack = auto_out_d_bits_opcode == 3'h0;
  wire  d_replace = d_first & d_ack & d_cam_sel_match_0;
  
  assign auto_in_a_ready = out_1_ready & a_allow;
  assign auto_in_d_valid = auto_out_d_valid & ~d_drop;
  assign auto_in_d_bits_opcode = d_replace ? 3'h1 : auto_out_d_bits_opcode;
  assign auto_in_d_bits_param = auto_out_d_bits_param;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_source = auto_out_d_bits_source;
  assign auto_in_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_d_bits_denied = d_replace ? cam_d_0_denied | auto_out_d_bits_denied : auto_out_d_bits_denied;
  assign auto_in_d_bits_data = d_replace ? cam_d_0_data : auto_out_d_bits_data;
  assign auto_in_d_bits_corrupt = d_replace ? cam_d_0_corrupt | auto_out_d_bits_denied : auto_out_d_bits_corrupt;
  assign auto_out_a_valid = idle ? _T_12 : _sink_ACancel_earlyValid_T_3;
  assign auto_out_a_bits_opcode = muxStateEarly_1 ? source_i_bits_opcode : 3'h0;
  assign auto_out_a_bits_param = muxStateEarly_1 ? source_i_bits_param : 3'h0;
  assign auto_out_a_bits_size = _T_41 | _T_42;
  assign auto_out_a_bits_source = _T_38 | _T_39;
  assign auto_out_a_bits_address = _T_35 | _T_36;
  assign auto_out_a_bits_mask = _T_32 | _T_33;
  assign auto_out_a_bits_data = _T_29 | _T_30;
  assign auto_out_a_bits_corrupt = muxStateEarly_0 & source_c_bits_a_corrupt | muxStateEarly_1 & auto_in_a_bits_corrupt;
  assign auto_out_d_ready = auto_in_d_ready | d_drop;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = out_1_ready & a_allow;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = auto_out_d_valid & ~d_drop;
  assign monitor_io_in_d_bits_opcode = d_replace ? 3'h1 : auto_out_d_bits_opcode;
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param;
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size;
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source;
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink;
  assign monitor_io_in_d_bits_denied = d_replace ? cam_d_0_denied | auto_out_d_bits_denied : auto_out_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = d_replace ? cam_d_0_corrupt | auto_out_d_bits_denied : auto_out_d_bits_corrupt;
  always @(posedge clock) begin
    if (reset) begin
      cam_s_0_state <= 2'h0;
    end else if (_d_first_T & d_first) begin
      if (d_cam_sel_match_0) begin
        if (d_ackd) begin
          cam_s_0_state <= 2'h2;
        end else begin
          cam_s_0_state <= 2'h0;
        end
      end else begin
        cam_s_0_state <= _GEN_25;
      end
    end else begin
      cam_s_0_state <= _GEN_25;
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        cam_a_0_bits_opcode <= auto_in_a_bits_opcode;
      end
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        cam_a_0_bits_param <= auto_in_a_bits_param;
      end
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        cam_a_0_bits_size <= auto_in_a_bits_size;
      end
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        cam_a_0_bits_source <= auto_in_a_bits_source;
      end
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        cam_a_0_bits_address <= auto_in_a_bits_address;
      end
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        cam_a_0_bits_mask <= auto_in_a_bits_mask;
      end
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        cam_a_0_bits_data <= auto_in_a_bits_data;
      end
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        cam_a_0_bits_corrupt <= auto_in_a_bits_corrupt;
      end
    end
    if (_T_50 & _T) begin
      if (cam_free_0) begin
        if (3'h3 == _GEN_41) begin
          cam_a_0_lut <= 4'hc;
        end else if (3'h0 == _GEN_41) begin
          cam_a_0_lut <= 4'h6;
        end else begin
          cam_a_0_lut <= _cam_a_0_lut_T_2;
        end
      end
    end
    if (_d_first_T & d_first) begin
      if (d_cam_sel_match_0 & d_ackd) begin
        cam_d_0_data <= auto_out_d_bits_data;
      end
    end
    if (_d_first_T & d_first) begin
      if (d_cam_sel_match_0 & d_ackd) begin
        cam_d_0_denied <= auto_out_d_bits_denied;
      end
    end
    if (_d_first_T & d_first) begin
      if (d_cam_sel_match_0 & d_ackd) begin
        cam_d_0_corrupt <= auto_out_d_bits_corrupt;
      end
    end
    if (reset) begin
      beatsLeft <= 10'h0;
    end else if (latch) begin
      if (earlyWinner_1) begin
        if (opdata) begin
          beatsLeft <= decode;
        end else begin
          beatsLeft <= 10'h0;
        end
      end else begin
        beatsLeft <= 10'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin
      state_1 <= 1'h0;
    end else if (idle) begin
      state_1 <= earlyWinner_1;
    end
    if (reset) begin
      state_0 <= 1'h0;
    end else if (idle) begin
      state_0 <= earlyWinner_0;
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
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1) & ~reset) begin
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
        if (~reset & ~(~earlyWinner_0 | ~earlyWinner_1)) begin
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
        if (~(~(cam_amo_0 | source_i_valid) | _prefixOR_T) & _T_10) begin
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
        if (_T_10 & ~(~(cam_amo_0 | source_i_valid) | _prefixOR_T)) begin
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
        if (~(_T_13 | _T_12) & _T_10) begin
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
        if (_T_10 & ~(_T_13 | _T_12)) begin
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
  cam_s_0_state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  cam_a_0_bits_opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  cam_a_0_bits_param = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  cam_a_0_bits_size = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  cam_a_0_bits_source = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  cam_a_0_bits_address = _RAND_5[27:0];
  _RAND_6 = {1{`RANDOM}};
  cam_a_0_bits_mask = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  cam_a_0_bits_data = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  cam_a_0_bits_corrupt = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  cam_a_0_lut = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  cam_d_0_data = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  cam_d_0_denied = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  cam_d_0_corrupt = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  beatsLeft = _RAND_13[9:0];
  _RAND_14 = {1{`RANDOM}};
  state_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  state_0 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  d_first_counter = _RAND_16[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule