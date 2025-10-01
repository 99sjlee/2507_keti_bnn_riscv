`default_nettype wire
module PTW(
  input         clock,
  input         reset,
  output        io_requestor_0_req_ready,
  input         io_requestor_0_req_valid,
  input  [19:0] io_requestor_0_req_bits_bits_addr,
  input         io_requestor_0_req_bits_bits_need_gpa,
  output        io_requestor_0_resp_valid,
  output        io_requestor_0_resp_bits_ae_ptw,
  output        io_requestor_0_resp_bits_ae_final,
  output        io_requestor_0_resp_bits_pf,
  output [43:0] io_requestor_0_resp_bits_pte_ppn,
  output        io_requestor_0_resp_bits_pte_d,
  output        io_requestor_0_resp_bits_pte_a,
  output        io_requestor_0_resp_bits_pte_g,
  output        io_requestor_0_resp_bits_pte_u,
  output        io_requestor_0_resp_bits_pte_x,
  output        io_requestor_0_resp_bits_pte_w,
  output        io_requestor_0_resp_bits_pte_r,
  output        io_requestor_0_resp_bits_pte_v,
  output        io_requestor_0_resp_bits_level,
  output        io_requestor_0_resp_bits_homogeneous,
  output        io_requestor_0_ptbr_mode,
  output        io_requestor_0_status_debug,
  output        io_requestor_0_status_mxr,
  output        io_requestor_0_status_sum,
  output        io_requestor_0_pmp_0_cfg_l,
  output [1:0]  io_requestor_0_pmp_0_cfg_a,
  output        io_requestor_0_pmp_0_cfg_x,
  output        io_requestor_0_pmp_0_cfg_w,
  output        io_requestor_0_pmp_0_cfg_r,
  output [29:0] io_requestor_0_pmp_0_addr,
  output [31:0] io_requestor_0_pmp_0_mask,
  output        io_requestor_0_pmp_1_cfg_l,
  output [1:0]  io_requestor_0_pmp_1_cfg_a,
  output        io_requestor_0_pmp_1_cfg_x,
  output        io_requestor_0_pmp_1_cfg_w,
  output        io_requestor_0_pmp_1_cfg_r,
  output [29:0] io_requestor_0_pmp_1_addr,
  output [31:0] io_requestor_0_pmp_1_mask,
  output        io_requestor_0_pmp_2_cfg_l,
  output [1:0]  io_requestor_0_pmp_2_cfg_a,
  output        io_requestor_0_pmp_2_cfg_x,
  output        io_requestor_0_pmp_2_cfg_w,
  output        io_requestor_0_pmp_2_cfg_r,
  output [29:0] io_requestor_0_pmp_2_addr,
  output [31:0] io_requestor_0_pmp_2_mask,
  output        io_requestor_0_pmp_3_cfg_l,
  output [1:0]  io_requestor_0_pmp_3_cfg_a,
  output        io_requestor_0_pmp_3_cfg_x,
  output        io_requestor_0_pmp_3_cfg_w,
  output        io_requestor_0_pmp_3_cfg_r,
  output [29:0] io_requestor_0_pmp_3_addr,
  output [31:0] io_requestor_0_pmp_3_mask,
  output        io_requestor_0_pmp_4_cfg_l,
  output [1:0]  io_requestor_0_pmp_4_cfg_a,
  output        io_requestor_0_pmp_4_cfg_x,
  output        io_requestor_0_pmp_4_cfg_w,
  output        io_requestor_0_pmp_4_cfg_r,
  output [29:0] io_requestor_0_pmp_4_addr,
  output [31:0] io_requestor_0_pmp_4_mask,
  output        io_requestor_0_pmp_5_cfg_l,
  output [1:0]  io_requestor_0_pmp_5_cfg_a,
  output        io_requestor_0_pmp_5_cfg_x,
  output        io_requestor_0_pmp_5_cfg_w,
  output        io_requestor_0_pmp_5_cfg_r,
  output [29:0] io_requestor_0_pmp_5_addr,
  output [31:0] io_requestor_0_pmp_5_mask,
  output        io_requestor_0_pmp_6_cfg_l,
  output [1:0]  io_requestor_0_pmp_6_cfg_a,
  output        io_requestor_0_pmp_6_cfg_x,
  output        io_requestor_0_pmp_6_cfg_w,
  output        io_requestor_0_pmp_6_cfg_r,
  output [29:0] io_requestor_0_pmp_6_addr,
  output [31:0] io_requestor_0_pmp_6_mask,
  output        io_requestor_0_pmp_7_cfg_l,
  output [1:0]  io_requestor_0_pmp_7_cfg_a,
  output        io_requestor_0_pmp_7_cfg_x,
  output        io_requestor_0_pmp_7_cfg_w,
  output        io_requestor_0_pmp_7_cfg_r,
  output [29:0] io_requestor_0_pmp_7_addr,
  output [31:0] io_requestor_0_pmp_7_mask,
  output        io_requestor_1_req_ready,
  input         io_requestor_1_req_valid,
  input         io_requestor_1_req_bits_valid,
  input  [19:0] io_requestor_1_req_bits_bits_addr,
  input         io_requestor_1_req_bits_bits_need_gpa,
  output        io_requestor_1_resp_valid,
  output        io_requestor_1_resp_bits_ae_ptw,
  output        io_requestor_1_resp_bits_ae_final,
  output        io_requestor_1_resp_bits_pf,
  output [43:0] io_requestor_1_resp_bits_pte_ppn,
  output        io_requestor_1_resp_bits_pte_d,
  output        io_requestor_1_resp_bits_pte_a,
  output        io_requestor_1_resp_bits_pte_g,
  output        io_requestor_1_resp_bits_pte_u,
  output        io_requestor_1_resp_bits_pte_x,
  output        io_requestor_1_resp_bits_pte_w,
  output        io_requestor_1_resp_bits_pte_r,
  output        io_requestor_1_resp_bits_pte_v,
  output        io_requestor_1_resp_bits_level,
  output        io_requestor_1_resp_bits_homogeneous,
  output        io_requestor_1_ptbr_mode,
  output        io_requestor_1_status_debug,
  output [1:0]  io_requestor_1_status_prv,
  output        io_requestor_1_pmp_0_cfg_l,
  output [1:0]  io_requestor_1_pmp_0_cfg_a,
  output        io_requestor_1_pmp_0_cfg_x,
  output        io_requestor_1_pmp_0_cfg_w,
  output        io_requestor_1_pmp_0_cfg_r,
  output [29:0] io_requestor_1_pmp_0_addr,
  output [31:0] io_requestor_1_pmp_0_mask,
  output        io_requestor_1_pmp_1_cfg_l,
  output [1:0]  io_requestor_1_pmp_1_cfg_a,
  output        io_requestor_1_pmp_1_cfg_x,
  output        io_requestor_1_pmp_1_cfg_w,
  output        io_requestor_1_pmp_1_cfg_r,
  output [29:0] io_requestor_1_pmp_1_addr,
  output [31:0] io_requestor_1_pmp_1_mask,
  output        io_requestor_1_pmp_2_cfg_l,
  output [1:0]  io_requestor_1_pmp_2_cfg_a,
  output        io_requestor_1_pmp_2_cfg_x,
  output        io_requestor_1_pmp_2_cfg_w,
  output        io_requestor_1_pmp_2_cfg_r,
  output [29:0] io_requestor_1_pmp_2_addr,
  output [31:0] io_requestor_1_pmp_2_mask,
  output        io_requestor_1_pmp_3_cfg_l,
  output [1:0]  io_requestor_1_pmp_3_cfg_a,
  output        io_requestor_1_pmp_3_cfg_x,
  output        io_requestor_1_pmp_3_cfg_w,
  output        io_requestor_1_pmp_3_cfg_r,
  output [29:0] io_requestor_1_pmp_3_addr,
  output [31:0] io_requestor_1_pmp_3_mask,
  output        io_requestor_1_pmp_4_cfg_l,
  output [1:0]  io_requestor_1_pmp_4_cfg_a,
  output        io_requestor_1_pmp_4_cfg_x,
  output        io_requestor_1_pmp_4_cfg_w,
  output        io_requestor_1_pmp_4_cfg_r,
  output [29:0] io_requestor_1_pmp_4_addr,
  output [31:0] io_requestor_1_pmp_4_mask,
  output        io_requestor_1_pmp_5_cfg_l,
  output [1:0]  io_requestor_1_pmp_5_cfg_a,
  output        io_requestor_1_pmp_5_cfg_x,
  output        io_requestor_1_pmp_5_cfg_w,
  output        io_requestor_1_pmp_5_cfg_r,
  output [29:0] io_requestor_1_pmp_5_addr,
  output [31:0] io_requestor_1_pmp_5_mask,
  output        io_requestor_1_pmp_6_cfg_l,
  output [1:0]  io_requestor_1_pmp_6_cfg_a,
  output        io_requestor_1_pmp_6_cfg_x,
  output        io_requestor_1_pmp_6_cfg_w,
  output        io_requestor_1_pmp_6_cfg_r,
  output [29:0] io_requestor_1_pmp_6_addr,
  output [31:0] io_requestor_1_pmp_6_mask,
  output        io_requestor_1_pmp_7_cfg_l,
  output [1:0]  io_requestor_1_pmp_7_cfg_a,
  output        io_requestor_1_pmp_7_cfg_x,
  output        io_requestor_1_pmp_7_cfg_w,
  output        io_requestor_1_pmp_7_cfg_r,
  output [29:0] io_requestor_1_pmp_7_addr,
  output [31:0] io_requestor_1_pmp_7_mask,
  output [31:0] io_requestor_1_customCSRs_csrs_0_value,
  input         io_mem_req_ready,
  output        io_mem_req_valid,
  output [31:0] io_mem_req_bits_addr,
  output        io_mem_s1_kill,
  input         io_mem_s2_nack,
  input         io_mem_resp_valid,
  input  [31:0] io_mem_resp_bits_data,
  input         io_mem_s2_xcpt_ae_ld,
  input         io_dpath_ptbr_mode,
  input  [21:0] io_dpath_ptbr_ppn,
  input         io_dpath_sfence_valid,
  input         io_dpath_sfence_bits_rs1,
  input         io_dpath_status_debug,
  input  [1:0]  io_dpath_status_prv,
  input         io_dpath_status_mxr,
  input         io_dpath_status_sum,
  input         io_dpath_pmp_0_cfg_l,
  input  [1:0]  io_dpath_pmp_0_cfg_a,
  input         io_dpath_pmp_0_cfg_x,
  input         io_dpath_pmp_0_cfg_w,
  input         io_dpath_pmp_0_cfg_r,
  input  [29:0] io_dpath_pmp_0_addr,
  input  [31:0] io_dpath_pmp_0_mask,
  input         io_dpath_pmp_1_cfg_l,
  input  [1:0]  io_dpath_pmp_1_cfg_a,
  input         io_dpath_pmp_1_cfg_x,
  input         io_dpath_pmp_1_cfg_w,
  input         io_dpath_pmp_1_cfg_r,
  input  [29:0] io_dpath_pmp_1_addr,
  input  [31:0] io_dpath_pmp_1_mask,
  input         io_dpath_pmp_2_cfg_l,
  input  [1:0]  io_dpath_pmp_2_cfg_a,
  input         io_dpath_pmp_2_cfg_x,
  input         io_dpath_pmp_2_cfg_w,
  input         io_dpath_pmp_2_cfg_r,
  input  [29:0] io_dpath_pmp_2_addr,
  input  [31:0] io_dpath_pmp_2_mask,
  input         io_dpath_pmp_3_cfg_l,
  input  [1:0]  io_dpath_pmp_3_cfg_a,
  input         io_dpath_pmp_3_cfg_x,
  input         io_dpath_pmp_3_cfg_w,
  input         io_dpath_pmp_3_cfg_r,
  input  [29:0] io_dpath_pmp_3_addr,
  input  [31:0] io_dpath_pmp_3_mask,
  input         io_dpath_pmp_4_cfg_l,
  input  [1:0]  io_dpath_pmp_4_cfg_a,
  input         io_dpath_pmp_4_cfg_x,
  input         io_dpath_pmp_4_cfg_w,
  input         io_dpath_pmp_4_cfg_r,
  input  [29:0] io_dpath_pmp_4_addr,
  input  [31:0] io_dpath_pmp_4_mask,
  input         io_dpath_pmp_5_cfg_l,
  input  [1:0]  io_dpath_pmp_5_cfg_a,
  input         io_dpath_pmp_5_cfg_x,
  input         io_dpath_pmp_5_cfg_w,
  input         io_dpath_pmp_5_cfg_r,
  input  [29:0] io_dpath_pmp_5_addr,
  input  [31:0] io_dpath_pmp_5_mask,
  input         io_dpath_pmp_6_cfg_l,
  input  [1:0]  io_dpath_pmp_6_cfg_a,
  input         io_dpath_pmp_6_cfg_x,
  input         io_dpath_pmp_6_cfg_w,
  input         io_dpath_pmp_6_cfg_r,
  input  [29:0] io_dpath_pmp_6_addr,
  input  [31:0] io_dpath_pmp_6_mask,
  input         io_dpath_pmp_7_cfg_l,
  input  [1:0]  io_dpath_pmp_7_cfg_a,
  input         io_dpath_pmp_7_cfg_x,
  input         io_dpath_pmp_7_cfg_w,
  input         io_dpath_pmp_7_cfg_r,
  input  [29:0] io_dpath_pmp_7_addr,
  input  [31:0] io_dpath_pmp_7_mask,
  output        io_dpath_perf_l2hit,
  output        io_dpath_perf_pte_miss,
  output        io_dpath_perf_pte_hit,
  input  [31:0] io_dpath_customCSRs_csrs_0_value
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
  reg [63:0] _RAND_12;
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
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
`endif // RANDOMIZE_REG_INIT
  wire  arb_io_in_0_ready;
  wire  arb_io_in_0_valid;
  wire [19:0] arb_io_in_0_bits_bits_addr;
  wire  arb_io_in_0_bits_bits_need_gpa;
  wire  arb_io_in_1_ready;
  wire  arb_io_in_1_valid;
  wire  arb_io_in_1_bits_valid;
  wire [19:0] arb_io_in_1_bits_bits_addr;
  wire  arb_io_in_1_bits_bits_need_gpa;
  wire  arb_io_out_ready;
  wire  arb_io_out_valid;
  wire  arb_io_out_bits_valid;
  wire [19:0] arb_io_out_bits_bits_addr;
  wire  arb_io_out_bits_bits_need_gpa;
  wire  arb_io_chosen;
  wire [2:0] state_barrier_io_x;
  wire [2:0] state_barrier_io_y;
  wire [43:0] r_pte_barrier_io_x_ppn;
  wire  r_pte_barrier_io_x_d;
  wire  r_pte_barrier_io_x_a;
  wire  r_pte_barrier_io_x_g;
  wire  r_pte_barrier_io_x_u;
  wire  r_pte_barrier_io_x_x;
  wire  r_pte_barrier_io_x_w;
  wire  r_pte_barrier_io_x_r;
  wire  r_pte_barrier_io_x_v;
  wire [43:0] r_pte_barrier_io_y_ppn;
  wire  r_pte_barrier_io_y_d;
  wire  r_pte_barrier_io_y_a;
  wire  r_pte_barrier_io_y_g;
  wire  r_pte_barrier_io_y_u;
  wire  r_pte_barrier_io_y_x;
  wire  r_pte_barrier_io_y_w;
  wire  r_pte_barrier_io_y_r;
  wire  r_pte_barrier_io_y_v;
  reg [2:0] state;
  reg  l2_refill;
  reg  resp_valid_0;
  reg  resp_valid_1;
  wire  _clock_en_T = state != 3'h0;
  reg  invalidated;
  reg  count;
  reg  resp_ae_ptw;
  reg  resp_ae_final;
  reg  resp_pf;
  reg [19:0] r_req_addr;
  reg  r_req_need_gpa;
  reg  r_req_dest;
  reg [43:0] r_pte_ppn;
  reg  r_pte_d;
  reg  r_pte_a;
  reg  r_pte_g;
  reg  r_pte_u;
  reg  r_pte_x;
  reg  r_pte_w;
  reg  r_pte_r;
  reg  r_pte_v;
  wire [43:0] vpn = {{24'd0}, r_req_addr};
  reg  mem_resp_valid;
  reg [31:0] mem_resp_data;
  wire [63:0] _WIRE = {{32'd0}, mem_resp_data};
  wire  tmp_v = _WIRE[0];
  wire  tmp_r = _WIRE[1];
  wire  tmp_w = _WIRE[2];
  wire  tmp_x = _WIRE[3];
  wire  tmp_u = _WIRE[4];
  wire  tmp_g = _WIRE[5];
  wire  tmp_a = _WIRE[6];
  wire  tmp_d = _WIRE[7];
  wire [43:0] tmp_ppn = _WIRE[53:10];
  wire [9:0] tmp_reserved_for_future = _WIRE[63:54];
  wire  _GEN_0 = count <= 1'h0 & tmp_ppn[9:0] != 10'h0 ? 1'h0 : tmp_v;
  wire  res_v = tmp_r | tmp_w | tmp_x ? _GEN_0 : tmp_v;
  wire  _T_25 = tmp_ppn[43:20] != 24'h0;
  wire  _traverse_T_13 = res_v & ~tmp_r & ~tmp_w & ~tmp_x & ~tmp_d & ~tmp_a & ~tmp_u & tmp_reserved_for_future == 10'h0;
  wire  _traverse_T_16 = count < 1'h1;
  wire  traverse = _traverse_T_13 & ~_T_25 & count < 1'h1;
  wire [9:0] vpn_idxs_0 = vpn[19:10];
  wire [9:0] vpn_idxs_1 = vpn[9:0];
  wire [9:0] vpn_idx = count ? vpn_idxs_1 : vpn_idxs_0;
  wire [53:0] _pte_addr_raw_pte_addr_T = {r_pte_ppn, 10'h0};
  wire [53:0] _GEN_250 = {{44'd0}, vpn_idx};
  wire [53:0] _pte_addr_raw_pte_addr_T_1 = _pte_addr_raw_pte_addr_T | _GEN_250;
  wire [55:0] raw_pte_addr = {_pte_addr_raw_pte_addr_T_1, 2'h0};
  wire [31:0] pte_addr = raw_pte_addr[31:0];
  reg [6:0] state_reg;
  reg [7:0] valid;
  reg [31:0] tags__0;
  reg [31:0] tags__1;
  reg [31:0] tags__2;
  reg [31:0] tags__3;
  reg [31:0] tags__4;
  reg [31:0] tags__5;
  reg [31:0] tags__6;
  reg [31:0] tags__7;
  reg [19:0] data__0;
  reg [19:0] data__1;
  reg [19:0] data__2;
  reg [19:0] data__3;
  reg [19:0] data__4;
  reg [19:0] data__5;
  reg [19:0] data__6;
  reg [19:0] data__7;
  wire [32:0] tag = {1'h0,pte_addr};
  wire [32:0] _GEN_251 = {{1'd0}, tags__0};
  wire  _hits_T = _GEN_251 == tag;
  wire [32:0] _GEN_252 = {{1'd0}, tags__1};
  wire  _hits_T_1 = _GEN_252 == tag;
  wire [32:0] _GEN_253 = {{1'd0}, tags__2};
  wire  _hits_T_2 = _GEN_253 == tag;
  wire [32:0] _GEN_254 = {{1'd0}, tags__3};
  wire  _hits_T_3 = _GEN_254 == tag;
  wire [32:0] _GEN_255 = {{1'd0}, tags__4};
  wire  _hits_T_4 = _GEN_255 == tag;
  wire [32:0] _GEN_256 = {{1'd0}, tags__5};
  wire  _hits_T_5 = _GEN_256 == tag;
  wire [32:0] _GEN_257 = {{1'd0}, tags__6};
  wire  _hits_T_6 = _GEN_257 == tag;
  wire [32:0] _GEN_258 = {{1'd0}, tags__7};
  wire  _hits_T_7 = _GEN_258 == tag;
  wire [7:0] _hits_T_8 = {_hits_T_7,_hits_T_6,_hits_T_5,_hits_T_4,_hits_T_3,_hits_T_2,_hits_T_1,_hits_T};
  wire [7:0] hits = _hits_T_8 & valid;
  wire  _hit_T = |hits;
  wire  pte_cache_hit = |hits & _traverse_T_16;
  wire  r_left_subtree_older = state_reg[6];
  wire [2:0] r_left_subtree_state = state_reg[5:3];
  wire [2:0] r_right_subtree_state = state_reg[2:0];
  wire  r_left_subtree_older_1 = r_left_subtree_state[2];
  wire  r_left_subtree_state_1 = r_left_subtree_state[1];
  wire  r_right_subtree_state_1 = r_left_subtree_state[0];
  wire  _r_T_3 = r_left_subtree_older_1 ? r_left_subtree_state_1 : r_right_subtree_state_1;
  wire [1:0] _r_T_4 = {r_left_subtree_older_1,_r_T_3};
  wire  r_left_subtree_older_2 = r_right_subtree_state[2];
  wire  r_left_subtree_state_2 = r_right_subtree_state[1];
  wire  r_right_subtree_state_2 = r_right_subtree_state[0];
  wire  _r_T_7 = r_left_subtree_older_2 ? r_left_subtree_state_2 : r_right_subtree_state_2;
  wire [1:0] _r_T_8 = {r_left_subtree_older_2,_r_T_7};
  wire [1:0] _r_T_9 = r_left_subtree_older ? _r_T_4 : _r_T_8;
  wire [2:0] _r_T_10 = {r_left_subtree_older,_r_T_9};
  wire [7:0] _r_T_11 = ~valid;
  wire [2:0] _r_T_20 = _r_T_11[6] ? 3'h6 : 3'h7;
  wire [2:0] _r_T_21 = _r_T_11[5] ? 3'h5 : _r_T_20;
  wire [2:0] _r_T_22 = _r_T_11[4] ? 3'h4 : _r_T_21;
  wire [2:0] _r_T_23 = _r_T_11[3] ? 3'h3 : _r_T_22;
  wire [2:0] _r_T_24 = _r_T_11[2] ? 3'h2 : _r_T_23;
  wire [2:0] _r_T_25 = _r_T_11[1] ? 3'h1 : _r_T_24;
  wire [2:0] _r_T_26 = _r_T_11[0] ? 3'h0 : _r_T_25;
  wire [2:0] r = &valid ? _r_T_10 : _r_T_26;
  wire [7:0] _valid_T = 8'h1 << r;
  wire [7:0] _valid_T_1 = valid | _valid_T;
  wire [43:0] res_ppn = {{24'd0}, tmp_ppn[19:0]};
  wire  state_reg_set_left_older = ~r[2];
  wire  state_reg_set_left_older_1 = ~r[1];
  wire  _state_reg_T_3 = ~r[0];
  wire  _state_reg_T_4 = state_reg_set_left_older_1 ? r_left_subtree_state_1 : _state_reg_T_3;
  wire  _state_reg_T_8 = state_reg_set_left_older_1 ? _state_reg_T_3 : r_right_subtree_state_1;
  wire [2:0] _state_reg_T_9 = {state_reg_set_left_older_1,_state_reg_T_4,_state_reg_T_8};
  wire [2:0] _state_reg_T_10 = state_reg_set_left_older ? r_left_subtree_state : _state_reg_T_9;
  wire  _state_reg_T_15 = state_reg_set_left_older_1 ? r_left_subtree_state_2 : _state_reg_T_3;
  wire  _state_reg_T_19 = state_reg_set_left_older_1 ? _state_reg_T_3 : r_right_subtree_state_2;
  wire [2:0] _state_reg_T_20 = {state_reg_set_left_older_1,_state_reg_T_15,_state_reg_T_19};
  wire [2:0] _state_reg_T_21 = state_reg_set_left_older ? _state_reg_T_20 : r_right_subtree_state;
  wire [6:0] _state_reg_T_22 = {state_reg_set_left_older,_state_reg_T_10,_state_reg_T_21};
  wire  _T_35 = state == 3'h1;
  wire [3:0] hi = hits[7:4];
  wire [3:0] lo = hits[3:0];
  wire  _T_37 = |hi;
  wire [3:0] _T_38 = hi | lo;
  wire [1:0] hi_1 = _T_38[3:2];
  wire [1:0] lo_1 = _T_38[1:0];
  wire  _T_39 = |hi_1;
  wire [1:0] _T_40 = hi_1 | lo_1;
  wire [2:0] state_reg_touch_way_sized_1 = {_T_37,_T_39,_T_40[1]};
  wire  state_reg_set_left_older_3 = ~state_reg_touch_way_sized_1[2];
  wire  state_reg_set_left_older_4 = ~state_reg_touch_way_sized_1[1];
  wire  _state_reg_T_26 = ~state_reg_touch_way_sized_1[0];
  wire  _state_reg_T_27 = state_reg_set_left_older_4 ? r_left_subtree_state_1 : _state_reg_T_26;
  wire  _state_reg_T_31 = state_reg_set_left_older_4 ? _state_reg_T_26 : r_right_subtree_state_1;
  wire [2:0] _state_reg_T_32 = {state_reg_set_left_older_4,_state_reg_T_27,_state_reg_T_31};
  wire [2:0] _state_reg_T_33 = state_reg_set_left_older_3 ? r_left_subtree_state : _state_reg_T_32;
  wire  _state_reg_T_38 = state_reg_set_left_older_4 ? r_left_subtree_state_2 : _state_reg_T_26;
  wire  _state_reg_T_42 = state_reg_set_left_older_4 ? _state_reg_T_26 : r_right_subtree_state_2;
  wire [2:0] _state_reg_T_43 = {state_reg_set_left_older_4,_state_reg_T_38,_state_reg_T_42};
  wire [2:0] _state_reg_T_44 = state_reg_set_left_older_3 ? _state_reg_T_43 : r_right_subtree_state;
  wire [6:0] _state_reg_T_45 = {state_reg_set_left_older_3,_state_reg_T_33,_state_reg_T_44};
  wire [19:0] _T_60 = hits[0] ? data__0 : 20'h0;
  wire [19:0] _T_61 = hits[1] ? data__1 : 20'h0;
  wire [19:0] _T_62 = hits[2] ? data__2 : 20'h0;
  wire [19:0] _T_63 = hits[3] ? data__3 : 20'h0;
  wire [19:0] _T_64 = hits[4] ? data__4 : 20'h0;
  wire [19:0] _T_65 = hits[5] ? data__5 : 20'h0;
  wire [19:0] _T_66 = hits[6] ? data__6 : 20'h0;
  wire [19:0] _T_67 = hits[7] ? data__7 : 20'h0;
  wire [19:0] _T_68 = _T_60 | _T_61;
  wire [19:0] _T_69 = _T_68 | _T_62;
  wire [19:0] _T_70 = _T_69 | _T_63;
  wire [19:0] _T_71 = _T_70 | _T_64;
  wire [19:0] _T_72 = _T_71 | _T_65;
  wire [19:0] _T_73 = _T_72 | _T_66;
  wire [19:0] pte_cache_data = _T_73 | _T_67;
  reg  pte_hit;
  wire  _T_126 = ~reset;
  wire [55:0] _pmaPgLevelHomogeneous_T = {r_pte_ppn, 12'h0};
  wire [55:0] _pmaPgLevelHomogeneous_T_1 = _pmaPgLevelHomogeneous_T ^ 56'hc000000;
  wire [56:0] _pmaPgLevelHomogeneous_T_2 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_1)};
  wire [56:0] _pmaPgLevelHomogeneous_T_4 = $signed(_pmaPgLevelHomogeneous_T_2) & -57'sh4000000;
  wire  _pmaPgLevelHomogeneous_T_5 = $signed(_pmaPgLevelHomogeneous_T_4) == 57'sh0;
  wire [55:0] _pmaPgLevelHomogeneous_T_6 = _pmaPgLevelHomogeneous_T ^ 56'h10000000;
  wire [56:0] _pmaPgLevelHomogeneous_T_7 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_6)};
  wire [56:0] _pmaPgLevelHomogeneous_T_9 = $signed(_pmaPgLevelHomogeneous_T_7) & -57'sh10000000;
  wire  _pmaPgLevelHomogeneous_T_10 = $signed(_pmaPgLevelHomogeneous_T_9) == 57'sh0;
  wire [55:0] _pmaPgLevelHomogeneous_T_11 = _pmaPgLevelHomogeneous_T ^ 56'h20000000;
  wire [56:0] _pmaPgLevelHomogeneous_T_12 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_11)};
  wire [56:0] _pmaPgLevelHomogeneous_T_14 = $signed(_pmaPgLevelHomogeneous_T_12) & -57'sh20000000;
  wire  _pmaPgLevelHomogeneous_T_15 = $signed(_pmaPgLevelHomogeneous_T_14) == 57'sh0;
  wire [55:0] _pmaPgLevelHomogeneous_T_16 = _pmaPgLevelHomogeneous_T ^ 56'h40000000;
  wire [56:0] _pmaPgLevelHomogeneous_T_17 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_16)};
  wire [56:0] _pmaPgLevelHomogeneous_T_19 = $signed(_pmaPgLevelHomogeneous_T_17) & -57'sh40000000;
  wire  _pmaPgLevelHomogeneous_T_20 = $signed(_pmaPgLevelHomogeneous_T_19) == 57'sh0;
  wire [55:0] _pmaPgLevelHomogeneous_T_21 = _pmaPgLevelHomogeneous_T ^ 56'h80000000;
  wire [56:0] _pmaPgLevelHomogeneous_T_22 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_21)};
  wire [56:0] _pmaPgLevelHomogeneous_T_24 = $signed(_pmaPgLevelHomogeneous_T_22) & -57'sh80000000;
  wire  _pmaPgLevelHomogeneous_T_25 = $signed(_pmaPgLevelHomogeneous_T_24) == 57'sh0;
  wire  pmaPgLevelHomogeneous_0 = _pmaPgLevelHomogeneous_T_5 | _pmaPgLevelHomogeneous_T_10 | _pmaPgLevelHomogeneous_T_15
     | _pmaPgLevelHomogeneous_T_20 | _pmaPgLevelHomogeneous_T_25;
  wire [56:0] _pmaPgLevelHomogeneous_T_33 = {1'b0,$signed(_pmaPgLevelHomogeneous_T)};
  wire [56:0] _pmaPgLevelHomogeneous_T_68 = $signed(_pmaPgLevelHomogeneous_T_33) & -57'sh1000;
  wire  _pmaPgLevelHomogeneous_T_69 = $signed(_pmaPgLevelHomogeneous_T_68) == 57'sh0;
  wire [55:0] _pmaPgLevelHomogeneous_T_70 = _pmaPgLevelHomogeneous_T ^ 56'h3000;
  wire [56:0] _pmaPgLevelHomogeneous_T_71 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_70)};
  wire [56:0] _pmaPgLevelHomogeneous_T_73 = $signed(_pmaPgLevelHomogeneous_T_71) & -57'sh1000;
  wire  _pmaPgLevelHomogeneous_T_74 = $signed(_pmaPgLevelHomogeneous_T_73) == 57'sh0;
  wire [55:0] _pmaPgLevelHomogeneous_T_75 = _pmaPgLevelHomogeneous_T ^ 56'h10000;
  wire [56:0] _pmaPgLevelHomogeneous_T_76 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_75)};
  wire [56:0] _pmaPgLevelHomogeneous_T_78 = $signed(_pmaPgLevelHomogeneous_T_76) & -57'sh10000;
  wire  _pmaPgLevelHomogeneous_T_79 = $signed(_pmaPgLevelHomogeneous_T_78) == 57'sh0;
  wire [55:0] _pmaPgLevelHomogeneous_T_80 = _pmaPgLevelHomogeneous_T ^ 56'h2000000;
  wire [56:0] _pmaPgLevelHomogeneous_T_81 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_80)};
  wire [56:0] _pmaPgLevelHomogeneous_T_83 = $signed(_pmaPgLevelHomogeneous_T_81) & -57'sh10000;
  wire  _pmaPgLevelHomogeneous_T_84 = $signed(_pmaPgLevelHomogeneous_T_83) == 57'sh0;
  wire  pmaPgLevelHomogeneous_1 = _pmaPgLevelHomogeneous_T_69 | _pmaPgLevelHomogeneous_T_74 |
    _pmaPgLevelHomogeneous_T_79 | _pmaPgLevelHomogeneous_T_84 | _pmaPgLevelHomogeneous_T_5 | _pmaPgLevelHomogeneous_T_10
     | _pmaPgLevelHomogeneous_T_15 | _pmaPgLevelHomogeneous_T_20 | _pmaPgLevelHomogeneous_T_25;
  wire  pmaHomogeneous = count ? pmaPgLevelHomogeneous_1 : pmaPgLevelHomogeneous_0;
  wire  pmpHomogeneous_maskHomogeneous = count ? io_dpath_pmp_0_mask[11] : io_dpath_pmp_0_mask[21];
  wire [31:0] _pmpHomogeneous_T_2 = {io_dpath_pmp_0_addr, 2'h0};
  wire [31:0] _pmpHomogeneous_T_3 = ~_pmpHomogeneous_T_2;
  wire [31:0] _pmpHomogeneous_T_4 = _pmpHomogeneous_T_3 | 32'h3;
  wire [31:0] _pmpHomogeneous_T_5 = ~_pmpHomogeneous_T_4;
  wire [55:0] _GEN_259 = {{24'd0}, _pmpHomogeneous_T_5};
  wire [55:0] _pmpHomogeneous_T_6 = _pmaPgLevelHomogeneous_T ^ _GEN_259;
  wire  _pmpHomogeneous_T_8 = _pmpHomogeneous_T_6[55:22] != 34'h0;
  wire  _pmpHomogeneous_T_15 = _pmpHomogeneous_T_6[55:12] != 44'h0;
  wire  _pmpHomogeneous_T_17 = count ? _pmpHomogeneous_T_15 : _pmpHomogeneous_T_8;
  wire  _pmpHomogeneous_T_18 = pmpHomogeneous_maskHomogeneous | _pmpHomogeneous_T_17;
  wire  pmpHomogeneous_beginsAfterUpper = ~(_pmaPgLevelHomogeneous_T < _GEN_259);
  wire [31:0] pmpHomogeneous_pgMask = count ? 32'hfffff000 : 32'hffc00000;
  wire [55:0] _GEN_262 = {{24'd0}, pmpHomogeneous_pgMask};
  wire [55:0] _pmpHomogeneous_endsBeforeLower_T = _pmaPgLevelHomogeneous_T & _GEN_262;
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_5 = _pmpHomogeneous_T_5 & pmpHomogeneous_pgMask;
  wire [55:0] _GEN_264 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_5};
  wire  pmpHomogeneous_endsBeforeUpper = _pmpHomogeneous_endsBeforeLower_T < _GEN_264;
  wire  _pmpHomogeneous_T_23 = pmpHomogeneous_beginsAfterUpper | pmpHomogeneous_endsBeforeUpper;
  wire  _pmpHomogeneous_T_25 = io_dpath_pmp_0_cfg_a[1] ? _pmpHomogeneous_T_18 : ~io_dpath_pmp_0_cfg_a[0] |
    _pmpHomogeneous_T_23;
  wire  pmpHomogeneous_maskHomogeneous_1 = count ? io_dpath_pmp_1_mask[11] : io_dpath_pmp_1_mask[21];
  wire [31:0] _pmpHomogeneous_T_28 = {io_dpath_pmp_1_addr, 2'h0};
  wire [31:0] _pmpHomogeneous_T_29 = ~_pmpHomogeneous_T_28;
  wire [31:0] _pmpHomogeneous_T_30 = _pmpHomogeneous_T_29 | 32'h3;
  wire [31:0] _pmpHomogeneous_T_31 = ~_pmpHomogeneous_T_30;
  wire [55:0] _GEN_265 = {{24'd0}, _pmpHomogeneous_T_31};
  wire [55:0] _pmpHomogeneous_T_32 = _pmaPgLevelHomogeneous_T ^ _GEN_265;
  wire  _pmpHomogeneous_T_34 = _pmpHomogeneous_T_32[55:22] != 34'h0;
  wire  _pmpHomogeneous_T_41 = _pmpHomogeneous_T_32[55:12] != 44'h0;
  wire  _pmpHomogeneous_T_43 = count ? _pmpHomogeneous_T_41 : _pmpHomogeneous_T_34;
  wire  _pmpHomogeneous_T_44 = pmpHomogeneous_maskHomogeneous_1 | _pmpHomogeneous_T_43;
  wire  pmpHomogeneous_beginsAfterUpper_1 = ~(_pmaPgLevelHomogeneous_T < _GEN_265);
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_11 = _pmpHomogeneous_T_31 & pmpHomogeneous_pgMask;
  wire [55:0] _GEN_272 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_11};
  wire  pmpHomogeneous_endsBeforeUpper_1 = _pmpHomogeneous_endsBeforeLower_T < _GEN_272;
  wire  _pmpHomogeneous_T_49 = pmpHomogeneous_endsBeforeUpper | pmpHomogeneous_beginsAfterUpper_1 |
    pmpHomogeneous_beginsAfterUpper & pmpHomogeneous_endsBeforeUpper_1;
  wire  _pmpHomogeneous_T_51 = io_dpath_pmp_1_cfg_a[1] ? _pmpHomogeneous_T_44 : ~io_dpath_pmp_1_cfg_a[0] |
    _pmpHomogeneous_T_49;
  wire  pmpHomogeneous_maskHomogeneous_2 = count ? io_dpath_pmp_2_mask[11] : io_dpath_pmp_2_mask[21];
  wire [31:0] _pmpHomogeneous_T_54 = {io_dpath_pmp_2_addr, 2'h0};
  wire [31:0] _pmpHomogeneous_T_55 = ~_pmpHomogeneous_T_54;
  wire [31:0] _pmpHomogeneous_T_56 = _pmpHomogeneous_T_55 | 32'h3;
  wire [31:0] _pmpHomogeneous_T_57 = ~_pmpHomogeneous_T_56;
  wire [55:0] _GEN_273 = {{24'd0}, _pmpHomogeneous_T_57};
  wire [55:0] _pmpHomogeneous_T_58 = _pmaPgLevelHomogeneous_T ^ _GEN_273;
  wire  _pmpHomogeneous_T_60 = _pmpHomogeneous_T_58[55:22] != 34'h0;
  wire  _pmpHomogeneous_T_67 = _pmpHomogeneous_T_58[55:12] != 44'h0;
  wire  _pmpHomogeneous_T_69 = count ? _pmpHomogeneous_T_67 : _pmpHomogeneous_T_60;
  wire  _pmpHomogeneous_T_70 = pmpHomogeneous_maskHomogeneous_2 | _pmpHomogeneous_T_69;
  wire  pmpHomogeneous_beginsAfterUpper_2 = ~(_pmaPgLevelHomogeneous_T < _GEN_273);
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_17 = _pmpHomogeneous_T_57 & pmpHomogeneous_pgMask;
  wire [55:0] _GEN_280 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_17};
  wire  pmpHomogeneous_endsBeforeUpper_2 = _pmpHomogeneous_endsBeforeLower_T < _GEN_280;
  wire  _pmpHomogeneous_T_75 = pmpHomogeneous_endsBeforeUpper_1 | pmpHomogeneous_beginsAfterUpper_2 |
    pmpHomogeneous_beginsAfterUpper_1 & pmpHomogeneous_endsBeforeUpper_2;
  wire  _pmpHomogeneous_T_77 = io_dpath_pmp_2_cfg_a[1] ? _pmpHomogeneous_T_70 : ~io_dpath_pmp_2_cfg_a[0] |
    _pmpHomogeneous_T_75;
  wire  pmpHomogeneous_maskHomogeneous_3 = count ? io_dpath_pmp_3_mask[11] : io_dpath_pmp_3_mask[21];
  wire [31:0] _pmpHomogeneous_T_80 = {io_dpath_pmp_3_addr, 2'h0};
  wire [31:0] _pmpHomogeneous_T_81 = ~_pmpHomogeneous_T_80;
  wire [31:0] _pmpHomogeneous_T_82 = _pmpHomogeneous_T_81 | 32'h3;
  wire [31:0] _pmpHomogeneous_T_83 = ~_pmpHomogeneous_T_82;
  wire [55:0] _GEN_281 = {{24'd0}, _pmpHomogeneous_T_83};
  wire [55:0] _pmpHomogeneous_T_84 = _pmaPgLevelHomogeneous_T ^ _GEN_281;
  wire  _pmpHomogeneous_T_86 = _pmpHomogeneous_T_84[55:22] != 34'h0;
  wire  _pmpHomogeneous_T_93 = _pmpHomogeneous_T_84[55:12] != 44'h0;
  wire  _pmpHomogeneous_T_95 = count ? _pmpHomogeneous_T_93 : _pmpHomogeneous_T_86;
  wire  _pmpHomogeneous_T_96 = pmpHomogeneous_maskHomogeneous_3 | _pmpHomogeneous_T_95;
  wire  pmpHomogeneous_beginsAfterUpper_3 = ~(_pmaPgLevelHomogeneous_T < _GEN_281);
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_23 = _pmpHomogeneous_T_83 & pmpHomogeneous_pgMask;
  wire [55:0] _GEN_288 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_23};
  wire  pmpHomogeneous_endsBeforeUpper_3 = _pmpHomogeneous_endsBeforeLower_T < _GEN_288;
  wire  _pmpHomogeneous_T_101 = pmpHomogeneous_endsBeforeUpper_2 | pmpHomogeneous_beginsAfterUpper_3 |
    pmpHomogeneous_beginsAfterUpper_2 & pmpHomogeneous_endsBeforeUpper_3;
  wire  _pmpHomogeneous_T_103 = io_dpath_pmp_3_cfg_a[1] ? _pmpHomogeneous_T_96 : ~io_dpath_pmp_3_cfg_a[0] |
    _pmpHomogeneous_T_101;
  wire  pmpHomogeneous_maskHomogeneous_4 = count ? io_dpath_pmp_4_mask[11] : io_dpath_pmp_4_mask[21];
  wire [31:0] _pmpHomogeneous_T_106 = {io_dpath_pmp_4_addr, 2'h0};
  wire [31:0] _pmpHomogeneous_T_107 = ~_pmpHomogeneous_T_106;
  wire [31:0] _pmpHomogeneous_T_108 = _pmpHomogeneous_T_107 | 32'h3;
  wire [31:0] _pmpHomogeneous_T_109 = ~_pmpHomogeneous_T_108;
  wire [55:0] _GEN_289 = {{24'd0}, _pmpHomogeneous_T_109};
  wire [55:0] _pmpHomogeneous_T_110 = _pmaPgLevelHomogeneous_T ^ _GEN_289;
  wire  _pmpHomogeneous_T_112 = _pmpHomogeneous_T_110[55:22] != 34'h0;
  wire  _pmpHomogeneous_T_119 = _pmpHomogeneous_T_110[55:12] != 44'h0;
  wire  _pmpHomogeneous_T_121 = count ? _pmpHomogeneous_T_119 : _pmpHomogeneous_T_112;
  wire  _pmpHomogeneous_T_122 = pmpHomogeneous_maskHomogeneous_4 | _pmpHomogeneous_T_121;
  wire  pmpHomogeneous_beginsAfterUpper_4 = ~(_pmaPgLevelHomogeneous_T < _GEN_289);
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_29 = _pmpHomogeneous_T_109 & pmpHomogeneous_pgMask;
  wire [55:0] _GEN_296 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_29};
  wire  pmpHomogeneous_endsBeforeUpper_4 = _pmpHomogeneous_endsBeforeLower_T < _GEN_296;
  wire  _pmpHomogeneous_T_127 = pmpHomogeneous_endsBeforeUpper_3 | pmpHomogeneous_beginsAfterUpper_4 |
    pmpHomogeneous_beginsAfterUpper_3 & pmpHomogeneous_endsBeforeUpper_4;
  wire  _pmpHomogeneous_T_129 = io_dpath_pmp_4_cfg_a[1] ? _pmpHomogeneous_T_122 : ~io_dpath_pmp_4_cfg_a[0] |
    _pmpHomogeneous_T_127;
  wire  pmpHomogeneous_maskHomogeneous_5 = count ? io_dpath_pmp_5_mask[11] : io_dpath_pmp_5_mask[21];
  wire [31:0] _pmpHomogeneous_T_132 = {io_dpath_pmp_5_addr, 2'h0};
  wire [31:0] _pmpHomogeneous_T_133 = ~_pmpHomogeneous_T_132;
  wire [31:0] _pmpHomogeneous_T_134 = _pmpHomogeneous_T_133 | 32'h3;
  wire [31:0] _pmpHomogeneous_T_135 = ~_pmpHomogeneous_T_134;
  wire [55:0] _GEN_297 = {{24'd0}, _pmpHomogeneous_T_135};
  wire [55:0] _pmpHomogeneous_T_136 = _pmaPgLevelHomogeneous_T ^ _GEN_297;
  wire  _pmpHomogeneous_T_138 = _pmpHomogeneous_T_136[55:22] != 34'h0;
  wire  _pmpHomogeneous_T_145 = _pmpHomogeneous_T_136[55:12] != 44'h0;
  wire  _pmpHomogeneous_T_147 = count ? _pmpHomogeneous_T_145 : _pmpHomogeneous_T_138;
  wire  _pmpHomogeneous_T_148 = pmpHomogeneous_maskHomogeneous_5 | _pmpHomogeneous_T_147;
  wire  pmpHomogeneous_beginsAfterUpper_5 = ~(_pmaPgLevelHomogeneous_T < _GEN_297);
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_35 = _pmpHomogeneous_T_135 & pmpHomogeneous_pgMask;
  wire [55:0] _GEN_304 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_35};
  wire  pmpHomogeneous_endsBeforeUpper_5 = _pmpHomogeneous_endsBeforeLower_T < _GEN_304;
  wire  _pmpHomogeneous_T_153 = pmpHomogeneous_endsBeforeUpper_4 | pmpHomogeneous_beginsAfterUpper_5 |
    pmpHomogeneous_beginsAfterUpper_4 & pmpHomogeneous_endsBeforeUpper_5;
  wire  _pmpHomogeneous_T_155 = io_dpath_pmp_5_cfg_a[1] ? _pmpHomogeneous_T_148 : ~io_dpath_pmp_5_cfg_a[0] |
    _pmpHomogeneous_T_153;
  wire  pmpHomogeneous_maskHomogeneous_6 = count ? io_dpath_pmp_6_mask[11] : io_dpath_pmp_6_mask[21];
  wire [31:0] _pmpHomogeneous_T_158 = {io_dpath_pmp_6_addr, 2'h0};
  wire [31:0] _pmpHomogeneous_T_159 = ~_pmpHomogeneous_T_158;
  wire [31:0] _pmpHomogeneous_T_160 = _pmpHomogeneous_T_159 | 32'h3;
  wire [31:0] _pmpHomogeneous_T_161 = ~_pmpHomogeneous_T_160;
  wire [55:0] _GEN_305 = {{24'd0}, _pmpHomogeneous_T_161};
  wire [55:0] _pmpHomogeneous_T_162 = _pmaPgLevelHomogeneous_T ^ _GEN_305;
  wire  _pmpHomogeneous_T_164 = _pmpHomogeneous_T_162[55:22] != 34'h0;
  wire  _pmpHomogeneous_T_171 = _pmpHomogeneous_T_162[55:12] != 44'h0;
  wire  _pmpHomogeneous_T_173 = count ? _pmpHomogeneous_T_171 : _pmpHomogeneous_T_164;
  wire  _pmpHomogeneous_T_174 = pmpHomogeneous_maskHomogeneous_6 | _pmpHomogeneous_T_173;
  wire  pmpHomogeneous_beginsAfterUpper_6 = ~(_pmaPgLevelHomogeneous_T < _GEN_305);
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_41 = _pmpHomogeneous_T_161 & pmpHomogeneous_pgMask;
  wire [55:0] _GEN_312 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_41};
  wire  pmpHomogeneous_endsBeforeUpper_6 = _pmpHomogeneous_endsBeforeLower_T < _GEN_312;
  wire  _pmpHomogeneous_T_179 = pmpHomogeneous_endsBeforeUpper_5 | pmpHomogeneous_beginsAfterUpper_6 |
    pmpHomogeneous_beginsAfterUpper_5 & pmpHomogeneous_endsBeforeUpper_6;
  wire  _pmpHomogeneous_T_181 = io_dpath_pmp_6_cfg_a[1] ? _pmpHomogeneous_T_174 : ~io_dpath_pmp_6_cfg_a[0] |
    _pmpHomogeneous_T_179;
  wire  pmpHomogeneous_maskHomogeneous_7 = count ? io_dpath_pmp_7_mask[11] : io_dpath_pmp_7_mask[21];
  wire [31:0] _pmpHomogeneous_T_184 = {io_dpath_pmp_7_addr, 2'h0};
  wire [31:0] _pmpHomogeneous_T_185 = ~_pmpHomogeneous_T_184;
  wire [31:0] _pmpHomogeneous_T_186 = _pmpHomogeneous_T_185 | 32'h3;
  wire [31:0] _pmpHomogeneous_T_187 = ~_pmpHomogeneous_T_186;
  wire [55:0] _GEN_313 = {{24'd0}, _pmpHomogeneous_T_187};
  wire [55:0] _pmpHomogeneous_T_188 = _pmaPgLevelHomogeneous_T ^ _GEN_313;
  wire  _pmpHomogeneous_T_190 = _pmpHomogeneous_T_188[55:22] != 34'h0;
  wire  _pmpHomogeneous_T_197 = _pmpHomogeneous_T_188[55:12] != 44'h0;
  wire  _pmpHomogeneous_T_199 = count ? _pmpHomogeneous_T_197 : _pmpHomogeneous_T_190;
  wire  _pmpHomogeneous_T_200 = pmpHomogeneous_maskHomogeneous_7 | _pmpHomogeneous_T_199;
  wire  pmpHomogeneous_beginsAfterUpper_7 = ~(_pmaPgLevelHomogeneous_T < _GEN_313);
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_47 = _pmpHomogeneous_T_187 & pmpHomogeneous_pgMask;
  wire [55:0] _GEN_320 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_47};
  wire  pmpHomogeneous_endsBeforeUpper_7 = _pmpHomogeneous_endsBeforeLower_T < _GEN_320;
  wire  _pmpHomogeneous_T_205 = pmpHomogeneous_endsBeforeUpper_6 | pmpHomogeneous_beginsAfterUpper_7 |
    pmpHomogeneous_beginsAfterUpper_6 & pmpHomogeneous_endsBeforeUpper_7;
  wire  _pmpHomogeneous_T_207 = io_dpath_pmp_7_cfg_a[1] ? _pmpHomogeneous_T_200 : ~io_dpath_pmp_7_cfg_a[0] |
    _pmpHomogeneous_T_205;
  wire  pmpHomogeneous = _pmpHomogeneous_T_25 & _pmpHomogeneous_T_51 & _pmpHomogeneous_T_77 & _pmpHomogeneous_T_103 &
    _pmpHomogeneous_T_129 & _pmpHomogeneous_T_155 & _pmpHomogeneous_T_181 & _pmpHomogeneous_T_207;
  wire  homogeneous = pmaHomogeneous & pmpHomogeneous;
  wire  _T_128 = 3'h0 == state;
  wire  _T_129 = arb_io_out_ready & arb_io_out_valid;
  wire [2:0] _next_state_T = arb_io_out_bits_valid ? 3'h1 : 3'h0;
  wire [2:0] _GEN_79 = _T_129 ? _next_state_T : state;
  wire  _GEN_87 = _T_129 ? 1'h0 : resp_ae_final;
  wire  _GEN_88 = _T_129 ? 1'h0 : resp_pf;
  wire  _count_T_2 = count + 1'h1;
  wire [2:0] _next_state_T_1 = io_mem_req_ready ? 3'h2 : 3'h1;
  wire [2:0] _GEN_100 = pte_cache_hit ? state : _next_state_T_1;
  wire  _GEN_107 = ~r_req_dest;
  wire  _GEN_109 = io_mem_s2_xcpt_ae_ld | resp_ae_ptw;
  wire [2:0] _GEN_110 = io_mem_s2_xcpt_ae_ld ? 3'h0 : 3'h5;
  wire  _GEN_111 = io_mem_s2_xcpt_ae_ld & _GEN_107;
  wire  _GEN_112 = io_mem_s2_xcpt_ae_ld & r_req_dest;
  wire  _T_145 = ~homogeneous;
  wire  _GEN_115 = ~homogeneous | count;
  wire [2:0] _GEN_118 = 3'h7 == state ? 3'h0 : state;
  wire  _GEN_119 = 3'h7 == state & _GEN_107;
  wire  _GEN_120 = 3'h7 == state & r_req_dest;
  wire  _GEN_121 = 3'h7 == state ? _GEN_115 : count;
  wire [2:0] _GEN_123 = 3'h4 == state ? _GEN_110 : _GEN_118;
  wire  _GEN_124 = 3'h4 == state & _traverse_T_16;
  wire  _GEN_126 = 3'h4 == state ? _GEN_111 : _GEN_119;
  wire  _GEN_127 = 3'h4 == state ? _GEN_112 : _GEN_120;
  wire  _GEN_128 = 3'h4 == state ? count : _GEN_121;
  wire [2:0] _GEN_130 = 3'h2 == state ? 3'h4 : _GEN_123;
  wire  _GEN_131 = 3'h2 == state ? 1'h0 : _GEN_124;
  wire  _GEN_133 = 3'h2 == state ? 1'h0 : _GEN_126;
  wire  _GEN_134 = 3'h2 == state ? 1'h0 : _GEN_127;
  wire [2:0] _GEN_143 = 3'h1 == state ? _GEN_100 : _GEN_130;
  wire  _GEN_144 = 3'h1 == state ? 1'h0 : _GEN_131;
  wire  _GEN_146 = 3'h1 == state ? 1'h0 : _GEN_133;
  wire  _GEN_147 = 3'h1 == state ? 1'h0 : _GEN_134;
  wire [2:0] _GEN_154 = 3'h0 == state ? _GEN_79 : _GEN_143;
  wire  _GEN_162 = 3'h0 == state ? _GEN_87 : resp_ae_final;
  wire  _GEN_163 = 3'h0 == state ? _GEN_88 : resp_pf;
  wire  _GEN_175 = 3'h0 == state ? 1'h0 : _GEN_146;
  wire  _GEN_176 = 3'h0 == state ? 1'h0 : _GEN_147;
  wire [43:0] pte_2_ppn = {r_pte_ppn[43:10],r_req_addr[9:0]};
  wire [43:0] pte_4_ppn = {{22'd0}, io_dpath_ptbr_ppn};
  wire [43:0] _r_pte_T_18_ppn = _T_129 ? pte_4_ppn : r_pte_ppn;
  wire [43:0] _r_pte_T_19_ppn = state == 3'h7 & _T_145 ? pte_2_ppn : _r_pte_T_18_ppn;
  wire [43:0] _r_pte_T_20_ppn = mem_resp_valid ? res_ppn : _r_pte_T_19_ppn;
  wire  _r_pte_T_20_d = mem_resp_valid ? tmp_d : r_pte_d;
  wire  _r_pte_T_20_a = mem_resp_valid ? tmp_a : r_pte_a;
  wire  _r_pte_T_20_g = mem_resp_valid ? tmp_g : r_pte_g;
  wire  _r_pte_T_20_u = mem_resp_valid ? tmp_u : r_pte_u;
  wire  _r_pte_T_20_x = mem_resp_valid ? tmp_x : r_pte_x;
  wire  _r_pte_T_20_w = mem_resp_valid ? tmp_w : r_pte_w;
  wire  _r_pte_T_20_r = mem_resp_valid ? tmp_r : r_pte_r;
  wire  _r_pte_T_20_v = mem_resp_valid ? res_v : r_pte_v;
  wire  ae = res_v & _T_25;
  wire  pf = res_v & tmp_reserved_for_future != 10'h0;
  wire  success = res_v & ~ae & ~pf;
  wire [43:0] pte_ppn = {{24'd0}, pte_cache_data};
  wire  _GEN_177 = _GEN_107 | _GEN_175;
  wire  _GEN_178 = r_req_dest | _GEN_176;
  wire  _l2_refill_T_3 = success & count & ~r_req_need_gpa;
  wire  _GEN_211 = traverse ? 1'h0 : _l2_refill_T_3;
  wire [2:0] _GEN_212 = traverse ? 3'h1 : 3'h0;
  wire [2:0] _GEN_221 = mem_resp_valid ? _GEN_212 : _GEN_154;
  Arbiter arb (
    .io_in_0_ready(arb_io_in_0_ready),
    .io_in_0_valid(arb_io_in_0_valid),
    .io_in_0_bits_bits_addr(arb_io_in_0_bits_bits_addr),
    .io_in_0_bits_bits_need_gpa(arb_io_in_0_bits_bits_need_gpa),
    .io_in_1_ready(arb_io_in_1_ready),
    .io_in_1_valid(arb_io_in_1_valid),
    .io_in_1_bits_valid(arb_io_in_1_bits_valid),
    .io_in_1_bits_bits_addr(arb_io_in_1_bits_bits_addr),
    .io_in_1_bits_bits_need_gpa(arb_io_in_1_bits_bits_need_gpa),
    .io_out_ready(arb_io_out_ready),
    .io_out_valid(arb_io_out_valid),
    .io_out_bits_valid(arb_io_out_bits_valid),
    .io_out_bits_bits_addr(arb_io_out_bits_bits_addr),
    .io_out_bits_bits_need_gpa(arb_io_out_bits_bits_need_gpa),
    .io_chosen(arb_io_chosen)
  );
  OptimizationBarrier_42 state_barrier (
    .io_x(state_barrier_io_x),
    .io_y(state_barrier_io_y)
  );
  OptimizationBarrier_43 r_pte_barrier (
    .io_x_ppn(r_pte_barrier_io_x_ppn),
    .io_x_d(r_pte_barrier_io_x_d),
    .io_x_a(r_pte_barrier_io_x_a),
    .io_x_g(r_pte_barrier_io_x_g),
    .io_x_u(r_pte_barrier_io_x_u),
    .io_x_x(r_pte_barrier_io_x_x),
    .io_x_w(r_pte_barrier_io_x_w),
    .io_x_r(r_pte_barrier_io_x_r),
    .io_x_v(r_pte_barrier_io_x_v),
    .io_y_ppn(r_pte_barrier_io_y_ppn),
    .io_y_d(r_pte_barrier_io_y_d),
    .io_y_a(r_pte_barrier_io_y_a),
    .io_y_g(r_pte_barrier_io_y_g),
    .io_y_u(r_pte_barrier_io_y_u),
    .io_y_x(r_pte_barrier_io_y_x),
    .io_y_w(r_pte_barrier_io_y_w),
    .io_y_r(r_pte_barrier_io_y_r),
    .io_y_v(r_pte_barrier_io_y_v)
  );
  assign io_requestor_0_req_ready = arb_io_in_0_ready;
  assign io_requestor_0_resp_valid = resp_valid_0;
  assign io_requestor_0_resp_bits_ae_ptw = resp_ae_ptw;
  assign io_requestor_0_resp_bits_ae_final = resp_ae_final;
  assign io_requestor_0_resp_bits_pf = resp_pf;
  assign io_requestor_0_resp_bits_pte_ppn = r_pte_ppn;
  assign io_requestor_0_resp_bits_pte_d = r_pte_d;
  assign io_requestor_0_resp_bits_pte_a = r_pte_a;
  assign io_requestor_0_resp_bits_pte_g = r_pte_g;
  assign io_requestor_0_resp_bits_pte_u = r_pte_u;
  assign io_requestor_0_resp_bits_pte_x = r_pte_x;
  assign io_requestor_0_resp_bits_pte_w = r_pte_w;
  assign io_requestor_0_resp_bits_pte_r = r_pte_r;
  assign io_requestor_0_resp_bits_pte_v = r_pte_v;
  assign io_requestor_0_resp_bits_level = count;
  assign io_requestor_0_resp_bits_homogeneous = pmaHomogeneous & pmpHomogeneous;
  assign io_requestor_0_ptbr_mode = io_dpath_ptbr_mode;
  assign io_requestor_0_status_debug = io_dpath_status_debug;
  assign io_requestor_0_status_mxr = io_dpath_status_mxr;
  assign io_requestor_0_status_sum = io_dpath_status_sum;
  assign io_requestor_0_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l;
  assign io_requestor_0_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a;
  assign io_requestor_0_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x;
  assign io_requestor_0_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w;
  assign io_requestor_0_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r;
  assign io_requestor_0_pmp_0_addr = io_dpath_pmp_0_addr;
  assign io_requestor_0_pmp_0_mask = io_dpath_pmp_0_mask;
  assign io_requestor_0_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l;
  assign io_requestor_0_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a;
  assign io_requestor_0_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x;
  assign io_requestor_0_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w;
  assign io_requestor_0_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r;
  assign io_requestor_0_pmp_1_addr = io_dpath_pmp_1_addr;
  assign io_requestor_0_pmp_1_mask = io_dpath_pmp_1_mask;
  assign io_requestor_0_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l;
  assign io_requestor_0_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a;
  assign io_requestor_0_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x;
  assign io_requestor_0_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w;
  assign io_requestor_0_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r;
  assign io_requestor_0_pmp_2_addr = io_dpath_pmp_2_addr;
  assign io_requestor_0_pmp_2_mask = io_dpath_pmp_2_mask;
  assign io_requestor_0_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l;
  assign io_requestor_0_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a;
  assign io_requestor_0_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x;
  assign io_requestor_0_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w;
  assign io_requestor_0_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r;
  assign io_requestor_0_pmp_3_addr = io_dpath_pmp_3_addr;
  assign io_requestor_0_pmp_3_mask = io_dpath_pmp_3_mask;
  assign io_requestor_0_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l;
  assign io_requestor_0_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a;
  assign io_requestor_0_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x;
  assign io_requestor_0_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w;
  assign io_requestor_0_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r;
  assign io_requestor_0_pmp_4_addr = io_dpath_pmp_4_addr;
  assign io_requestor_0_pmp_4_mask = io_dpath_pmp_4_mask;
  assign io_requestor_0_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l;
  assign io_requestor_0_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a;
  assign io_requestor_0_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x;
  assign io_requestor_0_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w;
  assign io_requestor_0_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r;
  assign io_requestor_0_pmp_5_addr = io_dpath_pmp_5_addr;
  assign io_requestor_0_pmp_5_mask = io_dpath_pmp_5_mask;
  assign io_requestor_0_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l;
  assign io_requestor_0_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a;
  assign io_requestor_0_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x;
  assign io_requestor_0_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w;
  assign io_requestor_0_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r;
  assign io_requestor_0_pmp_6_addr = io_dpath_pmp_6_addr;
  assign io_requestor_0_pmp_6_mask = io_dpath_pmp_6_mask;
  assign io_requestor_0_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l;
  assign io_requestor_0_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a;
  assign io_requestor_0_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x;
  assign io_requestor_0_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w;
  assign io_requestor_0_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r;
  assign io_requestor_0_pmp_7_addr = io_dpath_pmp_7_addr;
  assign io_requestor_0_pmp_7_mask = io_dpath_pmp_7_mask;
  assign io_requestor_1_req_ready = arb_io_in_1_ready;
  assign io_requestor_1_resp_valid = resp_valid_1;
  assign io_requestor_1_resp_bits_ae_ptw = resp_ae_ptw;
  assign io_requestor_1_resp_bits_ae_final = resp_ae_final;
  assign io_requestor_1_resp_bits_pf = resp_pf;
  assign io_requestor_1_resp_bits_pte_ppn = r_pte_ppn;
  assign io_requestor_1_resp_bits_pte_d = r_pte_d;
  assign io_requestor_1_resp_bits_pte_a = r_pte_a;
  assign io_requestor_1_resp_bits_pte_g = r_pte_g;
  assign io_requestor_1_resp_bits_pte_u = r_pte_u;
  assign io_requestor_1_resp_bits_pte_x = r_pte_x;
  assign io_requestor_1_resp_bits_pte_w = r_pte_w;
  assign io_requestor_1_resp_bits_pte_r = r_pte_r;
  assign io_requestor_1_resp_bits_pte_v = r_pte_v;
  assign io_requestor_1_resp_bits_level = count;
  assign io_requestor_1_resp_bits_homogeneous = pmaHomogeneous & pmpHomogeneous;
  assign io_requestor_1_ptbr_mode = io_dpath_ptbr_mode;
  assign io_requestor_1_status_debug = io_dpath_status_debug;
  assign io_requestor_1_status_prv = io_dpath_status_prv;
  assign io_requestor_1_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l;
  assign io_requestor_1_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a;
  assign io_requestor_1_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x;
  assign io_requestor_1_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w;
  assign io_requestor_1_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r;
  assign io_requestor_1_pmp_0_addr = io_dpath_pmp_0_addr;
  assign io_requestor_1_pmp_0_mask = io_dpath_pmp_0_mask;
  assign io_requestor_1_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l;
  assign io_requestor_1_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a;
  assign io_requestor_1_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x;
  assign io_requestor_1_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w;
  assign io_requestor_1_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r;
  assign io_requestor_1_pmp_1_addr = io_dpath_pmp_1_addr;
  assign io_requestor_1_pmp_1_mask = io_dpath_pmp_1_mask;
  assign io_requestor_1_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l;
  assign io_requestor_1_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a;
  assign io_requestor_1_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x;
  assign io_requestor_1_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w;
  assign io_requestor_1_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r;
  assign io_requestor_1_pmp_2_addr = io_dpath_pmp_2_addr;
  assign io_requestor_1_pmp_2_mask = io_dpath_pmp_2_mask;
  assign io_requestor_1_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l;
  assign io_requestor_1_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a;
  assign io_requestor_1_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x;
  assign io_requestor_1_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w;
  assign io_requestor_1_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r;
  assign io_requestor_1_pmp_3_addr = io_dpath_pmp_3_addr;
  assign io_requestor_1_pmp_3_mask = io_dpath_pmp_3_mask;
  assign io_requestor_1_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l;
  assign io_requestor_1_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a;
  assign io_requestor_1_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x;
  assign io_requestor_1_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w;
  assign io_requestor_1_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r;
  assign io_requestor_1_pmp_4_addr = io_dpath_pmp_4_addr;
  assign io_requestor_1_pmp_4_mask = io_dpath_pmp_4_mask;
  assign io_requestor_1_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l;
  assign io_requestor_1_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a;
  assign io_requestor_1_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x;
  assign io_requestor_1_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w;
  assign io_requestor_1_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r;
  assign io_requestor_1_pmp_5_addr = io_dpath_pmp_5_addr;
  assign io_requestor_1_pmp_5_mask = io_dpath_pmp_5_mask;
  assign io_requestor_1_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l;
  assign io_requestor_1_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a;
  assign io_requestor_1_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x;
  assign io_requestor_1_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w;
  assign io_requestor_1_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r;
  assign io_requestor_1_pmp_6_addr = io_dpath_pmp_6_addr;
  assign io_requestor_1_pmp_6_mask = io_dpath_pmp_6_mask;
  assign io_requestor_1_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l;
  assign io_requestor_1_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a;
  assign io_requestor_1_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x;
  assign io_requestor_1_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w;
  assign io_requestor_1_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r;
  assign io_requestor_1_pmp_7_addr = io_dpath_pmp_7_addr;
  assign io_requestor_1_pmp_7_mask = io_dpath_pmp_7_mask;
  assign io_requestor_1_customCSRs_csrs_0_value = io_dpath_customCSRs_csrs_0_value;
  assign io_mem_req_valid = _T_35 | state == 3'h3;
  assign io_mem_req_bits_addr = raw_pte_addr[31:0];
  assign io_mem_s1_kill = state != 3'h2;
  assign io_dpath_perf_l2hit = 1'h0;
  assign io_dpath_perf_pte_miss = 3'h0 == state ? 1'h0 : _GEN_144;
  assign io_dpath_perf_pte_hit = pte_hit & _T_35 & ~io_dpath_perf_l2hit;
  assign arb_io_in_0_valid = io_requestor_0_req_valid;
  assign arb_io_in_0_bits_bits_addr = io_requestor_0_req_bits_bits_addr;
  assign arb_io_in_0_bits_bits_need_gpa = io_requestor_0_req_bits_bits_need_gpa;
  assign arb_io_in_1_valid = io_requestor_1_req_valid;
  assign arb_io_in_1_bits_valid = io_requestor_1_req_bits_valid;
  assign arb_io_in_1_bits_bits_addr = io_requestor_1_req_bits_bits_addr;
  assign arb_io_in_1_bits_bits_need_gpa = io_requestor_1_req_bits_bits_need_gpa;
  assign arb_io_out_ready = state == 3'h0 & ~l2_refill;
  assign state_barrier_io_x = io_mem_s2_nack ? 3'h1 : _GEN_221;
  assign r_pte_barrier_io_x_ppn = _T_35 & pte_cache_hit ? pte_ppn : _r_pte_T_20_ppn;
  assign r_pte_barrier_io_x_d = _T_35 & pte_cache_hit ? 1'h0 : _r_pte_T_20_d;
  assign r_pte_barrier_io_x_a = _T_35 & pte_cache_hit ? 1'h0 : _r_pte_T_20_a;
  assign r_pte_barrier_io_x_g = _T_35 & pte_cache_hit ? 1'h0 : _r_pte_T_20_g;
  assign r_pte_barrier_io_x_u = _T_35 & pte_cache_hit ? 1'h0 : _r_pte_T_20_u;
  assign r_pte_barrier_io_x_x = _T_35 & pte_cache_hit ? 1'h0 : _r_pte_T_20_x;
  assign r_pte_barrier_io_x_w = _T_35 & pte_cache_hit ? 1'h0 : _r_pte_T_20_w;
  assign r_pte_barrier_io_x_r = _T_35 & pte_cache_hit ? 1'h0 : _r_pte_T_20_r;
  assign r_pte_barrier_io_x_v = _T_35 & pte_cache_hit ? 1'h0 : _r_pte_T_20_v;
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      state <= state_barrier_io_y;
    end
    l2_refill <= mem_resp_valid & _GEN_211;
    if (mem_resp_valid) begin
      if (traverse) begin
        resp_valid_0 <= _GEN_175;
      end else begin
        resp_valid_0 <= _GEN_177;
      end
    end else begin
      resp_valid_0 <= _GEN_175;
    end
    if (mem_resp_valid) begin
      if (traverse) begin
        resp_valid_1 <= _GEN_176;
      end else begin
        resp_valid_1 <= _GEN_178;
      end
    end else begin
      resp_valid_1 <= _GEN_176;
    end
    invalidated <= io_dpath_sfence_valid | invalidated & _clock_en_T;
    if (mem_resp_valid) begin
      if (traverse) begin
        count <= _count_T_2;
      end
    end else if (3'h0 == state) begin
      if (_T_129) begin
        count <= 1'h0;
      end
    end else if (3'h1 == state) begin
      if (pte_cache_hit) begin
        count <= count + 1'h1;
      end
    end else if (!(3'h2 == state)) begin
      count <= _GEN_128;
    end
    if (3'h0 == state) begin
      if (_T_129) begin
        resp_ae_ptw <= 1'h0;
      end
    end else if (!(3'h1 == state)) begin
      if (!(3'h2 == state)) begin
        if (3'h4 == state) begin
          resp_ae_ptw <= _GEN_109;
        end
      end
    end
    if (mem_resp_valid) begin
      if (traverse) begin
        resp_ae_final <= _GEN_162;
      end else begin
        resp_ae_final <= ae;
      end
    end else begin
      resp_ae_final <= _GEN_162;
    end
    if (mem_resp_valid) begin
      if (traverse) begin
        resp_pf <= _GEN_163;
      end else begin
        resp_pf <= pf;
      end
    end else begin
      resp_pf <= _GEN_163;
    end
    if (3'h0 == state) begin
      if (_T_129) begin
        r_req_addr <= arb_io_out_bits_bits_addr;
      end
    end
    if (3'h0 == state) begin
      if (_T_129) begin
        r_req_need_gpa <= arb_io_out_bits_bits_need_gpa;
      end
    end
    if (3'h0 == state) begin
      if (_T_129) begin
        r_req_dest <= arb_io_chosen;
      end
    end
    r_pte_ppn <= r_pte_barrier_io_y_ppn;
    r_pte_d <= r_pte_barrier_io_y_d;
    r_pte_a <= r_pte_barrier_io_y_a;
    r_pte_g <= r_pte_barrier_io_y_g;
    r_pte_u <= r_pte_barrier_io_y_u;
    r_pte_x <= r_pte_barrier_io_y_x;
    r_pte_w <= r_pte_barrier_io_y_w;
    r_pte_r <= r_pte_barrier_io_y_r;
    r_pte_v <= r_pte_barrier_io_y_v;
    mem_resp_valid <= io_mem_resp_valid;
    mem_resp_data <= io_mem_resp_bits_data;
    if (reset) begin
      state_reg <= 7'h0;
    end else if (pte_cache_hit & state == 3'h1) begin
      state_reg <= _state_reg_T_45;
    end else if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      state_reg <= _state_reg_T_22;
    end
    if (reset) begin
      valid <= 8'h0;
    end else if (io_dpath_sfence_valid & ~io_dpath_sfence_bits_rs1) begin
      valid <= 8'h0;
    end else if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      valid <= _valid_T_1;
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h0 == r) begin
        tags__0 <= tag[31:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h1 == r) begin
        tags__1 <= tag[31:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h2 == r) begin
        tags__2 <= tag[31:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h3 == r) begin
        tags__3 <= tag[31:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h4 == r) begin
        tags__4 <= tag[31:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h5 == r) begin
        tags__5 <= tag[31:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h6 == r) begin
        tags__6 <= tag[31:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h7 == r) begin
        tags__7 <= tag[31:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h0 == r) begin
        data__0 <= res_ppn[19:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h1 == r) begin
        data__1 <= res_ppn[19:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h2 == r) begin
        data__2 <= res_ppn[19:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h3 == r) begin
        data__3 <= res_ppn[19:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h4 == r) begin
        data__4 <= res_ppn[19:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h5 == r) begin
        data__5 <= res_ppn[19:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h6 == r) begin
        data__6 <= res_ppn[19:0];
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin
      if (3'h7 == r) begin
        data__7 <= res_ppn[19:0];
      end
    end
    if (3'h0 == state) begin
      pte_hit <= 1'h0;
    end else begin
      pte_hit <= 3'h1 == state & pte_cache_hit;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_dpath_perf_l2hit & (io_dpath_perf_pte_miss | io_dpath_perf_pte_hit))) & ~reset) begin
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
        if (~reset & ~(~(io_dpath_perf_l2hit & (io_dpath_perf_pte_miss | io_dpath_perf_pte_hit)))) begin
          $fwrite(32'h80000002,
            "Assertion failed: PTE Cache Hit/Miss Performance Monitor Events are lower priority than L2TLB Hit event\n    at PTW.scala:264 assert(!(io.dpath.perf.l2hit && (io.dpath.perf.pte_miss || io.dpath.perf.pte_hit)),\n"
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
        if (~(~arb_io_out_bits_bits_need_gpa) & (_T_128 & _T_129 & _T_126)) begin
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
        if (_T_128 & _T_129 & _T_126 & ~(~arb_io_out_bits_bits_need_gpa)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at PTW.scala:446 assert(!arb.io.out.bits.bits.need_gpa || arb.io.out.bits.bits.stage2)\n"
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
        if (~(state == 3'h5) & (mem_resp_valid & _T_126)) begin
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
        if (mem_resp_valid & _T_126 & ~(state == 3'h5)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PTW.scala:516 assert(state === s_wait3)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(state == 3'h4) & (io_mem_s2_nack & _T_126)) begin
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
        if (io_mem_s2_nack & _T_126 & ~(state == 3'h4)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PTW.scala:558 assert(state === s_wait2)\n");
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
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  l2_refill = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  resp_valid_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  resp_valid_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  invalidated = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  count = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  resp_ae_ptw = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  resp_ae_final = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  resp_pf = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  r_req_addr = _RAND_9[19:0];
  _RAND_10 = {1{`RANDOM}};
  r_req_need_gpa = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  r_req_dest = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  r_pte_ppn = _RAND_12[43:0];
  _RAND_13 = {1{`RANDOM}};
  r_pte_d = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  r_pte_a = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  r_pte_g = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  r_pte_u = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  r_pte_x = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  r_pte_w = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  r_pte_r = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  r_pte_v = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  mem_resp_valid = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  mem_resp_data = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  state_reg = _RAND_23[6:0];
  _RAND_24 = {1{`RANDOM}};
  valid = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  tags__0 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  tags__1 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  tags__2 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  tags__3 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  tags__4 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  tags__5 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  tags__6 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  tags__7 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  data__0 = _RAND_33[19:0];
  _RAND_34 = {1{`RANDOM}};
  data__1 = _RAND_34[19:0];
  _RAND_35 = {1{`RANDOM}};
  data__2 = _RAND_35[19:0];
  _RAND_36 = {1{`RANDOM}};
  data__3 = _RAND_36[19:0];
  _RAND_37 = {1{`RANDOM}};
  data__4 = _RAND_37[19:0];
  _RAND_38 = {1{`RANDOM}};
  data__5 = _RAND_38[19:0];
  _RAND_39 = {1{`RANDOM}};
  data__6 = _RAND_39[19:0];
  _RAND_40 = {1{`RANDOM}};
  data__7 = _RAND_40[19:0];
  _RAND_41 = {1{`RANDOM}};
  pte_hit = _RAND_41[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule