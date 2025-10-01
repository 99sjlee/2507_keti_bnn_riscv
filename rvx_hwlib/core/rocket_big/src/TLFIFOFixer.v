`default_nettype wire
module TLFIFOFixer(
  input         clock,
  input         reset,
  output        auto_in_1_a_ready,
  input         auto_in_1_a_valid,
  input  [2:0]  auto_in_1_a_bits_opcode,
  input  [2:0]  auto_in_1_a_bits_param,
  input  [3:0]  auto_in_1_a_bits_size,
  input  [2:0]  auto_in_1_a_bits_source,
  input  [31:0] auto_in_1_a_bits_address,
  input  [3:0]  auto_in_1_a_bits_mask,
  input  [31:0] auto_in_1_a_bits_data,
  input         auto_in_1_a_bits_corrupt,
  input         auto_in_1_d_ready,
  output        auto_in_1_d_valid,
  output [2:0]  auto_in_1_d_bits_opcode,
  output [1:0]  auto_in_1_d_bits_param,
  output [3:0]  auto_in_1_d_bits_size,
  output [2:0]  auto_in_1_d_bits_source,
  output        auto_in_1_d_bits_denied,
  output [31:0] auto_in_1_d_bits_data,
  output        auto_in_1_d_bits_corrupt,
  output        auto_in_0_a_ready,
  input         auto_in_0_a_valid,
  input  [2:0]  auto_in_0_a_bits_opcode,
  input  [2:0]  auto_in_0_a_bits_param,
  input  [3:0]  auto_in_0_a_bits_size,
  input  [3:0]  auto_in_0_a_bits_source,
  input  [31:0] auto_in_0_a_bits_address,
  input         auto_in_0_a_bits_user_amba_prot_bufferable,
  input         auto_in_0_a_bits_user_amba_prot_modifiable,
  input         auto_in_0_a_bits_user_amba_prot_readalloc,
  input         auto_in_0_a_bits_user_amba_prot_writealloc,
  input         auto_in_0_a_bits_user_amba_prot_privileged,
  input         auto_in_0_a_bits_user_amba_prot_secure,
  input         auto_in_0_a_bits_user_amba_prot_fetch,
  input  [3:0]  auto_in_0_a_bits_mask,
  input  [31:0] auto_in_0_a_bits_data,
  input         auto_in_0_a_bits_corrupt,
  input         auto_in_0_d_ready,
  output        auto_in_0_d_valid,
  output [2:0]  auto_in_0_d_bits_opcode,
  output [1:0]  auto_in_0_d_bits_param,
  output [3:0]  auto_in_0_d_bits_size,
  output [3:0]  auto_in_0_d_bits_source,
  output        auto_in_0_d_bits_sink,
  output        auto_in_0_d_bits_denied,
  output [31:0] auto_in_0_d_bits_data,
  output        auto_in_0_d_bits_corrupt,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [2:0]  auto_out_1_a_bits_param,
  output [3:0]  auto_out_1_a_bits_size,
  output [2:0]  auto_out_1_a_bits_source,
  output [31:0] auto_out_1_a_bits_address,
  output [3:0]  auto_out_1_a_bits_mask,
  output [31:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [1:0]  auto_out_1_d_bits_param,
  input  [3:0]  auto_out_1_d_bits_size,
  input  [2:0]  auto_out_1_d_bits_source,
  input         auto_out_1_d_bits_sink,
  input         auto_out_1_d_bits_denied,
  input  [31:0] auto_out_1_d_bits_data,
  input         auto_out_1_d_bits_corrupt,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [2:0]  auto_out_0_a_bits_param,
  output [3:0]  auto_out_0_a_bits_size,
  output [3:0]  auto_out_0_a_bits_source,
  output [31:0] auto_out_0_a_bits_address,
  output        auto_out_0_a_bits_user_amba_prot_bufferable,
  output        auto_out_0_a_bits_user_amba_prot_modifiable,
  output        auto_out_0_a_bits_user_amba_prot_readalloc,
  output        auto_out_0_a_bits_user_amba_prot_writealloc,
  output        auto_out_0_a_bits_user_amba_prot_privileged,
  output        auto_out_0_a_bits_user_amba_prot_secure,
  output        auto_out_0_a_bits_user_amba_prot_fetch,
  output [3:0]  auto_out_0_a_bits_mask,
  output [31:0] auto_out_0_a_bits_data,
  output        auto_out_0_a_bits_corrupt,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [3:0]  auto_out_0_d_bits_size,
  input  [3:0]  auto_out_0_d_bits_source,
  input         auto_out_0_d_bits_sink,
  input         auto_out_0_d_bits_denied,
  input  [31:0] auto_out_0_d_bits_data,
  input         auto_out_0_d_bits_corrupt
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
  reg [31:0] _RAND_24;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [3:0] monitor_io_in_a_bits_size;
  wire [3:0] monitor_io_in_a_bits_source;
  wire [31:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [3:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  monitor_1_clock;
  wire  monitor_1_reset;
  wire  monitor_1_io_in_a_ready;
  wire  monitor_1_io_in_a_valid;
  wire [2:0] monitor_1_io_in_a_bits_opcode;
  wire [2:0] monitor_1_io_in_a_bits_param;
  wire [3:0] monitor_1_io_in_a_bits_size;
  wire [2:0] monitor_1_io_in_a_bits_source;
  wire [31:0] monitor_1_io_in_a_bits_address;
  wire [3:0] monitor_1_io_in_a_bits_mask;
  wire  monitor_1_io_in_a_bits_corrupt;
  wire  monitor_1_io_in_d_ready;
  wire  monitor_1_io_in_d_valid;
  wire [2:0] monitor_1_io_in_d_bits_opcode;
  wire [1:0] monitor_1_io_in_d_bits_param;
  wire [3:0] monitor_1_io_in_d_bits_size;
  wire [2:0] monitor_1_io_in_d_bits_source;
  wire  monitor_1_io_in_d_bits_sink;
  wire  monitor_1_io_in_d_bits_denied;
  wire  monitor_1_io_in_d_bits_corrupt;
  wire [32:0] _a_notFIFO_T_1 = {1'b0,$signed(auto_in_0_a_bits_address)};
  wire [31:0] _a_notFIFO_T_11 = auto_in_0_a_bits_address ^ 32'h10000000;
  wire [32:0] _a_notFIFO_T_12 = {1'b0,$signed(_a_notFIFO_T_11)};
  wire [32:0] _a_notFIFO_T_14 = $signed(_a_notFIFO_T_12) & 33'shf0000000;
  wire  _a_notFIFO_T_15 = $signed(_a_notFIFO_T_14) == 33'sh0;
  wire [31:0] _a_notFIFO_T_16 = auto_in_0_a_bits_address ^ 32'h20000000;
  wire [32:0] _a_notFIFO_T_17 = {1'b0,$signed(_a_notFIFO_T_16)};
  wire [32:0] _a_notFIFO_T_19 = $signed(_a_notFIFO_T_17) & 33'she0000000;
  wire  _a_notFIFO_T_20 = $signed(_a_notFIFO_T_19) == 33'sh0;
  wire [31:0] _a_notFIFO_T_21 = auto_in_0_a_bits_address ^ 32'h40000000;
  wire [32:0] _a_notFIFO_T_22 = {1'b0,$signed(_a_notFIFO_T_21)};
  wire [32:0] _a_notFIFO_T_24 = $signed(_a_notFIFO_T_22) & 33'shc0000000;
  wire  _a_notFIFO_T_25 = $signed(_a_notFIFO_T_24) == 33'sh0;
  wire [31:0] _a_notFIFO_T_26 = auto_in_0_a_bits_address ^ 32'h80000000;
  wire [32:0] _a_notFIFO_T_27 = {1'b0,$signed(_a_notFIFO_T_26)};
  wire [32:0] _a_notFIFO_T_29 = $signed(_a_notFIFO_T_27) & 33'shc0000000;
  wire  _a_notFIFO_T_30 = $signed(_a_notFIFO_T_29) == 33'sh0;
  wire  a_notFIFO = _a_notFIFO_T_15 | _a_notFIFO_T_20 | _a_notFIFO_T_25 | _a_notFIFO_T_30;
  wire [32:0] _a_id_T_3 = $signed(_a_notFIFO_T_1) & 33'sh80000000;
  wire  _a_id_T_4 = $signed(_a_id_T_3) == 33'sh0;
  wire [32:0] _a_id_T_8 = $signed(_a_notFIFO_T_27) & 33'sh80000000;
  wire  _a_id_T_9 = $signed(_a_id_T_8) == 33'sh0;
  wire [1:0] _a_id_T_11 = _a_id_T_9 ? 2'h2 : 2'h0;
  wire [1:0] _GEN_99 = {{1'd0}, _a_id_T_4};
  wire [1:0] a_id = _GEN_99 | _a_id_T_11;
  wire  a_noDomain = a_id == 2'h0;
  wire  stalls_a_sel = ~auto_in_0_a_bits_source[3];
  reg [9:0] a_first_counter;
  wire  a_first = a_first_counter == 10'h0;
  reg  flight__0;
  reg  flight__1;
  reg  flight__2;
  reg  flight__3;
  reg  flight__4;
  reg  flight__5;
  reg  flight__6;
  reg  flight__7;
  reg [1:0] stalls_id;
  wire  stalls_0 = stalls_a_sel & a_first & (flight__0 | flight__1 | flight__2 | flight__3 | flight__4 | flight__5 |
    flight__6 | flight__7) & (a_noDomain | stalls_id != a_id);
  reg  flight__8;
  reg  flight__9;
  reg  flight__10;
  reg  flight__11;
  reg  flight__12;
  reg  flight__13;
  reg  flight__14;
  reg  flight__15;
  reg [1:0] stalls_id_1;
  wire  stalls_1 = auto_in_0_a_bits_source[3] & a_first & (flight__8 | flight__9 | flight__10 | flight__11 | flight__12
     | flight__13 | flight__14 | flight__15) & (a_noDomain | stalls_id_1 != a_id);
  wire  stall = stalls_0 | stalls_1;
  wire  _bundleIn_0_a_ready_T_1 = a_notFIFO | ~stall;
  wire  bundleIn_0_a_ready = auto_out_0_a_ready & (a_notFIFO | ~stall);
  wire  _a_first_T = bundleIn_0_a_ready & auto_in_0_a_valid;
  wire [26:0] _a_first_beats1_decode_T_1 = 27'hfff << auto_in_0_a_bits_size;
  wire [11:0] _a_first_beats1_decode_T_3 = ~_a_first_beats1_decode_T_1[11:0];
  wire [9:0] a_first_beats1_decode = _a_first_beats1_decode_T_3[11:2];
  wire  a_first_beats1_opdata = ~auto_in_0_a_bits_opcode[2];
  wire [9:0] a_first_counter1 = a_first_counter - 10'h1;
  wire  _d_first_T = auto_in_0_d_ready & auto_out_0_d_valid;
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hfff << auto_out_0_d_bits_size;
  wire [11:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[11:0];
  wire [9:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[11:2];
  wire  d_first_beats1_opdata = auto_out_0_d_bits_opcode[0];
  reg [9:0] d_first_counter;
  wire [9:0] d_first_counter1 = d_first_counter - 10'h1;
  wire  d_first_first = d_first_counter == 10'h0;
  wire  d_first = d_first_first & auto_out_0_d_bits_opcode != 3'h6;
  wire  _flight_T = ~a_notFIFO;
  wire  _GEN_2 = 4'h0 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__0;
  wire  _GEN_3 = 4'h1 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__1;
  wire  _GEN_4 = 4'h2 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__2;
  wire  _GEN_5 = 4'h3 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__3;
  wire  _GEN_6 = 4'h4 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__4;
  wire  _GEN_7 = 4'h5 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__5;
  wire  _GEN_8 = 4'h6 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__6;
  wire  _GEN_9 = 4'h7 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__7;
  wire  _GEN_10 = 4'h8 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__8;
  wire  _GEN_11 = 4'h9 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__9;
  wire  _GEN_12 = 4'ha == auto_in_0_a_bits_source ? ~a_notFIFO : flight__10;
  wire  _GEN_13 = 4'hb == auto_in_0_a_bits_source ? ~a_notFIFO : flight__11;
  wire  _GEN_14 = 4'hc == auto_in_0_a_bits_source ? ~a_notFIFO : flight__12;
  wire  _GEN_15 = 4'hd == auto_in_0_a_bits_source ? ~a_notFIFO : flight__13;
  wire  _GEN_16 = 4'he == auto_in_0_a_bits_source ? ~a_notFIFO : flight__14;
  wire  _GEN_17 = 4'hf == auto_in_0_a_bits_source ? ~a_notFIFO : flight__15;
  wire  _GEN_18 = a_first & _a_first_T ? _GEN_2 : flight__0;
  wire  _GEN_19 = a_first & _a_first_T ? _GEN_3 : flight__1;
  wire  _GEN_20 = a_first & _a_first_T ? _GEN_4 : flight__2;
  wire  _GEN_21 = a_first & _a_first_T ? _GEN_5 : flight__3;
  wire  _GEN_22 = a_first & _a_first_T ? _GEN_6 : flight__4;
  wire  _GEN_23 = a_first & _a_first_T ? _GEN_7 : flight__5;
  wire  _GEN_24 = a_first & _a_first_T ? _GEN_8 : flight__6;
  wire  _GEN_25 = a_first & _a_first_T ? _GEN_9 : flight__7;
  wire  _GEN_26 = a_first & _a_first_T ? _GEN_10 : flight__8;
  wire  _GEN_27 = a_first & _a_first_T ? _GEN_11 : flight__9;
  wire  _GEN_28 = a_first & _a_first_T ? _GEN_12 : flight__10;
  wire  _GEN_29 = a_first & _a_first_T ? _GEN_13 : flight__11;
  wire  _GEN_30 = a_first & _a_first_T ? _GEN_14 : flight__12;
  wire  _GEN_31 = a_first & _a_first_T ? _GEN_15 : flight__13;
  wire  _GEN_32 = a_first & _a_first_T ? _GEN_16 : flight__14;
  wire  _GEN_33 = a_first & _a_first_T ? _GEN_17 : flight__15;
  wire  _stalls_id_T_3 = _a_first_T & stalls_a_sel & _flight_T;
  wire  _stalls_id_T_7 = _a_first_T & auto_in_0_a_bits_source[3] & _flight_T;
  wire [32:0] _a_notFIFO_T_38 = {1'b0,$signed(auto_in_1_a_bits_address)};
  wire [31:0] _a_notFIFO_T_48 = auto_in_1_a_bits_address ^ 32'h10000000;
  wire [32:0] _a_notFIFO_T_49 = {1'b0,$signed(_a_notFIFO_T_48)};
  wire [32:0] _a_notFIFO_T_51 = $signed(_a_notFIFO_T_49) & 33'shf0000000;
  wire  _a_notFIFO_T_52 = $signed(_a_notFIFO_T_51) == 33'sh0;
  wire [31:0] _a_notFIFO_T_53 = auto_in_1_a_bits_address ^ 32'h20000000;
  wire [32:0] _a_notFIFO_T_54 = {1'b0,$signed(_a_notFIFO_T_53)};
  wire [32:0] _a_notFIFO_T_56 = $signed(_a_notFIFO_T_54) & 33'she0000000;
  wire  _a_notFIFO_T_57 = $signed(_a_notFIFO_T_56) == 33'sh0;
  wire [31:0] _a_notFIFO_T_58 = auto_in_1_a_bits_address ^ 32'h40000000;
  wire [32:0] _a_notFIFO_T_59 = {1'b0,$signed(_a_notFIFO_T_58)};
  wire [32:0] _a_notFIFO_T_61 = $signed(_a_notFIFO_T_59) & 33'shc0000000;
  wire  _a_notFIFO_T_62 = $signed(_a_notFIFO_T_61) == 33'sh0;
  wire [31:0] _a_notFIFO_T_63 = auto_in_1_a_bits_address ^ 32'h80000000;
  wire [32:0] _a_notFIFO_T_64 = {1'b0,$signed(_a_notFIFO_T_63)};
  wire [32:0] _a_notFIFO_T_66 = $signed(_a_notFIFO_T_64) & 33'shc0000000;
  wire  _a_notFIFO_T_67 = $signed(_a_notFIFO_T_66) == 33'sh0;
  wire  a_notFIFO_1 = _a_notFIFO_T_52 | _a_notFIFO_T_57 | _a_notFIFO_T_62 | _a_notFIFO_T_67;
  wire [32:0] _a_id_T_16 = $signed(_a_notFIFO_T_38) & 33'sh80000000;
  wire  _a_id_T_17 = $signed(_a_id_T_16) == 33'sh0;
  wire [32:0] _a_id_T_21 = $signed(_a_notFIFO_T_64) & 33'sh80000000;
  wire  _a_id_T_22 = $signed(_a_id_T_21) == 33'sh0;
  wire [1:0] _a_id_T_24 = _a_id_T_22 ? 2'h2 : 2'h0;
  wire [1:0] _GEN_100 = {{1'd0}, _a_id_T_17};
  wire [1:0] a_id_1 = _GEN_100 | _a_id_T_24;
  wire  a_noDomain_1 = a_id_1 == 2'h0;
  wire  stalls_a_sel_2 = auto_in_1_a_bits_source[2:1] == 2'h1;
  reg [9:0] a_first_counter_1;
  wire  a_first_1 = a_first_counter_1 == 10'h0;
  reg  flight_1_2;
  reg  flight_1_3;
  reg [1:0] stalls_id_2;
  wire  stalls_0_1 = stalls_a_sel_2 & a_first_1 & (flight_1_2 | flight_1_3) & (a_noDomain_1 | stalls_id_2 != a_id_1);
  wire  _bundleIn_1_a_ready_T_1 = a_notFIFO_1 | ~stalls_0_1;
  wire  bundleIn_1_a_ready = auto_out_1_a_ready & (a_notFIFO_1 | ~stalls_0_1);
  wire  _a_first_T_1 = bundleIn_1_a_ready & auto_in_1_a_valid;
  wire [26:0] _a_first_beats1_decode_T_5 = 27'hfff << auto_in_1_a_bits_size;
  wire [11:0] _a_first_beats1_decode_T_7 = ~_a_first_beats1_decode_T_5[11:0];
  wire [9:0] a_first_beats1_decode_1 = _a_first_beats1_decode_T_7[11:2];
  wire  a_first_beats1_opdata_1 = ~auto_in_1_a_bits_opcode[2];
  wire [9:0] a_first_counter1_1 = a_first_counter_1 - 10'h1;
  wire  _d_first_T_2 = auto_in_1_d_ready & auto_out_1_d_valid;
  wire [26:0] _d_first_beats1_decode_T_5 = 27'hfff << auto_out_1_d_bits_size;
  wire [11:0] _d_first_beats1_decode_T_7 = ~_d_first_beats1_decode_T_5[11:0];
  wire [9:0] d_first_beats1_decode_1 = _d_first_beats1_decode_T_7[11:2];
  wire  d_first_beats1_opdata_1 = auto_out_1_d_bits_opcode[0];
  reg [9:0] d_first_counter_1;
  wire [9:0] d_first_counter1_1 = d_first_counter_1 - 10'h1;
  wire  d_first_first_1 = d_first_counter_1 == 10'h0;
  wire  d_first_1 = d_first_first_1 & auto_out_1_d_bits_opcode != 3'h6;
  wire  _flight_T_1 = ~a_notFIFO_1;
  wire  _GEN_74 = 3'h2 == auto_in_1_a_bits_source ? ~a_notFIFO_1 : flight_1_2;
  wire  _GEN_75 = 3'h3 == auto_in_1_a_bits_source ? ~a_notFIFO_1 : flight_1_3;
  wire  _GEN_80 = a_first_1 & _a_first_T_1 ? _GEN_74 : flight_1_2;
  wire  _GEN_81 = a_first_1 & _a_first_T_1 ? _GEN_75 : flight_1_3;
  wire  _stalls_id_T_11 = _a_first_T_1 & stalls_a_sel_2 & _flight_T_1;
  
  
  assign auto_in_1_a_ready = auto_out_1_a_ready & (a_notFIFO_1 | ~stalls_0_1);
  assign auto_in_1_d_valid = auto_out_1_d_valid;
  assign auto_in_1_d_bits_opcode = auto_out_1_d_bits_opcode;
  assign auto_in_1_d_bits_param = auto_out_1_d_bits_param;
  assign auto_in_1_d_bits_size = auto_out_1_d_bits_size;
  assign auto_in_1_d_bits_source = auto_out_1_d_bits_source;
  assign auto_in_1_d_bits_denied = auto_out_1_d_bits_denied;
  assign auto_in_1_d_bits_data = auto_out_1_d_bits_data;
  assign auto_in_1_d_bits_corrupt = auto_out_1_d_bits_corrupt;
  assign auto_in_0_a_ready = auto_out_0_a_ready & (a_notFIFO | ~stall);
  assign auto_in_0_d_valid = auto_out_0_d_valid;
  assign auto_in_0_d_bits_opcode = auto_out_0_d_bits_opcode;
  assign auto_in_0_d_bits_param = auto_out_0_d_bits_param;
  assign auto_in_0_d_bits_size = auto_out_0_d_bits_size;
  assign auto_in_0_d_bits_source = auto_out_0_d_bits_source;
  assign auto_in_0_d_bits_sink = auto_out_0_d_bits_sink;
  assign auto_in_0_d_bits_denied = auto_out_0_d_bits_denied;
  assign auto_in_0_d_bits_data = auto_out_0_d_bits_data;
  assign auto_in_0_d_bits_corrupt = auto_out_0_d_bits_corrupt;
  assign auto_out_1_a_valid = auto_in_1_a_valid & _bundleIn_1_a_ready_T_1;
  assign auto_out_1_a_bits_opcode = auto_in_1_a_bits_opcode;
  assign auto_out_1_a_bits_param = auto_in_1_a_bits_param;
  assign auto_out_1_a_bits_size = auto_in_1_a_bits_size;
  assign auto_out_1_a_bits_source = auto_in_1_a_bits_source;
  assign auto_out_1_a_bits_address = auto_in_1_a_bits_address;
  assign auto_out_1_a_bits_mask = auto_in_1_a_bits_mask;
  assign auto_out_1_a_bits_data = auto_in_1_a_bits_data;
  assign auto_out_1_a_bits_corrupt = auto_in_1_a_bits_corrupt;
  assign auto_out_1_d_ready = auto_in_1_d_ready;
  assign auto_out_0_a_valid = auto_in_0_a_valid & _bundleIn_0_a_ready_T_1;
  assign auto_out_0_a_bits_opcode = auto_in_0_a_bits_opcode;
  assign auto_out_0_a_bits_param = auto_in_0_a_bits_param;
  assign auto_out_0_a_bits_size = auto_in_0_a_bits_size;
  assign auto_out_0_a_bits_source = auto_in_0_a_bits_source;
  assign auto_out_0_a_bits_address = auto_in_0_a_bits_address;
  assign auto_out_0_a_bits_user_amba_prot_bufferable = auto_in_0_a_bits_user_amba_prot_bufferable;
  assign auto_out_0_a_bits_user_amba_prot_modifiable = auto_in_0_a_bits_user_amba_prot_modifiable;
  assign auto_out_0_a_bits_user_amba_prot_readalloc = auto_in_0_a_bits_user_amba_prot_readalloc;
  assign auto_out_0_a_bits_user_amba_prot_writealloc = auto_in_0_a_bits_user_amba_prot_writealloc;
  assign auto_out_0_a_bits_user_amba_prot_privileged = auto_in_0_a_bits_user_amba_prot_privileged;
  assign auto_out_0_a_bits_user_amba_prot_secure = auto_in_0_a_bits_user_amba_prot_secure;
  assign auto_out_0_a_bits_user_amba_prot_fetch = auto_in_0_a_bits_user_amba_prot_fetch;
  assign auto_out_0_a_bits_mask = auto_in_0_a_bits_mask;
  assign auto_out_0_a_bits_data = auto_in_0_a_bits_data;
  assign auto_out_0_a_bits_corrupt = auto_in_0_a_bits_corrupt;
  assign auto_out_0_d_ready = auto_in_0_d_ready;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_0_a_ready & (a_notFIFO | ~stall);
  assign monitor_io_in_a_valid = auto_in_0_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_0_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_0_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_0_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_0_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_0_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_0_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_0_d_ready;
  assign monitor_io_in_d_valid = auto_out_0_d_valid;
  assign monitor_io_in_d_bits_opcode = auto_out_0_d_bits_opcode;
  assign monitor_io_in_d_bits_param = auto_out_0_d_bits_param;
  assign monitor_io_in_d_bits_size = auto_out_0_d_bits_size;
  assign monitor_io_in_d_bits_source = auto_out_0_d_bits_source;
  assign monitor_io_in_d_bits_sink = auto_out_0_d_bits_sink;
  assign monitor_io_in_d_bits_denied = auto_out_0_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = auto_out_0_d_bits_corrupt;
  assign monitor_1_clock = clock;
  assign monitor_1_reset = reset;
  assign monitor_1_io_in_a_ready = auto_out_1_a_ready & (a_notFIFO_1 | ~stalls_0_1);
  assign monitor_1_io_in_a_valid = auto_in_1_a_valid;
  assign monitor_1_io_in_a_bits_opcode = auto_in_1_a_bits_opcode;
  assign monitor_1_io_in_a_bits_param = auto_in_1_a_bits_param;
  assign monitor_1_io_in_a_bits_size = auto_in_1_a_bits_size;
  assign monitor_1_io_in_a_bits_source = auto_in_1_a_bits_source;
  assign monitor_1_io_in_a_bits_address = auto_in_1_a_bits_address;
  assign monitor_1_io_in_a_bits_mask = auto_in_1_a_bits_mask;
  assign monitor_1_io_in_a_bits_corrupt = auto_in_1_a_bits_corrupt;
  assign monitor_1_io_in_d_ready = auto_in_1_d_ready;
  assign monitor_1_io_in_d_valid = auto_out_1_d_valid;
  assign monitor_1_io_in_d_bits_opcode = auto_out_1_d_bits_opcode;
  assign monitor_1_io_in_d_bits_param = auto_out_1_d_bits_param;
  assign monitor_1_io_in_d_bits_size = auto_out_1_d_bits_size;
  assign monitor_1_io_in_d_bits_source = auto_out_1_d_bits_source;
  assign monitor_1_io_in_d_bits_sink = auto_out_1_d_bits_sink;
  assign monitor_1_io_in_d_bits_denied = auto_out_1_d_bits_denied;
  assign monitor_1_io_in_d_bits_corrupt = auto_out_1_d_bits_corrupt;
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 10'h0;
    end else if (_a_first_T) begin
      if (a_first) begin
        if (a_first_beats1_opdata) begin
          a_first_counter <= a_first_beats1_decode;
        end else begin
          a_first_counter <= 10'h0;
        end
      end else begin
        a_first_counter <= a_first_counter1;
      end
    end
    if (reset) begin
      flight__0 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h0 == auto_out_0_d_bits_source) begin
        flight__0 <= 1'h0;
      end else begin
        flight__0 <= _GEN_18;
      end
    end else begin
      flight__0 <= _GEN_18;
    end
    if (reset) begin
      flight__1 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h1 == auto_out_0_d_bits_source) begin
        flight__1 <= 1'h0;
      end else begin
        flight__1 <= _GEN_19;
      end
    end else begin
      flight__1 <= _GEN_19;
    end
    if (reset) begin
      flight__2 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h2 == auto_out_0_d_bits_source) begin
        flight__2 <= 1'h0;
      end else begin
        flight__2 <= _GEN_20;
      end
    end else begin
      flight__2 <= _GEN_20;
    end
    if (reset) begin
      flight__3 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h3 == auto_out_0_d_bits_source) begin
        flight__3 <= 1'h0;
      end else begin
        flight__3 <= _GEN_21;
      end
    end else begin
      flight__3 <= _GEN_21;
    end
    if (reset) begin
      flight__4 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h4 == auto_out_0_d_bits_source) begin
        flight__4 <= 1'h0;
      end else begin
        flight__4 <= _GEN_22;
      end
    end else begin
      flight__4 <= _GEN_22;
    end
    if (reset) begin
      flight__5 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h5 == auto_out_0_d_bits_source) begin
        flight__5 <= 1'h0;
      end else begin
        flight__5 <= _GEN_23;
      end
    end else begin
      flight__5 <= _GEN_23;
    end
    if (reset) begin
      flight__6 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h6 == auto_out_0_d_bits_source) begin
        flight__6 <= 1'h0;
      end else begin
        flight__6 <= _GEN_24;
      end
    end else begin
      flight__6 <= _GEN_24;
    end
    if (reset) begin
      flight__7 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h7 == auto_out_0_d_bits_source) begin
        flight__7 <= 1'h0;
      end else begin
        flight__7 <= _GEN_25;
      end
    end else begin
      flight__7 <= _GEN_25;
    end
    if (_stalls_id_T_3) begin
      stalls_id <= a_id;
    end
    if (reset) begin
      flight__8 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h8 == auto_out_0_d_bits_source) begin
        flight__8 <= 1'h0;
      end else begin
        flight__8 <= _GEN_26;
      end
    end else begin
      flight__8 <= _GEN_26;
    end
    if (reset) begin
      flight__9 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h9 == auto_out_0_d_bits_source) begin
        flight__9 <= 1'h0;
      end else begin
        flight__9 <= _GEN_27;
      end
    end else begin
      flight__9 <= _GEN_27;
    end
    if (reset) begin
      flight__10 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'ha == auto_out_0_d_bits_source) begin
        flight__10 <= 1'h0;
      end else begin
        flight__10 <= _GEN_28;
      end
    end else begin
      flight__10 <= _GEN_28;
    end
    if (reset) begin
      flight__11 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'hb == auto_out_0_d_bits_source) begin
        flight__11 <= 1'h0;
      end else begin
        flight__11 <= _GEN_29;
      end
    end else begin
      flight__11 <= _GEN_29;
    end
    if (reset) begin
      flight__12 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'hc == auto_out_0_d_bits_source) begin
        flight__12 <= 1'h0;
      end else begin
        flight__12 <= _GEN_30;
      end
    end else begin
      flight__12 <= _GEN_30;
    end
    if (reset) begin
      flight__13 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'hd == auto_out_0_d_bits_source) begin
        flight__13 <= 1'h0;
      end else begin
        flight__13 <= _GEN_31;
      end
    end else begin
      flight__13 <= _GEN_31;
    end
    if (reset) begin
      flight__14 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'he == auto_out_0_d_bits_source) begin
        flight__14 <= 1'h0;
      end else begin
        flight__14 <= _GEN_32;
      end
    end else begin
      flight__14 <= _GEN_32;
    end
    if (reset) begin
      flight__15 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'hf == auto_out_0_d_bits_source) begin
        flight__15 <= 1'h0;
      end else begin
        flight__15 <= _GEN_33;
      end
    end else begin
      flight__15 <= _GEN_33;
    end
    if (_stalls_id_T_7) begin
      stalls_id_1 <= a_id;
    end
    if (reset) begin
      d_first_counter <= 10'h0;
    end else if (_d_first_T) begin
      if (d_first_first) begin
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
      a_first_counter_1 <= 10'h0;
    end else if (_a_first_T_1) begin
      if (a_first_1) begin
        if (a_first_beats1_opdata_1) begin
          a_first_counter_1 <= a_first_beats1_decode_1;
        end else begin
          a_first_counter_1 <= 10'h0;
        end
      end else begin
        a_first_counter_1 <= a_first_counter1_1;
      end
    end
    if (reset) begin
      flight_1_2 <= 1'h0;
    end else if (d_first_1 & _d_first_T_2) begin
      if (3'h2 == auto_out_1_d_bits_source) begin
        flight_1_2 <= 1'h0;
      end else begin
        flight_1_2 <= _GEN_80;
      end
    end else begin
      flight_1_2 <= _GEN_80;
    end
    if (reset) begin
      flight_1_3 <= 1'h0;
    end else if (d_first_1 & _d_first_T_2) begin
      if (3'h3 == auto_out_1_d_bits_source) begin
        flight_1_3 <= 1'h0;
      end else begin
        flight_1_3 <= _GEN_81;
      end
    end else begin
      flight_1_3 <= _GEN_81;
    end
    if (_stalls_id_T_11) begin
      stalls_id_2 <= a_id_1;
    end
    if (reset) begin
      d_first_counter_1 <= 10'h0;
    end else if (_d_first_T_2) begin
      if (d_first_first_1) begin
        if (d_first_beats1_opdata_1) begin
          d_first_counter_1 <= d_first_beats1_decode_1;
        end else begin
          d_first_counter_1 <= 10'h0;
        end
      end else begin
        d_first_counter_1 <= d_first_counter1_1;
      end
    end
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
  a_first_counter = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  flight__0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  flight__1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  flight__2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  flight__3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  flight__4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  flight__5 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  flight__6 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  flight__7 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stalls_id = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  flight__8 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  flight__9 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  flight__10 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  flight__11 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  flight__12 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  flight__13 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  flight__14 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  flight__15 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stalls_id_1 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  d_first_counter = _RAND_19[9:0];
  _RAND_20 = {1{`RANDOM}};
  a_first_counter_1 = _RAND_20[9:0];
  _RAND_21 = {1{`RANDOM}};
  flight_1_2 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  flight_1_3 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  stalls_id_2 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  d_first_counter_1 = _RAND_24[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule