`default_nettype wire
module AXI4Fragmenter(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input         auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [1:0]  auto_in_aw_bits_burst,
  input  [3:0]  auto_in_aw_bits_cache,
  input  [2:0]  auto_in_aw_bits_prot,
  input  [6:0]  auto_in_aw_bits_echo_extra_id,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output        auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output [6:0]  auto_in_b_bits_echo_extra_id,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input         auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input  [3:0]  auto_in_ar_bits_cache,
  input  [2:0]  auto_in_ar_bits_prot,
  input  [6:0]  auto_in_ar_bits_echo_extra_id,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output        auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output [6:0]  auto_in_r_bits_echo_extra_id,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output        auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output [7:0]  auto_out_aw_bits_len,
  output [2:0]  auto_out_aw_bits_size,
  output [3:0]  auto_out_aw_bits_cache,
  output [2:0]  auto_out_aw_bits_prot,
  output [6:0]  auto_out_aw_bits_echo_extra_id,
  output        auto_out_aw_bits_echo_real_last,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [63:0] auto_out_w_bits_data,
  output [7:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input         auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input  [6:0]  auto_out_b_bits_echo_extra_id,
  input         auto_out_b_bits_echo_real_last,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output        auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output [7:0]  auto_out_ar_bits_len,
  output [2:0]  auto_out_ar_bits_size,
  output [3:0]  auto_out_ar_bits_cache,
  output [2:0]  auto_out_ar_bits_prot,
  output [6:0]  auto_out_ar_bits_echo_extra_id,
  output        auto_out_ar_bits_echo_real_last,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input         auto_out_r_bits_id,
  input  [63:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input  [6:0]  auto_out_r_bits_echo_extra_id,
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
`endif // RANDOMIZE_REG_INIT
  wire  deq_clock;
  wire  deq_reset;
  wire  deq_io_enq_ready;
  wire  deq_io_enq_valid;
  wire  deq_io_enq_bits_id;
  wire [31:0] deq_io_enq_bits_addr;
  wire [7:0] deq_io_enq_bits_len;
  wire [2:0] deq_io_enq_bits_size;
  wire [1:0] deq_io_enq_bits_burst;
  wire [3:0] deq_io_enq_bits_cache;
  wire [2:0] deq_io_enq_bits_prot;
  wire [6:0] deq_io_enq_bits_echo_extra_id;
  wire  deq_io_deq_ready;
  wire  deq_io_deq_valid;
  wire  deq_io_deq_bits_id;
  wire [31:0] deq_io_deq_bits_addr;
  wire [7:0] deq_io_deq_bits_len;
  wire [2:0] deq_io_deq_bits_size;
  wire [1:0] deq_io_deq_bits_burst;
  wire [3:0] deq_io_deq_bits_cache;
  wire [2:0] deq_io_deq_bits_prot;
  wire [6:0] deq_io_deq_bits_echo_extra_id;
  wire  deq_1_clock;
  wire  deq_1_reset;
  wire  deq_1_io_enq_ready;
  wire  deq_1_io_enq_valid;
  wire  deq_1_io_enq_bits_id;
  wire [31:0] deq_1_io_enq_bits_addr;
  wire [7:0] deq_1_io_enq_bits_len;
  wire [2:0] deq_1_io_enq_bits_size;
  wire [1:0] deq_1_io_enq_bits_burst;
  wire [3:0] deq_1_io_enq_bits_cache;
  wire [2:0] deq_1_io_enq_bits_prot;
  wire [6:0] deq_1_io_enq_bits_echo_extra_id;
  wire  deq_1_io_deq_ready;
  wire  deq_1_io_deq_valid;
  wire  deq_1_io_deq_bits_id;
  wire [31:0] deq_1_io_deq_bits_addr;
  wire [7:0] deq_1_io_deq_bits_len;
  wire [2:0] deq_1_io_deq_bits_size;
  wire [1:0] deq_1_io_deq_bits_burst;
  wire [3:0] deq_1_io_deq_bits_cache;
  wire [2:0] deq_1_io_deq_bits_prot;
  wire [6:0] deq_1_io_deq_bits_echo_extra_id;
  wire  in_w_deq_clock;
  wire  in_w_deq_reset;
  wire  in_w_deq_io_enq_ready;
  wire  in_w_deq_io_enq_valid;
  wire [63:0] in_w_deq_io_enq_bits_data;
  wire [7:0] in_w_deq_io_enq_bits_strb;
  wire  in_w_deq_io_enq_bits_last;
  wire  in_w_deq_io_deq_ready;
  wire  in_w_deq_io_deq_valid;
  wire [63:0] in_w_deq_io_deq_bits_data;
  wire [7:0] in_w_deq_io_deq_bits_strb;
  wire  in_w_deq_io_deq_bits_last;
  reg  busy;
  reg [31:0] r_addr;
  reg [7:0] r_len;
  wire [7:0] irr_bits_len = deq_io_deq_bits_len;
  wire [7:0] len = busy ? r_len : irr_bits_len;
  wire [31:0] irr_bits_addr = deq_io_deq_bits_addr;
  wire [31:0] addr = busy ? r_addr : irr_bits_addr;
  wire [7:0] alignment = addr[10:3];
  wire [31:0] _support1_T = addr ^ 32'h2000;
  wire [32:0] _support1_T_1 = {1'b0,$signed(_support1_T)};
  wire [32:0] _support1_T_3 = $signed(_support1_T_1) & 33'shfa012000;
  wire  _support1_T_4 = $signed(_support1_T_3) == 33'sh0;
  wire [32:0] _support1_T_6 = {1'b0,$signed(addr)};
  wire [32:0] _support1_T_8 = $signed(_support1_T_6) & 33'shfa012000;
  wire  _support1_T_9 = $signed(_support1_T_8) == 33'sh0;
  wire [31:0] _support1_T_10 = addr ^ 32'h10000;
  wire [32:0] _support1_T_11 = {1'b0,$signed(_support1_T_10)};
  wire [32:0] _support1_T_13 = $signed(_support1_T_11) & 33'shfa010000;
  wire  _support1_T_14 = $signed(_support1_T_13) == 33'sh0;
  wire [31:0] _support1_T_15 = addr ^ 32'h2000000;
  wire [32:0] _support1_T_16 = {1'b0,$signed(_support1_T_15)};
  wire [32:0] _support1_T_18 = $signed(_support1_T_16) & 33'shfa010000;
  wire  _support1_T_19 = $signed(_support1_T_18) == 33'sh0;
  wire [31:0] _support1_T_20 = addr ^ 32'h8000000;
  wire [32:0] _support1_T_21 = {1'b0,$signed(_support1_T_20)};
  wire [32:0] _support1_T_23 = $signed(_support1_T_21) & 33'shf8000000;
  wire  _support1_T_24 = $signed(_support1_T_23) == 33'sh0;
  wire [31:0] _support1_T_25 = addr ^ 32'h10000000;
  wire [32:0] _support1_T_26 = {1'b0,$signed(_support1_T_25)};
  wire [32:0] _support1_T_28 = $signed(_support1_T_26) & 33'shf0000000;
  wire  _support1_T_29 = $signed(_support1_T_28) == 33'sh0;
  wire [31:0] _support1_T_30 = addr ^ 32'h20000000;
  wire [32:0] _support1_T_31 = {1'b0,$signed(_support1_T_30)};
  wire [32:0] _support1_T_33 = $signed(_support1_T_31) & 33'she0000000;
  wire  _support1_T_34 = $signed(_support1_T_33) == 33'sh0;
  wire [31:0] _support1_T_35 = addr ^ 32'h40000000;
  wire [32:0] _support1_T_36 = {1'b0,$signed(_support1_T_35)};
  wire [32:0] _support1_T_38 = $signed(_support1_T_36) & 33'shc0000000;
  wire  _support1_T_39 = $signed(_support1_T_38) == 33'sh0;
  wire [31:0] _support1_T_40 = addr ^ 32'h80000000;
  wire [32:0] _support1_T_41 = {1'b0,$signed(_support1_T_40)};
  wire [32:0] _support1_T_43 = $signed(_support1_T_41) & 33'sh80000000;
  wire  _support1_T_44 = $signed(_support1_T_43) == 33'sh0;
  wire  _support1_T_51 = _support1_T_9 | _support1_T_14 | _support1_T_19 | _support1_T_24 | _support1_T_29 |
    _support1_T_34 | _support1_T_39 | _support1_T_44;
  wire [7:0] _support1_T_52 = _support1_T_4 ? 8'hff : 8'h0;
  wire [2:0] _support1_T_53 = _support1_T_51 ? 3'h7 : 3'h0;
  wire [7:0] _GEN_16 = {{5'd0}, _support1_T_53};
  wire [7:0] support1 = _support1_T_52 | _GEN_16;
  wire [7:0] _GEN_17 = {{1'd0}, len[7:1]};
  wire [7:0] _fillLow_T_1 = len | _GEN_17;
  wire [7:0] _GEN_18 = {{2'd0}, _fillLow_T_1[7:2]};
  wire [7:0] _fillLow_T_3 = _fillLow_T_1 | _GEN_18;
  wire [7:0] _GEN_19 = {{4'd0}, _fillLow_T_3[7:4]};
  wire [7:0] _fillLow_T_5 = _fillLow_T_3 | _GEN_19;
  wire [6:0] fillLow = _fillLow_T_5[7:1];
  wire [7:0] _wipeHigh_T = ~len;
  wire [8:0] _wipeHigh_T_1 = {_wipeHigh_T, 1'h0};
  wire [7:0] _wipeHigh_T_3 = _wipeHigh_T | _wipeHigh_T_1[7:0];
  wire [9:0] _wipeHigh_T_4 = {_wipeHigh_T_3, 2'h0};
  wire [7:0] _wipeHigh_T_6 = _wipeHigh_T_3 | _wipeHigh_T_4[7:0];
  wire [11:0] _wipeHigh_T_7 = {_wipeHigh_T_6, 4'h0};
  wire [7:0] _wipeHigh_T_9 = _wipeHigh_T_6 | _wipeHigh_T_7[7:0];
  wire [7:0] wipeHigh = ~_wipeHigh_T_9;
  wire [7:0] _GEN_20 = {{1'd0}, fillLow};
  wire [7:0] remain1 = _GEN_20 | wipeHigh;
  wire [8:0] _align1_T = {alignment, 1'h0};
  wire [7:0] _align1_T_2 = alignment | _align1_T[7:0];
  wire [9:0] _align1_T_3 = {_align1_T_2, 2'h0};
  wire [7:0] _align1_T_5 = _align1_T_2 | _align1_T_3[7:0];
  wire [11:0] _align1_T_6 = {_align1_T_5, 4'h0};
  wire [7:0] _align1_T_8 = _align1_T_5 | _align1_T_6[7:0];
  wire [7:0] align1 = ~_align1_T_8;
  wire [7:0] _maxSupported1_T = remain1 & align1;
  wire [7:0] maxSupported1 = _maxSupported1_T & support1;
  wire [1:0] irr_bits_burst = deq_io_deq_bits_burst;
  wire  fixed = irr_bits_burst == 2'h0;
  wire [2:0] irr_bits_size = deq_io_deq_bits_size;
  wire  narrow = irr_bits_size != 3'h3;
  wire  bad = fixed | narrow;
  wire [7:0] beats1 = bad ? 8'h0 : maxSupported1;
  wire [8:0] _beats_T = {beats1, 1'h0};
  wire [8:0] _beats_T_1 = _beats_T | 9'h1;
  wire [8:0] _beats_T_2 = {1'h0,beats1};
  wire [8:0] _beats_T_3 = ~_beats_T_2;
  wire [8:0] beats = _beats_T_1 & _beats_T_3;
  wire [15:0] _GEN_1 = {{7'd0}, beats};
  wire [15:0] _inc_addr_T = _GEN_1 << irr_bits_size;
  wire [31:0] _GEN_21 = {{16'd0}, _inc_addr_T};
  wire [31:0] inc_addr = addr + _GEN_21;
  wire [15:0] _wrapMask_T = {irr_bits_len,8'hff};
  wire [22:0] _GEN_3 = {{7'd0}, _wrapMask_T};
  wire [22:0] _wrapMask_T_1 = _GEN_3 << irr_bits_size;
  wire [14:0] wrapMask = _wrapMask_T_1[22:8];
  wire [31:0] _GEN_22 = {{17'd0}, wrapMask};
  wire [31:0] _mux_addr_T = inc_addr & _GEN_22;
  wire [31:0] _mux_addr_T_1 = ~irr_bits_addr;
  wire [31:0] _mux_addr_T_2 = _mux_addr_T_1 | _GEN_22;
  wire [31:0] _mux_addr_T_3 = ~_mux_addr_T_2;
  wire [31:0] _mux_addr_T_4 = _mux_addr_T | _mux_addr_T_3;
  wire  ar_last = beats1 == len;
  wire [31:0] _out_bits_addr_T = ~addr;
  wire [9:0] _out_bits_addr_T_2 = 10'h7 << irr_bits_size;
  wire [2:0] _out_bits_addr_T_4 = ~_out_bits_addr_T_2[2:0];
  wire [31:0] _GEN_24 = {{29'd0}, _out_bits_addr_T_4};
  wire [31:0] _out_bits_addr_T_5 = _out_bits_addr_T | _GEN_24;
  wire  irr_valid = deq_io_deq_valid;
  wire  _T_2 = auto_out_ar_ready & irr_valid;
  wire [8:0] _GEN_25 = {{1'd0}, len};
  wire [8:0] _r_len_T_1 = _GEN_25 - beats;
  wire [8:0] _GEN_4 = _T_2 ? _r_len_T_1 : {{1'd0}, r_len};
  reg  busy_1;
  reg [31:0] r_addr_1;
  reg [7:0] r_len_1;
  wire [7:0] irr_1_bits_len = deq_1_io_deq_bits_len;
  wire [7:0] len_1 = busy_1 ? r_len_1 : irr_1_bits_len;
  wire [31:0] irr_1_bits_addr = deq_1_io_deq_bits_addr;
  wire [31:0] addr_1 = busy_1 ? r_addr_1 : irr_1_bits_addr;
  wire [7:0] alignment_1 = addr_1[10:3];
  wire [31:0] _support1_T_55 = addr_1 ^ 32'h2000;
  wire [32:0] _support1_T_56 = {1'b0,$signed(_support1_T_55)};
  wire [32:0] _support1_T_58 = $signed(_support1_T_56) & 33'shfa002000;
  wire  _support1_T_59 = $signed(_support1_T_58) == 33'sh0;
  wire [32:0] _support1_T_61 = {1'b0,$signed(addr_1)};
  wire [32:0] _support1_T_63 = $signed(_support1_T_61) & 33'shfa002000;
  wire  _support1_T_64 = $signed(_support1_T_63) == 33'sh0;
  wire [31:0] _support1_T_65 = addr_1 ^ 32'h2000000;
  wire [32:0] _support1_T_66 = {1'b0,$signed(_support1_T_65)};
  wire [32:0] _support1_T_68 = $signed(_support1_T_66) & 33'shfa000000;
  wire  _support1_T_69 = $signed(_support1_T_68) == 33'sh0;
  wire [31:0] _support1_T_70 = addr_1 ^ 32'h8000000;
  wire [32:0] _support1_T_71 = {1'b0,$signed(_support1_T_70)};
  wire [32:0] _support1_T_73 = $signed(_support1_T_71) & 33'shf8000000;
  wire  _support1_T_74 = $signed(_support1_T_73) == 33'sh0;
  wire [31:0] _support1_T_75 = addr_1 ^ 32'h10000000;
  wire [32:0] _support1_T_76 = {1'b0,$signed(_support1_T_75)};
  wire [32:0] _support1_T_78 = $signed(_support1_T_76) & 33'shf0000000;
  wire  _support1_T_79 = $signed(_support1_T_78) == 33'sh0;
  wire [31:0] _support1_T_80 = addr_1 ^ 32'h20000000;
  wire [32:0] _support1_T_81 = {1'b0,$signed(_support1_T_80)};
  wire [32:0] _support1_T_83 = $signed(_support1_T_81) & 33'she0000000;
  wire  _support1_T_84 = $signed(_support1_T_83) == 33'sh0;
  wire [31:0] _support1_T_85 = addr_1 ^ 32'h40000000;
  wire [32:0] _support1_T_86 = {1'b0,$signed(_support1_T_85)};
  wire [32:0] _support1_T_88 = $signed(_support1_T_86) & 33'shc0000000;
  wire  _support1_T_89 = $signed(_support1_T_88) == 33'sh0;
  wire [31:0] _support1_T_90 = addr_1 ^ 32'h80000000;
  wire [32:0] _support1_T_91 = {1'b0,$signed(_support1_T_90)};
  wire [32:0] _support1_T_93 = $signed(_support1_T_91) & 33'shc0000000;
  wire  _support1_T_94 = $signed(_support1_T_93) == 33'sh0;
  wire  _support1_T_100 = _support1_T_64 | _support1_T_69 | _support1_T_74 | _support1_T_79 | _support1_T_84 |
    _support1_T_89 | _support1_T_94;
  wire [31:0] _support1_T_101 = addr_1 ^ 32'hc0000000;
  wire [32:0] _support1_T_102 = {1'b0,$signed(_support1_T_101)};
  wire [32:0] _support1_T_104 = $signed(_support1_T_102) & 33'shc0000000;
  wire  _support1_T_105 = $signed(_support1_T_104) == 33'sh0;
  wire [7:0] _support1_T_106 = _support1_T_59 ? 8'hff : 8'h0;
  wire [2:0] _support1_T_107 = _support1_T_100 ? 3'h7 : 3'h0;
  wire [4:0] _support1_T_108 = _support1_T_105 ? 5'h1f : 5'h0;
  wire [7:0] _GEN_26 = {{5'd0}, _support1_T_107};
  wire [7:0] _support1_T_109 = _support1_T_106 | _GEN_26;
  wire [7:0] _GEN_27 = {{3'd0}, _support1_T_108};
  wire [7:0] support1_1 = _support1_T_109 | _GEN_27;
  wire [7:0] _GEN_28 = {{1'd0}, len_1[7:1]};
  wire [7:0] _fillLow_T_8 = len_1 | _GEN_28;
  wire [7:0] _GEN_29 = {{2'd0}, _fillLow_T_8[7:2]};
  wire [7:0] _fillLow_T_10 = _fillLow_T_8 | _GEN_29;
  wire [7:0] _GEN_30 = {{4'd0}, _fillLow_T_10[7:4]};
  wire [7:0] _fillLow_T_12 = _fillLow_T_10 | _GEN_30;
  wire [6:0] fillLow_1 = _fillLow_T_12[7:1];
  wire [7:0] _wipeHigh_T_11 = ~len_1;
  wire [8:0] _wipeHigh_T_12 = {_wipeHigh_T_11, 1'h0};
  wire [7:0] _wipeHigh_T_14 = _wipeHigh_T_11 | _wipeHigh_T_12[7:0];
  wire [9:0] _wipeHigh_T_15 = {_wipeHigh_T_14, 2'h0};
  wire [7:0] _wipeHigh_T_17 = _wipeHigh_T_14 | _wipeHigh_T_15[7:0];
  wire [11:0] _wipeHigh_T_18 = {_wipeHigh_T_17, 4'h0};
  wire [7:0] _wipeHigh_T_20 = _wipeHigh_T_17 | _wipeHigh_T_18[7:0];
  wire [7:0] wipeHigh_1 = ~_wipeHigh_T_20;
  wire [7:0] _GEN_31 = {{1'd0}, fillLow_1};
  wire [7:0] remain1_1 = _GEN_31 | wipeHigh_1;
  wire [8:0] _align1_T_10 = {alignment_1, 1'h0};
  wire [7:0] _align1_T_12 = alignment_1 | _align1_T_10[7:0];
  wire [9:0] _align1_T_13 = {_align1_T_12, 2'h0};
  wire [7:0] _align1_T_15 = _align1_T_12 | _align1_T_13[7:0];
  wire [11:0] _align1_T_16 = {_align1_T_15, 4'h0};
  wire [7:0] _align1_T_18 = _align1_T_15 | _align1_T_16[7:0];
  wire [7:0] align1_1 = ~_align1_T_18;
  wire [7:0] _maxSupported1_T_1 = remain1_1 & align1_1;
  wire [7:0] maxSupported1_1 = _maxSupported1_T_1 & support1_1;
  wire [1:0] irr_1_bits_burst = deq_1_io_deq_bits_burst;
  wire  fixed_1 = irr_1_bits_burst == 2'h0;
  wire [2:0] irr_1_bits_size = deq_1_io_deq_bits_size;
  wire  narrow_1 = irr_1_bits_size != 3'h3;
  wire  bad_1 = fixed_1 | narrow_1;
  wire [7:0] beats1_1 = bad_1 ? 8'h0 : maxSupported1_1;
  wire [8:0] _beats_T_4 = {beats1_1, 1'h0};
  wire [8:0] _beats_T_5 = _beats_T_4 | 9'h1;
  wire [8:0] _beats_T_6 = {1'h0,beats1_1};
  wire [8:0] _beats_T_7 = ~_beats_T_6;
  wire [8:0] w_beats = _beats_T_5 & _beats_T_7;
  wire [15:0] _GEN_6 = {{7'd0}, w_beats};
  wire [15:0] _inc_addr_T_2 = _GEN_6 << irr_1_bits_size;
  wire [31:0] _GEN_32 = {{16'd0}, _inc_addr_T_2};
  wire [31:0] inc_addr_1 = addr_1 + _GEN_32;
  wire [15:0] _wrapMask_T_2 = {irr_1_bits_len,8'hff};
  wire [22:0] _GEN_8 = {{7'd0}, _wrapMask_T_2};
  wire [22:0] _wrapMask_T_3 = _GEN_8 << irr_1_bits_size;
  wire [14:0] wrapMask_1 = _wrapMask_T_3[22:8];
  wire [31:0] _GEN_33 = {{17'd0}, wrapMask_1};
  wire [31:0] _mux_addr_T_5 = inc_addr_1 & _GEN_33;
  wire [31:0] _mux_addr_T_6 = ~irr_1_bits_addr;
  wire [31:0] _mux_addr_T_7 = _mux_addr_T_6 | _GEN_33;
  wire [31:0] _mux_addr_T_8 = ~_mux_addr_T_7;
  wire [31:0] _mux_addr_T_9 = _mux_addr_T_5 | _mux_addr_T_8;
  wire  aw_last = beats1_1 == len_1;
  reg [8:0] w_counter;
  wire  w_idle = w_counter == 9'h0;
  reg  wbeats_latched;
  wire  _in_aw_ready_T = w_idle | wbeats_latched;
  wire  in_aw_ready = auto_out_aw_ready & (w_idle | wbeats_latched);
  wire [31:0] _out_bits_addr_T_7 = ~addr_1;
  wire [9:0] _out_bits_addr_T_9 = 10'h7 << irr_1_bits_size;
  wire [2:0] _out_bits_addr_T_11 = ~_out_bits_addr_T_9[2:0];
  wire [31:0] _GEN_35 = {{29'd0}, _out_bits_addr_T_11};
  wire [31:0] _out_bits_addr_T_12 = _out_bits_addr_T_7 | _GEN_35;
  wire  irr_1_valid = deq_1_io_deq_valid;
  wire  _T_5 = in_aw_ready & irr_1_valid;
  wire [8:0] _GEN_36 = {{1'd0}, len_1};
  wire [8:0] _r_len_T_3 = _GEN_36 - w_beats;
  wire [8:0] _GEN_9 = _T_5 ? _r_len_T_3 : {{1'd0}, r_len_1};
  wire  wbeats_valid = irr_1_valid & ~wbeats_latched;
  wire  _GEN_10 = wbeats_valid & w_idle | wbeats_latched;
  wire  bundleOut_0_aw_valid = irr_1_valid & _in_aw_ready_T;
  wire  _T_7 = auto_out_aw_ready & bundleOut_0_aw_valid;
  wire [8:0] _w_todo_T = wbeats_valid ? w_beats : 9'h0;
  wire [8:0] w_todo = w_idle ? _w_todo_T : w_counter;
  wire  w_last = w_todo == 9'h1;
  wire  in_w_valid = in_w_deq_io_deq_valid;
  wire  _bundleOut_0_w_valid_T_1 = ~w_idle | wbeats_valid;
  wire  bundleOut_0_w_valid = in_w_valid & (~w_idle | wbeats_valid);
  wire  _w_counter_T = auto_out_w_ready & bundleOut_0_w_valid;
  wire [8:0] _GEN_37 = {{8'd0}, _w_counter_T};
  wire [8:0] _w_counter_T_2 = w_todo - _GEN_37;
  wire  _T_13 = ~reset;
  wire  in_w_bits_last = in_w_deq_io_deq_bits_last;
  wire  bundleOut_0_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last;
  reg [1:0] error_0;
  reg [1:0] error_1;
  wire [1:0] _GEN_13 = auto_out_b_bits_id ? error_1 : error_0;
  wire [1:0] _T_22 = 2'h1 << auto_out_b_bits_id;
  wire  _T_26 = bundleOut_0_b_ready & auto_out_b_valid;
  wire [1:0] _error_0_T = error_0 | auto_out_b_bits_resp;
  wire [1:0] _error_1_T = error_1 | auto_out_b_bits_resp;
  Queue_24 deq (
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_id(deq_io_enq_bits_id),
    .io_enq_bits_addr(deq_io_enq_bits_addr),
    .io_enq_bits_len(deq_io_enq_bits_len),
    .io_enq_bits_size(deq_io_enq_bits_size),
    .io_enq_bits_burst(deq_io_enq_bits_burst),
    .io_enq_bits_cache(deq_io_enq_bits_cache),
    .io_enq_bits_prot(deq_io_enq_bits_prot),
    .io_enq_bits_echo_extra_id(deq_io_enq_bits_echo_extra_id),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_id(deq_io_deq_bits_id),
    .io_deq_bits_addr(deq_io_deq_bits_addr),
    .io_deq_bits_len(deq_io_deq_bits_len),
    .io_deq_bits_size(deq_io_deq_bits_size),
    .io_deq_bits_burst(deq_io_deq_bits_burst),
    .io_deq_bits_cache(deq_io_deq_bits_cache),
    .io_deq_bits_prot(deq_io_deq_bits_prot),
    .io_deq_bits_echo_extra_id(deq_io_deq_bits_echo_extra_id)
  );
  Queue_24 deq_1 (
    .clock(deq_1_clock),
    .reset(deq_1_reset),
    .io_enq_ready(deq_1_io_enq_ready),
    .io_enq_valid(deq_1_io_enq_valid),
    .io_enq_bits_id(deq_1_io_enq_bits_id),
    .io_enq_bits_addr(deq_1_io_enq_bits_addr),
    .io_enq_bits_len(deq_1_io_enq_bits_len),
    .io_enq_bits_size(deq_1_io_enq_bits_size),
    .io_enq_bits_burst(deq_1_io_enq_bits_burst),
    .io_enq_bits_cache(deq_1_io_enq_bits_cache),
    .io_enq_bits_prot(deq_1_io_enq_bits_prot),
    .io_enq_bits_echo_extra_id(deq_1_io_enq_bits_echo_extra_id),
    .io_deq_ready(deq_1_io_deq_ready),
    .io_deq_valid(deq_1_io_deq_valid),
    .io_deq_bits_id(deq_1_io_deq_bits_id),
    .io_deq_bits_addr(deq_1_io_deq_bits_addr),
    .io_deq_bits_len(deq_1_io_deq_bits_len),
    .io_deq_bits_size(deq_1_io_deq_bits_size),
    .io_deq_bits_burst(deq_1_io_deq_bits_burst),
    .io_deq_bits_cache(deq_1_io_deq_bits_cache),
    .io_deq_bits_prot(deq_1_io_deq_bits_prot),
    .io_deq_bits_echo_extra_id(deq_1_io_deq_bits_echo_extra_id)
  );
  Queue_26 in_w_deq (
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
  assign auto_in_b_bits_resp = auto_out_b_bits_resp | _GEN_13;
  assign auto_in_b_bits_echo_extra_id = auto_out_b_bits_echo_extra_id;
  assign auto_in_ar_ready = deq_io_enq_ready;
  assign auto_in_r_valid = auto_out_r_valid;
  assign auto_in_r_bits_id = auto_out_r_bits_id;
  assign auto_in_r_bits_data = auto_out_r_bits_data;
  assign auto_in_r_bits_resp = auto_out_r_bits_resp;
  assign auto_in_r_bits_echo_extra_id = auto_out_r_bits_echo_extra_id;
  assign auto_in_r_bits_last = auto_out_r_bits_last & auto_out_r_bits_echo_real_last;
  assign auto_out_aw_valid = irr_1_valid & _in_aw_ready_T;
  assign auto_out_aw_bits_id = deq_1_io_deq_bits_id;
  assign auto_out_aw_bits_addr = ~_out_bits_addr_T_12;
  assign auto_out_aw_bits_len = bad_1 ? 8'h0 : maxSupported1_1;
  assign auto_out_aw_bits_size = deq_1_io_deq_bits_size;
  assign auto_out_aw_bits_cache = deq_1_io_deq_bits_cache;
  assign auto_out_aw_bits_prot = deq_1_io_deq_bits_prot;
  assign auto_out_aw_bits_echo_extra_id = deq_1_io_deq_bits_echo_extra_id;
  assign auto_out_aw_bits_echo_real_last = beats1_1 == len_1;
  assign auto_out_w_valid = in_w_valid & (~w_idle | wbeats_valid);
  assign auto_out_w_bits_data = in_w_deq_io_deq_bits_data;
  assign auto_out_w_bits_strb = in_w_deq_io_deq_bits_strb;
  assign auto_out_w_bits_last = w_todo == 9'h1;
  assign auto_out_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last;
  assign auto_out_ar_valid = deq_io_deq_valid;
  assign auto_out_ar_bits_id = deq_io_deq_bits_id;
  assign auto_out_ar_bits_addr = ~_out_bits_addr_T_5;
  assign auto_out_ar_bits_len = bad ? 8'h0 : maxSupported1;
  assign auto_out_ar_bits_size = deq_io_deq_bits_size;
  assign auto_out_ar_bits_cache = deq_io_deq_bits_cache;
  assign auto_out_ar_bits_prot = deq_io_deq_bits_prot;
  assign auto_out_ar_bits_echo_extra_id = deq_io_deq_bits_echo_extra_id;
  assign auto_out_ar_bits_echo_real_last = beats1 == len;
  assign auto_out_r_ready = auto_in_r_ready;
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = auto_in_ar_valid;
  assign deq_io_enq_bits_id = auto_in_ar_bits_id;
  assign deq_io_enq_bits_addr = auto_in_ar_bits_addr;
  assign deq_io_enq_bits_len = auto_in_ar_bits_len;
  assign deq_io_enq_bits_size = auto_in_ar_bits_size;
  assign deq_io_enq_bits_burst = auto_in_ar_bits_burst;
  assign deq_io_enq_bits_cache = auto_in_ar_bits_cache;
  assign deq_io_enq_bits_prot = auto_in_ar_bits_prot;
  assign deq_io_enq_bits_echo_extra_id = auto_in_ar_bits_echo_extra_id;
  assign deq_io_deq_ready = auto_out_ar_ready & ar_last;
  assign deq_1_clock = clock;
  assign deq_1_reset = reset;
  assign deq_1_io_enq_valid = auto_in_aw_valid;
  assign deq_1_io_enq_bits_id = auto_in_aw_bits_id;
  assign deq_1_io_enq_bits_addr = auto_in_aw_bits_addr;
  assign deq_1_io_enq_bits_len = auto_in_aw_bits_len;
  assign deq_1_io_enq_bits_size = auto_in_aw_bits_size;
  assign deq_1_io_enq_bits_burst = auto_in_aw_bits_burst;
  assign deq_1_io_enq_bits_cache = auto_in_aw_bits_cache;
  assign deq_1_io_enq_bits_prot = auto_in_aw_bits_prot;
  assign deq_1_io_enq_bits_echo_extra_id = auto_in_aw_bits_echo_extra_id;
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
    end else if (_T_22[0] & _T_26) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_0 <= 2'h0;
      end else begin
        error_0 <= _error_0_T;
      end
    end
    if (reset) begin
      error_1 <= 2'h0;
    end else if (_T_22[1] & _T_26) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_1 <= 2'h0;
      end else begin
        error_1 <= _error_1_T;
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
  r_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  r_len = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  busy_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  r_addr_1 = _RAND_4[31:0];
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule