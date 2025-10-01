`default_nettype wire
module AXI4Xbar(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
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
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [31:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_3_aw_ready,
  output        auto_out_3_aw_valid,
  output [3:0]  auto_out_3_aw_bits_id,
  output [31:0] auto_out_3_aw_bits_addr,
  output [7:0]  auto_out_3_aw_bits_len,
  output [2:0]  auto_out_3_aw_bits_size,
  output [1:0]  auto_out_3_aw_bits_burst,
  input         auto_out_3_w_ready,
  output        auto_out_3_w_valid,
  output [31:0] auto_out_3_w_bits_data,
  output [3:0]  auto_out_3_w_bits_strb,
  output        auto_out_3_w_bits_last,
  output        auto_out_3_b_ready,
  input         auto_out_3_b_valid,
  input  [3:0]  auto_out_3_b_bits_id,
  input  [1:0]  auto_out_3_b_bits_resp,
  input         auto_out_3_ar_ready,
  output        auto_out_3_ar_valid,
  output [3:0]  auto_out_3_ar_bits_id,
  output [31:0] auto_out_3_ar_bits_addr,
  output [7:0]  auto_out_3_ar_bits_len,
  output [2:0]  auto_out_3_ar_bits_size,
  output [1:0]  auto_out_3_ar_bits_burst,
  output        auto_out_3_r_ready,
  input         auto_out_3_r_valid,
  input  [3:0]  auto_out_3_r_bits_id,
  input  [31:0] auto_out_3_r_bits_data,
  input  [1:0]  auto_out_3_r_bits_resp,
  input         auto_out_3_r_bits_last,
  input         auto_out_2_aw_ready,
  output        auto_out_2_aw_valid,
  output [3:0]  auto_out_2_aw_bits_id,
  output [30:0] auto_out_2_aw_bits_addr,
  output [7:0]  auto_out_2_aw_bits_len,
  output [2:0]  auto_out_2_aw_bits_size,
  output [1:0]  auto_out_2_aw_bits_burst,
  input         auto_out_2_w_ready,
  output        auto_out_2_w_valid,
  output [31:0] auto_out_2_w_bits_data,
  output [3:0]  auto_out_2_w_bits_strb,
  output        auto_out_2_w_bits_last,
  output        auto_out_2_b_ready,
  input         auto_out_2_b_valid,
  input  [3:0]  auto_out_2_b_bits_id,
  input  [1:0]  auto_out_2_b_bits_resp,
  input         auto_out_2_ar_ready,
  output        auto_out_2_ar_valid,
  output [3:0]  auto_out_2_ar_bits_id,
  output [30:0] auto_out_2_ar_bits_addr,
  output [7:0]  auto_out_2_ar_bits_len,
  output [2:0]  auto_out_2_ar_bits_size,
  output [1:0]  auto_out_2_ar_bits_burst,
  output        auto_out_2_r_ready,
  input         auto_out_2_r_valid,
  input  [3:0]  auto_out_2_r_bits_id,
  input  [31:0] auto_out_2_r_bits_data,
  input  [1:0]  auto_out_2_r_bits_resp,
  input         auto_out_2_r_bits_last,
  input         auto_out_1_aw_ready,
  output        auto_out_1_aw_valid,
  output [3:0]  auto_out_1_aw_bits_id,
  output [29:0] auto_out_1_aw_bits_addr,
  output [7:0]  auto_out_1_aw_bits_len,
  output [2:0]  auto_out_1_aw_bits_size,
  output [1:0]  auto_out_1_aw_bits_burst,
  input         auto_out_1_w_ready,
  output        auto_out_1_w_valid,
  output [31:0] auto_out_1_w_bits_data,
  output [3:0]  auto_out_1_w_bits_strb,
  output        auto_out_1_w_bits_last,
  output        auto_out_1_b_ready,
  input         auto_out_1_b_valid,
  input  [3:0]  auto_out_1_b_bits_id,
  input  [1:0]  auto_out_1_b_bits_resp,
  input         auto_out_1_ar_ready,
  output        auto_out_1_ar_valid,
  output [3:0]  auto_out_1_ar_bits_id,
  output [29:0] auto_out_1_ar_bits_addr,
  output [7:0]  auto_out_1_ar_bits_len,
  output [2:0]  auto_out_1_ar_bits_size,
  output [1:0]  auto_out_1_ar_bits_burst,
  output        auto_out_1_r_ready,
  input         auto_out_1_r_valid,
  input  [3:0]  auto_out_1_r_bits_id,
  input  [31:0] auto_out_1_r_bits_data,
  input  [1:0]  auto_out_1_r_bits_resp,
  input         auto_out_1_r_bits_last,
  input         auto_out_0_aw_ready,
  output        auto_out_0_aw_valid,
  output [3:0]  auto_out_0_aw_bits_id,
  output [28:0] auto_out_0_aw_bits_addr,
  output [7:0]  auto_out_0_aw_bits_len,
  output [2:0]  auto_out_0_aw_bits_size,
  output [1:0]  auto_out_0_aw_bits_burst,
  input         auto_out_0_w_ready,
  output        auto_out_0_w_valid,
  output [31:0] auto_out_0_w_bits_data,
  output [3:0]  auto_out_0_w_bits_strb,
  output        auto_out_0_w_bits_last,
  output        auto_out_0_b_ready,
  input         auto_out_0_b_valid,
  input  [3:0]  auto_out_0_b_bits_id,
  input  [1:0]  auto_out_0_b_bits_resp,
  input         auto_out_0_ar_ready,
  output        auto_out_0_ar_valid,
  output [3:0]  auto_out_0_ar_bits_id,
  output [28:0] auto_out_0_ar_bits_addr,
  output [7:0]  auto_out_0_ar_bits_len,
  output [2:0]  auto_out_0_ar_bits_size,
  output [1:0]  auto_out_0_ar_bits_burst,
  output        auto_out_0_r_ready,
  input         auto_out_0_r_valid,
  input  [3:0]  auto_out_0_r_bits_id,
  input  [31:0] auto_out_0_r_bits_data,
  input  [1:0]  auto_out_0_r_bits_resp,
  input         auto_out_0_r_bits_last
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
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  wire  awIn_0_clock;
  wire  awIn_0_reset;
  wire  awIn_0_io_enq_ready;
  wire  awIn_0_io_enq_valid;
  wire [3:0] awIn_0_io_enq_bits;
  wire  awIn_0_io_deq_ready;
  wire  awIn_0_io_deq_valid;
  wire [3:0] awIn_0_io_deq_bits;
  wire [32:0] _requestARIO_T_1 = {1'b0,$signed(auto_in_ar_bits_addr)};
  wire [32:0] _requestARIO_T_3 = $signed(_requestARIO_T_1) & 33'she0000000;
  wire  requestARIO_0_0 = $signed(_requestARIO_T_3) == 33'sh0;
  wire [31:0] _requestARIO_T_5 = auto_in_ar_bits_addr ^ 32'h20000000;
  wire [32:0] _requestARIO_T_6 = {1'b0,$signed(_requestARIO_T_5)};
  wire [32:0] _requestARIO_T_8 = $signed(_requestARIO_T_6) & 33'she0000000;
  wire  requestARIO_0_1 = $signed(_requestARIO_T_8) == 33'sh0;
  wire [31:0] _requestARIO_T_10 = auto_in_ar_bits_addr ^ 32'h40000000;
  wire [32:0] _requestARIO_T_11 = {1'b0,$signed(_requestARIO_T_10)};
  wire [32:0] _requestARIO_T_13 = $signed(_requestARIO_T_11) & 33'shc0000000;
  wire  requestARIO_0_2 = $signed(_requestARIO_T_13) == 33'sh0;
  wire [31:0] _requestARIO_T_15 = auto_in_ar_bits_addr ^ 32'h80000000;
  wire [32:0] _requestARIO_T_16 = {1'b0,$signed(_requestARIO_T_15)};
  wire [32:0] _requestARIO_T_18 = $signed(_requestARIO_T_16) & 33'shc0000000;
  wire  requestARIO_0_3 = $signed(_requestARIO_T_18) == 33'sh0;
  wire [32:0] _requestAWIO_T_1 = {1'b0,$signed(auto_in_aw_bits_addr)};
  wire [32:0] _requestAWIO_T_3 = $signed(_requestAWIO_T_1) & 33'she0000000;
  wire  requestAWIO_0_0 = $signed(_requestAWIO_T_3) == 33'sh0;
  wire [31:0] _requestAWIO_T_5 = auto_in_aw_bits_addr ^ 32'h20000000;
  wire [32:0] _requestAWIO_T_6 = {1'b0,$signed(_requestAWIO_T_5)};
  wire [32:0] _requestAWIO_T_8 = $signed(_requestAWIO_T_6) & 33'she0000000;
  wire  requestAWIO_0_1 = $signed(_requestAWIO_T_8) == 33'sh0;
  wire [31:0] _requestAWIO_T_10 = auto_in_aw_bits_addr ^ 32'h40000000;
  wire [32:0] _requestAWIO_T_11 = {1'b0,$signed(_requestAWIO_T_10)};
  wire [32:0] _requestAWIO_T_13 = $signed(_requestAWIO_T_11) & 33'shc0000000;
  wire  requestAWIO_0_2 = $signed(_requestAWIO_T_13) == 33'sh0;
  wire [31:0] _requestAWIO_T_15 = auto_in_aw_bits_addr ^ 32'h80000000;
  wire [32:0] _requestAWIO_T_16 = {1'b0,$signed(_requestAWIO_T_15)};
  wire [32:0] _requestAWIO_T_18 = $signed(_requestAWIO_T_16) & 33'shc0000000;
  wire  requestAWIO_0_3 = $signed(_requestAWIO_T_18) == 33'sh0;
  wire [1:0] awIn_0_io_enq_bits_lo = {requestAWIO_0_1,requestAWIO_0_0};
  wire [1:0] awIn_0_io_enq_bits_hi = {requestAWIO_0_3,requestAWIO_0_2};
  wire [3:0] _awIn_0_io_enq_bits_T = {requestAWIO_0_3,requestAWIO_0_2,requestAWIO_0_1,requestAWIO_0_0};
  wire  requestWIO_0_0 = awIn_0_io_deq_bits[0];
  wire  requestWIO_0_1 = awIn_0_io_deq_bits[1];
  wire  requestWIO_0_2 = awIn_0_io_deq_bits[2];
  wire  requestWIO_0_3 = awIn_0_io_deq_bits[3];
  reg  idle_4;
  wire [3:0] readys_valid = {auto_out_3_r_valid,auto_out_2_r_valid,auto_out_1_r_valid,auto_out_0_r_valid};
  reg [3:0] readys_mask;
  wire [3:0] _readys_filter_T = ~readys_mask;
  wire [3:0] _readys_filter_T_1 = readys_valid & _readys_filter_T;
  wire [7:0] readys_filter = {_readys_filter_T_1,auto_out_3_r_valid,auto_out_2_r_valid,auto_out_1_r_valid,
    auto_out_0_r_valid};
  wire [7:0] _GEN_70 = {{1'd0}, readys_filter[7:1]};
  wire [7:0] _readys_unready_T_1 = readys_filter | _GEN_70;
  wire [7:0] _GEN_71 = {{2'd0}, _readys_unready_T_1[7:2]};
  wire [7:0] _readys_unready_T_3 = _readys_unready_T_1 | _GEN_71;
  wire [7:0] _readys_unready_T_6 = {readys_mask, 4'h0};
  wire [7:0] _GEN_72 = {{1'd0}, _readys_unready_T_3[7:1]};
  wire [7:0] readys_unready = _GEN_72 | _readys_unready_T_6;
  wire [3:0] _readys_readys_T_2 = readys_unready[7:4] & readys_unready[3:0];
  wire [3:0] readys_readys = ~_readys_readys_T_2;
  wire  readys_4_0 = readys_readys[0];
  wire  winner_4_0 = readys_4_0 & auto_out_0_r_valid;
  reg  state_4_0;
  wire  muxState_4_0 = idle_4 ? winner_4_0 : state_4_0;
  wire [3:0] _T_102 = muxState_4_0 ? auto_out_0_r_bits_id : 4'h0;
  wire  readys_4_1 = readys_readys[1];
  wire  winner_4_1 = readys_4_1 & auto_out_1_r_valid;
  reg  state_4_1;
  wire  muxState_4_1 = idle_4 ? winner_4_1 : state_4_1;
  wire [3:0] _T_103 = muxState_4_1 ? auto_out_1_r_bits_id : 4'h0;
  wire [3:0] _T_106 = _T_102 | _T_103;
  wire  readys_4_2 = readys_readys[2];
  wire  winner_4_2 = readys_4_2 & auto_out_2_r_valid;
  reg  state_4_2;
  wire  muxState_4_2 = idle_4 ? winner_4_2 : state_4_2;
  wire [3:0] _T_104 = muxState_4_2 ? auto_out_2_r_bits_id : 4'h0;
  wire [3:0] _T_107 = _T_106 | _T_104;
  wire  readys_4_3 = readys_readys[3];
  wire  winner_4_3 = readys_4_3 & auto_out_3_r_valid;
  reg  state_4_3;
  wire  muxState_4_3 = idle_4 ? winner_4_3 : state_4_3;
  wire [3:0] _T_105 = muxState_4_3 ? auto_out_3_r_bits_id : 4'h0;
  wire [3:0] in_0_r_bits_id = _T_107 | _T_105;
  reg  idle_5;
  wire [3:0] readys_valid_1 = {auto_out_3_b_valid,auto_out_2_b_valid,auto_out_1_b_valid,auto_out_0_b_valid};
  reg [3:0] readys_mask_1;
  wire [3:0] _readys_filter_T_2 = ~readys_mask_1;
  wire [3:0] _readys_filter_T_3 = readys_valid_1 & _readys_filter_T_2;
  wire [7:0] readys_filter_1 = {_readys_filter_T_3,auto_out_3_b_valid,auto_out_2_b_valid,auto_out_1_b_valid,
    auto_out_0_b_valid};
  wire [7:0] _GEN_73 = {{1'd0}, readys_filter_1[7:1]};
  wire [7:0] _readys_unready_T_8 = readys_filter_1 | _GEN_73;
  wire [7:0] _GEN_74 = {{2'd0}, _readys_unready_T_8[7:2]};
  wire [7:0] _readys_unready_T_10 = _readys_unready_T_8 | _GEN_74;
  wire [7:0] _readys_unready_T_13 = {readys_mask_1, 4'h0};
  wire [7:0] _GEN_75 = {{1'd0}, _readys_unready_T_10[7:1]};
  wire [7:0] readys_unready_1 = _GEN_75 | _readys_unready_T_13;
  wire [3:0] _readys_readys_T_5 = readys_unready_1[7:4] & readys_unready_1[3:0];
  wire [3:0] readys_readys_1 = ~_readys_readys_T_5;
  wire  readys_5_0 = readys_readys_1[0];
  wire  winner_5_0 = readys_5_0 & auto_out_0_b_valid;
  reg  state_5_0;
  wire  muxState_5_0 = idle_5 ? winner_5_0 : state_5_0;
  wire [3:0] _T_143 = muxState_5_0 ? auto_out_0_b_bits_id : 4'h0;
  wire  readys_5_1 = readys_readys_1[1];
  wire  winner_5_1 = readys_5_1 & auto_out_1_b_valid;
  reg  state_5_1;
  wire  muxState_5_1 = idle_5 ? winner_5_1 : state_5_1;
  wire [3:0] _T_144 = muxState_5_1 ? auto_out_1_b_bits_id : 4'h0;
  wire [3:0] _T_147 = _T_143 | _T_144;
  wire  readys_5_2 = readys_readys_1[2];
  wire  winner_5_2 = readys_5_2 & auto_out_2_b_valid;
  reg  state_5_2;
  wire  muxState_5_2 = idle_5 ? winner_5_2 : state_5_2;
  wire [3:0] _T_145 = muxState_5_2 ? auto_out_2_b_bits_id : 4'h0;
  wire [3:0] _T_148 = _T_147 | _T_145;
  wire  readys_5_3 = readys_readys_1[3];
  wire  winner_5_3 = readys_5_3 & auto_out_3_b_valid;
  reg  state_5_3;
  wire  muxState_5_3 = idle_5 ? winner_5_3 : state_5_3;
  wire [3:0] _T_146 = muxState_5_3 ? auto_out_3_b_bits_id : 4'h0;
  wire [3:0] in_0_b_bits_id = _T_148 | _T_146;
  wire [15:0] arSel = 16'h1 << auto_in_ar_bits_id;
  wire [15:0] awSel = 16'h1 << auto_in_aw_bits_id;
  wire [15:0] rSel = 16'h1 << in_0_r_bits_id;
  wire [15:0] bSel = 16'h1 << in_0_b_bits_id;
  wire [3:0] _arTag_T = {requestARIO_0_3,requestARIO_0_2,requestARIO_0_1,requestARIO_0_0};
  wire [1:0] arTag_hi_1 = _arTag_T[3:2];
  wire [1:0] arTag_lo_1 = _arTag_T[1:0];
  wire  _arTag_T_1 = |arTag_hi_1;
  wire [1:0] _arTag_T_2 = arTag_hi_1 | arTag_lo_1;
  wire [1:0] arTag = {_arTag_T_1,_arTag_T_2[1]};
  wire [1:0] awTag_hi_1 = _awIn_0_io_enq_bits_T[3:2];
  wire [1:0] awTag_lo_1 = _awIn_0_io_enq_bits_T[1:0];
  wire  _awTag_T_1 = |awTag_hi_1;
  wire [1:0] _awTag_T_2 = awTag_hi_1 | awTag_lo_1;
  wire [1:0] awTag = {_awTag_T_1,_awTag_T_2[1]};
  wire  in_0_ar_ready = requestARIO_0_0 & auto_out_0_ar_ready | requestARIO_0_1 & auto_out_1_ar_ready | requestARIO_0_2
     & auto_out_2_ar_ready | requestARIO_0_3 & auto_out_3_ar_ready;
  reg [1:0] arFIFOMap_6_count;
  reg [1:0] arFIFOMap_6_last;
  wire  arFIFOMap_6_portMatch = arFIFOMap_6_last == arTag;
  wire  arFIFOMap_6 = arFIFOMap_6_count == 2'h0 | arFIFOMap_6_portMatch;
  wire  _arFIFOMap_6_T_21 = arFIFOMap_6_count != 2'h2;
  reg [2:0] arFIFOMap_5_count;
  reg [1:0] arFIFOMap_5_last;
  wire  arFIFOMap_5_portMatch = arFIFOMap_5_last == arTag;
  wire  _arFIFOMap_5_T_21 = arFIFOMap_5_count != 3'h7;
  wire  arFIFOMap_5 = (arFIFOMap_5_count == 3'h0 | arFIFOMap_5_portMatch) & arFIFOMap_5_count != 3'h7;
  reg [2:0] arFIFOMap_4_count;
  reg [1:0] arFIFOMap_4_last;
  wire  arFIFOMap_4_portMatch = arFIFOMap_4_last == arTag;
  wire  _arFIFOMap_4_T_21 = arFIFOMap_4_count != 3'h7;
  wire  arFIFOMap_4 = (arFIFOMap_4_count == 3'h0 | arFIFOMap_4_portMatch) & arFIFOMap_4_count != 3'h7;
  reg  arFIFOMap_3_count;
  wire  _arFIFOMap_3_T_19 = ~arFIFOMap_3_count;
  reg  arFIFOMap_2_count;
  wire  _arFIFOMap_2_T_19 = ~arFIFOMap_2_count;
  reg  arFIFOMap_1_count;
  wire  _arFIFOMap_1_T_19 = ~arFIFOMap_1_count;
  reg  arFIFOMap_0_count;
  wire  _arFIFOMap_0_T_19 = ~arFIFOMap_0_count;
  wire  _GEN_18 = 4'h4 == auto_in_ar_bits_id ? arFIFOMap_4 : 1'h1;
  wire  _GEN_19 = 4'h5 == auto_in_ar_bits_id ? arFIFOMap_5 : _GEN_18;
  wire  _GEN_20 = 4'h6 == auto_in_ar_bits_id ? arFIFOMap_6 : _GEN_19;
  wire  _GEN_29 = 4'hf == auto_in_ar_bits_id | (4'he == auto_in_ar_bits_id | (4'hd == auto_in_ar_bits_id | (4'hc ==
    auto_in_ar_bits_id | (4'hb == auto_in_ar_bits_id | (4'ha == auto_in_ar_bits_id | (4'h9 == auto_in_ar_bits_id | (4'h8
     == auto_in_ar_bits_id | (4'h7 == auto_in_ar_bits_id | _GEN_20))))))));
  wire  io_in_0_ar_ready = in_0_ar_ready & _GEN_29;
  wire  _arFIFOMap_0_T_1 = io_in_0_ar_ready & auto_in_ar_valid;
  wire  _arFIFOMap_0_T_2 = arSel[0] & _arFIFOMap_0_T_1;
  wire  anyValid = auto_out_0_r_valid | auto_out_1_r_valid | auto_out_2_r_valid | auto_out_3_r_valid;
  wire  _in_0_r_valid_T_6 = state_4_0 & auto_out_0_r_valid | state_4_1 & auto_out_1_r_valid | state_4_2 &
    auto_out_2_r_valid | state_4_3 & auto_out_3_r_valid;
  wire  in_0_r_valid = idle_4 ? anyValid : _in_0_r_valid_T_6;
  wire  _arFIFOMap_0_T_4 = auto_in_r_ready & in_0_r_valid;
  wire  in_0_r_bits_last = muxState_4_0 & auto_out_0_r_bits_last | muxState_4_1 & auto_out_1_r_bits_last | muxState_4_2
     & auto_out_2_r_bits_last | muxState_4_3 & auto_out_3_r_bits_last;
  wire  _arFIFOMap_0_T_6 = rSel[0] & _arFIFOMap_0_T_4 & in_0_r_bits_last;
  wire  _arFIFOMap_0_count_T_1 = arFIFOMap_0_count + _arFIFOMap_0_T_2;
  wire  _arFIFOMap_0_T_11 = ~reset;
  wire  in_0_aw_ready = requestAWIO_0_0 & auto_out_0_aw_ready | requestAWIO_0_1 & auto_out_1_aw_ready | requestAWIO_0_2
     & auto_out_2_aw_ready | requestAWIO_0_3 & auto_out_3_aw_ready;
  reg  latched;
  wire  _bundleIn_0_aw_ready_T = latched | awIn_0_io_enq_ready;
  reg [1:0] awFIFOMap_6_count;
  reg [1:0] awFIFOMap_6_last;
  wire  awFIFOMap_6_portMatch = awFIFOMap_6_last == awTag;
  wire  awFIFOMap_6 = awFIFOMap_6_count == 2'h0 | awFIFOMap_6_portMatch;
  wire  _awFIFOMap_6_T_20 = awFIFOMap_6_count != 2'h2;
  reg [2:0] awFIFOMap_5_count;
  reg [1:0] awFIFOMap_5_last;
  wire  awFIFOMap_5_portMatch = awFIFOMap_5_last == awTag;
  wire  _awFIFOMap_5_T_20 = awFIFOMap_5_count != 3'h7;
  wire  awFIFOMap_5 = (awFIFOMap_5_count == 3'h0 | awFIFOMap_5_portMatch) & awFIFOMap_5_count != 3'h7;
  reg [2:0] awFIFOMap_4_count;
  reg [1:0] awFIFOMap_4_last;
  wire  awFIFOMap_4_portMatch = awFIFOMap_4_last == awTag;
  wire  _awFIFOMap_4_T_20 = awFIFOMap_4_count != 3'h7;
  wire  awFIFOMap_4 = (awFIFOMap_4_count == 3'h0 | awFIFOMap_4_portMatch) & awFIFOMap_4_count != 3'h7;
  reg  awFIFOMap_3_count;
  wire  _awFIFOMap_3_T_18 = ~awFIFOMap_3_count;
  reg  awFIFOMap_2_count;
  wire  _awFIFOMap_2_T_18 = ~awFIFOMap_2_count;
  reg  awFIFOMap_1_count;
  wire  _awFIFOMap_1_T_18 = ~awFIFOMap_1_count;
  reg  awFIFOMap_0_count;
  wire  _awFIFOMap_0_T_18 = ~awFIFOMap_0_count;
  wire  _GEN_34 = 4'h4 == auto_in_aw_bits_id ? awFIFOMap_4 : 1'h1;
  wire  _GEN_35 = 4'h5 == auto_in_aw_bits_id ? awFIFOMap_5 : _GEN_34;
  wire  _GEN_36 = 4'h6 == auto_in_aw_bits_id ? awFIFOMap_6 : _GEN_35;
  wire  _GEN_45 = 4'hf == auto_in_aw_bits_id | (4'he == auto_in_aw_bits_id | (4'hd == auto_in_aw_bits_id | (4'hc ==
    auto_in_aw_bits_id | (4'hb == auto_in_aw_bits_id | (4'ha == auto_in_aw_bits_id | (4'h9 == auto_in_aw_bits_id | (4'h8
     == auto_in_aw_bits_id | (4'h7 == auto_in_aw_bits_id | _GEN_36))))))));
  wire  io_in_0_aw_ready = in_0_aw_ready & (latched | awIn_0_io_enq_ready) & _GEN_45;
  wire  _awFIFOMap_0_T_1 = io_in_0_aw_ready & auto_in_aw_valid;
  wire  _awFIFOMap_0_T_2 = awSel[0] & _awFIFOMap_0_T_1;
  wire  anyValid_1 = auto_out_0_b_valid | auto_out_1_b_valid | auto_out_2_b_valid | auto_out_3_b_valid;
  wire  _in_0_b_valid_T_6 = state_5_0 & auto_out_0_b_valid | state_5_1 & auto_out_1_b_valid | state_5_2 &
    auto_out_2_b_valid | state_5_3 & auto_out_3_b_valid;
  wire  in_0_b_valid = idle_5 ? anyValid_1 : _in_0_b_valid_T_6;
  wire  _awFIFOMap_0_T_4 = auto_in_b_ready & in_0_b_valid;
  wire  _awFIFOMap_0_T_5 = bSel[0] & _awFIFOMap_0_T_4;
  wire  _awFIFOMap_0_count_T_1 = awFIFOMap_0_count + _awFIFOMap_0_T_2;
  wire  _arFIFOMap_1_T_2 = arSel[1] & _arFIFOMap_0_T_1;
  wire  _arFIFOMap_1_T_6 = rSel[1] & _arFIFOMap_0_T_4 & in_0_r_bits_last;
  wire  _arFIFOMap_1_count_T_1 = arFIFOMap_1_count + _arFIFOMap_1_T_2;
  wire  _awFIFOMap_1_T_2 = awSel[1] & _awFIFOMap_0_T_1;
  wire  _awFIFOMap_1_T_5 = bSel[1] & _awFIFOMap_0_T_4;
  wire  _awFIFOMap_1_count_T_1 = awFIFOMap_1_count + _awFIFOMap_1_T_2;
  wire  _arFIFOMap_2_T_2 = arSel[2] & _arFIFOMap_0_T_1;
  wire  _arFIFOMap_2_T_6 = rSel[2] & _arFIFOMap_0_T_4 & in_0_r_bits_last;
  wire  _arFIFOMap_2_count_T_1 = arFIFOMap_2_count + _arFIFOMap_2_T_2;
  wire  _awFIFOMap_2_T_2 = awSel[2] & _awFIFOMap_0_T_1;
  wire  _awFIFOMap_2_T_5 = bSel[2] & _awFIFOMap_0_T_4;
  wire  _awFIFOMap_2_count_T_1 = awFIFOMap_2_count + _awFIFOMap_2_T_2;
  wire  _arFIFOMap_3_T_2 = arSel[3] & _arFIFOMap_0_T_1;
  wire  _arFIFOMap_3_T_6 = rSel[3] & _arFIFOMap_0_T_4 & in_0_r_bits_last;
  wire  _arFIFOMap_3_count_T_1 = arFIFOMap_3_count + _arFIFOMap_3_T_2;
  wire  _awFIFOMap_3_T_2 = awSel[3] & _awFIFOMap_0_T_1;
  wire  _awFIFOMap_3_T_5 = bSel[3] & _awFIFOMap_0_T_4;
  wire  _awFIFOMap_3_count_T_1 = awFIFOMap_3_count + _awFIFOMap_3_T_2;
  wire  _arFIFOMap_4_T_2 = arSel[4] & _arFIFOMap_0_T_1;
  wire  _arFIFOMap_4_T_6 = rSel[4] & _arFIFOMap_0_T_4 & in_0_r_bits_last;
  wire [2:0] _GEN_94 = {{2'd0}, _arFIFOMap_4_T_2};
  wire [2:0] _arFIFOMap_4_count_T_1 = arFIFOMap_4_count + _GEN_94;
  wire [2:0] _GEN_95 = {{2'd0}, _arFIFOMap_4_T_6};
  wire [2:0] _arFIFOMap_4_count_T_3 = _arFIFOMap_4_count_T_1 - _GEN_95;
  wire  _awFIFOMap_4_T_2 = awSel[4] & _awFIFOMap_0_T_1;
  wire  _awFIFOMap_4_T_5 = bSel[4] & _awFIFOMap_0_T_4;
  wire [2:0] _GEN_96 = {{2'd0}, _awFIFOMap_4_T_2};
  wire [2:0] _awFIFOMap_4_count_T_1 = awFIFOMap_4_count + _GEN_96;
  wire [2:0] _GEN_97 = {{2'd0}, _awFIFOMap_4_T_5};
  wire [2:0] _awFIFOMap_4_count_T_3 = _awFIFOMap_4_count_T_1 - _GEN_97;
  wire  _arFIFOMap_5_T_2 = arSel[5] & _arFIFOMap_0_T_1;
  wire  _arFIFOMap_5_T_6 = rSel[5] & _arFIFOMap_0_T_4 & in_0_r_bits_last;
  wire [2:0] _GEN_98 = {{2'd0}, _arFIFOMap_5_T_2};
  wire [2:0] _arFIFOMap_5_count_T_1 = arFIFOMap_5_count + _GEN_98;
  wire [2:0] _GEN_99 = {{2'd0}, _arFIFOMap_5_T_6};
  wire [2:0] _arFIFOMap_5_count_T_3 = _arFIFOMap_5_count_T_1 - _GEN_99;
  wire  _awFIFOMap_5_T_2 = awSel[5] & _awFIFOMap_0_T_1;
  wire  _awFIFOMap_5_T_5 = bSel[5] & _awFIFOMap_0_T_4;
  wire [2:0] _GEN_100 = {{2'd0}, _awFIFOMap_5_T_2};
  wire [2:0] _awFIFOMap_5_count_T_1 = awFIFOMap_5_count + _GEN_100;
  wire [2:0] _GEN_101 = {{2'd0}, _awFIFOMap_5_T_5};
  wire [2:0] _awFIFOMap_5_count_T_3 = _awFIFOMap_5_count_T_1 - _GEN_101;
  wire  _arFIFOMap_6_T_2 = arSel[6] & _arFIFOMap_0_T_1;
  wire  _arFIFOMap_6_T_6 = rSel[6] & _arFIFOMap_0_T_4 & in_0_r_bits_last;
  wire [1:0] _GEN_102 = {{1'd0}, _arFIFOMap_6_T_2};
  wire [1:0] _arFIFOMap_6_count_T_1 = arFIFOMap_6_count + _GEN_102;
  wire [1:0] _GEN_103 = {{1'd0}, _arFIFOMap_6_T_6};
  wire [1:0] _arFIFOMap_6_count_T_3 = _arFIFOMap_6_count_T_1 - _GEN_103;
  wire  _awFIFOMap_6_T_2 = awSel[6] & _awFIFOMap_0_T_1;
  wire  _awFIFOMap_6_T_5 = bSel[6] & _awFIFOMap_0_T_4;
  wire [1:0] _GEN_104 = {{1'd0}, _awFIFOMap_6_T_2};
  wire [1:0] _awFIFOMap_6_count_T_1 = awFIFOMap_6_count + _GEN_104;
  wire [1:0] _GEN_105 = {{1'd0}, _awFIFOMap_6_T_5};
  wire [1:0] _awFIFOMap_6_count_T_3 = _awFIFOMap_6_count_T_1 - _GEN_105;
  wire  in_0_ar_valid = auto_in_ar_valid & (4'hf == auto_in_ar_bits_id | (4'he == auto_in_ar_bits_id | (4'hd ==
    auto_in_ar_bits_id | (4'hc == auto_in_ar_bits_id | (4'hb == auto_in_ar_bits_id | (4'ha == auto_in_ar_bits_id | (4'h9
     == auto_in_ar_bits_id | (4'h8 == auto_in_ar_bits_id | (4'h7 == auto_in_ar_bits_id | _GEN_20)))))))));
  wire  in_0_aw_valid = auto_in_aw_valid & _bundleIn_0_aw_ready_T & (4'hf == auto_in_aw_bits_id | (4'he ==
    auto_in_aw_bits_id | (4'hd == auto_in_aw_bits_id | (4'hc == auto_in_aw_bits_id | (4'hb == auto_in_aw_bits_id | (4'ha
     == auto_in_aw_bits_id | (4'h9 == auto_in_aw_bits_id | (4'h8 == auto_in_aw_bits_id | (4'h7 == auto_in_aw_bits_id |
    _GEN_36)))))))));
  wire  _T = awIn_0_io_enq_ready & awIn_0_io_enq_valid;
  wire  _GEN_46 = _T | latched;
  wire  _T_1 = in_0_aw_ready & in_0_aw_valid;
  wire  in_0_w_valid = auto_in_w_valid & awIn_0_io_deq_valid;
  wire  in_0_w_ready = requestWIO_0_0 & auto_out_0_w_ready | requestWIO_0_1 & auto_out_1_w_ready | requestWIO_0_2 &
    auto_out_2_w_ready | requestWIO_0_3 & auto_out_3_w_ready;
  wire  portsAROI_filtered_0_valid = in_0_ar_valid & requestARIO_0_0;
  wire  portsAROI_filtered_1_valid = in_0_ar_valid & requestARIO_0_1;
  wire  portsAROI_filtered_2_valid = in_0_ar_valid & requestARIO_0_2;
  wire  portsAROI_filtered_3_valid = in_0_ar_valid & requestARIO_0_3;
  wire  portsAWOI_filtered_0_valid = in_0_aw_valid & requestAWIO_0_0;
  wire  portsAWOI_filtered_1_valid = in_0_aw_valid & requestAWIO_0_1;
  wire  portsAWOI_filtered_2_valid = in_0_aw_valid & requestAWIO_0_2;
  wire  portsAWOI_filtered_3_valid = in_0_aw_valid & requestAWIO_0_3;
  wire  _awOut_0_io_enq_bits_T_1 = ~portsAWOI_filtered_0_valid;
  wire  _T_3 = ~portsAROI_filtered_0_valid;
  wire  _awOut_1_io_enq_bits_T_1 = ~portsAWOI_filtered_1_valid;
  wire  _T_16 = ~portsAROI_filtered_1_valid;
  wire  _awOut_2_io_enq_bits_T_1 = ~portsAWOI_filtered_2_valid;
  wire  _T_29 = ~portsAROI_filtered_2_valid;
  wire  _awOut_3_io_enq_bits_T_1 = ~portsAWOI_filtered_3_valid;
  wire  _T_42 = ~portsAROI_filtered_3_valid;
  wire [3:0] _readys_mask_T = readys_readys & readys_valid;
  wire [4:0] _readys_mask_T_1 = {_readys_mask_T, 1'h0};
  wire [3:0] _readys_mask_T_3 = _readys_mask_T | _readys_mask_T_1[3:0];
  wire [5:0] _readys_mask_T_4 = {_readys_mask_T_3, 2'h0};
  wire [3:0] _readys_mask_T_6 = _readys_mask_T_3 | _readys_mask_T_4[3:0];
  wire  prefixOR_2 = winner_4_0 | winner_4_1;
  wire  prefixOR_3 = prefixOR_2 | winner_4_2;
  wire  _prefixOR_T_4 = prefixOR_3 | winner_4_3;
  wire  _GEN_65 = anyValid ? 1'h0 : idle_4;
  wire  _GEN_66 = _arFIFOMap_0_T_4 | _GEN_65;
  wire  allowed__0 = idle_4 ? readys_4_0 : state_4_0;
  wire  allowed__1 = idle_4 ? readys_4_1 : state_4_1;
  wire  allowed__2 = idle_4 ? readys_4_2 : state_4_2;
  wire  allowed__3 = idle_4 ? readys_4_3 : state_4_3;
  wire [1:0] _T_88 = muxState_4_0 ? auto_out_0_r_bits_resp : 2'h0;
  wire [1:0] _T_89 = muxState_4_1 ? auto_out_1_r_bits_resp : 2'h0;
  wire [1:0] _T_90 = muxState_4_2 ? auto_out_2_r_bits_resp : 2'h0;
  wire [1:0] _T_91 = muxState_4_3 ? auto_out_3_r_bits_resp : 2'h0;
  wire [1:0] _T_92 = _T_88 | _T_89;
  wire [1:0] _T_93 = _T_92 | _T_90;
  wire [31:0] _T_95 = muxState_4_0 ? auto_out_0_r_bits_data : 32'h0;
  wire [31:0] _T_96 = muxState_4_1 ? auto_out_1_r_bits_data : 32'h0;
  wire [31:0] _T_97 = muxState_4_2 ? auto_out_2_r_bits_data : 32'h0;
  wire [31:0] _T_98 = muxState_4_3 ? auto_out_3_r_bits_data : 32'h0;
  wire [31:0] _T_99 = _T_95 | _T_96;
  wire [31:0] _T_100 = _T_99 | _T_97;
  wire [3:0] _readys_mask_T_8 = readys_readys_1 & readys_valid_1;
  wire [4:0] _readys_mask_T_9 = {_readys_mask_T_8, 1'h0};
  wire [3:0] _readys_mask_T_11 = _readys_mask_T_8 | _readys_mask_T_9[3:0];
  wire [5:0] _readys_mask_T_12 = {_readys_mask_T_11, 2'h0};
  wire [3:0] _readys_mask_T_14 = _readys_mask_T_11 | _readys_mask_T_12[3:0];
  wire  prefixOR_2_1 = winner_5_0 | winner_5_1;
  wire  prefixOR_3_1 = prefixOR_2_1 | winner_5_2;
  wire  _prefixOR_T_5 = prefixOR_3_1 | winner_5_3;
  wire  _GEN_68 = anyValid_1 ? 1'h0 : idle_5;
  wire  _GEN_69 = _awFIFOMap_0_T_4 | _GEN_68;
  wire  allowed_1_0 = idle_5 ? readys_5_0 : state_5_0;
  wire  allowed_1_1 = idle_5 ? readys_5_1 : state_5_1;
  wire  allowed_1_2 = idle_5 ? readys_5_2 : state_5_2;
  wire  allowed_1_3 = idle_5 ? readys_5_3 : state_5_3;
  wire [1:0] _T_136 = muxState_5_0 ? auto_out_0_b_bits_resp : 2'h0;
  wire [1:0] _T_137 = muxState_5_1 ? auto_out_1_b_bits_resp : 2'h0;
  wire [1:0] _T_138 = muxState_5_2 ? auto_out_2_b_bits_resp : 2'h0;
  wire [1:0] _T_139 = muxState_5_3 ? auto_out_3_b_bits_resp : 2'h0;
  wire [1:0] _T_140 = _T_136 | _T_137;
  wire [1:0] _T_141 = _T_140 | _T_138;
  QueueCompatibility_32 awIn_0 (
    .clock(awIn_0_clock),
    .reset(awIn_0_reset),
    .io_enq_ready(awIn_0_io_enq_ready),
    .io_enq_valid(awIn_0_io_enq_valid),
    .io_enq_bits(awIn_0_io_enq_bits),
    .io_deq_ready(awIn_0_io_deq_ready),
    .io_deq_valid(awIn_0_io_deq_valid),
    .io_deq_bits(awIn_0_io_deq_bits)
  );
  assign auto_in_aw_ready = in_0_aw_ready & (latched | awIn_0_io_enq_ready) & _GEN_45;
  assign auto_in_w_ready = in_0_w_ready & awIn_0_io_deq_valid;
  assign auto_in_b_valid = idle_5 ? anyValid_1 : _in_0_b_valid_T_6;
  assign auto_in_b_bits_id = _T_148 | _T_146;
  assign auto_in_b_bits_resp = _T_141 | _T_139;
  assign auto_in_ar_ready = in_0_ar_ready & _GEN_29;
  assign auto_in_r_valid = idle_4 ? anyValid : _in_0_r_valid_T_6;
  assign auto_in_r_bits_id = _T_107 | _T_105;
  assign auto_in_r_bits_data = _T_100 | _T_98;
  assign auto_in_r_bits_resp = _T_93 | _T_91;
  assign auto_in_r_bits_last = muxState_4_0 & auto_out_0_r_bits_last | muxState_4_1 & auto_out_1_r_bits_last |
    muxState_4_2 & auto_out_2_r_bits_last | muxState_4_3 & auto_out_3_r_bits_last;
  assign auto_out_3_aw_valid = in_0_aw_valid & requestAWIO_0_3;
  assign auto_out_3_aw_bits_id = auto_in_aw_bits_id;
  assign auto_out_3_aw_bits_addr = auto_in_aw_bits_addr;
  assign auto_out_3_aw_bits_len = auto_in_aw_bits_len;
  assign auto_out_3_aw_bits_size = auto_in_aw_bits_size;
  assign auto_out_3_aw_bits_burst = auto_in_aw_bits_burst;
  assign auto_out_3_w_valid = in_0_w_valid & requestWIO_0_3;
  assign auto_out_3_w_bits_data = auto_in_w_bits_data;
  assign auto_out_3_w_bits_strb = auto_in_w_bits_strb;
  assign auto_out_3_w_bits_last = auto_in_w_bits_last;
  assign auto_out_3_b_ready = auto_in_b_ready & allowed_1_3;
  assign auto_out_3_ar_valid = in_0_ar_valid & requestARIO_0_3;
  assign auto_out_3_ar_bits_id = auto_in_ar_bits_id;
  assign auto_out_3_ar_bits_addr = auto_in_ar_bits_addr;
  assign auto_out_3_ar_bits_len = auto_in_ar_bits_len;
  assign auto_out_3_ar_bits_size = auto_in_ar_bits_size;
  assign auto_out_3_ar_bits_burst = auto_in_ar_bits_burst;
  assign auto_out_3_r_ready = auto_in_r_ready & allowed__3;
  assign auto_out_2_aw_valid = in_0_aw_valid & requestAWIO_0_2;
  assign auto_out_2_aw_bits_id = auto_in_aw_bits_id;
  assign auto_out_2_aw_bits_addr = auto_in_aw_bits_addr[30:0];
  assign auto_out_2_aw_bits_len = auto_in_aw_bits_len;
  assign auto_out_2_aw_bits_size = auto_in_aw_bits_size;
  assign auto_out_2_aw_bits_burst = auto_in_aw_bits_burst;
  assign auto_out_2_w_valid = in_0_w_valid & requestWIO_0_2;
  assign auto_out_2_w_bits_data = auto_in_w_bits_data;
  assign auto_out_2_w_bits_strb = auto_in_w_bits_strb;
  assign auto_out_2_w_bits_last = auto_in_w_bits_last;
  assign auto_out_2_b_ready = auto_in_b_ready & allowed_1_2;
  assign auto_out_2_ar_valid = in_0_ar_valid & requestARIO_0_2;
  assign auto_out_2_ar_bits_id = auto_in_ar_bits_id;
  assign auto_out_2_ar_bits_addr = auto_in_ar_bits_addr[30:0];
  assign auto_out_2_ar_bits_len = auto_in_ar_bits_len;
  assign auto_out_2_ar_bits_size = auto_in_ar_bits_size;
  assign auto_out_2_ar_bits_burst = auto_in_ar_bits_burst;
  assign auto_out_2_r_ready = auto_in_r_ready & allowed__2;
  assign auto_out_1_aw_valid = in_0_aw_valid & requestAWIO_0_1;
  assign auto_out_1_aw_bits_id = auto_in_aw_bits_id;
  assign auto_out_1_aw_bits_addr = auto_in_aw_bits_addr[29:0];
  assign auto_out_1_aw_bits_len = auto_in_aw_bits_len;
  assign auto_out_1_aw_bits_size = auto_in_aw_bits_size;
  assign auto_out_1_aw_bits_burst = auto_in_aw_bits_burst;
  assign auto_out_1_w_valid = in_0_w_valid & requestWIO_0_1;
  assign auto_out_1_w_bits_data = auto_in_w_bits_data;
  assign auto_out_1_w_bits_strb = auto_in_w_bits_strb;
  assign auto_out_1_w_bits_last = auto_in_w_bits_last;
  assign auto_out_1_b_ready = auto_in_b_ready & allowed_1_1;
  assign auto_out_1_ar_valid = in_0_ar_valid & requestARIO_0_1;
  assign auto_out_1_ar_bits_id = auto_in_ar_bits_id;
  assign auto_out_1_ar_bits_addr = auto_in_ar_bits_addr[29:0];
  assign auto_out_1_ar_bits_len = auto_in_ar_bits_len;
  assign auto_out_1_ar_bits_size = auto_in_ar_bits_size;
  assign auto_out_1_ar_bits_burst = auto_in_ar_bits_burst;
  assign auto_out_1_r_ready = auto_in_r_ready & allowed__1;
  assign auto_out_0_aw_valid = in_0_aw_valid & requestAWIO_0_0;
  assign auto_out_0_aw_bits_id = auto_in_aw_bits_id;
  assign auto_out_0_aw_bits_addr = auto_in_aw_bits_addr[28:0];
  assign auto_out_0_aw_bits_len = auto_in_aw_bits_len;
  assign auto_out_0_aw_bits_size = auto_in_aw_bits_size;
  assign auto_out_0_aw_bits_burst = auto_in_aw_bits_burst;
  assign auto_out_0_w_valid = in_0_w_valid & requestWIO_0_0;
  assign auto_out_0_w_bits_data = auto_in_w_bits_data;
  assign auto_out_0_w_bits_strb = auto_in_w_bits_strb;
  assign auto_out_0_w_bits_last = auto_in_w_bits_last;
  assign auto_out_0_b_ready = auto_in_b_ready & allowed_1_0;
  assign auto_out_0_ar_valid = in_0_ar_valid & requestARIO_0_0;
  assign auto_out_0_ar_bits_id = auto_in_ar_bits_id;
  assign auto_out_0_ar_bits_addr = auto_in_ar_bits_addr[28:0];
  assign auto_out_0_ar_bits_len = auto_in_ar_bits_len;
  assign auto_out_0_ar_bits_size = auto_in_ar_bits_size;
  assign auto_out_0_ar_bits_burst = auto_in_ar_bits_burst;
  assign auto_out_0_r_ready = auto_in_r_ready & allowed__0;
  assign awIn_0_clock = clock;
  assign awIn_0_reset = reset;
  assign awIn_0_io_enq_valid = auto_in_aw_valid & ~latched;
  assign awIn_0_io_enq_bits = {awIn_0_io_enq_bits_hi,awIn_0_io_enq_bits_lo};
  assign awIn_0_io_deq_ready = auto_in_w_valid & auto_in_w_bits_last & in_0_w_ready;
  always @(posedge clock) begin
    idle_4 <= reset | _GEN_66;
    if (reset) begin
      readys_mask <= 4'hf;
    end else if (idle_4 & |readys_valid) begin
      readys_mask <= _readys_mask_T_6;
    end
    if (reset) begin
      state_4_0 <= 1'h0;
    end else if (idle_4) begin
      state_4_0 <= winner_4_0;
    end
    if (reset) begin
      state_4_1 <= 1'h0;
    end else if (idle_4) begin
      state_4_1 <= winner_4_1;
    end
    if (reset) begin
      state_4_2 <= 1'h0;
    end else if (idle_4) begin
      state_4_2 <= winner_4_2;
    end
    if (reset) begin
      state_4_3 <= 1'h0;
    end else if (idle_4) begin
      state_4_3 <= winner_4_3;
    end
    idle_5 <= reset | _GEN_69;
    if (reset) begin
      readys_mask_1 <= 4'hf;
    end else if (idle_5 & |readys_valid_1) begin
      readys_mask_1 <= _readys_mask_T_14;
    end
    if (reset) begin
      state_5_0 <= 1'h0;
    end else if (idle_5) begin
      state_5_0 <= winner_5_0;
    end
    if (reset) begin
      state_5_1 <= 1'h0;
    end else if (idle_5) begin
      state_5_1 <= winner_5_1;
    end
    if (reset) begin
      state_5_2 <= 1'h0;
    end else if (idle_5) begin
      state_5_2 <= winner_5_2;
    end
    if (reset) begin
      state_5_3 <= 1'h0;
    end else if (idle_5) begin
      state_5_3 <= winner_5_3;
    end
    if (reset) begin
      arFIFOMap_6_count <= 2'h0;
    end else begin
      arFIFOMap_6_count <= _arFIFOMap_6_count_T_3;
    end
    if (_arFIFOMap_6_T_2) begin
      arFIFOMap_6_last <= arTag;
    end
    if (reset) begin
      arFIFOMap_5_count <= 3'h0;
    end else begin
      arFIFOMap_5_count <= _arFIFOMap_5_count_T_3;
    end
    if (_arFIFOMap_5_T_2) begin
      arFIFOMap_5_last <= arTag;
    end
    if (reset) begin
      arFIFOMap_4_count <= 3'h0;
    end else begin
      arFIFOMap_4_count <= _arFIFOMap_4_count_T_3;
    end
    if (_arFIFOMap_4_T_2) begin
      arFIFOMap_4_last <= arTag;
    end
    if (reset) begin
      arFIFOMap_3_count <= 1'h0;
    end else begin
      arFIFOMap_3_count <= _arFIFOMap_3_count_T_1 - _arFIFOMap_3_T_6;
    end
    if (reset) begin
      arFIFOMap_2_count <= 1'h0;
    end else begin
      arFIFOMap_2_count <= _arFIFOMap_2_count_T_1 - _arFIFOMap_2_T_6;
    end
    if (reset) begin
      arFIFOMap_1_count <= 1'h0;
    end else begin
      arFIFOMap_1_count <= _arFIFOMap_1_count_T_1 - _arFIFOMap_1_T_6;
    end
    if (reset) begin
      arFIFOMap_0_count <= 1'h0;
    end else begin
      arFIFOMap_0_count <= _arFIFOMap_0_count_T_1 - _arFIFOMap_0_T_6;
    end
    if (reset) begin
      latched <= 1'h0;
    end else if (_T_1) begin
      latched <= 1'h0;
    end else begin
      latched <= _GEN_46;
    end
    if (reset) begin
      awFIFOMap_6_count <= 2'h0;
    end else begin
      awFIFOMap_6_count <= _awFIFOMap_6_count_T_3;
    end
    if (_awFIFOMap_6_T_2) begin
      awFIFOMap_6_last <= awTag;
    end
    if (reset) begin
      awFIFOMap_5_count <= 3'h0;
    end else begin
      awFIFOMap_5_count <= _awFIFOMap_5_count_T_3;
    end
    if (_awFIFOMap_5_T_2) begin
      awFIFOMap_5_last <= awTag;
    end
    if (reset) begin
      awFIFOMap_4_count <= 3'h0;
    end else begin
      awFIFOMap_4_count <= _awFIFOMap_4_count_T_3;
    end
    if (_awFIFOMap_4_T_2) begin
      awFIFOMap_4_last <= awTag;
    end
    if (reset) begin
      awFIFOMap_3_count <= 1'h0;
    end else begin
      awFIFOMap_3_count <= _awFIFOMap_3_count_T_1 - _awFIFOMap_3_T_5;
    end
    if (reset) begin
      awFIFOMap_2_count <= 1'h0;
    end else begin
      awFIFOMap_2_count <= _awFIFOMap_2_count_T_1 - _awFIFOMap_2_T_5;
    end
    if (reset) begin
      awFIFOMap_1_count <= 1'h0;
    end else begin
      awFIFOMap_1_count <= _awFIFOMap_1_count_T_1 - _awFIFOMap_1_T_5;
    end
    if (reset) begin
      awFIFOMap_0_count <= 1'h0;
    end else begin
      awFIFOMap_0_count <= _awFIFOMap_0_count_T_1 - _awFIFOMap_0_T_5;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_arFIFOMap_0_T_6 | arFIFOMap_0_count) & ~reset) begin
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
        if (~reset & ~(~_arFIFOMap_0_T_6 | arFIFOMap_0_count)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_arFIFOMap_0_T_2 | _arFIFOMap_0_T_19) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_arFIFOMap_0_T_2 | _arFIFOMap_0_T_19)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_awFIFOMap_0_T_5 | awFIFOMap_0_count) & ~reset) begin
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
        if (~reset & ~(~_awFIFOMap_0_T_5 | awFIFOMap_0_count)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_awFIFOMap_0_T_2 | _awFIFOMap_0_T_18) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_awFIFOMap_0_T_2 | _awFIFOMap_0_T_18)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_arFIFOMap_1_T_6 | arFIFOMap_1_count) & ~reset) begin
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
        if (~reset & ~(~_arFIFOMap_1_T_6 | arFIFOMap_1_count)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_arFIFOMap_1_T_2 | _arFIFOMap_1_T_19) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_arFIFOMap_1_T_2 | _arFIFOMap_1_T_19)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_awFIFOMap_1_T_5 | awFIFOMap_1_count) & ~reset) begin
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
        if (~reset & ~(~_awFIFOMap_1_T_5 | awFIFOMap_1_count)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_awFIFOMap_1_T_2 | _awFIFOMap_1_T_18) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_awFIFOMap_1_T_2 | _awFIFOMap_1_T_18)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_arFIFOMap_2_T_6 | arFIFOMap_2_count) & ~reset) begin
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
        if (~reset & ~(~_arFIFOMap_2_T_6 | arFIFOMap_2_count)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_arFIFOMap_2_T_2 | _arFIFOMap_2_T_19) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_arFIFOMap_2_T_2 | _arFIFOMap_2_T_19)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_awFIFOMap_2_T_5 | awFIFOMap_2_count) & ~reset) begin
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
        if (~reset & ~(~_awFIFOMap_2_T_5 | awFIFOMap_2_count)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_awFIFOMap_2_T_2 | _awFIFOMap_2_T_18) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_awFIFOMap_2_T_2 | _awFIFOMap_2_T_18)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_arFIFOMap_3_T_6 | arFIFOMap_3_count) & ~reset) begin
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
        if (~reset & ~(~_arFIFOMap_3_T_6 | arFIFOMap_3_count)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_arFIFOMap_3_T_2 | _arFIFOMap_3_T_19) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_arFIFOMap_3_T_2 | _arFIFOMap_3_T_19)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_awFIFOMap_3_T_5 | awFIFOMap_3_count) & ~reset) begin
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
        if (~reset & ~(~_awFIFOMap_3_T_5 | awFIFOMap_3_count)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_awFIFOMap_3_T_2 | _awFIFOMap_3_T_18) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_awFIFOMap_3_T_2 | _awFIFOMap_3_T_18)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_arFIFOMap_4_T_6 | arFIFOMap_4_count != 3'h0) & ~reset) begin
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
        if (~reset & ~(~_arFIFOMap_4_T_6 | arFIFOMap_4_count != 3'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_arFIFOMap_4_T_2 | _arFIFOMap_4_T_21) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_arFIFOMap_4_T_2 | _arFIFOMap_4_T_21)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_awFIFOMap_4_T_5 | awFIFOMap_4_count != 3'h0) & ~reset) begin
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
        if (~reset & ~(~_awFIFOMap_4_T_5 | awFIFOMap_4_count != 3'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_awFIFOMap_4_T_2 | _awFIFOMap_4_T_20) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_awFIFOMap_4_T_2 | _awFIFOMap_4_T_20)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_arFIFOMap_5_T_6 | arFIFOMap_5_count != 3'h0) & ~reset) begin
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
        if (~reset & ~(~_arFIFOMap_5_T_6 | arFIFOMap_5_count != 3'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_arFIFOMap_5_T_2 | _arFIFOMap_5_T_21) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_arFIFOMap_5_T_2 | _arFIFOMap_5_T_21)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_awFIFOMap_5_T_5 | awFIFOMap_5_count != 3'h0) & ~reset) begin
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
        if (~reset & ~(~_awFIFOMap_5_T_5 | awFIFOMap_5_count != 3'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_awFIFOMap_5_T_2 | _awFIFOMap_5_T_20) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_awFIFOMap_5_T_2 | _awFIFOMap_5_T_20)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_arFIFOMap_6_T_6 | arFIFOMap_6_count != 2'h0) & ~reset) begin
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
        if (~reset & ~(~_arFIFOMap_6_T_6 | arFIFOMap_6_count != 2'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_arFIFOMap_6_T_2 | _arFIFOMap_6_T_21) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_arFIFOMap_6_T_2 | _arFIFOMap_6_T_21)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(~_awFIFOMap_6_T_5 | awFIFOMap_6_count != 2'h0) & ~reset) begin
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
        if (~reset & ~(~_awFIFOMap_6_T_5 | awFIFOMap_6_count != 2'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:121 assert (!resp_fire || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_awFIFOMap_6_T_2 | _awFIFOMap_6_T_20) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~_awFIFOMap_6_T_2 | _awFIFOMap_6_T_20)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:122 assert (!req_fire  || count =/= UInt(flight))\n"
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
        if (~(_awOut_0_io_enq_bits_T_1 | portsAWOI_filtered_0_valid) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(_awOut_0_io_enq_bits_T_1 | portsAWOI_filtered_0_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_3 | portsAROI_filtered_0_valid) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(_T_3 | portsAROI_filtered_0_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_awOut_1_io_enq_bits_T_1 | portsAWOI_filtered_1_valid) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(_awOut_1_io_enq_bits_T_1 | portsAWOI_filtered_1_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_16 | portsAROI_filtered_1_valid) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(_T_16 | portsAROI_filtered_1_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_awOut_2_io_enq_bits_T_1 | portsAWOI_filtered_2_valid) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(_awOut_2_io_enq_bits_T_1 | portsAWOI_filtered_2_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_29 | portsAROI_filtered_2_valid) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(_T_29 | portsAROI_filtered_2_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_awOut_3_io_enq_bits_T_1 | portsAWOI_filtered_3_valid) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(_awOut_3_io_enq_bits_T_1 | portsAWOI_filtered_3_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_42 | portsAROI_filtered_3_valid) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(_T_42 | portsAROI_filtered_3_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~((~winner_4_0 | ~winner_4_1) & (~prefixOR_2 | ~winner_4_2) & (~prefixOR_3 | ~winner_4_3)) &
          _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~((~winner_4_0 | ~winner_4_1) & (~prefixOR_2 | ~winner_4_2) & (~prefixOR_3 | ~winner_4_3
          ))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Xbar.scala:270 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
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
        if (~(~anyValid | _prefixOR_T_4) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~anyValid | _prefixOR_T_4)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~((~winner_5_0 | ~winner_5_1) & (~prefixOR_2_1 | ~winner_5_2) & (~prefixOR_3_1 | ~winner_5_3)) &
          _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~((~winner_5_0 | ~winner_5_1) & (~prefixOR_2_1 | ~winner_5_2) & (~prefixOR_3_1 | ~
          winner_5_3))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Xbar.scala:270 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
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
        if (~(~anyValid_1 | _prefixOR_T_5) & _arFIFOMap_0_T_11) begin
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
        if (_arFIFOMap_0_T_11 & ~(~anyValid_1 | _prefixOR_T_5)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:272 assert (!anyValid || winner.reduce(_||_))\n");
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
  idle_4 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  readys_mask = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  state_4_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_4_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_4_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state_4_3 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  idle_5 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  readys_mask_1 = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  state_5_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  state_5_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  state_5_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  state_5_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  arFIFOMap_6_count = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  arFIFOMap_6_last = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  arFIFOMap_5_count = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  arFIFOMap_5_last = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  arFIFOMap_4_count = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  arFIFOMap_4_last = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  arFIFOMap_3_count = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  arFIFOMap_2_count = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  arFIFOMap_1_count = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  arFIFOMap_0_count = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  latched = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  awFIFOMap_6_count = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  awFIFOMap_6_last = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  awFIFOMap_5_count = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  awFIFOMap_5_last = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  awFIFOMap_4_count = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  awFIFOMap_4_last = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  awFIFOMap_3_count = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  awFIFOMap_2_count = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  awFIFOMap_1_count = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  awFIFOMap_0_count = _RAND_32[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule