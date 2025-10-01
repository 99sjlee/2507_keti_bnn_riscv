`default_nettype wire
module TLXbar(
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
  output        auto_in_1_d_bits_sink,
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
  input         auto_out_2_a_ready,
  output        auto_out_2_a_valid,
  output [2:0]  auto_out_2_a_bits_opcode,
  output [2:0]  auto_out_2_a_bits_param,
  output [3:0]  auto_out_2_a_bits_size,
  output [4:0]  auto_out_2_a_bits_source,
  output [31:0] auto_out_2_a_bits_address,
  output        auto_out_2_a_bits_user_amba_prot_bufferable,
  output        auto_out_2_a_bits_user_amba_prot_modifiable,
  output        auto_out_2_a_bits_user_amba_prot_readalloc,
  output        auto_out_2_a_bits_user_amba_prot_writealloc,
  output        auto_out_2_a_bits_user_amba_prot_privileged,
  output        auto_out_2_a_bits_user_amba_prot_secure,
  output        auto_out_2_a_bits_user_amba_prot_fetch,
  output [3:0]  auto_out_2_a_bits_mask,
  output [31:0] auto_out_2_a_bits_data,
  output        auto_out_2_a_bits_corrupt,
  output        auto_out_2_d_ready,
  input         auto_out_2_d_valid,
  input  [2:0]  auto_out_2_d_bits_opcode,
  input  [3:0]  auto_out_2_d_bits_size,
  input  [4:0]  auto_out_2_d_bits_source,
  input         auto_out_2_d_bits_denied,
  input  [31:0] auto_out_2_d_bits_data,
  input         auto_out_2_d_bits_corrupt,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [2:0]  auto_out_1_a_bits_param,
  output [2:0]  auto_out_1_a_bits_size,
  output [4:0]  auto_out_1_a_bits_source,
  output [31:0] auto_out_1_a_bits_address,
  output        auto_out_1_a_bits_user_amba_prot_bufferable,
  output        auto_out_1_a_bits_user_amba_prot_modifiable,
  output        auto_out_1_a_bits_user_amba_prot_readalloc,
  output        auto_out_1_a_bits_user_amba_prot_writealloc,
  output        auto_out_1_a_bits_user_amba_prot_privileged,
  output        auto_out_1_a_bits_user_amba_prot_secure,
  output        auto_out_1_a_bits_user_amba_prot_fetch,
  output [3:0]  auto_out_1_a_bits_mask,
  output [31:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [2:0]  auto_out_1_d_bits_size,
  input  [4:0]  auto_out_1_d_bits_source,
  input         auto_out_1_d_bits_denied,
  input  [31:0] auto_out_1_d_bits_data,
  input         auto_out_1_d_bits_corrupt,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [2:0]  auto_out_0_a_bits_param,
  output [3:0]  auto_out_0_a_bits_size,
  output [4:0]  auto_out_0_a_bits_source,
  output [27:0] auto_out_0_a_bits_address,
  output [3:0]  auto_out_0_a_bits_mask,
  output [31:0] auto_out_0_a_bits_data,
  output        auto_out_0_a_bits_corrupt,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [3:0]  auto_out_0_d_bits_size,
  input  [4:0]  auto_out_0_d_bits_source,
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
  reg [9:0] beatsLeft_3;
  wire  idle_3 = beatsLeft_3 == 10'h0;
  wire  requestDOI_2_0 = ~auto_out_2_d_bits_source[4];
  wire  portsDIO_filtered_2_0_valid = auto_out_2_d_valid & requestDOI_2_0;
  wire  requestDOI_1_0 = ~auto_out_1_d_bits_source[4];
  wire  portsDIO_filtered_1_0_valid = auto_out_1_d_valid & requestDOI_1_0;
  wire  requestDOI_0_0 = ~auto_out_0_d_bits_source[4];
  wire  portsDIO_filtered__0_valid = auto_out_0_d_valid & requestDOI_0_0;
  wire [2:0] readys_valid_3 = {portsDIO_filtered_2_0_valid,portsDIO_filtered_1_0_valid,portsDIO_filtered__0_valid};
  reg [2:0] readys_mask_3;
  wire [2:0] _readys_filter_T_6 = ~readys_mask_3;
  wire [2:0] _readys_filter_T_7 = readys_valid_3 & _readys_filter_T_6;
  wire [5:0] readys_filter_3 = {_readys_filter_T_7,portsDIO_filtered_2_0_valid,portsDIO_filtered_1_0_valid,
    portsDIO_filtered__0_valid};
  wire [5:0] _GEN_5 = {{1'd0}, readys_filter_3[5:1]};
  wire [5:0] _readys_unready_T_16 = readys_filter_3 | _GEN_5;
  wire [5:0] _GEN_6 = {{2'd0}, _readys_unready_T_16[5:2]};
  wire [5:0] _readys_unready_T_18 = _readys_unready_T_16 | _GEN_6;
  wire [5:0] _readys_unready_T_21 = {readys_mask_3, 3'h0};
  wire [5:0] _GEN_7 = {{1'd0}, _readys_unready_T_18[5:1]};
  wire [5:0] readys_unready_3 = _GEN_7 | _readys_unready_T_21;
  wire [2:0] _readys_readys_T_11 = readys_unready_3[5:3] & readys_unready_3[2:0];
  wire [2:0] readys_readys_3 = ~_readys_readys_T_11;
  wire  readys_3_0 = readys_readys_3[0];
  wire  earlyWinner_3_0 = readys_3_0 & portsDIO_filtered__0_valid;
  reg  state_3_0;
  wire  muxStateEarly_3_0 = idle_3 ? earlyWinner_3_0 : state_3_0;
  wire [4:0] _T_259 = muxStateEarly_3_0 ? auto_out_0_d_bits_source : 5'h0;
  wire  readys_3_1 = readys_readys_3[1];
  wire  earlyWinner_3_1 = readys_3_1 & portsDIO_filtered_1_0_valid;
  reg  state_3_1;
  wire  muxStateEarly_3_1 = idle_3 ? earlyWinner_3_1 : state_3_1;
  wire [4:0] _T_260 = muxStateEarly_3_1 ? auto_out_1_d_bits_source : 5'h0;
  wire [4:0] _T_262 = _T_259 | _T_260;
  wire  readys_3_2 = readys_readys_3[2];
  wire  earlyWinner_3_2 = readys_3_2 & portsDIO_filtered_2_0_valid;
  reg  state_3_2;
  wire  muxStateEarly_3_2 = idle_3 ? earlyWinner_3_2 : state_3_2;
  wire [4:0] _T_261 = muxStateEarly_3_2 ? auto_out_2_d_bits_source : 5'h0;
  wire [4:0] sink_ACancel_7_bits_source = _T_262 | _T_261;
  wire [4:0] _GEN_8 = {{2'd0}, auto_in_1_a_bits_source};
  wire [4:0] in_1_a_bits_source = _GEN_8 | 5'h10;
  reg [9:0] beatsLeft_4;
  wire  idle_4 = beatsLeft_4 == 10'h0;
  wire  requestDOI_2_1 = auto_out_2_d_bits_source[4:3] == 2'h2;
  wire  portsDIO_filtered_2_1_valid = auto_out_2_d_valid & requestDOI_2_1;
  wire  requestDOI_1_1 = auto_out_1_d_bits_source[4:3] == 2'h2;
  wire  portsDIO_filtered_1_1_valid = auto_out_1_d_valid & requestDOI_1_1;
  wire  requestDOI_0_1 = auto_out_0_d_bits_source[4:3] == 2'h2;
  wire  portsDIO_filtered__1_valid = auto_out_0_d_valid & requestDOI_0_1;
  wire [2:0] readys_valid_4 = {portsDIO_filtered_2_1_valid,portsDIO_filtered_1_1_valid,portsDIO_filtered__1_valid};
  reg [2:0] readys_mask_4;
  wire [2:0] _readys_filter_T_8 = ~readys_mask_4;
  wire [2:0] _readys_filter_T_9 = readys_valid_4 & _readys_filter_T_8;
  wire [5:0] readys_filter_4 = {_readys_filter_T_9,portsDIO_filtered_2_1_valid,portsDIO_filtered_1_1_valid,
    portsDIO_filtered__1_valid};
  wire [5:0] _GEN_9 = {{1'd0}, readys_filter_4[5:1]};
  wire [5:0] _readys_unready_T_23 = readys_filter_4 | _GEN_9;
  wire [5:0] _GEN_10 = {{2'd0}, _readys_unready_T_23[5:2]};
  wire [5:0] _readys_unready_T_25 = _readys_unready_T_23 | _GEN_10;
  wire [5:0] _readys_unready_T_28 = {readys_mask_4, 3'h0};
  wire [5:0] _GEN_11 = {{1'd0}, _readys_unready_T_25[5:1]};
  wire [5:0] readys_unready_4 = _GEN_11 | _readys_unready_T_28;
  wire [2:0] _readys_readys_T_14 = readys_unready_4[5:3] & readys_unready_4[2:0];
  wire [2:0] readys_readys_4 = ~_readys_readys_T_14;
  wire  readys_4_0 = readys_readys_4[0];
  wire  earlyWinner_4_0 = readys_4_0 & portsDIO_filtered__1_valid;
  reg  state_4_0;
  wire  muxStateEarly_4_0 = idle_4 ? earlyWinner_4_0 : state_4_0;
  wire [4:0] _T_331 = muxStateEarly_4_0 ? auto_out_0_d_bits_source : 5'h0;
  wire  readys_4_1 = readys_readys_4[1];
  wire  earlyWinner_4_1 = readys_4_1 & portsDIO_filtered_1_1_valid;
  reg  state_4_1;
  wire  muxStateEarly_4_1 = idle_4 ? earlyWinner_4_1 : state_4_1;
  wire [4:0] _T_332 = muxStateEarly_4_1 ? auto_out_1_d_bits_source : 5'h0;
  wire [4:0] _T_334 = _T_331 | _T_332;
  wire  readys_4_2 = readys_readys_4[2];
  wire  earlyWinner_4_2 = readys_4_2 & portsDIO_filtered_2_1_valid;
  reg  state_4_2;
  wire  muxStateEarly_4_2 = idle_4 ? earlyWinner_4_2 : state_4_2;
  wire [4:0] _T_333 = muxStateEarly_4_2 ? auto_out_2_d_bits_source : 5'h0;
  wire [4:0] sink_ACancel_9_bits_source = _T_334 | _T_333;
  wire [32:0] _requestAIO_T_1 = {1'b0,$signed(auto_in_0_a_bits_address)};
  wire [32:0] _requestAIO_T_3 = $signed(_requestAIO_T_1) & 33'shf0000000;
  wire  requestAIO_0_0 = $signed(_requestAIO_T_3) == 33'sh0;
  wire [31:0] _requestAIO_T_5 = auto_in_0_a_bits_address ^ 32'h10000000;
  wire [32:0] _requestAIO_T_6 = {1'b0,$signed(_requestAIO_T_5)};
  wire [32:0] _requestAIO_T_8 = $signed(_requestAIO_T_6) & 33'shf0000000;
  wire  _requestAIO_T_9 = $signed(_requestAIO_T_8) == 33'sh0;
  wire [31:0] _requestAIO_T_10 = auto_in_0_a_bits_address ^ 32'h20000000;
  wire [32:0] _requestAIO_T_11 = {1'b0,$signed(_requestAIO_T_10)};
  wire [32:0] _requestAIO_T_13 = $signed(_requestAIO_T_11) & 33'she0000000;
  wire  _requestAIO_T_14 = $signed(_requestAIO_T_13) == 33'sh0;
  wire [31:0] _requestAIO_T_15 = auto_in_0_a_bits_address ^ 32'h40000000;
  wire [32:0] _requestAIO_T_16 = {1'b0,$signed(_requestAIO_T_15)};
  wire [32:0] _requestAIO_T_18 = $signed(_requestAIO_T_16) & 33'shc0000000;
  wire  _requestAIO_T_19 = $signed(_requestAIO_T_18) == 33'sh0;
  wire [31:0] _requestAIO_T_20 = auto_in_0_a_bits_address ^ 32'h80000000;
  wire [32:0] _requestAIO_T_21 = {1'b0,$signed(_requestAIO_T_20)};
  wire [32:0] _requestAIO_T_23 = $signed(_requestAIO_T_21) & 33'shc0000000;
  wire  _requestAIO_T_24 = $signed(_requestAIO_T_23) == 33'sh0;
  wire  requestAIO_0_1 = _requestAIO_T_9 | _requestAIO_T_14 | _requestAIO_T_19 | _requestAIO_T_24;
  wire [31:0] _requestAIO_T_28 = auto_in_0_a_bits_address ^ 32'hc0000000;
  wire [32:0] _requestAIO_T_29 = {1'b0,$signed(_requestAIO_T_28)};
  wire [32:0] _requestAIO_T_31 = $signed(_requestAIO_T_29) & 33'shc0000000;
  wire  requestAIO_0_2 = $signed(_requestAIO_T_31) == 33'sh0;
  wire [32:0] _requestAIO_T_34 = {1'b0,$signed(auto_in_1_a_bits_address)};
  wire [32:0] _requestAIO_T_36 = $signed(_requestAIO_T_34) & 33'shf0000000;
  wire  requestAIO_1_0 = $signed(_requestAIO_T_36) == 33'sh0;
  wire [31:0] _requestAIO_T_38 = auto_in_1_a_bits_address ^ 32'h10000000;
  wire [32:0] _requestAIO_T_39 = {1'b0,$signed(_requestAIO_T_38)};
  wire [32:0] _requestAIO_T_41 = $signed(_requestAIO_T_39) & 33'shf0000000;
  wire  _requestAIO_T_42 = $signed(_requestAIO_T_41) == 33'sh0;
  wire [31:0] _requestAIO_T_43 = auto_in_1_a_bits_address ^ 32'h20000000;
  wire [32:0] _requestAIO_T_44 = {1'b0,$signed(_requestAIO_T_43)};
  wire [32:0] _requestAIO_T_46 = $signed(_requestAIO_T_44) & 33'she0000000;
  wire  _requestAIO_T_47 = $signed(_requestAIO_T_46) == 33'sh0;
  wire [31:0] _requestAIO_T_48 = auto_in_1_a_bits_address ^ 32'h40000000;
  wire [32:0] _requestAIO_T_49 = {1'b0,$signed(_requestAIO_T_48)};
  wire [32:0] _requestAIO_T_51 = $signed(_requestAIO_T_49) & 33'shc0000000;
  wire  _requestAIO_T_52 = $signed(_requestAIO_T_51) == 33'sh0;
  wire [31:0] _requestAIO_T_53 = auto_in_1_a_bits_address ^ 32'h80000000;
  wire [32:0] _requestAIO_T_54 = {1'b0,$signed(_requestAIO_T_53)};
  wire [32:0] _requestAIO_T_56 = $signed(_requestAIO_T_54) & 33'shc0000000;
  wire  _requestAIO_T_57 = $signed(_requestAIO_T_56) == 33'sh0;
  wire  requestAIO_1_1 = _requestAIO_T_42 | _requestAIO_T_47 | _requestAIO_T_52 | _requestAIO_T_57;
  wire [31:0] _requestAIO_T_61 = auto_in_1_a_bits_address ^ 32'hc0000000;
  wire [32:0] _requestAIO_T_62 = {1'b0,$signed(_requestAIO_T_61)};
  wire [32:0] _requestAIO_T_64 = $signed(_requestAIO_T_62) & 33'shc0000000;
  wire  requestAIO_1_2 = $signed(_requestAIO_T_64) == 33'sh0;
  wire [26:0] _beatsAI_decode_T_1 = 27'hfff << auto_in_0_a_bits_size;
  wire [11:0] _beatsAI_decode_T_3 = ~_beatsAI_decode_T_1[11:0];
  wire [9:0] beatsAI_decode = _beatsAI_decode_T_3[11:2];
  wire  beatsAI_opdata = ~auto_in_0_a_bits_opcode[2];
  wire [9:0] beatsAI_0 = beatsAI_opdata ? beatsAI_decode : 10'h0;
  wire [26:0] _beatsAI_decode_T_5 = 27'hfff << auto_in_1_a_bits_size;
  wire [11:0] _beatsAI_decode_T_7 = ~_beatsAI_decode_T_5[11:0];
  wire [9:0] beatsAI_decode_1 = _beatsAI_decode_T_7[11:2];
  wire  beatsAI_opdata_1 = ~auto_in_1_a_bits_opcode[2];
  wire [9:0] beatsAI_1 = beatsAI_opdata_1 ? beatsAI_decode_1 : 10'h0;
  wire [26:0] _beatsDO_decode_T_1 = 27'hfff << auto_out_0_d_bits_size;
  wire [11:0] _beatsDO_decode_T_3 = ~_beatsDO_decode_T_1[11:0];
  wire [9:0] beatsDO_decode = _beatsDO_decode_T_3[11:2];
  wire  beatsDO_opdata = auto_out_0_d_bits_opcode[0];
  wire [9:0] beatsDO_0 = beatsDO_opdata ? beatsDO_decode : 10'h0;
  wire [3:0] out_2_1_d_bits_size = {{1'd0}, auto_out_1_d_bits_size};
  wire [20:0] _beatsDO_decode_T_5 = 21'h3f << out_2_1_d_bits_size;
  wire [5:0] _beatsDO_decode_T_7 = ~_beatsDO_decode_T_5[5:0];
  wire [3:0] beatsDO_decode_1 = _beatsDO_decode_T_7[5:2];
  wire  beatsDO_opdata_1 = auto_out_1_d_bits_opcode[0];
  wire [3:0] beatsDO_1 = beatsDO_opdata_1 ? beatsDO_decode_1 : 4'h0;
  wire [22:0] _beatsDO_decode_T_9 = 23'hff << auto_out_2_d_bits_size;
  wire [7:0] _beatsDO_decode_T_11 = ~_beatsDO_decode_T_9[7:0];
  wire [5:0] beatsDO_decode_2 = _beatsDO_decode_T_11[7:2];
  wire  beatsDO_opdata_2 = auto_out_2_d_bits_opcode[0];
  wire [5:0] beatsDO_2 = beatsDO_opdata_2 ? beatsDO_decode_2 : 6'h0;
  wire  portsAOI_filtered__0_earlyValid = auto_in_0_a_valid & requestAIO_0_0;
  wire  portsAOI_filtered__1_earlyValid = auto_in_0_a_valid & requestAIO_0_1;
  wire  portsAOI_filtered__2_earlyValid = auto_in_0_a_valid & requestAIO_0_2;
  reg [9:0] beatsLeft;
  wire  idle = beatsLeft == 10'h0;
  wire  portsAOI_filtered_1_0_earlyValid = auto_in_1_a_valid & requestAIO_1_0;
  wire [1:0] readys_valid = {portsAOI_filtered_1_0_earlyValid,portsAOI_filtered__0_earlyValid};
  reg [1:0] readys_mask;
  wire [1:0] _readys_filter_T = ~readys_mask;
  wire [1:0] _readys_filter_T_1 = readys_valid & _readys_filter_T;
  wire [3:0] readys_filter = {_readys_filter_T_1,portsAOI_filtered_1_0_earlyValid,portsAOI_filtered__0_earlyValid};
  wire [3:0] _GEN_12 = {{1'd0}, readys_filter[3:1]};
  wire [3:0] _readys_unready_T_1 = readys_filter | _GEN_12;
  wire [3:0] _readys_unready_T_4 = {readys_mask, 2'h0};
  wire [3:0] _GEN_13 = {{1'd0}, _readys_unready_T_1[3:1]};
  wire [3:0] readys_unready = _GEN_13 | _readys_unready_T_4;
  wire [1:0] _readys_readys_T_2 = readys_unready[3:2] & readys_unready[1:0];
  wire [1:0] readys_readys = ~_readys_readys_T_2;
  wire  readys__0 = readys_readys[0];
  reg  state__0;
  wire  allowed__0 = idle ? readys__0 : state__0;
  wire  portsAOI_filtered__0_ready = auto_out_0_a_ready & allowed__0;
  reg [9:0] beatsLeft_1;
  wire  idle_1 = beatsLeft_1 == 10'h0;
  wire  portsAOI_filtered_1_1_earlyValid = auto_in_1_a_valid & requestAIO_1_1;
  wire [1:0] readys_valid_1 = {portsAOI_filtered_1_1_earlyValid,portsAOI_filtered__1_earlyValid};
  reg [1:0] readys_mask_1;
  wire [1:0] _readys_filter_T_2 = ~readys_mask_1;
  wire [1:0] _readys_filter_T_3 = readys_valid_1 & _readys_filter_T_2;
  wire [3:0] readys_filter_1 = {_readys_filter_T_3,portsAOI_filtered_1_1_earlyValid,portsAOI_filtered__1_earlyValid};
  wire [3:0] _GEN_14 = {{1'd0}, readys_filter_1[3:1]};
  wire [3:0] _readys_unready_T_6 = readys_filter_1 | _GEN_14;
  wire [3:0] _readys_unready_T_9 = {readys_mask_1, 2'h0};
  wire [3:0] _GEN_15 = {{1'd0}, _readys_unready_T_6[3:1]};
  wire [3:0] readys_unready_1 = _GEN_15 | _readys_unready_T_9;
  wire [1:0] _readys_readys_T_5 = readys_unready_1[3:2] & readys_unready_1[1:0];
  wire [1:0] readys_readys_1 = ~_readys_readys_T_5;
  wire  readys_1_0 = readys_readys_1[0];
  reg  state_1_0;
  wire  allowed_1_0 = idle_1 ? readys_1_0 : state_1_0;
  wire  portsAOI_filtered__1_ready = auto_out_1_a_ready & allowed_1_0;
  reg [9:0] beatsLeft_2;
  wire  idle_2 = beatsLeft_2 == 10'h0;
  wire  portsAOI_filtered_1_2_earlyValid = auto_in_1_a_valid & requestAIO_1_2;
  wire [1:0] readys_valid_2 = {portsAOI_filtered_1_2_earlyValid,portsAOI_filtered__2_earlyValid};
  reg [1:0] readys_mask_2;
  wire [1:0] _readys_filter_T_4 = ~readys_mask_2;
  wire [1:0] _readys_filter_T_5 = readys_valid_2 & _readys_filter_T_4;
  wire [3:0] readys_filter_2 = {_readys_filter_T_5,portsAOI_filtered_1_2_earlyValid,portsAOI_filtered__2_earlyValid};
  wire [3:0] _GEN_16 = {{1'd0}, readys_filter_2[3:1]};
  wire [3:0] _readys_unready_T_11 = readys_filter_2 | _GEN_16;
  wire [3:0] _readys_unready_T_14 = {readys_mask_2, 2'h0};
  wire [3:0] _GEN_17 = {{1'd0}, _readys_unready_T_11[3:1]};
  wire [3:0] readys_unready_2 = _GEN_17 | _readys_unready_T_14;
  wire [1:0] _readys_readys_T_8 = readys_unready_2[3:2] & readys_unready_2[1:0];
  wire [1:0] readys_readys_2 = ~_readys_readys_T_8;
  wire  readys_2_0 = readys_readys_2[0];
  reg  state_2_0;
  wire  allowed_2_0 = idle_2 ? readys_2_0 : state_2_0;
  wire  portsAOI_filtered__2_ready = auto_out_2_a_ready & allowed_2_0;
  wire  readys__1 = readys_readys[1];
  reg  state__1;
  wire  allowed__1 = idle ? readys__1 : state__1;
  wire  portsAOI_filtered_1_0_ready = auto_out_0_a_ready & allowed__1;
  wire  readys_1_1 = readys_readys_1[1];
  reg  state_1_1;
  wire  allowed_1_1 = idle_1 ? readys_1_1 : state_1_1;
  wire  portsAOI_filtered_1_1_ready = auto_out_1_a_ready & allowed_1_1;
  wire  readys_2_1 = readys_readys_2[1];
  reg  state_2_1;
  wire  allowed_2_1 = idle_2 ? readys_2_1 : state_2_1;
  wire  portsAOI_filtered_1_2_ready = auto_out_2_a_ready & allowed_2_1;
  wire  allowed_3_0 = idle_3 ? readys_3_0 : state_3_0;
  wire  out_10_ready = auto_in_0_d_ready & allowed_3_0;
  wire  allowed_4_0 = idle_4 ? readys_4_0 : state_4_0;
  wire  out_15_ready = auto_in_1_d_ready & allowed_4_0;
  wire  allowed_3_1 = idle_3 ? readys_3_1 : state_3_1;
  wire  out_11_ready = auto_in_0_d_ready & allowed_3_1;
  wire  allowed_4_1 = idle_4 ? readys_4_1 : state_4_1;
  wire  out_16_ready = auto_in_1_d_ready & allowed_4_1;
  wire  allowed_3_2 = idle_3 ? readys_3_2 : state_3_2;
  wire  out_12_ready = auto_in_0_d_ready & allowed_3_2;
  wire  allowed_4_2 = idle_4 ? readys_4_2 : state_4_2;
  wire  out_17_ready = auto_in_1_d_ready & allowed_4_2;
  wire  latch = idle & auto_out_0_a_ready;
  wire  _readys_T_3 = ~reset;
  wire [1:0] _readys_mask_T = readys_readys & readys_valid;
  wire [2:0] _readys_mask_T_1 = {_readys_mask_T, 1'h0};
  wire [1:0] _readys_mask_T_3 = _readys_mask_T | _readys_mask_T_1[1:0];
  wire  earlyWinner__0 = readys__0 & portsAOI_filtered__0_earlyValid;
  wire  earlyWinner__1 = readys__1 & portsAOI_filtered_1_0_earlyValid;
  wire  _prefixOR_T = earlyWinner__0 | earlyWinner__1;
  wire  _T_10 = portsAOI_filtered__0_earlyValid | portsAOI_filtered_1_0_earlyValid;
  wire  _T_11 = ~(portsAOI_filtered__0_earlyValid | portsAOI_filtered_1_0_earlyValid);
  wire [9:0] maskedBeats_0 = earlyWinner__0 ? beatsAI_0 : 10'h0;
  wire [9:0] maskedBeats_1 = earlyWinner__1 ? beatsAI_1 : 10'h0;
  wire [9:0] initBeats = maskedBeats_0 | maskedBeats_1;
  wire  muxStateEarly__0 = idle ? earlyWinner__0 : state__0;
  wire  muxStateEarly__1 = idle ? earlyWinner__1 : state__1;
  wire  _out_0_a_earlyValid_T_3 = state__0 & portsAOI_filtered__0_earlyValid | state__1 &
    portsAOI_filtered_1_0_earlyValid;
  wire  out_2_0_a_earlyValid = idle ? _T_10 : _out_0_a_earlyValid_T_3;
  wire  _beatsLeft_T_2 = auto_out_0_a_ready & out_2_0_a_earlyValid;
  wire [9:0] _GEN_18 = {{9'd0}, _beatsLeft_T_2};
  wire [9:0] _beatsLeft_T_4 = beatsLeft - _GEN_18;
  wire [31:0] _T_27 = muxStateEarly__0 ? auto_in_0_a_bits_data : 32'h0;
  wire [31:0] _T_28 = muxStateEarly__1 ? auto_in_1_a_bits_data : 32'h0;
  wire [3:0] _T_30 = muxStateEarly__0 ? auto_in_0_a_bits_mask : 4'h0;
  wire [3:0] _T_31 = muxStateEarly__1 ? auto_in_1_a_bits_mask : 4'h0;
  wire [31:0] _T_54 = muxStateEarly__0 ? auto_in_0_a_bits_address : 32'h0;
  wire [31:0] _T_55 = muxStateEarly__1 ? auto_in_1_a_bits_address : 32'h0;
  wire [31:0] out_2_0_a_bits_address = _T_54 | _T_55;
  wire [4:0] in_0_a_bits_source = {{1'd0}, auto_in_0_a_bits_source};
  wire [4:0] _T_57 = muxStateEarly__0 ? in_0_a_bits_source : 5'h0;
  wire [4:0] _T_58 = muxStateEarly__1 ? in_1_a_bits_source : 5'h0;
  wire [3:0] _T_60 = muxStateEarly__0 ? auto_in_0_a_bits_size : 4'h0;
  wire [3:0] _T_61 = muxStateEarly__1 ? auto_in_1_a_bits_size : 4'h0;
  wire [2:0] _T_63 = muxStateEarly__0 ? auto_in_0_a_bits_param : 3'h0;
  wire [2:0] _T_64 = muxStateEarly__1 ? auto_in_1_a_bits_param : 3'h0;
  wire [2:0] _T_66 = muxStateEarly__0 ? auto_in_0_a_bits_opcode : 3'h0;
  wire [2:0] _T_67 = muxStateEarly__1 ? auto_in_1_a_bits_opcode : 3'h0;
  wire  latch_1 = idle_1 & auto_out_1_a_ready;
  wire [1:0] _readys_mask_T_5 = readys_readys_1 & readys_valid_1;
  wire [2:0] _readys_mask_T_6 = {_readys_mask_T_5, 1'h0};
  wire [1:0] _readys_mask_T_8 = _readys_mask_T_5 | _readys_mask_T_6[1:0];
  wire  earlyWinner_1_0 = readys_1_0 & portsAOI_filtered__1_earlyValid;
  wire  earlyWinner_1_1 = readys_1_1 & portsAOI_filtered_1_1_earlyValid;
  wire  _prefixOR_T_1 = earlyWinner_1_0 | earlyWinner_1_1;
  wire  _T_79 = portsAOI_filtered__1_earlyValid | portsAOI_filtered_1_1_earlyValid;
  wire  _T_80 = ~(portsAOI_filtered__1_earlyValid | portsAOI_filtered_1_1_earlyValid);
  wire [9:0] maskedBeats_0_1 = earlyWinner_1_0 ? beatsAI_0 : 10'h0;
  wire [9:0] maskedBeats_1_1 = earlyWinner_1_1 ? beatsAI_1 : 10'h0;
  wire [9:0] initBeats_1 = maskedBeats_0_1 | maskedBeats_1_1;
  wire  muxStateEarly_1_0 = idle_1 ? earlyWinner_1_0 : state_1_0;
  wire  muxStateEarly_1_1 = idle_1 ? earlyWinner_1_1 : state_1_1;
  wire  _out_1_a_earlyValid_T_3 = state_1_0 & portsAOI_filtered__1_earlyValid | state_1_1 &
    portsAOI_filtered_1_1_earlyValid;
  wire  out_2_1_a_earlyValid = idle_1 ? _T_79 : _out_1_a_earlyValid_T_3;
  wire  _beatsLeft_T_8 = auto_out_1_a_ready & out_2_1_a_earlyValid;
  wire [9:0] _GEN_19 = {{9'd0}, _beatsLeft_T_8};
  wire [9:0] _beatsLeft_T_10 = beatsLeft_1 - _GEN_19;
  wire [31:0] _T_96 = muxStateEarly_1_0 ? auto_in_0_a_bits_data : 32'h0;
  wire [31:0] _T_97 = muxStateEarly_1_1 ? auto_in_1_a_bits_data : 32'h0;
  wire [3:0] _T_99 = muxStateEarly_1_0 ? auto_in_0_a_bits_mask : 4'h0;
  wire [3:0] _T_100 = muxStateEarly_1_1 ? auto_in_1_a_bits_mask : 4'h0;
  wire [31:0] _T_123 = muxStateEarly_1_0 ? auto_in_0_a_bits_address : 32'h0;
  wire [31:0] _T_124 = muxStateEarly_1_1 ? auto_in_1_a_bits_address : 32'h0;
  wire [4:0] _T_126 = muxStateEarly_1_0 ? in_0_a_bits_source : 5'h0;
  wire [4:0] _T_127 = muxStateEarly_1_1 ? in_1_a_bits_source : 5'h0;
  wire [3:0] _T_129 = muxStateEarly_1_0 ? auto_in_0_a_bits_size : 4'h0;
  wire [3:0] _T_130 = muxStateEarly_1_1 ? auto_in_1_a_bits_size : 4'h0;
  wire [3:0] out_2_1_a_bits_size = _T_129 | _T_130;
  wire [2:0] _T_132 = muxStateEarly_1_0 ? auto_in_0_a_bits_param : 3'h0;
  wire [2:0] _T_133 = muxStateEarly_1_1 ? auto_in_1_a_bits_param : 3'h0;
  wire [2:0] _T_135 = muxStateEarly_1_0 ? auto_in_0_a_bits_opcode : 3'h0;
  wire [2:0] _T_136 = muxStateEarly_1_1 ? auto_in_1_a_bits_opcode : 3'h0;
  wire  latch_2 = idle_2 & auto_out_2_a_ready;
  wire [1:0] _readys_mask_T_10 = readys_readys_2 & readys_valid_2;
  wire [2:0] _readys_mask_T_11 = {_readys_mask_T_10, 1'h0};
  wire [1:0] _readys_mask_T_13 = _readys_mask_T_10 | _readys_mask_T_11[1:0];
  wire  earlyWinner_2_0 = readys_2_0 & portsAOI_filtered__2_earlyValid;
  wire  earlyWinner_2_1 = readys_2_1 & portsAOI_filtered_1_2_earlyValid;
  wire  _prefixOR_T_2 = earlyWinner_2_0 | earlyWinner_2_1;
  wire  _T_148 = portsAOI_filtered__2_earlyValid | portsAOI_filtered_1_2_earlyValid;
  wire  _T_149 = ~(portsAOI_filtered__2_earlyValid | portsAOI_filtered_1_2_earlyValid);
  wire [9:0] maskedBeats_0_2 = earlyWinner_2_0 ? beatsAI_0 : 10'h0;
  wire [9:0] maskedBeats_1_2 = earlyWinner_2_1 ? beatsAI_1 : 10'h0;
  wire [9:0] initBeats_2 = maskedBeats_0_2 | maskedBeats_1_2;
  wire  muxStateEarly_2_0 = idle_2 ? earlyWinner_2_0 : state_2_0;
  wire  muxStateEarly_2_1 = idle_2 ? earlyWinner_2_1 : state_2_1;
  wire  _out_2_a_earlyValid_T_3 = state_2_0 & portsAOI_filtered__2_earlyValid | state_2_1 &
    portsAOI_filtered_1_2_earlyValid;
  wire  out_2_2_a_earlyValid = idle_2 ? _T_148 : _out_2_a_earlyValid_T_3;
  wire  _beatsLeft_T_14 = auto_out_2_a_ready & out_2_2_a_earlyValid;
  wire [9:0] _GEN_20 = {{9'd0}, _beatsLeft_T_14};
  wire [9:0] _beatsLeft_T_16 = beatsLeft_2 - _GEN_20;
  wire [31:0] _T_165 = muxStateEarly_2_0 ? auto_in_0_a_bits_data : 32'h0;
  wire [31:0] _T_166 = muxStateEarly_2_1 ? auto_in_1_a_bits_data : 32'h0;
  wire [3:0] _T_168 = muxStateEarly_2_0 ? auto_in_0_a_bits_mask : 4'h0;
  wire [3:0] _T_169 = muxStateEarly_2_1 ? auto_in_1_a_bits_mask : 4'h0;
  wire [31:0] _T_192 = muxStateEarly_2_0 ? auto_in_0_a_bits_address : 32'h0;
  wire [31:0] _T_193 = muxStateEarly_2_1 ? auto_in_1_a_bits_address : 32'h0;
  wire [4:0] _T_195 = muxStateEarly_2_0 ? in_0_a_bits_source : 5'h0;
  wire [4:0] _T_196 = muxStateEarly_2_1 ? in_1_a_bits_source : 5'h0;
  wire [3:0] _T_198 = muxStateEarly_2_0 ? auto_in_0_a_bits_size : 4'h0;
  wire [3:0] _T_199 = muxStateEarly_2_1 ? auto_in_1_a_bits_size : 4'h0;
  wire [2:0] _T_201 = muxStateEarly_2_0 ? auto_in_0_a_bits_param : 3'h0;
  wire [2:0] _T_202 = muxStateEarly_2_1 ? auto_in_1_a_bits_param : 3'h0;
  wire [2:0] _T_204 = muxStateEarly_2_0 ? auto_in_0_a_bits_opcode : 3'h0;
  wire [2:0] _T_205 = muxStateEarly_2_1 ? auto_in_1_a_bits_opcode : 3'h0;
  wire  latch_3 = idle_3 & auto_in_0_d_ready;
  wire [2:0] _readys_mask_T_15 = readys_readys_3 & readys_valid_3;
  wire [3:0] _readys_mask_T_16 = {_readys_mask_T_15, 1'h0};
  wire [2:0] _readys_mask_T_18 = _readys_mask_T_15 | _readys_mask_T_16[2:0];
  wire [4:0] _readys_mask_T_19 = {_readys_mask_T_18, 2'h0};
  wire [2:0] _readys_mask_T_21 = _readys_mask_T_18 | _readys_mask_T_19[2:0];
  wire  prefixOR_2 = earlyWinner_3_0 | earlyWinner_3_1;
  wire  _prefixOR_T_3 = prefixOR_2 | earlyWinner_3_2;
  wire  _T_222 = portsDIO_filtered__0_valid | portsDIO_filtered_1_0_valid | portsDIO_filtered_2_0_valid;
  wire  _T_223 = ~(portsDIO_filtered__0_valid | portsDIO_filtered_1_0_valid | portsDIO_filtered_2_0_valid);
  wire [9:0] maskedBeats_0_3 = earlyWinner_3_0 ? beatsDO_0 : 10'h0;
  wire [3:0] maskedBeats_1_3 = earlyWinner_3_1 ? beatsDO_1 : 4'h0;
  wire [5:0] maskedBeats_2 = earlyWinner_3_2 ? beatsDO_2 : 6'h0;
  wire [9:0] _GEN_21 = {{6'd0}, maskedBeats_1_3};
  wire [9:0] _initBeats_T = maskedBeats_0_3 | _GEN_21;
  wire [9:0] _GEN_22 = {{4'd0}, maskedBeats_2};
  wire [9:0] initBeats_3 = _initBeats_T | _GEN_22;
  wire  _sink_ACancel_earlyValid_T_6 = state_3_0 & portsDIO_filtered__0_valid | state_3_1 & portsDIO_filtered_1_0_valid
     | state_3_2 & portsDIO_filtered_2_0_valid;
  wire  sink_ACancel_7_earlyValid = idle_3 ? _T_222 : _sink_ACancel_earlyValid_T_6;
  wire  _beatsLeft_T_20 = auto_in_0_d_ready & sink_ACancel_7_earlyValid;
  wire [9:0] _GEN_23 = {{9'd0}, _beatsLeft_T_20};
  wire [9:0] _beatsLeft_T_22 = beatsLeft_3 - _GEN_23;
  wire [31:0] _T_244 = muxStateEarly_3_0 ? auto_out_0_d_bits_data : 32'h0;
  wire [31:0] _T_245 = muxStateEarly_3_1 ? auto_out_1_d_bits_data : 32'h0;
  wire [31:0] _T_246 = muxStateEarly_3_2 ? auto_out_2_d_bits_data : 32'h0;
  wire [31:0] _T_247 = _T_244 | _T_245;
  wire [3:0] _T_264 = muxStateEarly_3_0 ? auto_out_0_d_bits_size : 4'h0;
  wire [3:0] _T_265 = muxStateEarly_3_1 ? out_2_1_d_bits_size : 4'h0;
  wire [3:0] _T_266 = muxStateEarly_3_2 ? auto_out_2_d_bits_size : 4'h0;
  wire [3:0] _T_267 = _T_264 | _T_265;
  wire [2:0] _T_274 = muxStateEarly_3_0 ? auto_out_0_d_bits_opcode : 3'h0;
  wire [2:0] _T_275 = muxStateEarly_3_1 ? auto_out_1_d_bits_opcode : 3'h0;
  wire [2:0] _T_276 = muxStateEarly_3_2 ? auto_out_2_d_bits_opcode : 3'h0;
  wire [2:0] _T_277 = _T_274 | _T_275;
  wire  latch_4 = idle_4 & auto_in_1_d_ready;
  wire [2:0] _readys_mask_T_23 = readys_readys_4 & readys_valid_4;
  wire [3:0] _readys_mask_T_24 = {_readys_mask_T_23, 1'h0};
  wire [2:0] _readys_mask_T_26 = _readys_mask_T_23 | _readys_mask_T_24[2:0];
  wire [4:0] _readys_mask_T_27 = {_readys_mask_T_26, 2'h0};
  wire [2:0] _readys_mask_T_29 = _readys_mask_T_26 | _readys_mask_T_27[2:0];
  wire  prefixOR_2_1 = earlyWinner_4_0 | earlyWinner_4_1;
  wire  _prefixOR_T_4 = prefixOR_2_1 | earlyWinner_4_2;
  wire  _T_294 = portsDIO_filtered__1_valid | portsDIO_filtered_1_1_valid | portsDIO_filtered_2_1_valid;
  wire  _T_295 = ~(portsDIO_filtered__1_valid | portsDIO_filtered_1_1_valid | portsDIO_filtered_2_1_valid);
  wire [9:0] maskedBeats_0_4 = earlyWinner_4_0 ? beatsDO_0 : 10'h0;
  wire [3:0] maskedBeats_1_4 = earlyWinner_4_1 ? beatsDO_1 : 4'h0;
  wire [5:0] maskedBeats_2_1 = earlyWinner_4_2 ? beatsDO_2 : 6'h0;
  wire [9:0] _GEN_24 = {{6'd0}, maskedBeats_1_4};
  wire [9:0] _initBeats_T_1 = maskedBeats_0_4 | _GEN_24;
  wire [9:0] _GEN_25 = {{4'd0}, maskedBeats_2_1};
  wire [9:0] initBeats_4 = _initBeats_T_1 | _GEN_25;
  wire  _sink_ACancel_earlyValid_T_14 = state_4_0 & portsDIO_filtered__1_valid | state_4_1 & portsDIO_filtered_1_1_valid
     | state_4_2 & portsDIO_filtered_2_1_valid;
  wire  sink_ACancel_9_earlyValid = idle_4 ? _T_294 : _sink_ACancel_earlyValid_T_14;
  wire  _beatsLeft_T_26 = auto_in_1_d_ready & sink_ACancel_9_earlyValid;
  wire [9:0] _GEN_26 = {{9'd0}, _beatsLeft_T_26};
  wire [9:0] _beatsLeft_T_28 = beatsLeft_4 - _GEN_26;
  wire [31:0] _T_316 = muxStateEarly_4_0 ? auto_out_0_d_bits_data : 32'h0;
  wire [31:0] _T_317 = muxStateEarly_4_1 ? auto_out_1_d_bits_data : 32'h0;
  wire [31:0] _T_318 = muxStateEarly_4_2 ? auto_out_2_d_bits_data : 32'h0;
  wire [31:0] _T_319 = _T_316 | _T_317;
  wire [3:0] _T_336 = muxStateEarly_4_0 ? auto_out_0_d_bits_size : 4'h0;
  wire [3:0] _T_337 = muxStateEarly_4_1 ? out_2_1_d_bits_size : 4'h0;
  wire [3:0] _T_338 = muxStateEarly_4_2 ? auto_out_2_d_bits_size : 4'h0;
  wire [3:0] _T_339 = _T_336 | _T_337;
  wire [2:0] _T_346 = muxStateEarly_4_0 ? auto_out_0_d_bits_opcode : 3'h0;
  wire [2:0] _T_347 = muxStateEarly_4_1 ? auto_out_1_d_bits_opcode : 3'h0;
  wire [2:0] _T_348 = muxStateEarly_4_2 ? auto_out_2_d_bits_opcode : 3'h0;
  wire [2:0] _T_349 = _T_346 | _T_347;
  
  
  assign auto_in_1_a_ready = requestAIO_1_0 & portsAOI_filtered_1_0_ready | requestAIO_1_1 & portsAOI_filtered_1_1_ready
     | requestAIO_1_2 & portsAOI_filtered_1_2_ready;
  assign auto_in_1_d_valid = idle_4 ? _T_294 : _sink_ACancel_earlyValid_T_14;
  assign auto_in_1_d_bits_opcode = _T_349 | _T_348;
  assign auto_in_1_d_bits_param = muxStateEarly_4_0 ? auto_out_0_d_bits_param : 2'h0;
  assign auto_in_1_d_bits_size = _T_339 | _T_338;
  assign auto_in_1_d_bits_source = sink_ACancel_9_bits_source[2:0];
  assign auto_in_1_d_bits_sink = muxStateEarly_4_0 & auto_out_0_d_bits_sink;
  assign auto_in_1_d_bits_denied = muxStateEarly_4_0 & auto_out_0_d_bits_denied | muxStateEarly_4_1 &
    auto_out_1_d_bits_denied | muxStateEarly_4_2 & auto_out_2_d_bits_denied;
  assign auto_in_1_d_bits_data = _T_319 | _T_318;
  assign auto_in_1_d_bits_corrupt = muxStateEarly_4_0 & auto_out_0_d_bits_corrupt | muxStateEarly_4_1 &
    auto_out_1_d_bits_corrupt | muxStateEarly_4_2 & auto_out_2_d_bits_corrupt;
  assign auto_in_0_a_ready = requestAIO_0_0 & portsAOI_filtered__0_ready | requestAIO_0_1 & portsAOI_filtered__1_ready
     | requestAIO_0_2 & portsAOI_filtered__2_ready;
  assign auto_in_0_d_valid = idle_3 ? _T_222 : _sink_ACancel_earlyValid_T_6;
  assign auto_in_0_d_bits_opcode = _T_277 | _T_276;
  assign auto_in_0_d_bits_param = muxStateEarly_3_0 ? auto_out_0_d_bits_param : 2'h0;
  assign auto_in_0_d_bits_size = _T_267 | _T_266;
  assign auto_in_0_d_bits_source = sink_ACancel_7_bits_source[3:0];
  assign auto_in_0_d_bits_sink = muxStateEarly_3_0 & auto_out_0_d_bits_sink;
  assign auto_in_0_d_bits_denied = muxStateEarly_3_0 & auto_out_0_d_bits_denied | muxStateEarly_3_1 &
    auto_out_1_d_bits_denied | muxStateEarly_3_2 & auto_out_2_d_bits_denied;
  assign auto_in_0_d_bits_data = _T_247 | _T_246;
  assign auto_in_0_d_bits_corrupt = muxStateEarly_3_0 & auto_out_0_d_bits_corrupt | muxStateEarly_3_1 &
    auto_out_1_d_bits_corrupt | muxStateEarly_3_2 & auto_out_2_d_bits_corrupt;
  assign auto_out_2_a_valid = idle_2 ? _T_148 : _out_2_a_earlyValid_T_3;
  assign auto_out_2_a_bits_opcode = _T_204 | _T_205;
  assign auto_out_2_a_bits_param = _T_201 | _T_202;
  assign auto_out_2_a_bits_size = _T_198 | _T_199;
  assign auto_out_2_a_bits_source = _T_195 | _T_196;
  assign auto_out_2_a_bits_address = _T_192 | _T_193;
  assign auto_out_2_a_bits_user_amba_prot_bufferable = muxStateEarly_2_0 & auto_in_0_a_bits_user_amba_prot_bufferable;
  assign auto_out_2_a_bits_user_amba_prot_modifiable = muxStateEarly_2_0 & auto_in_0_a_bits_user_amba_prot_modifiable;
  assign auto_out_2_a_bits_user_amba_prot_readalloc = muxStateEarly_2_0 & auto_in_0_a_bits_user_amba_prot_readalloc;
  assign auto_out_2_a_bits_user_amba_prot_writealloc = muxStateEarly_2_0 & auto_in_0_a_bits_user_amba_prot_writealloc;
  assign auto_out_2_a_bits_user_amba_prot_privileged = muxStateEarly_2_0 & auto_in_0_a_bits_user_amba_prot_privileged |
    muxStateEarly_2_1;
  assign auto_out_2_a_bits_user_amba_prot_secure = muxStateEarly_2_0 & auto_in_0_a_bits_user_amba_prot_secure |
    muxStateEarly_2_1;
  assign auto_out_2_a_bits_user_amba_prot_fetch = muxStateEarly_2_0 & auto_in_0_a_bits_user_amba_prot_fetch;
  assign auto_out_2_a_bits_mask = _T_168 | _T_169;
  assign auto_out_2_a_bits_data = _T_165 | _T_166;
  assign auto_out_2_a_bits_corrupt = muxStateEarly_2_0 & auto_in_0_a_bits_corrupt | muxStateEarly_2_1 &
    auto_in_1_a_bits_corrupt;
  assign auto_out_2_d_ready = requestDOI_2_0 & out_12_ready | requestDOI_2_1 & out_17_ready;
  assign auto_out_1_a_valid = idle_1 ? _T_79 : _out_1_a_earlyValid_T_3;
  assign auto_out_1_a_bits_opcode = _T_135 | _T_136;
  assign auto_out_1_a_bits_param = _T_132 | _T_133;
  assign auto_out_1_a_bits_size = out_2_1_a_bits_size[2:0];
  assign auto_out_1_a_bits_source = _T_126 | _T_127;
  assign auto_out_1_a_bits_address = _T_123 | _T_124;
  assign auto_out_1_a_bits_user_amba_prot_bufferable = muxStateEarly_1_0 & auto_in_0_a_bits_user_amba_prot_bufferable;
  assign auto_out_1_a_bits_user_amba_prot_modifiable = muxStateEarly_1_0 & auto_in_0_a_bits_user_amba_prot_modifiable;
  assign auto_out_1_a_bits_user_amba_prot_readalloc = muxStateEarly_1_0 & auto_in_0_a_bits_user_amba_prot_readalloc;
  assign auto_out_1_a_bits_user_amba_prot_writealloc = muxStateEarly_1_0 & auto_in_0_a_bits_user_amba_prot_writealloc;
  assign auto_out_1_a_bits_user_amba_prot_privileged = muxStateEarly_1_0 & auto_in_0_a_bits_user_amba_prot_privileged |
    muxStateEarly_1_1;
  assign auto_out_1_a_bits_user_amba_prot_secure = muxStateEarly_1_0 & auto_in_0_a_bits_user_amba_prot_secure |
    muxStateEarly_1_1;
  assign auto_out_1_a_bits_user_amba_prot_fetch = muxStateEarly_1_0 & auto_in_0_a_bits_user_amba_prot_fetch;
  assign auto_out_1_a_bits_mask = _T_99 | _T_100;
  assign auto_out_1_a_bits_data = _T_96 | _T_97;
  assign auto_out_1_a_bits_corrupt = muxStateEarly_1_0 & auto_in_0_a_bits_corrupt | muxStateEarly_1_1 &
    auto_in_1_a_bits_corrupt;
  assign auto_out_1_d_ready = requestDOI_1_0 & out_11_ready | requestDOI_1_1 & out_16_ready;
  assign auto_out_0_a_valid = idle ? _T_10 : _out_0_a_earlyValid_T_3;
  assign auto_out_0_a_bits_opcode = _T_66 | _T_67;
  assign auto_out_0_a_bits_param = _T_63 | _T_64;
  assign auto_out_0_a_bits_size = _T_60 | _T_61;
  assign auto_out_0_a_bits_source = _T_57 | _T_58;
  assign auto_out_0_a_bits_address = out_2_0_a_bits_address[27:0];
  assign auto_out_0_a_bits_mask = _T_30 | _T_31;
  assign auto_out_0_a_bits_data = _T_27 | _T_28;
  assign auto_out_0_a_bits_corrupt = muxStateEarly__0 & auto_in_0_a_bits_corrupt | muxStateEarly__1 &
    auto_in_1_a_bits_corrupt;
  assign auto_out_0_d_ready = requestDOI_0_0 & out_10_ready | requestDOI_0_1 & out_15_ready;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = requestAIO_0_0 & portsAOI_filtered__0_ready | requestAIO_0_1 &
    portsAOI_filtered__1_ready | requestAIO_0_2 & portsAOI_filtered__2_ready;
  assign monitor_io_in_a_valid = auto_in_0_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_0_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_0_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_0_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_0_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_0_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_0_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_0_d_ready;
  assign monitor_io_in_d_valid = idle_3 ? _T_222 : _sink_ACancel_earlyValid_T_6;
  assign monitor_io_in_d_bits_opcode = _T_277 | _T_276;
  assign monitor_io_in_d_bits_param = muxStateEarly_3_0 ? auto_out_0_d_bits_param : 2'h0;
  assign monitor_io_in_d_bits_size = _T_267 | _T_266;
  assign monitor_io_in_d_bits_source = sink_ACancel_7_bits_source[3:0];
  assign monitor_io_in_d_bits_sink = muxStateEarly_3_0 & auto_out_0_d_bits_sink;
  assign monitor_io_in_d_bits_denied = muxStateEarly_3_0 & auto_out_0_d_bits_denied | muxStateEarly_3_1 &
    auto_out_1_d_bits_denied | muxStateEarly_3_2 & auto_out_2_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = muxStateEarly_3_0 & auto_out_0_d_bits_corrupt | muxStateEarly_3_1 &
    auto_out_1_d_bits_corrupt | muxStateEarly_3_2 & auto_out_2_d_bits_corrupt;
  assign monitor_1_clock = clock;
  assign monitor_1_reset = reset;
  assign monitor_1_io_in_a_ready = requestAIO_1_0 & portsAOI_filtered_1_0_ready | requestAIO_1_1 &
    portsAOI_filtered_1_1_ready | requestAIO_1_2 & portsAOI_filtered_1_2_ready;
  assign monitor_1_io_in_a_valid = auto_in_1_a_valid;
  assign monitor_1_io_in_a_bits_opcode = auto_in_1_a_bits_opcode;
  assign monitor_1_io_in_a_bits_param = auto_in_1_a_bits_param;
  assign monitor_1_io_in_a_bits_size = auto_in_1_a_bits_size;
  assign monitor_1_io_in_a_bits_source = auto_in_1_a_bits_source;
  assign monitor_1_io_in_a_bits_address = auto_in_1_a_bits_address;
  assign monitor_1_io_in_a_bits_mask = auto_in_1_a_bits_mask;
  assign monitor_1_io_in_a_bits_corrupt = auto_in_1_a_bits_corrupt;
  assign monitor_1_io_in_d_ready = auto_in_1_d_ready;
  assign monitor_1_io_in_d_valid = idle_4 ? _T_294 : _sink_ACancel_earlyValid_T_14;
  assign monitor_1_io_in_d_bits_opcode = _T_349 | _T_348;
  assign monitor_1_io_in_d_bits_param = muxStateEarly_4_0 ? auto_out_0_d_bits_param : 2'h0;
  assign monitor_1_io_in_d_bits_size = _T_339 | _T_338;
  assign monitor_1_io_in_d_bits_source = sink_ACancel_9_bits_source[2:0];
  assign monitor_1_io_in_d_bits_sink = muxStateEarly_4_0 & auto_out_0_d_bits_sink;
  assign monitor_1_io_in_d_bits_denied = muxStateEarly_4_0 & auto_out_0_d_bits_denied | muxStateEarly_4_1 &
    auto_out_1_d_bits_denied | muxStateEarly_4_2 & auto_out_2_d_bits_denied;
  assign monitor_1_io_in_d_bits_corrupt = muxStateEarly_4_0 & auto_out_0_d_bits_corrupt | muxStateEarly_4_1 &
    auto_out_1_d_bits_corrupt | muxStateEarly_4_2 & auto_out_2_d_bits_corrupt;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft_3 <= 10'h0;
    end else if (latch_3) begin
      beatsLeft_3 <= initBeats_3;
    end else begin
      beatsLeft_3 <= _beatsLeft_T_22;
    end
    if (reset) begin
      readys_mask_3 <= 3'h7;
    end else if (latch_3 & |readys_valid_3) begin
      readys_mask_3 <= _readys_mask_T_21;
    end
    if (reset) begin
      state_3_0 <= 1'h0;
    end else if (idle_3) begin
      state_3_0 <= earlyWinner_3_0;
    end
    if (reset) begin
      state_3_1 <= 1'h0;
    end else if (idle_3) begin
      state_3_1 <= earlyWinner_3_1;
    end
    if (reset) begin
      state_3_2 <= 1'h0;
    end else if (idle_3) begin
      state_3_2 <= earlyWinner_3_2;
    end
    if (reset) begin
      beatsLeft_4 <= 10'h0;
    end else if (latch_4) begin
      beatsLeft_4 <= initBeats_4;
    end else begin
      beatsLeft_4 <= _beatsLeft_T_28;
    end
    if (reset) begin
      readys_mask_4 <= 3'h7;
    end else if (latch_4 & |readys_valid_4) begin
      readys_mask_4 <= _readys_mask_T_29;
    end
    if (reset) begin
      state_4_0 <= 1'h0;
    end else if (idle_4) begin
      state_4_0 <= earlyWinner_4_0;
    end
    if (reset) begin
      state_4_1 <= 1'h0;
    end else if (idle_4) begin
      state_4_1 <= earlyWinner_4_1;
    end
    if (reset) begin
      state_4_2 <= 1'h0;
    end else if (idle_4) begin
      state_4_2 <= earlyWinner_4_2;
    end
    if (reset) begin
      beatsLeft <= 10'h0;
    end else if (latch) begin
      beatsLeft <= initBeats;
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin
      readys_mask <= 2'h3;
    end else if (latch & |readys_valid) begin
      readys_mask <= _readys_mask_T_3;
    end
    if (reset) begin
      state__0 <= 1'h0;
    end else if (idle) begin
      state__0 <= earlyWinner__0;
    end
    if (reset) begin
      beatsLeft_1 <= 10'h0;
    end else if (latch_1) begin
      beatsLeft_1 <= initBeats_1;
    end else begin
      beatsLeft_1 <= _beatsLeft_T_10;
    end
    if (reset) begin
      readys_mask_1 <= 2'h3;
    end else if (latch_1 & |readys_valid_1) begin
      readys_mask_1 <= _readys_mask_T_8;
    end
    if (reset) begin
      state_1_0 <= 1'h0;
    end else if (idle_1) begin
      state_1_0 <= earlyWinner_1_0;
    end
    if (reset) begin
      beatsLeft_2 <= 10'h0;
    end else if (latch_2) begin
      beatsLeft_2 <= initBeats_2;
    end else begin
      beatsLeft_2 <= _beatsLeft_T_16;
    end
    if (reset) begin
      readys_mask_2 <= 2'h3;
    end else if (latch_2 & |readys_valid_2) begin
      readys_mask_2 <= _readys_mask_T_13;
    end
    if (reset) begin
      state_2_0 <= 1'h0;
    end else if (idle_2) begin
      state_2_0 <= earlyWinner_2_0;
    end
    if (reset) begin
      state__1 <= 1'h0;
    end else if (idle) begin
      state__1 <= earlyWinner__1;
    end
    if (reset) begin
      state_1_1 <= 1'h0;
    end else if (idle_1) begin
      state_1_1 <= earlyWinner_1_1;
    end
    if (reset) begin
      state_2_1 <= 1'h0;
    end else if (idle_2) begin
      state_2_1 <= earlyWinner_2_1;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~earlyWinner__0 | ~earlyWinner__1) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(~earlyWinner__0 | ~earlyWinner__1)) begin
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
        if (~(~(portsAOI_filtered__0_earlyValid | portsAOI_filtered_1_0_earlyValid) | _prefixOR_T) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(~(portsAOI_filtered__0_earlyValid | portsAOI_filtered_1_0_earlyValid) | _prefixOR_T)) begin
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
        if (~(_T_11 | _T_10) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(_T_11 | _T_10)) begin
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
        if (~(~earlyWinner_1_0 | ~earlyWinner_1_1) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(~earlyWinner_1_0 | ~earlyWinner_1_1)) begin
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
        if (~(~(portsAOI_filtered__1_earlyValid | portsAOI_filtered_1_1_earlyValid) | _prefixOR_T_1) & _readys_T_3
          ) begin
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
        if (_readys_T_3 & ~(~(portsAOI_filtered__1_earlyValid | portsAOI_filtered_1_1_earlyValid) | _prefixOR_T_1)
          ) begin
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
        if (~(_T_80 | _T_79) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(_T_80 | _T_79)) begin
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
        if (~(~earlyWinner_2_0 | ~earlyWinner_2_1) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(~earlyWinner_2_0 | ~earlyWinner_2_1)) begin
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
        if (~(~(portsAOI_filtered__2_earlyValid | portsAOI_filtered_1_2_earlyValid) | _prefixOR_T_2) & _readys_T_3
          ) begin
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
        if (_readys_T_3 & ~(~(portsAOI_filtered__2_earlyValid | portsAOI_filtered_1_2_earlyValid) | _prefixOR_T_2)
          ) begin
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
        if (~(_T_149 | _T_148) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(_T_149 | _T_148)) begin
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
        if (~((~earlyWinner_3_0 | ~earlyWinner_3_1) & (~prefixOR_2 | ~earlyWinner_3_2)) & _readys_T_3) begin
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
        if (_readys_T_3 & ~((~earlyWinner_3_0 | ~earlyWinner_3_1) & (~prefixOR_2 | ~earlyWinner_3_2))) begin
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
        if (~(~(portsDIO_filtered__0_valid | portsDIO_filtered_1_0_valid | portsDIO_filtered_2_0_valid) | _prefixOR_T_3)
           & _readys_T_3) begin
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
        if (_readys_T_3 & ~(~(portsDIO_filtered__0_valid | portsDIO_filtered_1_0_valid | portsDIO_filtered_2_0_valid) |
          _prefixOR_T_3)) begin
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
        if (~(_T_223 | _T_222) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(_T_223 | _T_222)) begin
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
        if (~((~earlyWinner_4_0 | ~earlyWinner_4_1) & (~prefixOR_2_1 | ~earlyWinner_4_2)) & _readys_T_3) begin
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
        if (_readys_T_3 & ~((~earlyWinner_4_0 | ~earlyWinner_4_1) & (~prefixOR_2_1 | ~earlyWinner_4_2))) begin
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
        if (~(~(portsDIO_filtered__1_valid | portsDIO_filtered_1_1_valid | portsDIO_filtered_2_1_valid) | _prefixOR_T_4)
           & _readys_T_3) begin
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
        if (_readys_T_3 & ~(~(portsDIO_filtered__1_valid | portsDIO_filtered_1_1_valid | portsDIO_filtered_2_1_valid) |
          _prefixOR_T_4)) begin
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
        if (~(_T_295 | _T_294) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(_T_295 | _T_294)) begin
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
  beatsLeft_3 = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  readys_mask_3 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  state_3_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_3_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_3_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  beatsLeft_4 = _RAND_5[9:0];
  _RAND_6 = {1{`RANDOM}};
  readys_mask_4 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  state_4_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  state_4_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  state_4_2 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  beatsLeft = _RAND_10[9:0];
  _RAND_11 = {1{`RANDOM}};
  readys_mask = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  state__0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  beatsLeft_1 = _RAND_13[9:0];
  _RAND_14 = {1{`RANDOM}};
  readys_mask_1 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  state_1_0 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  beatsLeft_2 = _RAND_16[9:0];
  _RAND_17 = {1{`RANDOM}};
  readys_mask_2 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  state_2_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  state__1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  state_1_1 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  state_2_1 = _RAND_21[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule