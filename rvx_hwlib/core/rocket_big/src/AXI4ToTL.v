`default_nettype wire
module AXI4ToTL(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input         auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [3:0]  auto_in_aw_bits_cache,
  input  [2:0]  auto_in_aw_bits_prot,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output        auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input         auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [3:0]  auto_in_ar_bits_cache,
  input  [2:0]  auto_in_ar_bits_prot,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output        auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [3:0]  auto_out_a_bits_size,
  output [3:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output        auto_out_a_bits_user_amba_prot_bufferable,
  output        auto_out_a_bits_user_amba_prot_modifiable,
  output        auto_out_a_bits_user_amba_prot_readalloc,
  output        auto_out_a_bits_user_amba_prot_writealloc,
  output        auto_out_a_bits_user_amba_prot_privileged,
  output        auto_out_a_bits_user_amba_prot_secure,
  output        auto_out_a_bits_user_amba_prot_fetch,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [3:0]  auto_out_d_bits_size,
  input  [3:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
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
`endif // RANDOMIZE_REG_INIT
  wire  deq_clock;
  wire  deq_reset;
  wire  deq_io_enq_ready;
  wire  deq_io_enq_valid;
  wire  deq_io_enq_bits_id;
  wire [63:0] deq_io_enq_bits_data;
  wire [1:0] deq_io_enq_bits_resp;
  wire  deq_io_enq_bits_last;
  wire  deq_io_deq_ready;
  wire  deq_io_deq_valid;
  wire  deq_io_deq_bits_id;
  wire [63:0] deq_io_deq_bits_data;
  wire [1:0] deq_io_deq_bits_resp;
  wire  deq_io_deq_bits_last;
  wire  q_b_deq_clock;
  wire  q_b_deq_reset;
  wire  q_b_deq_io_enq_ready;
  wire  q_b_deq_io_enq_valid;
  wire  q_b_deq_io_enq_bits_id;
  wire [1:0] q_b_deq_io_enq_bits_resp;
  wire  q_b_deq_io_deq_ready;
  wire  q_b_deq_io_deq_valid;
  wire  q_b_deq_io_deq_bits_id;
  wire [1:0] q_b_deq_io_deq_bits_resp;
  wire [15:0] _r_size1_T = {auto_in_ar_bits_len,8'hff};
  wire [22:0] _GEN_0 = {{7'd0}, _r_size1_T};
  wire [22:0] _r_size1_T_1 = _GEN_0 << auto_in_ar_bits_size;
  wire [14:0] r_size1 = _r_size1_T_1[22:8];
  wire [15:0] _r_size_T = {r_size1, 1'h0};
  wire [15:0] _r_size_T_1 = _r_size_T | 16'h1;
  wire [15:0] _r_size_T_2 = {1'h0,r_size1};
  wire [15:0] _r_size_T_3 = ~_r_size_T_2;
  wire [15:0] _r_size_T_4 = _r_size_T_1 & _r_size_T_3;
  wire [7:0] r_size_hi = _r_size_T_4[15:8];
  wire [7:0] r_size_lo = _r_size_T_4[7:0];
  wire  _r_size_T_5 = |r_size_hi;
  wire [7:0] _r_size_T_6 = r_size_hi | r_size_lo;
  wire [3:0] r_size_hi_1 = _r_size_T_6[7:4];
  wire [3:0] r_size_lo_1 = _r_size_T_6[3:0];
  wire  _r_size_T_7 = |r_size_hi_1;
  wire [3:0] _r_size_T_8 = r_size_hi_1 | r_size_lo_1;
  wire [1:0] r_size_hi_2 = _r_size_T_8[3:2];
  wire [1:0] r_size_lo_2 = _r_size_T_8[1:0];
  wire  _r_size_T_9 = |r_size_hi_2;
  wire [1:0] _r_size_T_10 = r_size_hi_2 | r_size_lo_2;
  wire [3:0] r_size = {_r_size_T_5,_r_size_T_7,_r_size_T_9,_r_size_T_10[1]};
  wire  _r_ok_T_1 = r_size <= 4'hc;
  wire [31:0] _r_ok_T_4 = auto_in_ar_bits_addr ^ 32'h3000;
  wire [32:0] _r_ok_T_5 = {1'b0,$signed(_r_ok_T_4)};
  wire [32:0] _r_ok_T_7 = $signed(_r_ok_T_5) & -33'sh1000;
  wire  _r_ok_T_8 = $signed(_r_ok_T_7) == 33'sh0;
  wire  _r_ok_T_9 = _r_ok_T_1 & _r_ok_T_8;
  wire  _r_ok_T_11 = r_size <= 4'h6;
  wire [32:0] _r_ok_T_15 = {1'b0,$signed(auto_in_ar_bits_addr)};
  wire [32:0] _r_ok_T_17 = $signed(_r_ok_T_15) & -33'sh1000;
  wire  _r_ok_T_18 = $signed(_r_ok_T_17) == 33'sh0;
  wire [31:0] _r_ok_T_19 = auto_in_ar_bits_addr ^ 32'h10000;
  wire [32:0] _r_ok_T_20 = {1'b0,$signed(_r_ok_T_19)};
  wire [32:0] _r_ok_T_22 = $signed(_r_ok_T_20) & -33'sh10000;
  wire  _r_ok_T_23 = $signed(_r_ok_T_22) == 33'sh0;
  wire [31:0] _r_ok_T_24 = auto_in_ar_bits_addr ^ 32'h2000000;
  wire [32:0] _r_ok_T_25 = {1'b0,$signed(_r_ok_T_24)};
  wire [32:0] _r_ok_T_27 = $signed(_r_ok_T_25) & -33'sh10000;
  wire  _r_ok_T_28 = $signed(_r_ok_T_27) == 33'sh0;
  wire [31:0] _r_ok_T_29 = auto_in_ar_bits_addr ^ 32'hc000000;
  wire [32:0] _r_ok_T_30 = {1'b0,$signed(_r_ok_T_29)};
  wire [32:0] _r_ok_T_32 = $signed(_r_ok_T_30) & -33'sh4000000;
  wire  _r_ok_T_33 = $signed(_r_ok_T_32) == 33'sh0;
  wire [31:0] _r_ok_T_34 = auto_in_ar_bits_addr ^ 32'h10000000;
  wire [32:0] _r_ok_T_35 = {1'b0,$signed(_r_ok_T_34)};
  wire [32:0] _r_ok_T_37 = $signed(_r_ok_T_35) & -33'sh10000000;
  wire  _r_ok_T_38 = $signed(_r_ok_T_37) == 33'sh0;
  wire [31:0] _r_ok_T_39 = auto_in_ar_bits_addr ^ 32'h20000000;
  wire [32:0] _r_ok_T_40 = {1'b0,$signed(_r_ok_T_39)};
  wire [32:0] _r_ok_T_42 = $signed(_r_ok_T_40) & -33'sh20000000;
  wire  _r_ok_T_43 = $signed(_r_ok_T_42) == 33'sh0;
  wire [31:0] _r_ok_T_44 = auto_in_ar_bits_addr ^ 32'h40000000;
  wire [32:0] _r_ok_T_45 = {1'b0,$signed(_r_ok_T_44)};
  wire [32:0] _r_ok_T_47 = $signed(_r_ok_T_45) & -33'sh40000000;
  wire  _r_ok_T_48 = $signed(_r_ok_T_47) == 33'sh0;
  wire [31:0] _r_ok_T_49 = auto_in_ar_bits_addr ^ 32'h80000000;
  wire [32:0] _r_ok_T_50 = {1'b0,$signed(_r_ok_T_49)};
  wire [32:0] _r_ok_T_52 = $signed(_r_ok_T_50) & -33'sh80000000;
  wire  _r_ok_T_53 = $signed(_r_ok_T_52) == 33'sh0;
  wire  _r_ok_T_60 = _r_ok_T_18 | _r_ok_T_23 | _r_ok_T_28 | _r_ok_T_33 | _r_ok_T_38 | _r_ok_T_43 | _r_ok_T_48 |
    _r_ok_T_53;
  wire  _r_ok_T_61 = _r_ok_T_11 & _r_ok_T_60;
  wire  r_ok = _r_ok_T_9 | _r_ok_T_61;
  wire [13:0] _GEN_16 = {{11'd0}, auto_in_ar_bits_addr[2:0]};
  wire [13:0] _r_addr_T_1 = 14'h3000 | _GEN_16;
  wire [31:0] r_addr = r_ok ? auto_in_ar_bits_addr : {{18'd0}, _r_addr_T_1};
  reg [2:0] r_count_0;
  reg [2:0] r_count_1;
  wire [2:0] _GEN_1 = auto_in_ar_bits_id ? r_count_1 : r_count_0;
  wire [3:0] r_id = {auto_in_ar_bits_id,_GEN_1[1:0],1'h0};
  wire [29:0] _T_2 = 30'h7fff << r_size;
  wire [14:0] _T_4 = ~_T_2[14:0];
  wire  _T_8 = ~reset;
  wire [1:0] a_mask_sizeOH_shiftAmount = r_size[1:0];
  wire [3:0] _a_mask_sizeOH_T_1 = 4'h1 << a_mask_sizeOH_shiftAmount;
  wire [2:0] a_mask_sizeOH = _a_mask_sizeOH_T_1[2:0] | 3'h1;
  wire  _a_mask_T = r_size >= 4'h3;
  wire  a_mask_size = a_mask_sizeOH[2];
  wire  a_mask_bit = r_addr[2];
  wire  a_mask_nbit = ~a_mask_bit;
  wire  a_mask_acc = _a_mask_T | a_mask_size & a_mask_nbit;
  wire  a_mask_acc_1 = _a_mask_T | a_mask_size & a_mask_bit;
  wire  a_mask_size_1 = a_mask_sizeOH[1];
  wire  a_mask_bit_1 = r_addr[1];
  wire  a_mask_nbit_1 = ~a_mask_bit_1;
  wire  a_mask_eq_2 = a_mask_nbit & a_mask_nbit_1;
  wire  a_mask_acc_2 = a_mask_acc | a_mask_size_1 & a_mask_eq_2;
  wire  a_mask_eq_3 = a_mask_nbit & a_mask_bit_1;
  wire  a_mask_acc_3 = a_mask_acc | a_mask_size_1 & a_mask_eq_3;
  wire  a_mask_eq_4 = a_mask_bit & a_mask_nbit_1;
  wire  a_mask_acc_4 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_4;
  wire  a_mask_eq_5 = a_mask_bit & a_mask_bit_1;
  wire  a_mask_acc_5 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_5;
  wire  a_mask_size_2 = a_mask_sizeOH[0];
  wire  a_mask_bit_2 = r_addr[0];
  wire  a_mask_nbit_2 = ~a_mask_bit_2;
  wire  a_mask_eq_6 = a_mask_eq_2 & a_mask_nbit_2;
  wire  a_mask_acc_6 = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_6;
  wire  a_mask_eq_7 = a_mask_eq_2 & a_mask_bit_2;
  wire  a_mask_acc_7 = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_7;
  wire  a_mask_eq_8 = a_mask_eq_3 & a_mask_nbit_2;
  wire  a_mask_acc_8 = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_8;
  wire  a_mask_eq_9 = a_mask_eq_3 & a_mask_bit_2;
  wire  a_mask_acc_9 = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_9;
  wire  a_mask_eq_10 = a_mask_eq_4 & a_mask_nbit_2;
  wire  a_mask_acc_10 = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_10;
  wire  a_mask_eq_11 = a_mask_eq_4 & a_mask_bit_2;
  wire  a_mask_acc_11 = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_11;
  wire  a_mask_eq_12 = a_mask_eq_5 & a_mask_nbit_2;
  wire  a_mask_acc_12 = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_12;
  wire  a_mask_eq_13 = a_mask_eq_5 & a_mask_bit_2;
  wire  a_mask_acc_13 = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_13;
  wire [7:0] a_mask = {a_mask_acc_13,a_mask_acc_12,a_mask_acc_11,a_mask_acc_10,a_mask_acc_9,a_mask_acc_8,a_mask_acc_7,
    a_mask_acc_6};
  wire  r_out_bits_user_amba_prot_privileged = auto_in_ar_bits_prot[0];
  wire  r_out_bits_user_amba_prot_secure = ~auto_in_ar_bits_prot[1];
  wire  r_out_bits_user_amba_prot_fetch = auto_in_ar_bits_prot[2];
  wire  r_out_bits_user_amba_prot_bufferable = auto_in_ar_bits_cache[0];
  wire  r_out_bits_user_amba_prot_modifiable = auto_in_ar_bits_cache[1];
  wire  r_out_bits_user_amba_prot_readalloc = auto_in_ar_bits_cache[2];
  wire  r_out_bits_user_amba_prot_writealloc = auto_in_ar_bits_cache[3];
  wire [1:0] r_sel = 2'h1 << auto_in_ar_bits_id;
  reg [7:0] beatsLeft;
  wire  idle = beatsLeft == 8'h0;
  wire  w_out_valid = auto_in_aw_valid & auto_in_w_valid;
  wire [1:0] readys_valid = {w_out_valid,auto_in_ar_valid};
  reg [1:0] readys_mask;
  wire [1:0] _readys_filter_T = ~readys_mask;
  wire [1:0] _readys_filter_T_1 = readys_valid & _readys_filter_T;
  wire [3:0] readys_filter = {_readys_filter_T_1,w_out_valid,auto_in_ar_valid};
  wire [3:0] _GEN_17 = {{1'd0}, readys_filter[3:1]};
  wire [3:0] _readys_unready_T_1 = readys_filter | _GEN_17;
  wire [3:0] _readys_unready_T_4 = {readys_mask, 2'h0};
  wire [3:0] _GEN_18 = {{1'd0}, _readys_unready_T_1[3:1]};
  wire [3:0] readys_unready = _GEN_18 | _readys_unready_T_4;
  wire [1:0] _readys_readys_T_2 = readys_unready[3:2] & readys_unready[1:0];
  wire [1:0] readys_readys = ~_readys_readys_T_2;
  wire  readys_0 = readys_readys[0];
  reg  state_0;
  wire  allowed_0 = idle ? readys_0 : state_0;
  wire  out_ready = auto_out_a_ready & allowed_0;
  wire  _T_12 = out_ready & auto_in_ar_valid;
  wire [2:0] _r_count_0_T_1 = r_count_0 + 3'h1;
  wire [2:0] _r_count_1_T_1 = r_count_1 + 3'h1;
  wire [15:0] _w_size1_T = {auto_in_aw_bits_len,8'hff};
  wire [22:0] _GEN_4 = {{7'd0}, _w_size1_T};
  wire [22:0] _w_size1_T_1 = _GEN_4 << auto_in_aw_bits_size;
  wire [14:0] w_size1 = _w_size1_T_1[22:8];
  wire [15:0] _w_size_T = {w_size1, 1'h0};
  wire [15:0] _w_size_T_1 = _w_size_T | 16'h1;
  wire [15:0] _w_size_T_2 = {1'h0,w_size1};
  wire [15:0] _w_size_T_3 = ~_w_size_T_2;
  wire [15:0] _w_size_T_4 = _w_size_T_1 & _w_size_T_3;
  wire [7:0] w_size_hi = _w_size_T_4[15:8];
  wire [7:0] w_size_lo = _w_size_T_4[7:0];
  wire  _w_size_T_5 = |w_size_hi;
  wire [7:0] _w_size_T_6 = w_size_hi | w_size_lo;
  wire [3:0] w_size_hi_1 = _w_size_T_6[7:4];
  wire [3:0] w_size_lo_1 = _w_size_T_6[3:0];
  wire  _w_size_T_7 = |w_size_hi_1;
  wire [3:0] _w_size_T_8 = w_size_hi_1 | w_size_lo_1;
  wire [1:0] w_size_hi_2 = _w_size_T_8[3:2];
  wire [1:0] w_size_lo_2 = _w_size_T_8[1:0];
  wire  _w_size_T_9 = |w_size_hi_2;
  wire [1:0] _w_size_T_10 = w_size_hi_2 | w_size_lo_2;
  wire [3:0] w_size = {_w_size_T_5,_w_size_T_7,_w_size_T_9,_w_size_T_10[1]};
  wire  _w_ok_T_1 = w_size <= 4'hc;
  wire [31:0] _w_ok_T_4 = auto_in_aw_bits_addr ^ 32'h3000;
  wire [32:0] _w_ok_T_5 = {1'b0,$signed(_w_ok_T_4)};
  wire [32:0] _w_ok_T_7 = $signed(_w_ok_T_5) & -33'sh1000;
  wire  _w_ok_T_8 = $signed(_w_ok_T_7) == 33'sh0;
  wire  _w_ok_T_9 = _w_ok_T_1 & _w_ok_T_8;
  wire  _w_ok_T_11 = w_size <= 4'h6;
  wire [32:0] _w_ok_T_15 = {1'b0,$signed(auto_in_aw_bits_addr)};
  wire [32:0] _w_ok_T_17 = $signed(_w_ok_T_15) & -33'sh1000;
  wire  _w_ok_T_18 = $signed(_w_ok_T_17) == 33'sh0;
  wire [31:0] _w_ok_T_19 = auto_in_aw_bits_addr ^ 32'h2000000;
  wire [32:0] _w_ok_T_20 = {1'b0,$signed(_w_ok_T_19)};
  wire [32:0] _w_ok_T_22 = $signed(_w_ok_T_20) & -33'sh10000;
  wire  _w_ok_T_23 = $signed(_w_ok_T_22) == 33'sh0;
  wire [31:0] _w_ok_T_24 = auto_in_aw_bits_addr ^ 32'hc000000;
  wire [32:0] _w_ok_T_25 = {1'b0,$signed(_w_ok_T_24)};
  wire [32:0] _w_ok_T_27 = $signed(_w_ok_T_25) & -33'sh4000000;
  wire  _w_ok_T_28 = $signed(_w_ok_T_27) == 33'sh0;
  wire [31:0] _w_ok_T_29 = auto_in_aw_bits_addr ^ 32'h10000000;
  wire [32:0] _w_ok_T_30 = {1'b0,$signed(_w_ok_T_29)};
  wire [32:0] _w_ok_T_32 = $signed(_w_ok_T_30) & -33'sh10000000;
  wire  _w_ok_T_33 = $signed(_w_ok_T_32) == 33'sh0;
  wire [31:0] _w_ok_T_34 = auto_in_aw_bits_addr ^ 32'h20000000;
  wire [32:0] _w_ok_T_35 = {1'b0,$signed(_w_ok_T_34)};
  wire [32:0] _w_ok_T_37 = $signed(_w_ok_T_35) & -33'sh20000000;
  wire  _w_ok_T_38 = $signed(_w_ok_T_37) == 33'sh0;
  wire [31:0] _w_ok_T_39 = auto_in_aw_bits_addr ^ 32'h40000000;
  wire [32:0] _w_ok_T_40 = {1'b0,$signed(_w_ok_T_39)};
  wire [32:0] _w_ok_T_42 = $signed(_w_ok_T_40) & -33'sh40000000;
  wire  _w_ok_T_43 = $signed(_w_ok_T_42) == 33'sh0;
  wire [31:0] _w_ok_T_44 = auto_in_aw_bits_addr ^ 32'h80000000;
  wire [32:0] _w_ok_T_45 = {1'b0,$signed(_w_ok_T_44)};
  wire [32:0] _w_ok_T_47 = $signed(_w_ok_T_45) & -33'sh40000000;
  wire  _w_ok_T_48 = $signed(_w_ok_T_47) == 33'sh0;
  wire  _w_ok_T_54 = _w_ok_T_18 | _w_ok_T_23 | _w_ok_T_28 | _w_ok_T_33 | _w_ok_T_38 | _w_ok_T_43 | _w_ok_T_48;
  wire  _w_ok_T_55 = _w_ok_T_11 & _w_ok_T_54;
  wire  _w_ok_T_64 = w_size <= 4'h8;
  wire [31:0] _w_ok_T_67 = auto_in_aw_bits_addr ^ 32'hc0000000;
  wire [32:0] _w_ok_T_68 = {1'b0,$signed(_w_ok_T_67)};
  wire [32:0] _w_ok_T_70 = $signed(_w_ok_T_68) & -33'sh40000000;
  wire  _w_ok_T_71 = $signed(_w_ok_T_70) == 33'sh0;
  wire  _w_ok_T_72 = _w_ok_T_64 & _w_ok_T_71;
  wire  w_ok = _w_ok_T_9 | _w_ok_T_55 | _w_ok_T_72;
  wire [13:0] _GEN_19 = {{11'd0}, auto_in_aw_bits_addr[2:0]};
  wire [13:0] _w_addr_T_1 = 14'h3000 | _GEN_19;
  wire [31:0] w_addr = w_ok ? auto_in_aw_bits_addr : {{18'd0}, _w_addr_T_1};
  reg [2:0] w_count_0;
  reg [2:0] w_count_1;
  wire [2:0] _GEN_5 = auto_in_aw_bits_id ? w_count_1 : w_count_0;
  wire [3:0] w_id = {auto_in_aw_bits_id,_GEN_5[1:0],1'h1};
  wire  _T_16 = ~auto_in_aw_valid;
  wire [29:0] _T_18 = 30'h7fff << w_size;
  wire [14:0] _T_20 = ~_T_18[14:0];
  wire  readys_1 = readys_readys[1];
  reg  state_1;
  wire  allowed_1 = idle ? readys_1 : state_1;
  wire  out_1_ready = auto_out_a_ready & allowed_1;
  wire  bundleIn_0_aw_ready = out_1_ready & auto_in_w_valid & auto_in_w_bits_last;
  wire  w_out_bits_user_amba_prot_privileged = auto_in_aw_bits_prot[0];
  wire  w_out_bits_user_amba_prot_secure = ~auto_in_aw_bits_prot[1];
  wire  w_out_bits_user_amba_prot_fetch = auto_in_aw_bits_prot[2];
  wire  w_out_bits_user_amba_prot_bufferable = auto_in_aw_bits_cache[0];
  wire  w_out_bits_user_amba_prot_modifiable = auto_in_aw_bits_cache[1];
  wire  w_out_bits_user_amba_prot_readalloc = auto_in_aw_bits_cache[2];
  wire  w_out_bits_user_amba_prot_writealloc = auto_in_aw_bits_cache[3];
  wire [1:0] w_sel = 2'h1 << auto_in_aw_bits_id;
  wire  _T_36 = bundleIn_0_aw_ready & auto_in_aw_valid;
  wire [2:0] _w_count_0_T_1 = w_count_0 + 3'h1;
  wire [2:0] _w_count_1_T_1 = w_count_1 + 3'h1;
  wire  latch = idle & auto_out_a_ready;
  wire [1:0] _readys_mask_T = readys_readys & readys_valid;
  wire [2:0] _readys_mask_T_1 = {_readys_mask_T, 1'h0};
  wire [1:0] _readys_mask_T_3 = _readys_mask_T | _readys_mask_T_1[1:0];
  wire  earlyWinner_0 = readys_0 & auto_in_ar_valid;
  wire  earlyWinner_1 = readys_1 & w_out_valid;
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1;
  wire  _T_50 = auto_in_ar_valid | w_out_valid;
  wire  _T_51 = ~(auto_in_ar_valid | w_out_valid);
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0;
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1;
  wire  _sink_ACancel_earlyValid_T_3 = state_0 & auto_in_ar_valid | state_1 & w_out_valid;
  wire  sink_ACancel_earlyValid = idle ? _T_50 : _sink_ACancel_earlyValid_T_3;
  wire  _beatsLeft_T_2 = auto_out_a_ready & sink_ACancel_earlyValid;
  wire [7:0] _GEN_20 = {{7'd0}, _beatsLeft_T_2};
  wire [7:0] _beatsLeft_T_4 = beatsLeft - _GEN_20;
  wire [7:0] _T_70 = muxStateEarly_0 ? a_mask : 8'h0;
  wire [7:0] _T_71 = muxStateEarly_1 ? auto_in_w_bits_strb : 8'h0;
  wire [31:0] _T_94 = muxStateEarly_0 ? r_addr : 32'h0;
  wire [31:0] _T_95 = muxStateEarly_1 ? w_addr : 32'h0;
  wire [3:0] _T_97 = muxStateEarly_0 ? r_id : 4'h0;
  wire [3:0] _T_98 = muxStateEarly_1 ? w_id : 4'h0;
  wire [3:0] _T_100 = muxStateEarly_0 ? r_size : 4'h0;
  wire [3:0] _T_101 = muxStateEarly_1 ? w_size : 4'h0;
  wire [2:0] _T_106 = muxStateEarly_0 ? 3'h4 : 3'h0;
  wire [2:0] _T_107 = muxStateEarly_1 ? 3'h1 : 3'h0;
  wire  d_hasData = auto_out_d_bits_opcode[0];
  wire  ok_r_ready = deq_io_enq_ready;
  wire  ok_b_ready = q_b_deq_io_enq_ready;
  wire  bundleOut_0_d_ready = d_hasData ? ok_r_ready : ok_b_ready;
  wire  _d_last_T = bundleOut_0_d_ready & auto_out_d_valid;
  wire [26:0] _d_last_beats1_decode_T_1 = 27'hfff << auto_out_d_bits_size;
  wire [11:0] _d_last_beats1_decode_T_3 = ~_d_last_beats1_decode_T_1[11:0];
  wire [8:0] d_last_beats1_decode = _d_last_beats1_decode_T_3[11:3];
  wire [8:0] d_last_beats1 = d_hasData ? d_last_beats1_decode : 9'h0;
  reg [8:0] d_last_counter;
  wire [8:0] d_last_counter1 = d_last_counter - 9'h1;
  wire  d_last_first = d_last_counter == 9'h0;
  reg [2:0] b_count_0;
  reg [2:0] b_count_1;
  wire  q_b_bits_id = q_b_deq_io_deq_bits_id;
  wire [2:0] _GEN_11 = q_b_bits_id ? b_count_1 : b_count_0;
  wire [2:0] _GEN_13 = q_b_bits_id ? w_count_1 : w_count_0;
  wire  b_allow = _GEN_11 != _GEN_13;
  wire [1:0] b_sel = 2'h1 << q_b_bits_id;
  wire  q_b_valid = q_b_deq_io_deq_valid;
  wire  bundleIn_0_b_valid = q_b_valid & b_allow;
  wire  _T_111 = auto_in_b_ready & bundleIn_0_b_valid;
  wire [2:0] _b_count_0_T_1 = b_count_0 + 3'h1;
  wire [2:0] _b_count_1_T_1 = b_count_1 + 3'h1;
  Queue_22 deq (
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_id(deq_io_enq_bits_id),
    .io_enq_bits_data(deq_io_enq_bits_data),
    .io_enq_bits_resp(deq_io_enq_bits_resp),
    .io_enq_bits_last(deq_io_enq_bits_last),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_id(deq_io_deq_bits_id),
    .io_deq_bits_data(deq_io_deq_bits_data),
    .io_deq_bits_resp(deq_io_deq_bits_resp),
    .io_deq_bits_last(deq_io_deq_bits_last)
  );
  Queue_23 q_b_deq (
    .clock(q_b_deq_clock),
    .reset(q_b_deq_reset),
    .io_enq_ready(q_b_deq_io_enq_ready),
    .io_enq_valid(q_b_deq_io_enq_valid),
    .io_enq_bits_id(q_b_deq_io_enq_bits_id),
    .io_enq_bits_resp(q_b_deq_io_enq_bits_resp),
    .io_deq_ready(q_b_deq_io_deq_ready),
    .io_deq_valid(q_b_deq_io_deq_valid),
    .io_deq_bits_id(q_b_deq_io_deq_bits_id),
    .io_deq_bits_resp(q_b_deq_io_deq_bits_resp)
  );
  assign auto_in_aw_ready = out_1_ready & auto_in_w_valid & auto_in_w_bits_last;
  assign auto_in_w_ready = out_1_ready & auto_in_aw_valid;
  assign auto_in_b_valid = q_b_valid & b_allow;
  assign auto_in_b_bits_id = q_b_deq_io_deq_bits_id;
  assign auto_in_b_bits_resp = q_b_deq_io_deq_bits_resp;
  assign auto_in_ar_ready = auto_out_a_ready & allowed_0;
  assign auto_in_r_valid = deq_io_deq_valid;
  assign auto_in_r_bits_id = deq_io_deq_bits_id;
  assign auto_in_r_bits_data = deq_io_deq_bits_data;
  assign auto_in_r_bits_resp = deq_io_deq_bits_resp;
  assign auto_in_r_bits_last = deq_io_deq_bits_last;
  assign auto_out_a_valid = idle ? _T_50 : _sink_ACancel_earlyValid_T_3;
  assign auto_out_a_bits_opcode = _T_106 | _T_107;
  assign auto_out_a_bits_size = _T_100 | _T_101;
  assign auto_out_a_bits_source = _T_97 | _T_98;
  assign auto_out_a_bits_address = _T_94 | _T_95;
  assign auto_out_a_bits_user_amba_prot_bufferable = muxStateEarly_0 & r_out_bits_user_amba_prot_bufferable |
    muxStateEarly_1 & w_out_bits_user_amba_prot_bufferable;
  assign auto_out_a_bits_user_amba_prot_modifiable = muxStateEarly_0 & r_out_bits_user_amba_prot_modifiable |
    muxStateEarly_1 & w_out_bits_user_amba_prot_modifiable;
  assign auto_out_a_bits_user_amba_prot_readalloc = muxStateEarly_0 & r_out_bits_user_amba_prot_readalloc |
    muxStateEarly_1 & w_out_bits_user_amba_prot_readalloc;
  assign auto_out_a_bits_user_amba_prot_writealloc = muxStateEarly_0 & r_out_bits_user_amba_prot_writealloc |
    muxStateEarly_1 & w_out_bits_user_amba_prot_writealloc;
  assign auto_out_a_bits_user_amba_prot_privileged = muxStateEarly_0 & r_out_bits_user_amba_prot_privileged |
    muxStateEarly_1 & w_out_bits_user_amba_prot_privileged;
  assign auto_out_a_bits_user_amba_prot_secure = muxStateEarly_0 & r_out_bits_user_amba_prot_secure | muxStateEarly_1 &
    w_out_bits_user_amba_prot_secure;
  assign auto_out_a_bits_user_amba_prot_fetch = muxStateEarly_0 & r_out_bits_user_amba_prot_fetch | muxStateEarly_1 &
    w_out_bits_user_amba_prot_fetch;
  assign auto_out_a_bits_mask = _T_70 | _T_71;
  assign auto_out_a_bits_data = muxStateEarly_1 ? auto_in_w_bits_data : 64'h0;
  assign auto_out_d_ready = d_hasData ? ok_r_ready : ok_b_ready;
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = auto_out_d_valid & d_hasData;
  assign deq_io_enq_bits_id = auto_out_d_bits_source[3];
  assign deq_io_enq_bits_data = auto_out_d_bits_data;
  assign deq_io_enq_bits_resp = auto_out_d_bits_denied | auto_out_d_bits_corrupt ? 2'h2 : 2'h0;
  assign deq_io_enq_bits_last = d_last_counter == 9'h1 | d_last_beats1 == 9'h0;
  assign deq_io_deq_ready = auto_in_r_ready;
  assign q_b_deq_clock = clock;
  assign q_b_deq_reset = reset;
  assign q_b_deq_io_enq_valid = auto_out_d_valid & ~d_hasData;
  assign q_b_deq_io_enq_bits_id = auto_out_d_bits_source[3];
  assign q_b_deq_io_enq_bits_resp = auto_out_d_bits_denied | auto_out_d_bits_corrupt ? 2'h2 : 2'h0;
  assign q_b_deq_io_deq_ready = auto_in_b_ready & b_allow;
  always @(posedge clock) begin
    if (reset) begin
      r_count_0 <= 3'h0;
    end else if (_T_12 & r_sel[0]) begin
      r_count_0 <= _r_count_0_T_1;
    end
    if (reset) begin
      r_count_1 <= 3'h0;
    end else if (_T_12 & r_sel[1]) begin
      r_count_1 <= _r_count_1_T_1;
    end
    if (reset) begin
      beatsLeft <= 8'h0;
    end else if (latch) begin
      if (earlyWinner_1) begin
        beatsLeft <= auto_in_aw_bits_len;
      end else begin
        beatsLeft <= 8'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin
      readys_mask <= 2'h3;
    end else if (latch & |readys_valid) begin
      readys_mask <= _readys_mask_T_3;
    end
    if (reset) begin
      state_0 <= 1'h0;
    end else if (idle) begin
      state_0 <= earlyWinner_0;
    end
    if (reset) begin
      w_count_0 <= 3'h0;
    end else if (_T_36 & w_sel[0]) begin
      w_count_0 <= _w_count_0_T_1;
    end
    if (reset) begin
      w_count_1 <= 3'h0;
    end else if (_T_36 & w_sel[1]) begin
      w_count_1 <= _w_count_1_T_1;
    end
    if (reset) begin
      state_1 <= 1'h0;
    end else if (idle) begin
      state_1 <= earlyWinner_1;
    end
    if (reset) begin
      d_last_counter <= 9'h0;
    end else if (_d_last_T) begin
      if (d_last_first) begin
        if (d_hasData) begin
          d_last_counter <= d_last_beats1_decode;
        end else begin
          d_last_counter <= 9'h0;
        end
      end else begin
        d_last_counter <= d_last_counter1;
      end
    end
    if (reset) begin
      b_count_0 <= 3'h0;
    end else if (_T_111 & b_sel[0]) begin
      b_count_0 <= _b_count_0_T_1;
    end
    if (reset) begin
      b_count_1 <= 3'h0;
    end else if (_T_111 & b_sel[1]) begin
      b_count_1 <= _b_count_1_T_1;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~auto_in_ar_valid | r_size1 == _T_4) & ~reset) begin
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
        if (~reset & ~(~auto_in_ar_valid | r_size1 == _T_4)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToTL.scala:106 assert (!in.ar.valid || r_size1 === UIntToOH1(r_size, beatCountBits)) // because aligned\n"
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
        if (~(~auto_in_aw_valid | w_size1 == _T_20) & _T_8) begin
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
        if (_T_8 & ~(~auto_in_aw_valid | w_size1 == _T_20)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToTL.scala:139 assert (!in.aw.valid || w_size1 === UIntToOH1(w_size, beatCountBits)) // because aligned\n"
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
        if (~(_T_16 | auto_in_aw_bits_len == 8'h0 | auto_in_aw_bits_size == 3'h3) & _T_8) begin
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
        if (_T_8 & ~(_T_16 | auto_in_aw_bits_len == 8'h0 | auto_in_aw_bits_size == 3'h3)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToTL.scala:140 assert (!in.aw.valid || in.aw.bits.len === UInt(0) || in.aw.bits.size === UInt(log2Ceil(beatBytes))) // because aligned\n"
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
        if (~(~earlyWinner_0 | ~earlyWinner_1) & _T_8) begin
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
        if (_T_8 & ~(~earlyWinner_0 | ~earlyWinner_1)) begin
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
        if (~(~(auto_in_ar_valid | w_out_valid) | _prefixOR_T) & _T_8) begin
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
        if (_T_8 & ~(~(auto_in_ar_valid | w_out_valid) | _prefixOR_T)) begin
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
        if (~(_T_51 | _T_50) & _T_8) begin
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
        if (_T_8 & ~(_T_51 | _T_50)) begin
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
  r_count_0 = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  r_count_1 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  beatsLeft = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  readys_mask = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  state_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  w_count_0 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  w_count_1 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  state_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  d_last_counter = _RAND_8[8:0];
  _RAND_9 = {1{`RANDOM}};
  b_count_0 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  b_count_1 = _RAND_10[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule