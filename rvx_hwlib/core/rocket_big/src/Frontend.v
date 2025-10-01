`default_nettype wire
`include "platform_info.vh"
module Frontend(
  input         clock,
  input         reset,
  input         auto_icache_master_out_a_ready,
  output        auto_icache_master_out_a_valid,
  output [31:0] auto_icache_master_out_a_bits_address,
  input         auto_icache_master_out_d_valid,
  input  [2:0]  auto_icache_master_out_d_bits_opcode,
  input  [3:0]  auto_icache_master_out_d_bits_size,
  input  [31:0] auto_icache_master_out_d_bits_data,
  input         auto_icache_master_out_d_bits_corrupt,
  input         io_cpu_might_request,
  input         io_cpu_req_valid,
  input  [31:0] io_cpu_req_bits_pc,
  input         io_cpu_req_bits_speculative,
  input         io_cpu_sfence_valid,
  input         io_cpu_sfence_bits_rs1,
  input         io_cpu_sfence_bits_rs2,
  input  [31:0] io_cpu_sfence_bits_addr,
  input         io_cpu_resp_ready,
  output        io_cpu_resp_valid,
  output        io_cpu_resp_bits_btb_taken,
  output        io_cpu_resp_bits_btb_bridx,
  output [4:0]  io_cpu_resp_bits_btb_entry,
  output [7:0]  io_cpu_resp_bits_btb_bht_history,
  output [31:0] io_cpu_resp_bits_pc,
  output [31:0] io_cpu_resp_bits_data,
  output        io_cpu_resp_bits_xcpt_pf_inst,
  output        io_cpu_resp_bits_xcpt_ae_inst,
  output        io_cpu_resp_bits_replay,
  input         io_cpu_btb_update_valid,
  input  [4:0]  io_cpu_btb_update_bits_prediction_entry,
  input  [31:0] io_cpu_btb_update_bits_pc,
  input         io_cpu_btb_update_bits_isValid,
  input  [31:0] io_cpu_btb_update_bits_br_pc,
  input  [1:0]  io_cpu_btb_update_bits_cfiType,
  input         io_cpu_bht_update_valid,
  input  [7:0]  io_cpu_bht_update_bits_prediction_history,
  input  [31:0] io_cpu_bht_update_bits_pc,
  input         io_cpu_bht_update_bits_branch,
  input         io_cpu_bht_update_bits_taken,
  input         io_cpu_bht_update_bits_mispredict,
  input         io_cpu_flush_icache,
  output [31:0] io_cpu_npc,
  input         io_cpu_progress,
  input         io_ptw_req_ready,
  output        io_ptw_req_valid,
  output        io_ptw_req_bits_valid,
  output [19:0] io_ptw_req_bits_bits_addr,
  output        io_ptw_req_bits_bits_need_gpa,
  input         io_ptw_resp_valid,
  input         io_ptw_resp_bits_ae_ptw,
  input         io_ptw_resp_bits_ae_final,
  input         io_ptw_resp_bits_pf,
  input  [43:0] io_ptw_resp_bits_pte_ppn,
  input         io_ptw_resp_bits_pte_d,
  input         io_ptw_resp_bits_pte_a,
  input         io_ptw_resp_bits_pte_g,
  input         io_ptw_resp_bits_pte_u,
  input         io_ptw_resp_bits_pte_x,
  input         io_ptw_resp_bits_pte_w,
  input         io_ptw_resp_bits_pte_r,
  input         io_ptw_resp_bits_pte_v,
  input         io_ptw_resp_bits_level,
  input         io_ptw_resp_bits_homogeneous,
  input         io_ptw_ptbr_mode,
  input         io_ptw_status_debug,
  input  [1:0]  io_ptw_status_prv,
  input         io_ptw_pmp_0_cfg_l,
  input  [1:0]  io_ptw_pmp_0_cfg_a,
  input         io_ptw_pmp_0_cfg_x,
  input         io_ptw_pmp_0_cfg_w,
  input         io_ptw_pmp_0_cfg_r,
  input  [29:0] io_ptw_pmp_0_addr,
  input  [31:0] io_ptw_pmp_0_mask,
  input         io_ptw_pmp_1_cfg_l,
  input  [1:0]  io_ptw_pmp_1_cfg_a,
  input         io_ptw_pmp_1_cfg_x,
  input         io_ptw_pmp_1_cfg_w,
  input         io_ptw_pmp_1_cfg_r,
  input  [29:0] io_ptw_pmp_1_addr,
  input  [31:0] io_ptw_pmp_1_mask,
  input         io_ptw_pmp_2_cfg_l,
  input  [1:0]  io_ptw_pmp_2_cfg_a,
  input         io_ptw_pmp_2_cfg_x,
  input         io_ptw_pmp_2_cfg_w,
  input         io_ptw_pmp_2_cfg_r,
  input  [29:0] io_ptw_pmp_2_addr,
  input  [31:0] io_ptw_pmp_2_mask,
  input         io_ptw_pmp_3_cfg_l,
  input  [1:0]  io_ptw_pmp_3_cfg_a,
  input         io_ptw_pmp_3_cfg_x,
  input         io_ptw_pmp_3_cfg_w,
  input         io_ptw_pmp_3_cfg_r,
  input  [29:0] io_ptw_pmp_3_addr,
  input  [31:0] io_ptw_pmp_3_mask,
  input         io_ptw_pmp_4_cfg_l,
  input  [1:0]  io_ptw_pmp_4_cfg_a,
  input         io_ptw_pmp_4_cfg_x,
  input         io_ptw_pmp_4_cfg_w,
  input         io_ptw_pmp_4_cfg_r,
  input  [29:0] io_ptw_pmp_4_addr,
  input  [31:0] io_ptw_pmp_4_mask,
  input         io_ptw_pmp_5_cfg_l,
  input  [1:0]  io_ptw_pmp_5_cfg_a,
  input         io_ptw_pmp_5_cfg_x,
  input         io_ptw_pmp_5_cfg_w,
  input         io_ptw_pmp_5_cfg_r,
  input  [29:0] io_ptw_pmp_5_addr,
  input  [31:0] io_ptw_pmp_5_mask,
  input         io_ptw_pmp_6_cfg_l,
  input  [1:0]  io_ptw_pmp_6_cfg_a,
  input         io_ptw_pmp_6_cfg_x,
  input         io_ptw_pmp_6_cfg_w,
  input         io_ptw_pmp_6_cfg_r,
  input  [29:0] io_ptw_pmp_6_addr,
  input  [31:0] io_ptw_pmp_6_mask,
  input         io_ptw_pmp_7_cfg_l,
  input  [1:0]  io_ptw_pmp_7_cfg_a,
  input         io_ptw_pmp_7_cfg_x,
  input         io_ptw_pmp_7_cfg_w,
  input         io_ptw_pmp_7_cfg_r,
  input  [29:0] io_ptw_pmp_7_addr,
  input  [31:0] io_ptw_pmp_7_mask,
  input  [31:0] io_ptw_customCSRs_csrs_0_value
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
  wire  icache_clock;
  wire  icache_reset;
  wire  icache_auto_master_out_a_ready;
  wire  icache_auto_master_out_a_valid;
  wire [31:0] icache_auto_master_out_a_bits_address;
  wire  icache_auto_master_out_d_valid;
  wire [2:0] icache_auto_master_out_d_bits_opcode;
  wire [3:0] icache_auto_master_out_d_bits_size;
  wire [31:0] icache_auto_master_out_d_bits_data;
  wire  icache_auto_master_out_d_bits_corrupt;
  wire  icache_io_req_ready;
  wire  icache_io_req_valid;
  wire [31:0] icache_io_req_bits_addr;
  wire [31:0] icache_io_s1_paddr;
  wire  icache_io_s1_kill;
  wire  icache_io_s2_kill;
  wire  icache_io_resp_valid;
  wire [31:0] icache_io_resp_bits_data;
  wire  icache_io_resp_bits_ae;
  wire  icache_io_invalidate;
  wire  fq_clock;
  wire  fq_reset;
  wire  fq_io_enq_ready;
  wire  fq_io_enq_valid;
  wire  fq_io_enq_bits_btb_taken;
  wire  fq_io_enq_bits_btb_bridx;
  wire [4:0] fq_io_enq_bits_btb_entry;
  wire [7:0] fq_io_enq_bits_btb_bht_history;
  wire [31:0] fq_io_enq_bits_pc;
  wire [31:0] fq_io_enq_bits_data;
  wire [1:0] fq_io_enq_bits_mask;
  wire  fq_io_enq_bits_xcpt_pf_inst;
  wire  fq_io_enq_bits_xcpt_ae_inst;
  wire  fq_io_enq_bits_replay;
  wire  fq_io_deq_ready;
  wire  fq_io_deq_valid;
  wire  fq_io_deq_bits_btb_taken;
  wire  fq_io_deq_bits_btb_bridx;
  wire [4:0] fq_io_deq_bits_btb_entry;
  wire [7:0] fq_io_deq_bits_btb_bht_history;
  wire [31:0] fq_io_deq_bits_pc;
  wire [31:0] fq_io_deq_bits_data;
  wire  fq_io_deq_bits_xcpt_pf_inst;
  wire  fq_io_deq_bits_xcpt_ae_inst;
  wire  fq_io_deq_bits_replay;
  wire [4:0] fq_io_mask;
  wire  tlb_clock;
  wire  tlb_reset;
  wire  tlb_io_req_ready;
  wire  tlb_io_req_valid;
  wire [31:0] tlb_io_req_bits_vaddr;
  wire [1:0] tlb_io_req_bits_prv;
  wire  tlb_io_resp_miss;
  wire [31:0] tlb_io_resp_paddr;
  wire  tlb_io_resp_pf_inst;
  wire  tlb_io_resp_ae_inst;
  wire  tlb_io_resp_cacheable;
  wire  tlb_io_sfence_valid;
  wire  tlb_io_sfence_bits_rs1;
  wire  tlb_io_sfence_bits_rs2;
  wire [31:0] tlb_io_sfence_bits_addr;
  wire  tlb_io_ptw_req_ready;
  wire  tlb_io_ptw_req_valid;
  wire  tlb_io_ptw_req_bits_valid;
  wire [19:0] tlb_io_ptw_req_bits_bits_addr;
  wire  tlb_io_ptw_req_bits_bits_need_gpa;
  wire  tlb_io_ptw_resp_valid;
  wire  tlb_io_ptw_resp_bits_ae_ptw;
  wire  tlb_io_ptw_resp_bits_ae_final;
  wire  tlb_io_ptw_resp_bits_pf;
  wire [43:0] tlb_io_ptw_resp_bits_pte_ppn;
  wire  tlb_io_ptw_resp_bits_pte_d;
  wire  tlb_io_ptw_resp_bits_pte_a;
  wire  tlb_io_ptw_resp_bits_pte_g;
  wire  tlb_io_ptw_resp_bits_pte_u;
  wire  tlb_io_ptw_resp_bits_pte_x;
  wire  tlb_io_ptw_resp_bits_pte_w;
  wire  tlb_io_ptw_resp_bits_pte_r;
  wire  tlb_io_ptw_resp_bits_pte_v;
  wire  tlb_io_ptw_resp_bits_level;
  wire  tlb_io_ptw_resp_bits_homogeneous;
  wire  tlb_io_ptw_ptbr_mode;
  wire  tlb_io_ptw_status_debug;
  wire  tlb_io_ptw_pmp_0_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_0_cfg_a;
  wire  tlb_io_ptw_pmp_0_cfg_x;
  wire  tlb_io_ptw_pmp_0_cfg_w;
  wire  tlb_io_ptw_pmp_0_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_0_addr;
  wire [31:0] tlb_io_ptw_pmp_0_mask;
  wire  tlb_io_ptw_pmp_1_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_1_cfg_a;
  wire  tlb_io_ptw_pmp_1_cfg_x;
  wire  tlb_io_ptw_pmp_1_cfg_w;
  wire  tlb_io_ptw_pmp_1_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_1_addr;
  wire [31:0] tlb_io_ptw_pmp_1_mask;
  wire  tlb_io_ptw_pmp_2_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_2_cfg_a;
  wire  tlb_io_ptw_pmp_2_cfg_x;
  wire  tlb_io_ptw_pmp_2_cfg_w;
  wire  tlb_io_ptw_pmp_2_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_2_addr;
  wire [31:0] tlb_io_ptw_pmp_2_mask;
  wire  tlb_io_ptw_pmp_3_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_3_cfg_a;
  wire  tlb_io_ptw_pmp_3_cfg_x;
  wire  tlb_io_ptw_pmp_3_cfg_w;
  wire  tlb_io_ptw_pmp_3_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_3_addr;
  wire [31:0] tlb_io_ptw_pmp_3_mask;
  wire  tlb_io_ptw_pmp_4_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_4_cfg_a;
  wire  tlb_io_ptw_pmp_4_cfg_x;
  wire  tlb_io_ptw_pmp_4_cfg_w;
  wire  tlb_io_ptw_pmp_4_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_4_addr;
  wire [31:0] tlb_io_ptw_pmp_4_mask;
  wire  tlb_io_ptw_pmp_5_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_5_cfg_a;
  wire  tlb_io_ptw_pmp_5_cfg_x;
  wire  tlb_io_ptw_pmp_5_cfg_w;
  wire  tlb_io_ptw_pmp_5_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_5_addr;
  wire [31:0] tlb_io_ptw_pmp_5_mask;
  wire  tlb_io_ptw_pmp_6_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_6_cfg_a;
  wire  tlb_io_ptw_pmp_6_cfg_x;
  wire  tlb_io_ptw_pmp_6_cfg_w;
  wire  tlb_io_ptw_pmp_6_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_6_addr;
  wire [31:0] tlb_io_ptw_pmp_6_mask;
  wire  tlb_io_ptw_pmp_7_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_7_cfg_a;
  wire  tlb_io_ptw_pmp_7_cfg_x;
  wire  tlb_io_ptw_pmp_7_cfg_w;
  wire  tlb_io_ptw_pmp_7_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_7_addr;
  wire [31:0] tlb_io_ptw_pmp_7_mask;
  wire  tlb_io_kill;
  wire  btb_clock;
  wire  btb_reset;
  wire [31:0] btb_io_req_bits_addr;
  wire  btb_io_resp_valid;
  wire  btb_io_resp_bits_taken;
  wire  btb_io_resp_bits_bridx;
  wire [31:0] btb_io_resp_bits_target;
  wire [4:0] btb_io_resp_bits_entry;
  wire [7:0] btb_io_resp_bits_bht_history;
  wire  btb_io_resp_bits_bht_value;
  wire  btb_io_btb_update_valid;
  wire [4:0] btb_io_btb_update_bits_prediction_entry;
  wire [31:0] btb_io_btb_update_bits_pc;
  wire  btb_io_btb_update_bits_isValid;
  wire [31:0] btb_io_btb_update_bits_br_pc;
  wire [1:0] btb_io_btb_update_bits_cfiType;
  wire  btb_io_bht_update_valid;
  wire [7:0] btb_io_bht_update_bits_prediction_history;
  wire [31:0] btb_io_bht_update_bits_pc;
  wire  btb_io_bht_update_bits_branch;
  wire  btb_io_bht_update_bits_taken;
  wire  btb_io_bht_update_bits_mispredict;
  wire  btb_io_bht_advance_valid;
  wire  btb_io_bht_advance_bits_bht_value;
  wire  btb_io_ras_update_valid;
  wire [1:0] btb_io_ras_update_bits_cfiType;
  wire [31:0] btb_io_ras_update_bits_returnAddr;
  wire  btb_io_ras_head_valid;
  wire [31:0] btb_io_ras_head_bits;
  wire  btb_io_flush;
  wire  _T_9 = ~reset;
  reg  s1_valid;
  reg  s2_valid;
  wire  _s0_fq_has_space_T_4 = ~s1_valid;
  wire  _s0_fq_has_space_T_5 = ~s2_valid;
  wire  _s0_fq_has_space_T_7 = ~fq_io_mask[3] & (~s1_valid | ~s2_valid);
  wire  _s0_fq_has_space_T_8 = ~fq_io_mask[2] | _s0_fq_has_space_T_7;
  wire  _s0_fq_has_space_T_14 = ~fq_io_mask[4] & (_s0_fq_has_space_T_4 & _s0_fq_has_space_T_5);
  wire  s0_fq_has_space = _s0_fq_has_space_T_8 | _s0_fq_has_space_T_14;
  wire  s0_valid = io_cpu_req_valid | s0_fq_has_space;
  reg [31:0] s1_pc;
  reg  s1_speculative;
  reg [31:0] s2_pc;
  reg  s2_btb_resp_valid;
  reg  s2_btb_resp_bits_taken;
  reg  s2_btb_resp_bits_bridx;
  reg [4:0] s2_btb_resp_bits_entry;
  reg [7:0] s2_btb_resp_bits_bht_history;
  reg  s2_btb_resp_bits_bht_value;
  wire  s2_btb_taken = s2_btb_resp_valid & s2_btb_resp_bits_taken;
  reg  s2_tlb_resp_miss;
  reg  s2_tlb_resp_pf_inst;
  reg  s2_tlb_resp_ae_inst;
  reg  s2_tlb_resp_cacheable;
  wire  s2_xcpt = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst;
  reg  s2_speculative;
  reg  s2_partial_insn_valid;
  reg [15:0] s2_partial_insn;
  reg  wrong_path;
  wire [31:0] _s1_base_pc_T = ~s1_pc;
  wire [31:0] _s1_base_pc_T_1 = _s1_base_pc_T | 32'h3;
  wire [31:0] s1_base_pc = ~_s1_base_pc_T_1;
  wire [31:0] ntpc = s1_base_pc + 32'h4;
  wire  _s2_replay_T = fq_io_enq_ready & fq_io_enq_valid;
  reg  s2_replay_REG;
  wire  s2_replay = s2_valid & ~_s2_replay_T | s2_replay_REG;
  wire  _taken_prevRVI_T_1 = s2_partial_insn[1:0] != 2'h3;
  wire  taken_prevRVI = s2_partial_insn_valid & ~_taken_prevRVI_T_1;
  wire [15:0] taken_bits = fq_io_enq_bits_data[15:0];
  wire [31:0] taken_rviBits = {taken_bits,s2_partial_insn};
  wire  taken_rviJump = taken_rviBits[6:0] == 7'h6f;
  wire  taken_rviJALR = taken_rviBits[6:0] == 7'h67;
  wire  taken_rviBranch = taken_rviBits[6:0] == 7'h63;
  wire  taken_valid = fq_io_enq_bits_mask[0] & ~taken_prevRVI;
  wire [15:0] _taken_rvcJump_T = taken_bits & 16'he003;
  wire  taken_rvcJAL = 16'h2001 == _taken_rvcJump_T;
  wire  taken_rvcJump = 16'ha001 == _taken_rvcJump_T | taken_rvcJAL;
  wire [15:0] _taken_rvcJALR_T = taken_bits & 16'hf003;
  wire  _taken_rvcJALR_T_3 = taken_bits[6:2] == 5'h0;
  wire  taken_rvcJALR = 16'h9002 == _taken_rvcJALR_T & taken_bits[6:2] == 5'h0;
  wire  taken_rvcJR = 16'h8002 == _taken_rvcJALR_T & _taken_rvcJALR_T_3;
  wire  taken_rvcBranch = 16'hc001 == _taken_rvcJump_T | 16'he001 == _taken_rvcJump_T;
  wire  _taken_taken_T_8 = taken_valid & (taken_rvcJump | taken_rvcJALR | taken_rvcJR | taken_rvcBranch &
    s2_btb_resp_bits_bht_value);
  wire  taken_taken = taken_prevRVI & (taken_rviJump | taken_rviJALR | taken_rviBranch & s2_btb_resp_bits_bht_value) |
    _taken_taken_T_8;
  wire  taken_idx = ~taken_taken;
  wire  _taken_T_36 = ~s2_btb_taken;
  wire  _taken_prevRVI_T_4 = taken_bits[1:0] != 2'h3;
  wire  _taken_prevRVI_T_5 = ~_taken_prevRVI_T_4;
  wire  taken_prevRVI_1 = taken_valid & ~_taken_prevRVI_T_4;
  wire [15:0] taken_bits_1 = fq_io_enq_bits_data[31:16];
  wire [31:0] taken_rviBits_1 = {taken_bits_1,taken_bits};
  wire  taken_rviJALR_1 = taken_rviBits_1[6:0] == 7'h67;
  wire [4:0] _taken_rviReturn_T_10 = taken_rviBits_1[19:15] & 5'h1b;
  wire  taken_rviReturn_1 = taken_rviJALR_1 & ~taken_rviBits_1[7] & 5'h1 == _taken_rviReturn_T_10;
  wire  taken_valid_1 = fq_io_enq_bits_mask[1] & ~taken_prevRVI_1;
  wire [15:0] _taken_rvcJR_T_4 = taken_bits_1 & 16'hf003;
  wire  _taken_rvcJR_T_7 = taken_bits_1[6:2] == 5'h0;
  wire  taken_rvcJR_1 = 16'h8002 == _taken_rvcJR_T_4 & taken_bits_1[6:2] == 5'h0;
  wire [4:0] _taken_rvcReturn_T_4 = taken_bits_1[11:7] & 5'h1b;
  wire  taken_rvcReturn_1 = taken_rvcJR_1 & 5'h1 == _taken_rvcReturn_T_4;
  wire  taken_predictReturn_1 = btb_io_ras_head_valid & (taken_prevRVI_1 & taken_rviReturn_1 | taken_valid_1 &
    taken_rvcReturn_1);
  wire [4:0] _taken_rviReturn_T_4 = taken_rviBits[19:15] & 5'h1b;
  wire  taken_rviReturn = taken_rviJALR & ~taken_rviBits[7] & 5'h1 == _taken_rviReturn_T_4;
  wire [4:0] _taken_rvcReturn_T_1 = taken_bits[11:7] & 5'h1b;
  wire  taken_rvcReturn = taken_rvcJR & 5'h1 == _taken_rvcReturn_T_1;
  wire  taken_predictReturn = btb_io_ras_head_valid & (taken_prevRVI & taken_rviReturn | taken_valid & taken_rvcReturn);
  wire  _taken_T_16 = s2_valid & taken_predictReturn;
  wire  _GEN_56 = ~s2_btb_taken & _taken_T_16;
  wire  _GEN_89 = s2_valid & taken_predictReturn_1 | _GEN_56;
  wire  _GEN_92 = ~s2_btb_taken ? _GEN_89 : ~s2_btb_taken & _taken_T_16;
  wire  useRAS = taken_idx ? _GEN_92 : _GEN_56;
  wire  taken_rviBranch_1 = taken_rviBits_1[6:0] == 7'h63;
  wire [15:0] _taken_rvcBranch_T_4 = taken_bits_1 & 16'he003;
  wire  taken_rvcBranch_1 = 16'hc001 == _taken_rvcBranch_T_4 | 16'he001 == _taken_rvcBranch_T_4;
  wire  _taken_predictBranch_T_5 = taken_prevRVI_1 & taken_rviBranch_1 | taken_valid_1 & taken_rvcBranch_1;
  wire  taken_predictBranch_1 = s2_btb_resp_bits_bht_value & (taken_prevRVI_1 & taken_rviBranch_1 | taken_valid_1 &
    taken_rvcBranch_1);
  wire  taken_rviJump_1 = taken_rviBits_1[6:0] == 7'h6f;
  wire  taken_rvcJAL_1 = 16'h2001 == _taken_rvcBranch_T_4;
  wire  taken_rvcJump_1 = 16'ha001 == _taken_rvcBranch_T_4 | taken_rvcJAL_1;
  wire  taken_predictJump_1 = taken_prevRVI_1 & taken_rviJump_1 | taken_valid_1 & taken_rvcJump_1;
  wire [31:0] _s2_base_pc_T = ~s2_pc;
  wire [31:0] _s2_base_pc_T_1 = _s2_base_pc_T | 32'h3;
  wire [31:0] s2_base_pc = ~_s2_base_pc_T_1;
  wire [31:0] taken_pc_1 = s2_base_pc | 32'h2;
  wire [31:0] _taken_npc_T_6 = taken_pc_1 - 32'h2;
  wire [31:0] _taken_npc_T_8 = taken_prevRVI_1 ? _taken_npc_T_6 : taken_pc_1;
  wire  taken_rviImm_sign_2 = taken_rviBits_1[31];
  wire  taken_rviImm_hi_hi_hi_2 = taken_rviBits_1[31];
  wire [10:0] taken_rviImm_hi_hi_lo_2 = {11{taken_rviImm_sign_2}};
  wire [7:0] taken_rviImm_hi_lo_hi_2 = taken_rviBits_1[19:12];
  wire  taken_rviImm_hi_lo_lo_2 = taken_rviBits_1[20];
  wire [5:0] taken_rviImm_b10_5_2 = taken_rviBits_1[30:25];
  wire [3:0] taken_rviImm_b4_1_2 = taken_rviBits_1[24:21];
  wire [31:0] _taken_rviImm_T_7 = {taken_rviImm_hi_hi_hi_2,taken_rviImm_hi_hi_lo_2,taken_rviImm_hi_lo_hi_2,
    taken_rviImm_hi_lo_lo_2,taken_rviImm_b10_5_2,taken_rviImm_b4_1_2,1'h0};
  wire [7:0] taken_rviImm_hi_lo_hi_3 = {8{taken_rviImm_sign_2}};
  wire  taken_rviImm_hi_lo_lo_3 = taken_rviBits_1[7];
  wire [31:0] _taken_rviImm_T_9 = {taken_rviImm_hi_hi_hi_2,taken_rviImm_hi_hi_lo_2,taken_rviImm_hi_lo_hi_3,
    taken_rviImm_hi_lo_lo_3,taken_rviImm_b10_5_2,taken_rviBits_1[11:8],1'h0};
  wire [31:0] taken_rviImm_1 = taken_rviBits_1[3] ? $signed(_taken_rviImm_T_7) : $signed(_taken_rviImm_T_9);
  wire [4:0] _taken_rvcImm_T_25 = taken_bits_1[12] ? 5'h1f : 5'h0;
  wire [12:0] _taken_rvcImm_T_31 = {_taken_rvcImm_T_25,taken_bits_1[6:5],taken_bits_1[2],taken_bits_1[11:10],
    taken_bits_1[4:3],1'h0};
  wire [9:0] _taken_rvcImm_T_34 = taken_bits_1[12] ? 10'h3ff : 10'h0;
  wire [20:0] _taken_rvcImm_T_43 = {_taken_rvcImm_T_34,taken_bits_1[8],taken_bits_1[10:9],taken_bits_1[6],taken_bits_1[7
    ],taken_bits_1[2],taken_bits_1[11],taken_bits_1[5:3],1'h0};
  wire [20:0] taken_rvcImm_1 = taken_bits_1[14] ? $signed({{8{_taken_rvcImm_T_31[12]}},_taken_rvcImm_T_31}) : $signed(
    _taken_rvcImm_T_43);
  wire [31:0] _taken_npc_T_9 = taken_prevRVI_1 ? $signed(taken_rviImm_1) : $signed({{11{taken_rvcImm_1[20]}},
    taken_rvcImm_1});
  wire [31:0] _taken_predicted_npc_T_1 = $signed(_taken_npc_T_8) + $signed(_taken_npc_T_9);
  wire  _taken_predictBranch_T_2 = taken_prevRVI & taken_rviBranch | taken_valid & taken_rvcBranch;
  wire  taken_predictBranch = s2_btb_resp_bits_bht_value & (taken_prevRVI & taken_rviBranch | taken_valid &
    taken_rvcBranch);
  wire  taken_predictJump = taken_prevRVI & taken_rviJump | taken_valid & taken_rvcJump;
  wire [31:0] _taken_npc_T = ~_s2_base_pc_T_1;
  wire  taken_rviImm_sign = taken_rviBits[31];
  wire  taken_rviImm_hi_hi_hi = taken_rviBits[31];
  wire [10:0] taken_rviImm_hi_hi_lo = {11{taken_rviImm_sign}};
  wire [7:0] taken_rviImm_hi_lo_hi = taken_rviBits[19:12];
  wire  taken_rviImm_hi_lo_lo = taken_rviBits[20];
  wire [5:0] taken_rviImm_b10_5 = taken_rviBits[30:25];
  wire [3:0] taken_rviImm_b4_1 = taken_rviBits[24:21];
  wire [31:0] _taken_rviImm_T_2 = {taken_rviImm_hi_hi_hi,taken_rviImm_hi_hi_lo,taken_rviImm_hi_lo_hi,
    taken_rviImm_hi_lo_lo,taken_rviImm_b10_5,taken_rviImm_b4_1,1'h0};
  wire [7:0] taken_rviImm_hi_lo_hi_1 = {8{taken_rviImm_sign}};
  wire  taken_rviImm_hi_lo_lo_1 = taken_rviBits[7];
  wire [31:0] _taken_rviImm_T_4 = {taken_rviImm_hi_hi_hi,taken_rviImm_hi_hi_lo,taken_rviImm_hi_lo_hi_1,
    taken_rviImm_hi_lo_lo_1,taken_rviImm_b10_5,taken_rviBits[11:8],1'h0};
  wire [31:0] taken_rviImm = taken_rviBits[3] ? $signed(_taken_rviImm_T_2) : $signed(_taken_rviImm_T_4);
  wire [32:0] _taken_npc_T_1 = $signed(taken_rviImm) - 32'sh2;
  wire [4:0] _taken_rvcImm_T_3 = taken_bits[12] ? 5'h1f : 5'h0;
  wire [12:0] _taken_rvcImm_T_9 = {_taken_rvcImm_T_3,taken_bits[6:5],taken_bits[2],taken_bits[11:10],taken_bits[4:3],1'h0
    };
  wire [9:0] _taken_rvcImm_T_12 = taken_bits[12] ? 10'h3ff : 10'h0;
  wire [20:0] _taken_rvcImm_T_21 = {_taken_rvcImm_T_12,taken_bits[8],taken_bits[10:9],taken_bits[6],taken_bits[7],
    taken_bits[2],taken_bits[11],taken_bits[5:3],1'h0};
  wire [20:0] taken_rvcImm = taken_bits[14] ? $signed({{8{_taken_rvcImm_T_9[12]}},_taken_rvcImm_T_9}) : $signed(
    _taken_rvcImm_T_21);
  wire [32:0] _taken_npc_T_2 = taken_prevRVI ? $signed(_taken_npc_T_1) : $signed({{12{taken_rvcImm[20]}},taken_rvcImm});
  wire [32:0] _GEN_142 = {{1{_taken_npc_T[31]}},_taken_npc_T};
  wire [32:0] _taken_predicted_npc_T = $signed(_GEN_142) + $signed(_taken_npc_T_2);
  wire  predicted_taken = btb_io_resp_valid & btb_io_resp_bits_taken;
  wire [31:0] _GEN_39 = predicted_taken ? btb_io_resp_bits_target : ntpc;
  wire [32:0] _GEN_54 = s2_valid & (taken_predictBranch | taken_predictJump) ? _taken_predicted_npc_T : {{1'd0}, _GEN_39
    };
  wire [32:0] _GEN_57 = ~s2_btb_taken ? _GEN_54 : {{1'd0}, _GEN_39};
  wire [32:0] _GEN_90 = s2_valid & (taken_predictBranch_1 | taken_predictJump_1) ? {{1'd0}, _taken_predicted_npc_T_1} :
    _GEN_57;
  wire [32:0] _GEN_93 = ~s2_btb_taken ? _GEN_90 : _GEN_57;
  wire [32:0] _GEN_110 = taken_idx ? _GEN_93 : _GEN_57;
  wire [32:0] predicted_npc = useRAS ? {{1'd0}, btb_io_ras_head_bits} : _GEN_110;
  wire [32:0] npc = s2_replay ? {{1'd0}, s2_pc} : predicted_npc;
  wire  s0_speculative = s1_speculative | s2_valid & ~s2_speculative | predicted_taken;
  wire  _T_11 = ~s2_replay;
  wire  taken_rvcJALR_1 = 16'h9002 == _taken_rvcJR_T_4 & _taken_rvcJR_T_7;
  wire  _taken_taken_T_17 = taken_valid_1 & (taken_rvcJump_1 | taken_rvcJALR_1 | taken_rvcJR_1 | taken_rvcBranch_1 &
    s2_btb_resp_bits_bht_value);
  wire  taken_taken_1 = taken_prevRVI_1 & (taken_rviJump_1 | taken_rviJALR_1 | taken_rviBranch_1 &
    s2_btb_resp_bits_bht_value) | _taken_taken_T_17;
  wire  taken = taken_taken | taken_taken_1;
  wire  _GEN_127 = _s2_replay_T | io_cpu_req_valid;
  wire  _GEN_131 = taken ? _GEN_127 : io_cpu_req_valid;
  wire  s2_redirect = _taken_T_36 ? _GEN_131 : io_cpu_req_valid;
  wire  _GEN_0 = ~s2_replay & ~s2_redirect;
  reg [1:0] recent_progress_counter;
  wire  recent_progress = recent_progress_counter > 2'h0;
  wire  _T_12 = io_ptw_req_ready & io_ptw_req_valid;
  wire [1:0] _recent_progress_counter_T_1 = recent_progress_counter - 2'h1;
  wire  s2_kill_speculative_tlb_refill = s2_speculative & ~recent_progress;
  wire  s2_can_speculatively_refill = s2_tlb_resp_cacheable & ~io_ptw_customCSRs_csrs_0_value[3];
  reg  fq_io_enq_valid_REG;
  wire  _fq_io_enq_valid_T_1 = s2_kill_speculative_tlb_refill & s2_tlb_resp_miss;
  wire [32:0] _io_cpu_npc_T = io_cpu_req_valid ? {{1'd0}, io_cpu_req_bits_pc} : npc;
  wire [32:0] _io_cpu_npc_T_1 = ~_io_cpu_npc_T;
  wire [32:0] _io_cpu_npc_T_2 = _io_cpu_npc_T_1 | 33'h1;
  wire [32:0] _io_cpu_npc_T_3 = ~_io_cpu_npc_T_2;
  wire [2:0] _fq_io_enq_bits_mask_T_1 = 3'h3 << s2_pc[1];
  wire  fetch_bubble_likely = ~fq_io_mask[1];
  wire  _btb_io_btb_update_valid_T_2 = _s2_replay_T & ~wrong_path;
  wire  _taken_T_27 = ~s2_btb_resp_valid & (taken_predictBranch & s2_btb_resp_bits_bht_value | taken_predictJump |
    taken_predictReturn);
  wire  _GEN_103 = ~s2_btb_resp_valid & (taken_predictBranch_1 & s2_btb_resp_bits_bht_value | taken_predictJump_1 |
    taken_predictReturn_1) | ~s2_btb_resp_valid & (taken_predictBranch & s2_btb_resp_bits_bht_value | taken_predictJump
     | taken_predictReturn);
  wire  updateBTB = taken_idx ? _GEN_103 : _taken_T_27;
  wire [1:0] _btb_io_btb_update_bits_br_pc_T = {taken_idx, 1'h0};
  wire [31:0] _GEN_143 = {{30'd0}, _btb_io_btb_update_bits_br_pc_T};
  wire [31:0] _btb_io_btb_update_bits_br_pc_T_1 = s2_base_pc | _GEN_143;
  wire [1:0] after_idx = taken_idx ? 2'h2 : 2'h1;
  wire [2:0] _btb_io_ras_update_bits_returnAddr_T = {after_idx, 1'h0};
  wire [31:0] _GEN_144 = {{29'd0}, _btb_io_ras_update_bits_returnAddr_T};
  wire  taken_rviCall = (taken_rviJALR | taken_rviJump) & taken_rviBits[7];
  wire  taken_rvcCall = taken_rvcJAL | taken_rvcJALR;
  wire  _GEN_50 = s2_valid & s2_btb_resp_valid & ~s2_btb_resp_bits_bridx & taken_valid & _taken_prevRVI_T_5 | (
    icache_io_s2_kill & ~icache_io_resp_valid & ~s2_xcpt | _fq_io_enq_valid_T_1);
  wire  _GEN_51 = s2_valid & s2_btb_resp_valid & ~s2_btb_resp_bits_bridx & taken_valid & _taken_prevRVI_T_5 | wrong_path
    ;
  wire  _taken_btb_io_ras_update_bits_cfiType_T = taken_prevRVI ? taken_rviReturn : taken_rvcReturn;
  wire  _taken_btb_io_ras_update_bits_cfiType_T_1 = taken_prevRVI ? taken_rviCall : taken_rvcCall;
  wire  _taken_btb_io_ras_update_bits_cfiType_T_2 = taken_prevRVI ? taken_rviBranch : taken_rvcBranch;
  wire  _taken_btb_io_ras_update_bits_cfiType_T_5 = _taken_btb_io_ras_update_bits_cfiType_T_2 ? 1'h0 : 1'h1;
  wire [1:0] _taken_btb_io_ras_update_bits_cfiType_T_6 = _taken_btb_io_ras_update_bits_cfiType_T_1 ? 2'h2 : {{1'd0},
    _taken_btb_io_ras_update_bits_cfiType_T_5};
  wire [1:0] _taken_btb_io_ras_update_bits_cfiType_T_7 = _taken_btb_io_ras_update_bits_cfiType_T ? 2'h3 :
    _taken_btb_io_ras_update_bits_cfiType_T_6;
  wire  _GEN_52 = _s2_replay_T & taken_taken & ~taken_predictBranch & ~taken_predictJump & ~taken_predictReturn |
    _GEN_51;
  wire  _GEN_55 = ~s2_btb_taken ? _GEN_52 : _GEN_51;
  wire  _GEN_58 = _taken_predictBranch_T_2 & _btb_io_btb_update_valid_T_2;
  wire  taken_rvc_1 = taken_bits_1[1:0] != 2'h3;
  wire  taken_rviCall_1 = (taken_rviJALR_1 | taken_rviJump_1) & taken_rviBits_1[7];
  wire  taken_rvcCall_1 = taken_rvcJAL_1 | taken_rvcJALR_1;
  wire  _taken_T_33 = ~taken_rvc_1;
  wire  _GEN_87 = s2_valid & s2_btb_resp_valid & s2_btb_resp_bits_bridx & taken_valid_1 & ~taken_rvc_1 | _GEN_55;
  wire  _taken_btb_io_ras_update_bits_cfiType_T_8 = taken_prevRVI_1 ? taken_rviReturn_1 : taken_rvcReturn_1;
  wire  _taken_btb_io_ras_update_bits_cfiType_T_9 = taken_prevRVI_1 ? taken_rviCall_1 : taken_rvcCall_1;
  wire  _taken_btb_io_ras_update_bits_cfiType_T_10 = taken_prevRVI_1 ? taken_rviBranch_1 : taken_rvcBranch_1;
  wire  _taken_btb_io_ras_update_bits_cfiType_T_13 = _taken_btb_io_ras_update_bits_cfiType_T_10 ? 1'h0 : 1'h1;
  wire [1:0] _taken_btb_io_ras_update_bits_cfiType_T_14 = _taken_btb_io_ras_update_bits_cfiType_T_9 ? 2'h2 : {{1'd0},
    _taken_btb_io_ras_update_bits_cfiType_T_13};
  wire [1:0] _taken_btb_io_ras_update_bits_cfiType_T_15 = _taken_btb_io_ras_update_bits_cfiType_T_8 ? 2'h3 :
    _taken_btb_io_ras_update_bits_cfiType_T_14;
  wire  _GEN_88 = _s2_replay_T & taken_taken_1 & ~taken_predictBranch_1 & ~taken_predictJump_1 & ~taken_predictReturn_1
     | _GEN_87;
  wire  _GEN_94 = _taken_predictBranch_T_5 ? _btb_io_btb_update_valid_T_2 : _GEN_58;
  wire  _taken_T_61 = taken_valid_1 & taken_idx & _taken_T_33;
  wire [15:0] _taken_s2_partial_insn_T = taken_bits_1 | 16'h3;
  wire  _GEN_128 = taken ? taken_idx : s2_btb_resp_bits_bridx;
  wire  _GEN_129 = taken | s2_btb_taken;
  wire [4:0] _GEN_130 = taken ? 5'h1c : s2_btb_resp_bits_entry;
  ICache icache (
    .clock(icache_clock),
    .reset(icache_reset),
    .auto_master_out_a_ready(icache_auto_master_out_a_ready),
    .auto_master_out_a_valid(icache_auto_master_out_a_valid),
    .auto_master_out_a_bits_address(icache_auto_master_out_a_bits_address),
    .auto_master_out_d_valid(icache_auto_master_out_d_valid),
    .auto_master_out_d_bits_opcode(icache_auto_master_out_d_bits_opcode),
    .auto_master_out_d_bits_size(icache_auto_master_out_d_bits_size),
    .auto_master_out_d_bits_data(icache_auto_master_out_d_bits_data),
    .auto_master_out_d_bits_corrupt(icache_auto_master_out_d_bits_corrupt),
    .io_req_ready(icache_io_req_ready),
    .io_req_valid(icache_io_req_valid),
    .io_req_bits_addr(icache_io_req_bits_addr),
    .io_s1_paddr(icache_io_s1_paddr),
    .io_s1_kill(icache_io_s1_kill),
    .io_s2_kill(icache_io_s2_kill),
    .io_resp_valid(icache_io_resp_valid),
    .io_resp_bits_data(icache_io_resp_bits_data),
    .io_resp_bits_ae(icache_io_resp_bits_ae),
    .io_invalidate(icache_io_invalidate)
  );
  ShiftQueue fq (
    .clock(fq_clock),
    .reset(fq_reset),
    .io_enq_ready(fq_io_enq_ready),
    .io_enq_valid(fq_io_enq_valid),
    .io_enq_bits_btb_taken(fq_io_enq_bits_btb_taken),
    .io_enq_bits_btb_bridx(fq_io_enq_bits_btb_bridx),
    .io_enq_bits_btb_entry(fq_io_enq_bits_btb_entry),
    .io_enq_bits_btb_bht_history(fq_io_enq_bits_btb_bht_history),
    .io_enq_bits_pc(fq_io_enq_bits_pc),
    .io_enq_bits_data(fq_io_enq_bits_data),
    .io_enq_bits_mask(fq_io_enq_bits_mask),
    .io_enq_bits_xcpt_pf_inst(fq_io_enq_bits_xcpt_pf_inst),
    .io_enq_bits_xcpt_ae_inst(fq_io_enq_bits_xcpt_ae_inst),
    .io_enq_bits_replay(fq_io_enq_bits_replay),
    .io_deq_ready(fq_io_deq_ready),
    .io_deq_valid(fq_io_deq_valid),
    .io_deq_bits_btb_taken(fq_io_deq_bits_btb_taken),
    .io_deq_bits_btb_bridx(fq_io_deq_bits_btb_bridx),
    .io_deq_bits_btb_entry(fq_io_deq_bits_btb_entry),
    .io_deq_bits_btb_bht_history(fq_io_deq_bits_btb_bht_history),
    .io_deq_bits_pc(fq_io_deq_bits_pc),
    .io_deq_bits_data(fq_io_deq_bits_data),
    .io_deq_bits_xcpt_pf_inst(fq_io_deq_bits_xcpt_pf_inst),
    .io_deq_bits_xcpt_ae_inst(fq_io_deq_bits_xcpt_ae_inst),
    .io_deq_bits_replay(fq_io_deq_bits_replay),
    .io_mask(fq_io_mask)
  );
  TLB_1 tlb (
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_req_ready(tlb_io_req_ready),
    .io_req_valid(tlb_io_req_valid),
    .io_req_bits_vaddr(tlb_io_req_bits_vaddr),
    .io_req_bits_prv(tlb_io_req_bits_prv),
    .io_resp_miss(tlb_io_resp_miss),
    .io_resp_paddr(tlb_io_resp_paddr),
    .io_resp_pf_inst(tlb_io_resp_pf_inst),
    .io_resp_ae_inst(tlb_io_resp_ae_inst),
    .io_resp_cacheable(tlb_io_resp_cacheable),
    .io_sfence_valid(tlb_io_sfence_valid),
    .io_sfence_bits_rs1(tlb_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(tlb_io_sfence_bits_rs2),
    .io_sfence_bits_addr(tlb_io_sfence_bits_addr),
    .io_ptw_req_ready(tlb_io_ptw_req_ready),
    .io_ptw_req_valid(tlb_io_ptw_req_valid),
    .io_ptw_req_bits_valid(tlb_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(tlb_io_ptw_req_bits_bits_addr),
    .io_ptw_req_bits_bits_need_gpa(tlb_io_ptw_req_bits_bits_need_gpa),
    .io_ptw_resp_valid(tlb_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae_ptw(tlb_io_ptw_resp_bits_ae_ptw),
    .io_ptw_resp_bits_ae_final(tlb_io_ptw_resp_bits_ae_final),
    .io_ptw_resp_bits_pf(tlb_io_ptw_resp_bits_pf),
    .io_ptw_resp_bits_pte_ppn(tlb_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d(tlb_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(tlb_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(tlb_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(tlb_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(tlb_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(tlb_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(tlb_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(tlb_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(tlb_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_homogeneous(tlb_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(tlb_io_ptw_ptbr_mode),
    .io_ptw_status_debug(tlb_io_ptw_status_debug),
    .io_ptw_pmp_0_cfg_l(tlb_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(tlb_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(tlb_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(tlb_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(tlb_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(tlb_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(tlb_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(tlb_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(tlb_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(tlb_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(tlb_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(tlb_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(tlb_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(tlb_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(tlb_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(tlb_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(tlb_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(tlb_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(tlb_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(tlb_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(tlb_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(tlb_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(tlb_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(tlb_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(tlb_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(tlb_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(tlb_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(tlb_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(tlb_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(tlb_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(tlb_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(tlb_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(tlb_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(tlb_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(tlb_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(tlb_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(tlb_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(tlb_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(tlb_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(tlb_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(tlb_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(tlb_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(tlb_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(tlb_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(tlb_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(tlb_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(tlb_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(tlb_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(tlb_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(tlb_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(tlb_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(tlb_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(tlb_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(tlb_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(tlb_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(tlb_io_ptw_pmp_7_mask),
    .io_kill(tlb_io_kill)
  );
  BTB btb (
    .clock(btb_clock),
    .reset(btb_reset),
    .io_req_bits_addr(btb_io_req_bits_addr),
    .io_resp_valid(btb_io_resp_valid),
    .io_resp_bits_taken(btb_io_resp_bits_taken),
    .io_resp_bits_bridx(btb_io_resp_bits_bridx),
    .io_resp_bits_target(btb_io_resp_bits_target),
    .io_resp_bits_entry(btb_io_resp_bits_entry),
    .io_resp_bits_bht_history(btb_io_resp_bits_bht_history),
    .io_resp_bits_bht_value(btb_io_resp_bits_bht_value),
    .io_btb_update_valid(btb_io_btb_update_valid),
    .io_btb_update_bits_prediction_entry(btb_io_btb_update_bits_prediction_entry),
    .io_btb_update_bits_pc(btb_io_btb_update_bits_pc),
    .io_btb_update_bits_isValid(btb_io_btb_update_bits_isValid),
    .io_btb_update_bits_br_pc(btb_io_btb_update_bits_br_pc),
    .io_btb_update_bits_cfiType(btb_io_btb_update_bits_cfiType),
    .io_bht_update_valid(btb_io_bht_update_valid),
    .io_bht_update_bits_prediction_history(btb_io_bht_update_bits_prediction_history),
    .io_bht_update_bits_pc(btb_io_bht_update_bits_pc),
    .io_bht_update_bits_branch(btb_io_bht_update_bits_branch),
    .io_bht_update_bits_taken(btb_io_bht_update_bits_taken),
    .io_bht_update_bits_mispredict(btb_io_bht_update_bits_mispredict),
    .io_bht_advance_valid(btb_io_bht_advance_valid),
    .io_bht_advance_bits_bht_value(btb_io_bht_advance_bits_bht_value),
    .io_ras_update_valid(btb_io_ras_update_valid),
    .io_ras_update_bits_cfiType(btb_io_ras_update_bits_cfiType),
    .io_ras_update_bits_returnAddr(btb_io_ras_update_bits_returnAddr),
    .io_ras_head_valid(btb_io_ras_head_valid),
    .io_ras_head_bits(btb_io_ras_head_bits),
    .io_flush(btb_io_flush)
  );
  assign auto_icache_master_out_a_valid = icache_auto_master_out_a_valid;
  assign auto_icache_master_out_a_bits_address = icache_auto_master_out_a_bits_address;
  assign io_cpu_resp_valid = fq_io_deq_valid;
  assign io_cpu_resp_bits_btb_taken = fq_io_deq_bits_btb_taken;
  assign io_cpu_resp_bits_btb_bridx = fq_io_deq_bits_btb_bridx;
  assign io_cpu_resp_bits_btb_entry = fq_io_deq_bits_btb_entry;
  assign io_cpu_resp_bits_btb_bht_history = fq_io_deq_bits_btb_bht_history;
  assign io_cpu_resp_bits_pc = fq_io_deq_bits_pc;
  assign io_cpu_resp_bits_data = fq_io_deq_bits_data;
  assign io_cpu_resp_bits_xcpt_pf_inst = fq_io_deq_bits_xcpt_pf_inst;
  assign io_cpu_resp_bits_xcpt_ae_inst = fq_io_deq_bits_xcpt_ae_inst;
  assign io_cpu_resp_bits_replay = fq_io_deq_bits_replay;
  assign io_cpu_npc = _io_cpu_npc_T_3[31:0];
  assign io_ptw_req_valid = tlb_io_ptw_req_valid;
  assign io_ptw_req_bits_valid = tlb_io_ptw_req_bits_valid;
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr;
  assign io_ptw_req_bits_bits_need_gpa = tlb_io_ptw_req_bits_bits_need_gpa;
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_auto_master_out_a_ready = auto_icache_master_out_a_ready;
  assign icache_auto_master_out_d_valid = auto_icache_master_out_d_valid;
  assign icache_auto_master_out_d_bits_opcode = auto_icache_master_out_d_bits_opcode;
  assign icache_auto_master_out_d_bits_size = auto_icache_master_out_d_bits_size;
  assign icache_auto_master_out_d_bits_data = auto_icache_master_out_d_bits_data;
  assign icache_auto_master_out_d_bits_corrupt = auto_icache_master_out_d_bits_corrupt;
  assign icache_io_req_valid = io_cpu_req_valid | s0_fq_has_space;
  assign icache_io_req_bits_addr = io_cpu_npc;
  assign icache_io_s1_paddr = tlb_io_resp_paddr;
  assign icache_io_s1_kill = s2_redirect | tlb_io_resp_miss | s2_replay;
  assign icache_io_s2_kill = s2_speculative & ~s2_can_speculatively_refill | s2_xcpt;
  assign icache_io_invalidate = io_cpu_flush_icache;
  assign fq_clock = clock;
  assign fq_reset = reset | io_cpu_req_valid;
  assign fq_io_enq_valid = fq_io_enq_valid_REG & s2_valid & (icache_io_resp_valid | s2_kill_speculative_tlb_refill &
    s2_tlb_resp_miss | ~s2_tlb_resp_miss & icache_io_s2_kill);
  assign fq_io_enq_bits_btb_taken = _taken_T_36 ? _GEN_129 : s2_btb_taken;
  assign fq_io_enq_bits_btb_bridx = _taken_T_36 ? _GEN_128 : s2_btb_resp_bits_bridx;
  assign fq_io_enq_bits_btb_entry = _taken_T_36 ? _GEN_130 : s2_btb_resp_bits_entry;
  assign fq_io_enq_bits_btb_bht_history = s2_btb_resp_bits_bht_history;
  assign fq_io_enq_bits_pc = s2_pc;
  assign fq_io_enq_bits_data = icache_io_resp_bits_data;
  assign fq_io_enq_bits_mask = _fq_io_enq_bits_mask_T_1[1:0];
  assign fq_io_enq_bits_xcpt_pf_inst = s2_tlb_resp_pf_inst;
  assign fq_io_enq_bits_xcpt_ae_inst = icache_io_resp_valid & icache_io_resp_bits_ae | s2_tlb_resp_ae_inst;
  assign fq_io_enq_bits_replay = s2_valid & s2_btb_resp_valid & s2_btb_resp_bits_bridx & taken_valid_1 & ~taken_rvc_1 |
    _GEN_50;
  assign fq_io_deq_ready = io_cpu_resp_ready;
  assign tlb_clock = clock;
  assign tlb_reset = reset;
  assign tlb_io_req_valid = s1_valid & _T_11;
  assign tlb_io_req_bits_vaddr = s1_pc;
  assign tlb_io_req_bits_prv = io_ptw_status_prv;
  assign tlb_io_sfence_valid = io_cpu_sfence_valid;
  assign tlb_io_sfence_bits_rs1 = io_cpu_sfence_bits_rs1;
  assign tlb_io_sfence_bits_rs2 = io_cpu_sfence_bits_rs2;
  assign tlb_io_sfence_bits_addr = io_cpu_sfence_bits_addr;
  assign tlb_io_ptw_req_ready = io_ptw_req_ready;
  assign tlb_io_ptw_resp_valid = io_ptw_resp_valid;
  assign tlb_io_ptw_resp_bits_ae_ptw = io_ptw_resp_bits_ae_ptw;
  assign tlb_io_ptw_resp_bits_ae_final = io_ptw_resp_bits_ae_final;
  assign tlb_io_ptw_resp_bits_pf = io_ptw_resp_bits_pf;
  assign tlb_io_ptw_resp_bits_pte_ppn = io_ptw_resp_bits_pte_ppn;
  assign tlb_io_ptw_resp_bits_pte_d = io_ptw_resp_bits_pte_d;
  assign tlb_io_ptw_resp_bits_pte_a = io_ptw_resp_bits_pte_a;
  assign tlb_io_ptw_resp_bits_pte_g = io_ptw_resp_bits_pte_g;
  assign tlb_io_ptw_resp_bits_pte_u = io_ptw_resp_bits_pte_u;
  assign tlb_io_ptw_resp_bits_pte_x = io_ptw_resp_bits_pte_x;
  assign tlb_io_ptw_resp_bits_pte_w = io_ptw_resp_bits_pte_w;
  assign tlb_io_ptw_resp_bits_pte_r = io_ptw_resp_bits_pte_r;
  assign tlb_io_ptw_resp_bits_pte_v = io_ptw_resp_bits_pte_v;
  assign tlb_io_ptw_resp_bits_level = io_ptw_resp_bits_level;
  assign tlb_io_ptw_resp_bits_homogeneous = io_ptw_resp_bits_homogeneous;
  assign tlb_io_ptw_ptbr_mode = io_ptw_ptbr_mode;
  assign tlb_io_ptw_status_debug = io_ptw_status_debug;
  assign tlb_io_ptw_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l;
  assign tlb_io_ptw_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a;
  assign tlb_io_ptw_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x;
  assign tlb_io_ptw_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w;
  assign tlb_io_ptw_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r;
  assign tlb_io_ptw_pmp_0_addr = io_ptw_pmp_0_addr;
  assign tlb_io_ptw_pmp_0_mask = io_ptw_pmp_0_mask;
  assign tlb_io_ptw_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l;
  assign tlb_io_ptw_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a;
  assign tlb_io_ptw_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x;
  assign tlb_io_ptw_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w;
  assign tlb_io_ptw_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r;
  assign tlb_io_ptw_pmp_1_addr = io_ptw_pmp_1_addr;
  assign tlb_io_ptw_pmp_1_mask = io_ptw_pmp_1_mask;
  assign tlb_io_ptw_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l;
  assign tlb_io_ptw_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a;
  assign tlb_io_ptw_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x;
  assign tlb_io_ptw_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w;
  assign tlb_io_ptw_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r;
  assign tlb_io_ptw_pmp_2_addr = io_ptw_pmp_2_addr;
  assign tlb_io_ptw_pmp_2_mask = io_ptw_pmp_2_mask;
  assign tlb_io_ptw_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l;
  assign tlb_io_ptw_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a;
  assign tlb_io_ptw_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x;
  assign tlb_io_ptw_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w;
  assign tlb_io_ptw_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r;
  assign tlb_io_ptw_pmp_3_addr = io_ptw_pmp_3_addr;
  assign tlb_io_ptw_pmp_3_mask = io_ptw_pmp_3_mask;
  assign tlb_io_ptw_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l;
  assign tlb_io_ptw_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a;
  assign tlb_io_ptw_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x;
  assign tlb_io_ptw_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w;
  assign tlb_io_ptw_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r;
  assign tlb_io_ptw_pmp_4_addr = io_ptw_pmp_4_addr;
  assign tlb_io_ptw_pmp_4_mask = io_ptw_pmp_4_mask;
  assign tlb_io_ptw_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l;
  assign tlb_io_ptw_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a;
  assign tlb_io_ptw_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x;
  assign tlb_io_ptw_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w;
  assign tlb_io_ptw_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r;
  assign tlb_io_ptw_pmp_5_addr = io_ptw_pmp_5_addr;
  assign tlb_io_ptw_pmp_5_mask = io_ptw_pmp_5_mask;
  assign tlb_io_ptw_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l;
  assign tlb_io_ptw_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a;
  assign tlb_io_ptw_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x;
  assign tlb_io_ptw_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w;
  assign tlb_io_ptw_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r;
  assign tlb_io_ptw_pmp_6_addr = io_ptw_pmp_6_addr;
  assign tlb_io_ptw_pmp_6_mask = io_ptw_pmp_6_mask;
  assign tlb_io_ptw_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l;
  assign tlb_io_ptw_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a;
  assign tlb_io_ptw_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x;
  assign tlb_io_ptw_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w;
  assign tlb_io_ptw_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r;
  assign tlb_io_ptw_pmp_7_addr = io_ptw_pmp_7_addr;
  assign tlb_io_ptw_pmp_7_mask = io_ptw_pmp_7_mask;
  assign tlb_io_kill = _s0_fq_has_space_T_5 | s2_kill_speculative_tlb_refill;
  assign btb_clock = clock;
  assign btb_reset = reset;
  assign btb_io_req_bits_addr = s1_pc;
  assign btb_io_btb_update_valid = ~io_cpu_btb_update_valid ? _s2_replay_T & ~wrong_path & fetch_bubble_likely &
    updateBTB : io_cpu_btb_update_valid;
  assign btb_io_btb_update_bits_prediction_entry = ~io_cpu_btb_update_valid ? 5'h1c :
    io_cpu_btb_update_bits_prediction_entry;
  assign btb_io_btb_update_bits_pc = ~io_cpu_btb_update_valid ? s2_base_pc : io_cpu_btb_update_bits_pc;
  assign btb_io_btb_update_bits_isValid = ~io_cpu_btb_update_valid | io_cpu_btb_update_bits_isValid;
  assign btb_io_btb_update_bits_br_pc = ~io_cpu_btb_update_valid ? _btb_io_btb_update_bits_br_pc_T_1 :
    io_cpu_btb_update_bits_br_pc;
  assign btb_io_btb_update_bits_cfiType = ~io_cpu_btb_update_valid ? btb_io_ras_update_bits_cfiType :
    io_cpu_btb_update_bits_cfiType;
  assign btb_io_bht_update_valid = io_cpu_bht_update_valid;
  assign btb_io_bht_update_bits_prediction_history = io_cpu_bht_update_bits_prediction_history;
  assign btb_io_bht_update_bits_pc = io_cpu_bht_update_bits_pc;
  assign btb_io_bht_update_bits_branch = io_cpu_bht_update_bits_branch;
  assign btb_io_bht_update_bits_taken = io_cpu_bht_update_bits_taken;
  assign btb_io_bht_update_bits_mispredict = io_cpu_bht_update_bits_mispredict;
  assign btb_io_bht_advance_valid = taken_idx ? _GEN_94 : _GEN_58;
  assign btb_io_bht_advance_bits_bht_value = s2_btb_resp_bits_bht_value;
  assign btb_io_ras_update_valid = taken_idx ? _btb_io_btb_update_valid_T_2 & (taken_prevRVI_1 & (taken_rviCall_1 |
    taken_rviReturn_1) | taken_valid_1 & (taken_rvcCall_1 | taken_rvcReturn_1)) : _btb_io_btb_update_valid_T_2 & (
    taken_prevRVI & (taken_rviCall | taken_rviReturn) | taken_valid & (taken_rvcCall | taken_rvcReturn));
  assign btb_io_ras_update_bits_cfiType = taken_idx ? _taken_btb_io_ras_update_bits_cfiType_T_15 :
    _taken_btb_io_ras_update_bits_cfiType_T_7;
  assign btb_io_ras_update_bits_returnAddr = s2_base_pc + _GEN_144;
  assign btb_io_flush = s2_valid & s2_btb_resp_valid & s2_btb_resp_bits_bridx & taken_valid_1 & ~taken_rvc_1 | s2_valid
     & s2_btb_resp_valid & ~s2_btb_resp_bits_bridx & taken_valid & _taken_prevRVI_T_5;
  always @(posedge clock) begin
    s1_valid <= io_cpu_req_valid | s0_fq_has_space;
    if (reset) begin
      s2_valid <= 1'h0;
    end else begin
      s2_valid <= _GEN_0;
    end
    s1_pc <= io_cpu_npc;
    if (io_cpu_req_valid) begin
      s1_speculative <= io_cpu_req_bits_speculative;
    end else if (s2_replay) begin
      s1_speculative <= s2_speculative;
    end else begin
      s1_speculative <= s0_speculative;
    end
    if (reset) begin
      s2_pc <= 32'h0 + `IROM_BASEADDR;
    end else if (~s2_replay) begin
      s2_pc <= s1_pc;
    end
    if (_T_11) begin
      s2_btb_resp_valid <= btb_io_resp_valid;
    end
    if (_T_11) begin
      s2_btb_resp_bits_taken <= btb_io_resp_bits_taken;
    end
    if (_T_11) begin
      s2_btb_resp_bits_bridx <= btb_io_resp_bits_bridx;
    end
    if (_T_11) begin
      s2_btb_resp_bits_entry <= btb_io_resp_bits_entry;
    end
    if (_T_11) begin
      s2_btb_resp_bits_bht_history <= btb_io_resp_bits_bht_history;
    end
    if (_T_11) begin
      s2_btb_resp_bits_bht_value <= btb_io_resp_bits_bht_value;
    end
    if (~s2_replay) begin
      s2_tlb_resp_miss <= tlb_io_resp_miss;
    end
    if (~s2_replay) begin
      s2_tlb_resp_pf_inst <= tlb_io_resp_pf_inst;
    end
    if (~s2_replay) begin
      s2_tlb_resp_ae_inst <= tlb_io_resp_ae_inst;
    end
    if (~s2_replay) begin
      s2_tlb_resp_cacheable <= tlb_io_resp_cacheable;
    end
    if (reset) begin
      s2_speculative <= 1'h0;
    end else if (~s2_replay) begin
      s2_speculative <= s1_speculative;
    end
    if (reset) begin
      s2_partial_insn_valid <= 1'h0;
    end else if (s2_redirect) begin
      s2_partial_insn_valid <= 1'h0;
    end else if (_s2_replay_T & (s2_btb_taken | taken)) begin
      s2_partial_insn_valid <= 1'h0;
    end else if (_s2_replay_T) begin
      s2_partial_insn_valid <= _taken_T_61;
    end
    if (_s2_replay_T) begin
      if (taken_valid_1 & taken_idx & _taken_T_33) begin
        s2_partial_insn <= _taken_s2_partial_insn_T;
      end
    end
    if (reset) begin
      wrong_path <= 1'h0;
    end else if (io_cpu_req_valid) begin
      wrong_path <= 1'h0;
    end else if (taken_idx) begin
      if (~s2_btb_taken) begin
        wrong_path <= _GEN_88;
      end else begin
        wrong_path <= _GEN_87;
      end
    end else begin
      wrong_path <= _GEN_87;
    end
    s2_replay_REG <= reset | s2_replay & ~s0_valid;
    if (reset) begin
      recent_progress_counter <= 2'h3;
    end else if (io_cpu_progress) begin
      recent_progress_counter <= 2'h3;
    end else if (_T_12 & recent_progress) begin
      recent_progress_counter <= _recent_progress_counter_T_1;
    end
    fq_io_enq_valid_REG <= s1_valid;
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_cpu_req_valid | io_cpu_sfence_valid | io_cpu_flush_icache | io_cpu_bht_update_valid |
          io_cpu_btb_update_valid) | io_cpu_might_request) & ~reset) begin
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
        if (~reset & ~(~(io_cpu_req_valid | io_cpu_sfence_valid | io_cpu_flush_icache | io_cpu_bht_update_valid |
          io_cpu_btb_update_valid) | io_cpu_might_request)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Frontend.scala:93 assert(!(io.cpu.req.valid || io.cpu.sfence.valid || io.cpu.flush_icache || io.cpu.bht_update.valid || io.cpu.btb_update.valid) || io.cpu.might_request)\n"
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
        if (~(~(s2_speculative & io_ptw_customCSRs_csrs_0_value[3] & ~icache_io_s2_kill)) & _T_9) begin
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
        if (_T_9 & ~(~(s2_speculative & io_ptw_customCSRs_csrs_0_value[3] & ~icache_io_s2_kill))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Frontend.scala:190 assert(!(s2_speculative && io.ptw.customCSRs.asInstanceOf[RocketCustomCSRs].disableSpeculativeICacheRefill && !icache.io.s2_kill))\n"
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
        if (~(~s2_partial_insn_valid | fq_io_enq_bits_mask[0]) & _T_9) begin
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
        if (_T_9 & ~(~s2_partial_insn_valid | fq_io_enq_bits_mask[0])) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Frontend.scala:335 assert(!s2_partial_insn_valid || fq.io.enq.bits.mask(0))\n");
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s2_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s1_speculative = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s2_pc = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s2_btb_resp_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_btb_resp_bits_taken = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_btb_resp_bits_bridx = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_btb_resp_bits_entry = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  s2_btb_resp_bits_bht_history = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  s2_btb_resp_bits_bht_value = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s2_tlb_resp_miss = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s2_tlb_resp_pf_inst = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s2_tlb_resp_ae_inst = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s2_tlb_resp_cacheable = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s2_speculative = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s2_partial_insn_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s2_partial_insn = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  wrong_path = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s2_replay_REG = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  recent_progress_counter = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  fq_io_enq_valid_REG = _RAND_21[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule