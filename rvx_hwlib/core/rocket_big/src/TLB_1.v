`default_nettype wire
module TLB_1(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_vaddr,
  input  [1:0]  io_req_bits_prv,
  output        io_resp_miss,
  output [31:0] io_resp_paddr,
  output        io_resp_pf_inst,
  output        io_resp_ae_inst,
  output        io_resp_cacheable,
  input         io_sfence_valid,
  input         io_sfence_bits_rs1,
  input         io_sfence_bits_rs2,
  input  [31:0] io_sfence_bits_addr,
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
  input         io_kill
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [63:0] _RAND_64;
  reg [63:0] _RAND_65;
  reg [63:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [63:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [63:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [63:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [63:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
`endif // RANDOMIZE_REG_INIT
  wire [19:0] mpu_ppn_barrier_io_x_ppn;
  wire  mpu_ppn_barrier_io_x_u;
  wire  mpu_ppn_barrier_io_x_ae_ptw;
  wire  mpu_ppn_barrier_io_x_ae_final;
  wire  mpu_ppn_barrier_io_x_pf;
  wire  mpu_ppn_barrier_io_x_gf;
  wire  mpu_ppn_barrier_io_x_sw;
  wire  mpu_ppn_barrier_io_x_sx;
  wire  mpu_ppn_barrier_io_x_sr;
  wire  mpu_ppn_barrier_io_x_pw;
  wire  mpu_ppn_barrier_io_x_px;
  wire  mpu_ppn_barrier_io_x_pr;
  wire  mpu_ppn_barrier_io_x_ppp;
  wire  mpu_ppn_barrier_io_x_pal;
  wire  mpu_ppn_barrier_io_x_paa;
  wire  mpu_ppn_barrier_io_x_eff;
  wire  mpu_ppn_barrier_io_x_c;
  wire [19:0] mpu_ppn_barrier_io_y_ppn;
  wire  mpu_ppn_barrier_io_y_u;
  wire  mpu_ppn_barrier_io_y_ae_ptw;
  wire  mpu_ppn_barrier_io_y_ae_final;
  wire  mpu_ppn_barrier_io_y_pf;
  wire  mpu_ppn_barrier_io_y_gf;
  wire  mpu_ppn_barrier_io_y_sw;
  wire  mpu_ppn_barrier_io_y_sx;
  wire  mpu_ppn_barrier_io_y_sr;
  wire  mpu_ppn_barrier_io_y_pw;
  wire  mpu_ppn_barrier_io_y_px;
  wire  mpu_ppn_barrier_io_y_pr;
  wire  mpu_ppn_barrier_io_y_ppp;
  wire  mpu_ppn_barrier_io_y_pal;
  wire  mpu_ppn_barrier_io_y_paa;
  wire  mpu_ppn_barrier_io_y_eff;
  wire  mpu_ppn_barrier_io_y_c;
  wire [1:0] pmp_io_prv;
  wire  pmp_io_pmp_0_cfg_l;
  wire [1:0] pmp_io_pmp_0_cfg_a;
  wire  pmp_io_pmp_0_cfg_x;
  wire  pmp_io_pmp_0_cfg_w;
  wire  pmp_io_pmp_0_cfg_r;
  wire [29:0] pmp_io_pmp_0_addr;
  wire [31:0] pmp_io_pmp_0_mask;
  wire  pmp_io_pmp_1_cfg_l;
  wire [1:0] pmp_io_pmp_1_cfg_a;
  wire  pmp_io_pmp_1_cfg_x;
  wire  pmp_io_pmp_1_cfg_w;
  wire  pmp_io_pmp_1_cfg_r;
  wire [29:0] pmp_io_pmp_1_addr;
  wire [31:0] pmp_io_pmp_1_mask;
  wire  pmp_io_pmp_2_cfg_l;
  wire [1:0] pmp_io_pmp_2_cfg_a;
  wire  pmp_io_pmp_2_cfg_x;
  wire  pmp_io_pmp_2_cfg_w;
  wire  pmp_io_pmp_2_cfg_r;
  wire [29:0] pmp_io_pmp_2_addr;
  wire [31:0] pmp_io_pmp_2_mask;
  wire  pmp_io_pmp_3_cfg_l;
  wire [1:0] pmp_io_pmp_3_cfg_a;
  wire  pmp_io_pmp_3_cfg_x;
  wire  pmp_io_pmp_3_cfg_w;
  wire  pmp_io_pmp_3_cfg_r;
  wire [29:0] pmp_io_pmp_3_addr;
  wire [31:0] pmp_io_pmp_3_mask;
  wire  pmp_io_pmp_4_cfg_l;
  wire [1:0] pmp_io_pmp_4_cfg_a;
  wire  pmp_io_pmp_4_cfg_x;
  wire  pmp_io_pmp_4_cfg_w;
  wire  pmp_io_pmp_4_cfg_r;
  wire [29:0] pmp_io_pmp_4_addr;
  wire [31:0] pmp_io_pmp_4_mask;
  wire  pmp_io_pmp_5_cfg_l;
  wire [1:0] pmp_io_pmp_5_cfg_a;
  wire  pmp_io_pmp_5_cfg_x;
  wire  pmp_io_pmp_5_cfg_w;
  wire  pmp_io_pmp_5_cfg_r;
  wire [29:0] pmp_io_pmp_5_addr;
  wire [31:0] pmp_io_pmp_5_mask;
  wire  pmp_io_pmp_6_cfg_l;
  wire [1:0] pmp_io_pmp_6_cfg_a;
  wire  pmp_io_pmp_6_cfg_x;
  wire  pmp_io_pmp_6_cfg_w;
  wire  pmp_io_pmp_6_cfg_r;
  wire [29:0] pmp_io_pmp_6_addr;
  wire [31:0] pmp_io_pmp_6_mask;
  wire  pmp_io_pmp_7_cfg_l;
  wire [1:0] pmp_io_pmp_7_cfg_a;
  wire  pmp_io_pmp_7_cfg_x;
  wire  pmp_io_pmp_7_cfg_w;
  wire  pmp_io_pmp_7_cfg_r;
  wire [29:0] pmp_io_pmp_7_addr;
  wire [31:0] pmp_io_pmp_7_mask;
  wire [31:0] pmp_io_addr;
  wire  pmp_io_r;
  wire  pmp_io_w;
  wire  pmp_io_x;
  wire [19:0] entries_barrier_io_x_ppn;
  wire  entries_barrier_io_x_u;
  wire  entries_barrier_io_x_ae_ptw;
  wire  entries_barrier_io_x_ae_final;
  wire  entries_barrier_io_x_pf;
  wire  entries_barrier_io_x_gf;
  wire  entries_barrier_io_x_sw;
  wire  entries_barrier_io_x_sx;
  wire  entries_barrier_io_x_sr;
  wire  entries_barrier_io_x_pw;
  wire  entries_barrier_io_x_px;
  wire  entries_barrier_io_x_pr;
  wire  entries_barrier_io_x_ppp;
  wire  entries_barrier_io_x_pal;
  wire  entries_barrier_io_x_paa;
  wire  entries_barrier_io_x_eff;
  wire  entries_barrier_io_x_c;
  wire [19:0] entries_barrier_io_y_ppn;
  wire  entries_barrier_io_y_u;
  wire  entries_barrier_io_y_ae_ptw;
  wire  entries_barrier_io_y_ae_final;
  wire  entries_barrier_io_y_pf;
  wire  entries_barrier_io_y_gf;
  wire  entries_barrier_io_y_sw;
  wire  entries_barrier_io_y_sx;
  wire  entries_barrier_io_y_sr;
  wire  entries_barrier_io_y_pw;
  wire  entries_barrier_io_y_px;
  wire  entries_barrier_io_y_pr;
  wire  entries_barrier_io_y_ppp;
  wire  entries_barrier_io_y_pal;
  wire  entries_barrier_io_y_paa;
  wire  entries_barrier_io_y_eff;
  wire  entries_barrier_io_y_c;
  wire [19:0] entries_barrier_1_io_x_ppn;
  wire  entries_barrier_1_io_x_u;
  wire  entries_barrier_1_io_x_ae_ptw;
  wire  entries_barrier_1_io_x_ae_final;
  wire  entries_barrier_1_io_x_pf;
  wire  entries_barrier_1_io_x_gf;
  wire  entries_barrier_1_io_x_sw;
  wire  entries_barrier_1_io_x_sx;
  wire  entries_barrier_1_io_x_sr;
  wire  entries_barrier_1_io_x_pw;
  wire  entries_barrier_1_io_x_px;
  wire  entries_barrier_1_io_x_pr;
  wire  entries_barrier_1_io_x_ppp;
  wire  entries_barrier_1_io_x_pal;
  wire  entries_barrier_1_io_x_paa;
  wire  entries_barrier_1_io_x_eff;
  wire  entries_barrier_1_io_x_c;
  wire [19:0] entries_barrier_1_io_y_ppn;
  wire  entries_barrier_1_io_y_u;
  wire  entries_barrier_1_io_y_ae_ptw;
  wire  entries_barrier_1_io_y_ae_final;
  wire  entries_barrier_1_io_y_pf;
  wire  entries_barrier_1_io_y_gf;
  wire  entries_barrier_1_io_y_sw;
  wire  entries_barrier_1_io_y_sx;
  wire  entries_barrier_1_io_y_sr;
  wire  entries_barrier_1_io_y_pw;
  wire  entries_barrier_1_io_y_px;
  wire  entries_barrier_1_io_y_pr;
  wire  entries_barrier_1_io_y_ppp;
  wire  entries_barrier_1_io_y_pal;
  wire  entries_barrier_1_io_y_paa;
  wire  entries_barrier_1_io_y_eff;
  wire  entries_barrier_1_io_y_c;
  wire [19:0] entries_barrier_2_io_x_ppn;
  wire  entries_barrier_2_io_x_u;
  wire  entries_barrier_2_io_x_ae_ptw;
  wire  entries_barrier_2_io_x_ae_final;
  wire  entries_barrier_2_io_x_pf;
  wire  entries_barrier_2_io_x_gf;
  wire  entries_barrier_2_io_x_sw;
  wire  entries_barrier_2_io_x_sx;
  wire  entries_barrier_2_io_x_sr;
  wire  entries_barrier_2_io_x_pw;
  wire  entries_barrier_2_io_x_px;
  wire  entries_barrier_2_io_x_pr;
  wire  entries_barrier_2_io_x_ppp;
  wire  entries_barrier_2_io_x_pal;
  wire  entries_barrier_2_io_x_paa;
  wire  entries_barrier_2_io_x_eff;
  wire  entries_barrier_2_io_x_c;
  wire [19:0] entries_barrier_2_io_y_ppn;
  wire  entries_barrier_2_io_y_u;
  wire  entries_barrier_2_io_y_ae_ptw;
  wire  entries_barrier_2_io_y_ae_final;
  wire  entries_barrier_2_io_y_pf;
  wire  entries_barrier_2_io_y_gf;
  wire  entries_barrier_2_io_y_sw;
  wire  entries_barrier_2_io_y_sx;
  wire  entries_barrier_2_io_y_sr;
  wire  entries_barrier_2_io_y_pw;
  wire  entries_barrier_2_io_y_px;
  wire  entries_barrier_2_io_y_pr;
  wire  entries_barrier_2_io_y_ppp;
  wire  entries_barrier_2_io_y_pal;
  wire  entries_barrier_2_io_y_paa;
  wire  entries_barrier_2_io_y_eff;
  wire  entries_barrier_2_io_y_c;
  wire [19:0] entries_barrier_3_io_x_ppn;
  wire  entries_barrier_3_io_x_u;
  wire  entries_barrier_3_io_x_ae_ptw;
  wire  entries_barrier_3_io_x_ae_final;
  wire  entries_barrier_3_io_x_pf;
  wire  entries_barrier_3_io_x_gf;
  wire  entries_barrier_3_io_x_sw;
  wire  entries_barrier_3_io_x_sx;
  wire  entries_barrier_3_io_x_sr;
  wire  entries_barrier_3_io_x_pw;
  wire  entries_barrier_3_io_x_px;
  wire  entries_barrier_3_io_x_pr;
  wire  entries_barrier_3_io_x_ppp;
  wire  entries_barrier_3_io_x_pal;
  wire  entries_barrier_3_io_x_paa;
  wire  entries_barrier_3_io_x_eff;
  wire  entries_barrier_3_io_x_c;
  wire [19:0] entries_barrier_3_io_y_ppn;
  wire  entries_barrier_3_io_y_u;
  wire  entries_barrier_3_io_y_ae_ptw;
  wire  entries_barrier_3_io_y_ae_final;
  wire  entries_barrier_3_io_y_pf;
  wire  entries_barrier_3_io_y_gf;
  wire  entries_barrier_3_io_y_sw;
  wire  entries_barrier_3_io_y_sx;
  wire  entries_barrier_3_io_y_sr;
  wire  entries_barrier_3_io_y_pw;
  wire  entries_barrier_3_io_y_px;
  wire  entries_barrier_3_io_y_pr;
  wire  entries_barrier_3_io_y_ppp;
  wire  entries_barrier_3_io_y_pal;
  wire  entries_barrier_3_io_y_paa;
  wire  entries_barrier_3_io_y_eff;
  wire  entries_barrier_3_io_y_c;
  wire [19:0] entries_barrier_4_io_x_ppn;
  wire  entries_barrier_4_io_x_u;
  wire  entries_barrier_4_io_x_ae_ptw;
  wire  entries_barrier_4_io_x_ae_final;
  wire  entries_barrier_4_io_x_pf;
  wire  entries_barrier_4_io_x_gf;
  wire  entries_barrier_4_io_x_sw;
  wire  entries_barrier_4_io_x_sx;
  wire  entries_barrier_4_io_x_sr;
  wire  entries_barrier_4_io_x_pw;
  wire  entries_barrier_4_io_x_px;
  wire  entries_barrier_4_io_x_pr;
  wire  entries_barrier_4_io_x_ppp;
  wire  entries_barrier_4_io_x_pal;
  wire  entries_barrier_4_io_x_paa;
  wire  entries_barrier_4_io_x_eff;
  wire  entries_barrier_4_io_x_c;
  wire [19:0] entries_barrier_4_io_y_ppn;
  wire  entries_barrier_4_io_y_u;
  wire  entries_barrier_4_io_y_ae_ptw;
  wire  entries_barrier_4_io_y_ae_final;
  wire  entries_barrier_4_io_y_pf;
  wire  entries_barrier_4_io_y_gf;
  wire  entries_barrier_4_io_y_sw;
  wire  entries_barrier_4_io_y_sx;
  wire  entries_barrier_4_io_y_sr;
  wire  entries_barrier_4_io_y_pw;
  wire  entries_barrier_4_io_y_px;
  wire  entries_barrier_4_io_y_pr;
  wire  entries_barrier_4_io_y_ppp;
  wire  entries_barrier_4_io_y_pal;
  wire  entries_barrier_4_io_y_paa;
  wire  entries_barrier_4_io_y_eff;
  wire  entries_barrier_4_io_y_c;
  wire [19:0] entries_barrier_5_io_x_ppn;
  wire  entries_barrier_5_io_x_u;
  wire  entries_barrier_5_io_x_ae_ptw;
  wire  entries_barrier_5_io_x_ae_final;
  wire  entries_barrier_5_io_x_pf;
  wire  entries_barrier_5_io_x_gf;
  wire  entries_barrier_5_io_x_sw;
  wire  entries_barrier_5_io_x_sx;
  wire  entries_barrier_5_io_x_sr;
  wire  entries_barrier_5_io_x_pw;
  wire  entries_barrier_5_io_x_px;
  wire  entries_barrier_5_io_x_pr;
  wire  entries_barrier_5_io_x_ppp;
  wire  entries_barrier_5_io_x_pal;
  wire  entries_barrier_5_io_x_paa;
  wire  entries_barrier_5_io_x_eff;
  wire  entries_barrier_5_io_x_c;
  wire [19:0] entries_barrier_5_io_y_ppn;
  wire  entries_barrier_5_io_y_u;
  wire  entries_barrier_5_io_y_ae_ptw;
  wire  entries_barrier_5_io_y_ae_final;
  wire  entries_barrier_5_io_y_pf;
  wire  entries_barrier_5_io_y_gf;
  wire  entries_barrier_5_io_y_sw;
  wire  entries_barrier_5_io_y_sx;
  wire  entries_barrier_5_io_y_sr;
  wire  entries_barrier_5_io_y_pw;
  wire  entries_barrier_5_io_y_px;
  wire  entries_barrier_5_io_y_pr;
  wire  entries_barrier_5_io_y_ppp;
  wire  entries_barrier_5_io_y_pal;
  wire  entries_barrier_5_io_y_paa;
  wire  entries_barrier_5_io_y_eff;
  wire  entries_barrier_5_io_y_c;
  wire [19:0] entries_barrier_6_io_x_ppn;
  wire  entries_barrier_6_io_x_u;
  wire  entries_barrier_6_io_x_ae_ptw;
  wire  entries_barrier_6_io_x_ae_final;
  wire  entries_barrier_6_io_x_pf;
  wire  entries_barrier_6_io_x_gf;
  wire  entries_barrier_6_io_x_sw;
  wire  entries_barrier_6_io_x_sx;
  wire  entries_barrier_6_io_x_sr;
  wire  entries_barrier_6_io_x_pw;
  wire  entries_barrier_6_io_x_px;
  wire  entries_barrier_6_io_x_pr;
  wire  entries_barrier_6_io_x_ppp;
  wire  entries_barrier_6_io_x_pal;
  wire  entries_barrier_6_io_x_paa;
  wire  entries_barrier_6_io_x_eff;
  wire  entries_barrier_6_io_x_c;
  wire [19:0] entries_barrier_6_io_y_ppn;
  wire  entries_barrier_6_io_y_u;
  wire  entries_barrier_6_io_y_ae_ptw;
  wire  entries_barrier_6_io_y_ae_final;
  wire  entries_barrier_6_io_y_pf;
  wire  entries_barrier_6_io_y_gf;
  wire  entries_barrier_6_io_y_sw;
  wire  entries_barrier_6_io_y_sx;
  wire  entries_barrier_6_io_y_sr;
  wire  entries_barrier_6_io_y_pw;
  wire  entries_barrier_6_io_y_px;
  wire  entries_barrier_6_io_y_pr;
  wire  entries_barrier_6_io_y_ppp;
  wire  entries_barrier_6_io_y_pal;
  wire  entries_barrier_6_io_y_paa;
  wire  entries_barrier_6_io_y_eff;
  wire  entries_barrier_6_io_y_c;
  wire [19:0] entries_barrier_7_io_x_ppn;
  wire  entries_barrier_7_io_x_u;
  wire  entries_barrier_7_io_x_ae_ptw;
  wire  entries_barrier_7_io_x_ae_final;
  wire  entries_barrier_7_io_x_pf;
  wire  entries_barrier_7_io_x_gf;
  wire  entries_barrier_7_io_x_sw;
  wire  entries_barrier_7_io_x_sx;
  wire  entries_barrier_7_io_x_sr;
  wire  entries_barrier_7_io_x_pw;
  wire  entries_barrier_7_io_x_px;
  wire  entries_barrier_7_io_x_pr;
  wire  entries_barrier_7_io_x_ppp;
  wire  entries_barrier_7_io_x_pal;
  wire  entries_barrier_7_io_x_paa;
  wire  entries_barrier_7_io_x_eff;
  wire  entries_barrier_7_io_x_c;
  wire [19:0] entries_barrier_7_io_y_ppn;
  wire  entries_barrier_7_io_y_u;
  wire  entries_barrier_7_io_y_ae_ptw;
  wire  entries_barrier_7_io_y_ae_final;
  wire  entries_barrier_7_io_y_pf;
  wire  entries_barrier_7_io_y_gf;
  wire  entries_barrier_7_io_y_sw;
  wire  entries_barrier_7_io_y_sx;
  wire  entries_barrier_7_io_y_sr;
  wire  entries_barrier_7_io_y_pw;
  wire  entries_barrier_7_io_y_px;
  wire  entries_barrier_7_io_y_pr;
  wire  entries_barrier_7_io_y_ppp;
  wire  entries_barrier_7_io_y_pal;
  wire  entries_barrier_7_io_y_paa;
  wire  entries_barrier_7_io_y_eff;
  wire  entries_barrier_7_io_y_c;
  wire [19:0] entries_barrier_8_io_x_ppn;
  wire  entries_barrier_8_io_x_u;
  wire  entries_barrier_8_io_x_ae_ptw;
  wire  entries_barrier_8_io_x_ae_final;
  wire  entries_barrier_8_io_x_pf;
  wire  entries_barrier_8_io_x_gf;
  wire  entries_barrier_8_io_x_sw;
  wire  entries_barrier_8_io_x_sx;
  wire  entries_barrier_8_io_x_sr;
  wire  entries_barrier_8_io_x_pw;
  wire  entries_barrier_8_io_x_px;
  wire  entries_barrier_8_io_x_pr;
  wire  entries_barrier_8_io_x_ppp;
  wire  entries_barrier_8_io_x_pal;
  wire  entries_barrier_8_io_x_paa;
  wire  entries_barrier_8_io_x_eff;
  wire  entries_barrier_8_io_x_c;
  wire [19:0] entries_barrier_8_io_y_ppn;
  wire  entries_barrier_8_io_y_u;
  wire  entries_barrier_8_io_y_ae_ptw;
  wire  entries_barrier_8_io_y_ae_final;
  wire  entries_barrier_8_io_y_pf;
  wire  entries_barrier_8_io_y_gf;
  wire  entries_barrier_8_io_y_sw;
  wire  entries_barrier_8_io_y_sx;
  wire  entries_barrier_8_io_y_sr;
  wire  entries_barrier_8_io_y_pw;
  wire  entries_barrier_8_io_y_px;
  wire  entries_barrier_8_io_y_pr;
  wire  entries_barrier_8_io_y_ppp;
  wire  entries_barrier_8_io_y_pal;
  wire  entries_barrier_8_io_y_paa;
  wire  entries_barrier_8_io_y_eff;
  wire  entries_barrier_8_io_y_c;
  wire [19:0] entries_barrier_9_io_x_ppn;
  wire  entries_barrier_9_io_x_u;
  wire  entries_barrier_9_io_x_ae_ptw;
  wire  entries_barrier_9_io_x_ae_final;
  wire  entries_barrier_9_io_x_pf;
  wire  entries_barrier_9_io_x_gf;
  wire  entries_barrier_9_io_x_sw;
  wire  entries_barrier_9_io_x_sx;
  wire  entries_barrier_9_io_x_sr;
  wire  entries_barrier_9_io_x_pw;
  wire  entries_barrier_9_io_x_px;
  wire  entries_barrier_9_io_x_pr;
  wire  entries_barrier_9_io_x_ppp;
  wire  entries_barrier_9_io_x_pal;
  wire  entries_barrier_9_io_x_paa;
  wire  entries_barrier_9_io_x_eff;
  wire  entries_barrier_9_io_x_c;
  wire [19:0] entries_barrier_9_io_y_ppn;
  wire  entries_barrier_9_io_y_u;
  wire  entries_barrier_9_io_y_ae_ptw;
  wire  entries_barrier_9_io_y_ae_final;
  wire  entries_barrier_9_io_y_pf;
  wire  entries_barrier_9_io_y_gf;
  wire  entries_barrier_9_io_y_sw;
  wire  entries_barrier_9_io_y_sx;
  wire  entries_barrier_9_io_y_sr;
  wire  entries_barrier_9_io_y_pw;
  wire  entries_barrier_9_io_y_px;
  wire  entries_barrier_9_io_y_pr;
  wire  entries_barrier_9_io_y_ppp;
  wire  entries_barrier_9_io_y_pal;
  wire  entries_barrier_9_io_y_paa;
  wire  entries_barrier_9_io_y_eff;
  wire  entries_barrier_9_io_y_c;
  wire [19:0] entries_barrier_10_io_x_ppn;
  wire  entries_barrier_10_io_x_u;
  wire  entries_barrier_10_io_x_ae_ptw;
  wire  entries_barrier_10_io_x_ae_final;
  wire  entries_barrier_10_io_x_pf;
  wire  entries_barrier_10_io_x_gf;
  wire  entries_barrier_10_io_x_sw;
  wire  entries_barrier_10_io_x_sx;
  wire  entries_barrier_10_io_x_sr;
  wire  entries_barrier_10_io_x_pw;
  wire  entries_barrier_10_io_x_px;
  wire  entries_barrier_10_io_x_pr;
  wire  entries_barrier_10_io_x_ppp;
  wire  entries_barrier_10_io_x_pal;
  wire  entries_barrier_10_io_x_paa;
  wire  entries_barrier_10_io_x_eff;
  wire  entries_barrier_10_io_x_c;
  wire [19:0] entries_barrier_10_io_y_ppn;
  wire  entries_barrier_10_io_y_u;
  wire  entries_barrier_10_io_y_ae_ptw;
  wire  entries_barrier_10_io_y_ae_final;
  wire  entries_barrier_10_io_y_pf;
  wire  entries_barrier_10_io_y_gf;
  wire  entries_barrier_10_io_y_sw;
  wire  entries_barrier_10_io_y_sx;
  wire  entries_barrier_10_io_y_sr;
  wire  entries_barrier_10_io_y_pw;
  wire  entries_barrier_10_io_y_px;
  wire  entries_barrier_10_io_y_pr;
  wire  entries_barrier_10_io_y_ppp;
  wire  entries_barrier_10_io_y_pal;
  wire  entries_barrier_10_io_y_paa;
  wire  entries_barrier_10_io_y_eff;
  wire  entries_barrier_10_io_y_c;
  wire [19:0] entries_barrier_11_io_x_ppn;
  wire  entries_barrier_11_io_x_u;
  wire  entries_barrier_11_io_x_ae_ptw;
  wire  entries_barrier_11_io_x_ae_final;
  wire  entries_barrier_11_io_x_pf;
  wire  entries_barrier_11_io_x_gf;
  wire  entries_barrier_11_io_x_sw;
  wire  entries_barrier_11_io_x_sx;
  wire  entries_barrier_11_io_x_sr;
  wire  entries_barrier_11_io_x_pw;
  wire  entries_barrier_11_io_x_px;
  wire  entries_barrier_11_io_x_pr;
  wire  entries_barrier_11_io_x_ppp;
  wire  entries_barrier_11_io_x_pal;
  wire  entries_barrier_11_io_x_paa;
  wire  entries_barrier_11_io_x_eff;
  wire  entries_barrier_11_io_x_c;
  wire [19:0] entries_barrier_11_io_y_ppn;
  wire  entries_barrier_11_io_y_u;
  wire  entries_barrier_11_io_y_ae_ptw;
  wire  entries_barrier_11_io_y_ae_final;
  wire  entries_barrier_11_io_y_pf;
  wire  entries_barrier_11_io_y_gf;
  wire  entries_barrier_11_io_y_sw;
  wire  entries_barrier_11_io_y_sx;
  wire  entries_barrier_11_io_y_sr;
  wire  entries_barrier_11_io_y_pw;
  wire  entries_barrier_11_io_y_px;
  wire  entries_barrier_11_io_y_pr;
  wire  entries_barrier_11_io_y_ppp;
  wire  entries_barrier_11_io_y_pal;
  wire  entries_barrier_11_io_y_paa;
  wire  entries_barrier_11_io_y_eff;
  wire  entries_barrier_11_io_y_c;
  wire [19:0] entries_barrier_12_io_x_ppn;
  wire  entries_barrier_12_io_x_u;
  wire  entries_barrier_12_io_x_ae_ptw;
  wire  entries_barrier_12_io_x_ae_final;
  wire  entries_barrier_12_io_x_pf;
  wire  entries_barrier_12_io_x_gf;
  wire  entries_barrier_12_io_x_sw;
  wire  entries_barrier_12_io_x_sx;
  wire  entries_barrier_12_io_x_sr;
  wire  entries_barrier_12_io_x_pw;
  wire  entries_barrier_12_io_x_px;
  wire  entries_barrier_12_io_x_pr;
  wire  entries_barrier_12_io_x_ppp;
  wire  entries_barrier_12_io_x_pal;
  wire  entries_barrier_12_io_x_paa;
  wire  entries_barrier_12_io_x_eff;
  wire  entries_barrier_12_io_x_c;
  wire [19:0] entries_barrier_12_io_y_ppn;
  wire  entries_barrier_12_io_y_u;
  wire  entries_barrier_12_io_y_ae_ptw;
  wire  entries_barrier_12_io_y_ae_final;
  wire  entries_barrier_12_io_y_pf;
  wire  entries_barrier_12_io_y_gf;
  wire  entries_barrier_12_io_y_sw;
  wire  entries_barrier_12_io_y_sx;
  wire  entries_barrier_12_io_y_sr;
  wire  entries_barrier_12_io_y_pw;
  wire  entries_barrier_12_io_y_px;
  wire  entries_barrier_12_io_y_pr;
  wire  entries_barrier_12_io_y_ppp;
  wire  entries_barrier_12_io_y_pal;
  wire  entries_barrier_12_io_y_paa;
  wire  entries_barrier_12_io_y_eff;
  wire  entries_barrier_12_io_y_c;
  wire [19:0] vpn = io_req_bits_vaddr[31:12];
  reg [19:0] sectored_entries_0_0_tag_vpn;
  reg [40:0] sectored_entries_0_0_data_0;
  reg [40:0] sectored_entries_0_0_data_1;
  reg [40:0] sectored_entries_0_0_data_2;
  reg [40:0] sectored_entries_0_0_data_3;
  reg  sectored_entries_0_0_valid_0;
  reg  sectored_entries_0_0_valid_1;
  reg  sectored_entries_0_0_valid_2;
  reg  sectored_entries_0_0_valid_3;
  reg [19:0] sectored_entries_0_1_tag_vpn;
  reg [40:0] sectored_entries_0_1_data_0;
  reg [40:0] sectored_entries_0_1_data_1;
  reg [40:0] sectored_entries_0_1_data_2;
  reg [40:0] sectored_entries_0_1_data_3;
  reg  sectored_entries_0_1_valid_0;
  reg  sectored_entries_0_1_valid_1;
  reg  sectored_entries_0_1_valid_2;
  reg  sectored_entries_0_1_valid_3;
  reg [19:0] sectored_entries_0_2_tag_vpn;
  reg [40:0] sectored_entries_0_2_data_0;
  reg [40:0] sectored_entries_0_2_data_1;
  reg [40:0] sectored_entries_0_2_data_2;
  reg [40:0] sectored_entries_0_2_data_3;
  reg  sectored_entries_0_2_valid_0;
  reg  sectored_entries_0_2_valid_1;
  reg  sectored_entries_0_2_valid_2;
  reg  sectored_entries_0_2_valid_3;
  reg [19:0] sectored_entries_0_3_tag_vpn;
  reg [40:0] sectored_entries_0_3_data_0;
  reg [40:0] sectored_entries_0_3_data_1;
  reg [40:0] sectored_entries_0_3_data_2;
  reg [40:0] sectored_entries_0_3_data_3;
  reg  sectored_entries_0_3_valid_0;
  reg  sectored_entries_0_3_valid_1;
  reg  sectored_entries_0_3_valid_2;
  reg  sectored_entries_0_3_valid_3;
  reg [19:0] sectored_entries_0_4_tag_vpn;
  reg [40:0] sectored_entries_0_4_data_0;
  reg [40:0] sectored_entries_0_4_data_1;
  reg [40:0] sectored_entries_0_4_data_2;
  reg [40:0] sectored_entries_0_4_data_3;
  reg  sectored_entries_0_4_valid_0;
  reg  sectored_entries_0_4_valid_1;
  reg  sectored_entries_0_4_valid_2;
  reg  sectored_entries_0_4_valid_3;
  reg [19:0] sectored_entries_0_5_tag_vpn;
  reg [40:0] sectored_entries_0_5_data_0;
  reg [40:0] sectored_entries_0_5_data_1;
  reg [40:0] sectored_entries_0_5_data_2;
  reg [40:0] sectored_entries_0_5_data_3;
  reg  sectored_entries_0_5_valid_0;
  reg  sectored_entries_0_5_valid_1;
  reg  sectored_entries_0_5_valid_2;
  reg  sectored_entries_0_5_valid_3;
  reg [19:0] sectored_entries_0_6_tag_vpn;
  reg [40:0] sectored_entries_0_6_data_0;
  reg [40:0] sectored_entries_0_6_data_1;
  reg [40:0] sectored_entries_0_6_data_2;
  reg [40:0] sectored_entries_0_6_data_3;
  reg  sectored_entries_0_6_valid_0;
  reg  sectored_entries_0_6_valid_1;
  reg  sectored_entries_0_6_valid_2;
  reg  sectored_entries_0_6_valid_3;
  reg [19:0] sectored_entries_0_7_tag_vpn;
  reg [40:0] sectored_entries_0_7_data_0;
  reg [40:0] sectored_entries_0_7_data_1;
  reg [40:0] sectored_entries_0_7_data_2;
  reg [40:0] sectored_entries_0_7_data_3;
  reg  sectored_entries_0_7_valid_0;
  reg  sectored_entries_0_7_valid_1;
  reg  sectored_entries_0_7_valid_2;
  reg  sectored_entries_0_7_valid_3;
  reg [19:0] superpage_entries_0_tag_vpn;
  reg [40:0] superpage_entries_0_data_0;
  reg  superpage_entries_0_valid_0;
  reg [19:0] superpage_entries_1_tag_vpn;
  reg [40:0] superpage_entries_1_data_0;
  reg  superpage_entries_1_valid_0;
  reg [19:0] superpage_entries_2_tag_vpn;
  reg [40:0] superpage_entries_2_data_0;
  reg  superpage_entries_2_valid_0;
  reg [19:0] superpage_entries_3_tag_vpn;
  reg [40:0] superpage_entries_3_data_0;
  reg  superpage_entries_3_valid_0;
  reg  special_entry_level;
  reg [19:0] special_entry_tag_vpn;
  reg [40:0] special_entry_data_0;
  reg  special_entry_valid_0;
  reg [1:0] state;
  reg [19:0] r_refill_tag;
  reg [1:0] r_superpage_repl_addr;
  reg [2:0] r_sectored_repl_addr;
  reg  r_sectored_hit_valid;
  reg [2:0] r_sectored_hit_bits;
  reg  r_need_gpa;
  wire  priv_s = io_req_bits_prv[0];
  wire  priv_uses_vm = io_req_bits_prv <= 2'h1;
  wire  vm_enabled = io_ptw_ptbr_mode & priv_uses_vm;
  wire [19:0] refill_ppn = io_ptw_resp_bits_pte_ppn[19:0];
  wire  _invalidate_refill_T = state == 2'h1;
  wire  _invalidate_refill_T_1 = state == 2'h3;
  wire  _invalidate_refill_T_2 = _invalidate_refill_T | _invalidate_refill_T_1;
  wire  invalidate_refill = _invalidate_refill_T_2 | io_sfence_valid;
  wire [9:0] mpu_ppn_res = mpu_ppn_barrier_io_y_ppn[19:10];
  wire  mpu_ppn_ignore = special_entry_level < 1'h1;
  wire [19:0] _mpu_ppn_T_23 = mpu_ppn_ignore ? vpn : 20'h0;
  wire [19:0] _mpu_ppn_T_24 = _mpu_ppn_T_23 | mpu_ppn_barrier_io_y_ppn;
  wire [19:0] _mpu_ppn_T_26 = {mpu_ppn_res,_mpu_ppn_T_24[9:0]};
  wire [19:0] _mpu_ppn_T_28 = vm_enabled ? _mpu_ppn_T_26 : io_req_bits_vaddr[31:12];
  wire [19:0] mpu_ppn = io_ptw_resp_valid ? refill_ppn : _mpu_ppn_T_28;
  wire [31:0] mpu_physaddr = {mpu_ppn,io_req_bits_vaddr[11:0]};
  wire [2:0] _mpu_priv_T_2 = {io_ptw_status_debug,io_req_bits_prv};
  wire [2:0] mpu_priv = io_ptw_resp_valid ? 3'h1 : _mpu_priv_T_2;
  wire [31:0] _legal_address_T = mpu_physaddr ^ 32'h3000;
  wire [32:0] _legal_address_T_1 = {1'b0,$signed(_legal_address_T)};
  wire [32:0] _legal_address_T_3 = $signed(_legal_address_T_1) & -33'sh1000;
  wire  _legal_address_T_4 = $signed(_legal_address_T_3) == 33'sh0;
  wire [31:0] _legal_address_T_5 = mpu_physaddr ^ 32'hc000000;
  wire [32:0] _legal_address_T_6 = {1'b0,$signed(_legal_address_T_5)};
  wire [32:0] _legal_address_T_8 = $signed(_legal_address_T_6) & -33'sh4000000;
  wire  _legal_address_T_9 = $signed(_legal_address_T_8) == 33'sh0;
  wire [31:0] _legal_address_T_10 = mpu_physaddr ^ 32'h2000000;
  wire [32:0] _legal_address_T_11 = {1'b0,$signed(_legal_address_T_10)};
  wire [32:0] _legal_address_T_13 = $signed(_legal_address_T_11) & -33'sh10000;
  wire  _legal_address_T_14 = $signed(_legal_address_T_13) == 33'sh0;
  wire [32:0] _legal_address_T_16 = {1'b0,$signed(mpu_physaddr)};
  wire [32:0] _legal_address_T_18 = $signed(_legal_address_T_16) & -33'sh1000;
  wire  _legal_address_T_19 = $signed(_legal_address_T_18) == 33'sh0;
  wire [31:0] _legal_address_T_20 = mpu_physaddr ^ 32'h10000;
  wire [32:0] _legal_address_T_21 = {1'b0,$signed(_legal_address_T_20)};
  wire [32:0] _legal_address_T_23 = $signed(_legal_address_T_21) & -33'sh10000;
  wire  _legal_address_T_24 = $signed(_legal_address_T_23) == 33'sh0;
  wire [31:0] _legal_address_T_25 = mpu_physaddr ^ 32'h10000000;
  wire [32:0] _legal_address_T_26 = {1'b0,$signed(_legal_address_T_25)};
  wire [32:0] _legal_address_T_28 = $signed(_legal_address_T_26) & -33'sh10000000;
  wire  _legal_address_T_29 = $signed(_legal_address_T_28) == 33'sh0;
  wire [31:0] _legal_address_T_30 = mpu_physaddr ^ 32'h20000000;
  wire [32:0] _legal_address_T_31 = {1'b0,$signed(_legal_address_T_30)};
  wire [32:0] _legal_address_T_33 = $signed(_legal_address_T_31) & -33'sh20000000;
  wire  _legal_address_T_34 = $signed(_legal_address_T_33) == 33'sh0;
  wire [31:0] _legal_address_T_35 = mpu_physaddr ^ 32'h40000000;
  wire [32:0] _legal_address_T_36 = {1'b0,$signed(_legal_address_T_35)};
  wire [32:0] _legal_address_T_38 = $signed(_legal_address_T_36) & -33'sh40000000;
  wire  _legal_address_T_39 = $signed(_legal_address_T_38) == 33'sh0;
  wire [31:0] _legal_address_T_40 = mpu_physaddr ^ 32'h80000000;
  wire [32:0] _legal_address_T_41 = {1'b0,$signed(_legal_address_T_40)};
  wire [32:0] _legal_address_T_43 = $signed(_legal_address_T_41) & -33'sh40000000;
  wire  _legal_address_T_44 = $signed(_legal_address_T_43) == 33'sh0;
  wire  _legal_address_T_47 = _legal_address_T_29 | _legal_address_T_34 | _legal_address_T_39 | _legal_address_T_44;
  wire [31:0] _legal_address_T_48 = mpu_physaddr ^ 32'hc0000000;
  wire [32:0] _legal_address_T_49 = {1'b0,$signed(_legal_address_T_48)};
  wire [32:0] _legal_address_T_51 = $signed(_legal_address_T_49) & -33'sh40000000;
  wire  _legal_address_T_52 = $signed(_legal_address_T_51) == 33'sh0;
  wire  legal_address = _legal_address_T_4 | _legal_address_T_9 | _legal_address_T_14 | _legal_address_T_19 |
    _legal_address_T_24 | _legal_address_T_47 | _legal_address_T_52;
  wire [32:0] _cacheable_T_3 = $signed(_legal_address_T_16) & 33'shf8010000;
  wire  _cacheable_T_4 = $signed(_cacheable_T_3) == 33'sh0;
  wire [31:0] _cacheable_T_5 = mpu_physaddr ^ 32'h8000000;
  wire [32:0] _cacheable_T_6 = {1'b0,$signed(_cacheable_T_5)};
  wire [32:0] _cacheable_T_8 = $signed(_cacheable_T_6) & 33'shf8000000;
  wire  _cacheable_T_9 = $signed(_cacheable_T_8) == 33'sh0;
  wire [32:0] _cacheable_T_13 = $signed(_legal_address_T_49) & 33'shc0000000;
  wire  _cacheable_T_14 = $signed(_cacheable_T_13) == 33'sh0;
  wire  _cacheable_T_15 = _cacheable_T_4 | _cacheable_T_9;
  wire [32:0] _cacheable_T_20 = $signed(_legal_address_T_21) & 33'shf8010000;
  wire  _cacheable_T_21 = $signed(_cacheable_T_20) == 33'sh0;
  wire [32:0] _cacheable_T_25 = $signed(_legal_address_T_26) & 33'shf0000000;
  wire  _cacheable_T_26 = $signed(_cacheable_T_25) == 33'sh0;
  wire [32:0] _cacheable_T_30 = $signed(_legal_address_T_31) & 33'she0000000;
  wire  _cacheable_T_31 = $signed(_cacheable_T_30) == 33'sh0;
  wire [32:0] _cacheable_T_35 = $signed(_legal_address_T_36) & 33'shc0000000;
  wire  _cacheable_T_36 = $signed(_cacheable_T_35) == 33'sh0;
  wire [32:0] _cacheable_T_40 = $signed(_legal_address_T_41) & 33'shc0000000;
  wire  _cacheable_T_41 = $signed(_cacheable_T_40) == 33'sh0;
  wire  _cacheable_T_45 = _cacheable_T_21 | _cacheable_T_26 | _cacheable_T_31 | _cacheable_T_36 | _cacheable_T_41;
  wire  cacheable = legal_address & _cacheable_T_45;
  wire  deny_access_to_debug = mpu_priv <= 3'h3 & _legal_address_T_19;
  wire  _prot_r_T_6 = ~deny_access_to_debug;
  wire  prot_r = legal_address & ~deny_access_to_debug & pmp_io_r;
  wire [32:0] _prot_w_T_28 = $signed(_legal_address_T_41) & 33'sh80000000;
  wire  _prot_w_T_29 = $signed(_prot_w_T_28) == 33'sh0;
  wire  _prot_w_T_34 = _cacheable_T_4 | _cacheable_T_9 | _cacheable_T_26 | _cacheable_T_31 | _cacheable_T_36 |
    _prot_w_T_29;
  wire  _prot_w_T_43 = legal_address & _prot_w_T_34;
  wire  prot_w = _prot_w_T_43 & _prot_r_T_6 & pmp_io_w;
  wire  prot_al = legal_address & _cacheable_T_15;
  wire [32:0] _prot_x_T_3 = $signed(_legal_address_T_16) & 33'shfa000000;
  wire  _prot_x_T_4 = $signed(_prot_x_T_3) == 33'sh0;
  wire  _prot_x_T_28 = _prot_x_T_4 | _cacheable_T_26 | _cacheable_T_31 | _cacheable_T_36 | _prot_w_T_29;
  wire  _prot_x_T_43 = legal_address & _prot_x_T_28;
  wire  prot_x = _prot_x_T_43 & _prot_r_T_6 & pmp_io_x;
  wire [32:0] _prot_eff_T_38 = $signed(_legal_address_T_16) & 33'shfa012000;
  wire  _prot_eff_T_39 = $signed(_prot_eff_T_38) == 33'sh0;
  wire [32:0] _prot_eff_T_43 = $signed(_legal_address_T_11) & 33'shfa010000;
  wire  _prot_eff_T_44 = $signed(_prot_eff_T_43) == 33'sh0;
  wire  _prot_eff_T_57 = _prot_eff_T_39 | _prot_eff_T_44 | _cacheable_T_9 | _cacheable_T_14;
  wire  prot_eff = legal_address & _prot_eff_T_57;
  wire  _sector_hits_T_2 = sectored_entries_0_0_valid_0 | sectored_entries_0_0_valid_1 | sectored_entries_0_0_valid_2 |
    sectored_entries_0_0_valid_3;
  wire [19:0] _sector_hits_T_3 = sectored_entries_0_0_tag_vpn ^ vpn;
  wire  _sector_hits_T_5 = _sector_hits_T_3[19:2] == 18'h0;
  wire  sector_hits_0 = _sector_hits_T_2 & _sector_hits_T_5;
  wire  _sector_hits_T_10 = sectored_entries_0_1_valid_0 | sectored_entries_0_1_valid_1 | sectored_entries_0_1_valid_2
     | sectored_entries_0_1_valid_3;
  wire [19:0] _sector_hits_T_11 = sectored_entries_0_1_tag_vpn ^ vpn;
  wire  _sector_hits_T_13 = _sector_hits_T_11[19:2] == 18'h0;
  wire  sector_hits_1 = _sector_hits_T_10 & _sector_hits_T_13;
  wire  _sector_hits_T_18 = sectored_entries_0_2_valid_0 | sectored_entries_0_2_valid_1 | sectored_entries_0_2_valid_2
     | sectored_entries_0_2_valid_3;
  wire [19:0] _sector_hits_T_19 = sectored_entries_0_2_tag_vpn ^ vpn;
  wire  _sector_hits_T_21 = _sector_hits_T_19[19:2] == 18'h0;
  wire  sector_hits_2 = _sector_hits_T_18 & _sector_hits_T_21;
  wire  _sector_hits_T_26 = sectored_entries_0_3_valid_0 | sectored_entries_0_3_valid_1 | sectored_entries_0_3_valid_2
     | sectored_entries_0_3_valid_3;
  wire [19:0] _sector_hits_T_27 = sectored_entries_0_3_tag_vpn ^ vpn;
  wire  _sector_hits_T_29 = _sector_hits_T_27[19:2] == 18'h0;
  wire  sector_hits_3 = _sector_hits_T_26 & _sector_hits_T_29;
  wire  _sector_hits_T_34 = sectored_entries_0_4_valid_0 | sectored_entries_0_4_valid_1 | sectored_entries_0_4_valid_2
     | sectored_entries_0_4_valid_3;
  wire [19:0] _sector_hits_T_35 = sectored_entries_0_4_tag_vpn ^ vpn;
  wire  _sector_hits_T_37 = _sector_hits_T_35[19:2] == 18'h0;
  wire  sector_hits_4 = _sector_hits_T_34 & _sector_hits_T_37;
  wire  _sector_hits_T_42 = sectored_entries_0_5_valid_0 | sectored_entries_0_5_valid_1 | sectored_entries_0_5_valid_2
     | sectored_entries_0_5_valid_3;
  wire [19:0] _sector_hits_T_43 = sectored_entries_0_5_tag_vpn ^ vpn;
  wire  _sector_hits_T_45 = _sector_hits_T_43[19:2] == 18'h0;
  wire  sector_hits_5 = _sector_hits_T_42 & _sector_hits_T_45;
  wire  _sector_hits_T_50 = sectored_entries_0_6_valid_0 | sectored_entries_0_6_valid_1 | sectored_entries_0_6_valid_2
     | sectored_entries_0_6_valid_3;
  wire [19:0] _sector_hits_T_51 = sectored_entries_0_6_tag_vpn ^ vpn;
  wire  _sector_hits_T_53 = _sector_hits_T_51[19:2] == 18'h0;
  wire  sector_hits_6 = _sector_hits_T_50 & _sector_hits_T_53;
  wire  _sector_hits_T_58 = sectored_entries_0_7_valid_0 | sectored_entries_0_7_valid_1 | sectored_entries_0_7_valid_2
     | sectored_entries_0_7_valid_3;
  wire [19:0] _sector_hits_T_59 = sectored_entries_0_7_tag_vpn ^ vpn;
  wire  _sector_hits_T_61 = _sector_hits_T_59[19:2] == 18'h0;
  wire  sector_hits_7 = _sector_hits_T_58 & _sector_hits_T_61;
  wire [19:0] _superpage_hits_T = superpage_entries_0_tag_vpn ^ vpn;
  wire  superpage_hits_0 = superpage_entries_0_valid_0 & _superpage_hits_T[19:10] == 10'h0;
  wire [19:0] _superpage_hits_T_9 = superpage_entries_1_tag_vpn ^ vpn;
  wire  superpage_hits_1 = superpage_entries_1_valid_0 & _superpage_hits_T_9[19:10] == 10'h0;
  wire [19:0] _superpage_hits_T_18 = superpage_entries_2_tag_vpn ^ vpn;
  wire  superpage_hits_2 = superpage_entries_2_valid_0 & _superpage_hits_T_18[19:10] == 10'h0;
  wire [19:0] _superpage_hits_T_27 = superpage_entries_3_tag_vpn ^ vpn;
  wire  superpage_hits_3 = superpage_entries_3_valid_0 & _superpage_hits_T_27[19:10] == 10'h0;
  wire [1:0] hitsVec_idx = vpn[1:0];
  wire  _GEN_1 = 2'h1 == hitsVec_idx ? sectored_entries_0_0_valid_1 : sectored_entries_0_0_valid_0;
  wire  _GEN_2 = 2'h2 == hitsVec_idx ? sectored_entries_0_0_valid_2 : _GEN_1;
  wire  _GEN_3 = 2'h3 == hitsVec_idx ? sectored_entries_0_0_valid_3 : _GEN_2;
  wire  _hitsVec_T_5 = _GEN_3 & _sector_hits_T_5;
  wire  hitsVec_0 = vm_enabled & _hitsVec_T_5;
  wire  _GEN_5 = 2'h1 == hitsVec_idx ? sectored_entries_0_1_valid_1 : sectored_entries_0_1_valid_0;
  wire  _GEN_6 = 2'h2 == hitsVec_idx ? sectored_entries_0_1_valid_2 : _GEN_5;
  wire  _GEN_7 = 2'h3 == hitsVec_idx ? sectored_entries_0_1_valid_3 : _GEN_6;
  wire  _hitsVec_T_11 = _GEN_7 & _sector_hits_T_13;
  wire  hitsVec_1 = vm_enabled & _hitsVec_T_11;
  wire  _GEN_9 = 2'h1 == hitsVec_idx ? sectored_entries_0_2_valid_1 : sectored_entries_0_2_valid_0;
  wire  _GEN_10 = 2'h2 == hitsVec_idx ? sectored_entries_0_2_valid_2 : _GEN_9;
  wire  _GEN_11 = 2'h3 == hitsVec_idx ? sectored_entries_0_2_valid_3 : _GEN_10;
  wire  _hitsVec_T_17 = _GEN_11 & _sector_hits_T_21;
  wire  hitsVec_2 = vm_enabled & _hitsVec_T_17;
  wire  _GEN_13 = 2'h1 == hitsVec_idx ? sectored_entries_0_3_valid_1 : sectored_entries_0_3_valid_0;
  wire  _GEN_14 = 2'h2 == hitsVec_idx ? sectored_entries_0_3_valid_2 : _GEN_13;
  wire  _GEN_15 = 2'h3 == hitsVec_idx ? sectored_entries_0_3_valid_3 : _GEN_14;
  wire  _hitsVec_T_23 = _GEN_15 & _sector_hits_T_29;
  wire  hitsVec_3 = vm_enabled & _hitsVec_T_23;
  wire  _GEN_17 = 2'h1 == hitsVec_idx ? sectored_entries_0_4_valid_1 : sectored_entries_0_4_valid_0;
  wire  _GEN_18 = 2'h2 == hitsVec_idx ? sectored_entries_0_4_valid_2 : _GEN_17;
  wire  _GEN_19 = 2'h3 == hitsVec_idx ? sectored_entries_0_4_valid_3 : _GEN_18;
  wire  _hitsVec_T_29 = _GEN_19 & _sector_hits_T_37;
  wire  hitsVec_4 = vm_enabled & _hitsVec_T_29;
  wire  _GEN_21 = 2'h1 == hitsVec_idx ? sectored_entries_0_5_valid_1 : sectored_entries_0_5_valid_0;
  wire  _GEN_22 = 2'h2 == hitsVec_idx ? sectored_entries_0_5_valid_2 : _GEN_21;
  wire  _GEN_23 = 2'h3 == hitsVec_idx ? sectored_entries_0_5_valid_3 : _GEN_22;
  wire  _hitsVec_T_35 = _GEN_23 & _sector_hits_T_45;
  wire  hitsVec_5 = vm_enabled & _hitsVec_T_35;
  wire  _GEN_25 = 2'h1 == hitsVec_idx ? sectored_entries_0_6_valid_1 : sectored_entries_0_6_valid_0;
  wire  _GEN_26 = 2'h2 == hitsVec_idx ? sectored_entries_0_6_valid_2 : _GEN_25;
  wire  _GEN_27 = 2'h3 == hitsVec_idx ? sectored_entries_0_6_valid_3 : _GEN_26;
  wire  _hitsVec_T_41 = _GEN_27 & _sector_hits_T_53;
  wire  hitsVec_6 = vm_enabled & _hitsVec_T_41;
  wire  _GEN_29 = 2'h1 == hitsVec_idx ? sectored_entries_0_7_valid_1 : sectored_entries_0_7_valid_0;
  wire  _GEN_30 = 2'h2 == hitsVec_idx ? sectored_entries_0_7_valid_2 : _GEN_29;
  wire  _GEN_31 = 2'h3 == hitsVec_idx ? sectored_entries_0_7_valid_3 : _GEN_30;
  wire  _hitsVec_T_47 = _GEN_31 & _sector_hits_T_61;
  wire  hitsVec_7 = vm_enabled & _hitsVec_T_47;
  wire  hitsVec_8 = vm_enabled & superpage_hits_0;
  wire  hitsVec_9 = vm_enabled & superpage_hits_1;
  wire  hitsVec_10 = vm_enabled & superpage_hits_2;
  wire  hitsVec_11 = vm_enabled & superpage_hits_3;
  wire [19:0] _hitsVec_T_88 = special_entry_tag_vpn ^ vpn;
  wire  _hitsVec_T_97 = special_entry_valid_0 & _hitsVec_T_88[19:10] == 10'h0 & (mpu_ppn_ignore | _hitsVec_T_88[9:0] == 10'h0
    );
  wire  hitsVec_12 = vm_enabled & _hitsVec_T_97;
  wire [5:0] real_hits_lo = {hitsVec_5,hitsVec_4,hitsVec_3,hitsVec_2,hitsVec_1,hitsVec_0};
  wire [12:0] real_hits = {hitsVec_12,hitsVec_11,hitsVec_10,hitsVec_9,hitsVec_8,hitsVec_7,hitsVec_6,real_hits_lo};
  wire  _hits_T = ~vm_enabled;
  wire [13:0] hits = {_hits_T,hitsVec_12,hitsVec_11,hitsVec_10,hitsVec_9,hitsVec_8,hitsVec_7,hitsVec_6,real_hits_lo};
  wire  newEntry_g = io_ptw_resp_bits_pte_g & io_ptw_resp_bits_pte_v;
  wire  _newEntry_sr_T_4 = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~
    io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_a;
  wire  newEntry_sr = _newEntry_sr_T_4 & io_ptw_resp_bits_pte_r;
  wire  newEntry_sw = _newEntry_sr_T_4 & io_ptw_resp_bits_pte_w & io_ptw_resp_bits_pte_d;
  wire  newEntry_sx = _newEntry_sr_T_4 & io_ptw_resp_bits_pte_x;
  wire [10:0] special_entry_data_0_lo = {2'h3,prot_w,prot_x,prot_r,_prot_w_T_43,prot_al,prot_al,prot_eff,cacheable,1'h0}
    ;
  wire [4:0] special_entry_data_0_hi_lo = {1'h0,newEntry_sw,newEntry_sx,newEntry_sr,1'h1};
  wire [40:0] _special_entry_data_0_T = {refill_ppn,io_ptw_resp_bits_pte_u,newEntry_g,io_ptw_resp_bits_ae_ptw,
    io_ptw_resp_bits_ae_final,io_ptw_resp_bits_pf,special_entry_data_0_hi_lo,special_entry_data_0_lo};
  wire  _GEN_32 = invalidate_refill ? 1'h0 : 1'h1;
  wire  _GEN_36 = r_superpage_repl_addr == 2'h0 ? _GEN_32 : superpage_entries_0_valid_0;
  wire  _GEN_41 = r_superpage_repl_addr == 2'h1 ? _GEN_32 : superpage_entries_1_valid_0;
  wire  _GEN_46 = r_superpage_repl_addr == 2'h2 ? _GEN_32 : superpage_entries_2_valid_0;
  wire  _GEN_51 = r_superpage_repl_addr == 2'h3 ? _GEN_32 : superpage_entries_3_valid_0;
  wire [2:0] waddr_1 = r_sectored_hit_valid ? r_sectored_hit_bits : r_sectored_repl_addr;
  wire  _GEN_53 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_0_valid_0;
  wire  _GEN_54 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_0_valid_1;
  wire  _GEN_55 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_0_valid_2;
  wire  _GEN_56 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_0_valid_3;
  wire [1:0] idx = r_refill_tag[1:0];
  wire  _GEN_57 = 2'h0 == idx | _GEN_53;
  wire  _GEN_58 = 2'h1 == idx | _GEN_54;
  wire  _GEN_59 = 2'h2 == idx | _GEN_55;
  wire  _GEN_60 = 2'h3 == idx | _GEN_56;
  wire [40:0] _GEN_61 = 2'h0 == idx ? _special_entry_data_0_T : sectored_entries_0_0_data_0;
  wire [40:0] _GEN_62 = 2'h1 == idx ? _special_entry_data_0_T : sectored_entries_0_0_data_1;
  wire [40:0] _GEN_63 = 2'h2 == idx ? _special_entry_data_0_T : sectored_entries_0_0_data_2;
  wire [40:0] _GEN_64 = 2'h3 == idx ? _special_entry_data_0_T : sectored_entries_0_0_data_3;
  wire  _GEN_65 = invalidate_refill ? 1'h0 : _GEN_57;
  wire  _GEN_66 = invalidate_refill ? 1'h0 : _GEN_58;
  wire  _GEN_67 = invalidate_refill ? 1'h0 : _GEN_59;
  wire  _GEN_68 = invalidate_refill ? 1'h0 : _GEN_60;
  wire  _GEN_69 = waddr_1 == 3'h0 ? _GEN_65 : sectored_entries_0_0_valid_0;
  wire  _GEN_70 = waddr_1 == 3'h0 ? _GEN_66 : sectored_entries_0_0_valid_1;
  wire  _GEN_71 = waddr_1 == 3'h0 ? _GEN_67 : sectored_entries_0_0_valid_2;
  wire  _GEN_72 = waddr_1 == 3'h0 ? _GEN_68 : sectored_entries_0_0_valid_3;
  wire  _GEN_80 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_1_valid_0;
  wire  _GEN_81 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_1_valid_1;
  wire  _GEN_82 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_1_valid_2;
  wire  _GEN_83 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_1_valid_3;
  wire  _GEN_84 = 2'h0 == idx | _GEN_80;
  wire  _GEN_85 = 2'h1 == idx | _GEN_81;
  wire  _GEN_86 = 2'h2 == idx | _GEN_82;
  wire  _GEN_87 = 2'h3 == idx | _GEN_83;
  wire [40:0] _GEN_88 = 2'h0 == idx ? _special_entry_data_0_T : sectored_entries_0_1_data_0;
  wire [40:0] _GEN_89 = 2'h1 == idx ? _special_entry_data_0_T : sectored_entries_0_1_data_1;
  wire [40:0] _GEN_90 = 2'h2 == idx ? _special_entry_data_0_T : sectored_entries_0_1_data_2;
  wire [40:0] _GEN_91 = 2'h3 == idx ? _special_entry_data_0_T : sectored_entries_0_1_data_3;
  wire  _GEN_92 = invalidate_refill ? 1'h0 : _GEN_84;
  wire  _GEN_93 = invalidate_refill ? 1'h0 : _GEN_85;
  wire  _GEN_94 = invalidate_refill ? 1'h0 : _GEN_86;
  wire  _GEN_95 = invalidate_refill ? 1'h0 : _GEN_87;
  wire  _GEN_96 = waddr_1 == 3'h1 ? _GEN_92 : sectored_entries_0_1_valid_0;
  wire  _GEN_97 = waddr_1 == 3'h1 ? _GEN_93 : sectored_entries_0_1_valid_1;
  wire  _GEN_98 = waddr_1 == 3'h1 ? _GEN_94 : sectored_entries_0_1_valid_2;
  wire  _GEN_99 = waddr_1 == 3'h1 ? _GEN_95 : sectored_entries_0_1_valid_3;
  wire  _GEN_107 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_2_valid_0;
  wire  _GEN_108 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_2_valid_1;
  wire  _GEN_109 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_2_valid_2;
  wire  _GEN_110 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_2_valid_3;
  wire  _GEN_111 = 2'h0 == idx | _GEN_107;
  wire  _GEN_112 = 2'h1 == idx | _GEN_108;
  wire  _GEN_113 = 2'h2 == idx | _GEN_109;
  wire  _GEN_114 = 2'h3 == idx | _GEN_110;
  wire [40:0] _GEN_115 = 2'h0 == idx ? _special_entry_data_0_T : sectored_entries_0_2_data_0;
  wire [40:0] _GEN_116 = 2'h1 == idx ? _special_entry_data_0_T : sectored_entries_0_2_data_1;
  wire [40:0] _GEN_117 = 2'h2 == idx ? _special_entry_data_0_T : sectored_entries_0_2_data_2;
  wire [40:0] _GEN_118 = 2'h3 == idx ? _special_entry_data_0_T : sectored_entries_0_2_data_3;
  wire  _GEN_119 = invalidate_refill ? 1'h0 : _GEN_111;
  wire  _GEN_120 = invalidate_refill ? 1'h0 : _GEN_112;
  wire  _GEN_121 = invalidate_refill ? 1'h0 : _GEN_113;
  wire  _GEN_122 = invalidate_refill ? 1'h0 : _GEN_114;
  wire  _GEN_123 = waddr_1 == 3'h2 ? _GEN_119 : sectored_entries_0_2_valid_0;
  wire  _GEN_124 = waddr_1 == 3'h2 ? _GEN_120 : sectored_entries_0_2_valid_1;
  wire  _GEN_125 = waddr_1 == 3'h2 ? _GEN_121 : sectored_entries_0_2_valid_2;
  wire  _GEN_126 = waddr_1 == 3'h2 ? _GEN_122 : sectored_entries_0_2_valid_3;
  wire  _GEN_134 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_3_valid_0;
  wire  _GEN_135 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_3_valid_1;
  wire  _GEN_136 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_3_valid_2;
  wire  _GEN_137 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_3_valid_3;
  wire  _GEN_138 = 2'h0 == idx | _GEN_134;
  wire  _GEN_139 = 2'h1 == idx | _GEN_135;
  wire  _GEN_140 = 2'h2 == idx | _GEN_136;
  wire  _GEN_141 = 2'h3 == idx | _GEN_137;
  wire [40:0] _GEN_142 = 2'h0 == idx ? _special_entry_data_0_T : sectored_entries_0_3_data_0;
  wire [40:0] _GEN_143 = 2'h1 == idx ? _special_entry_data_0_T : sectored_entries_0_3_data_1;
  wire [40:0] _GEN_144 = 2'h2 == idx ? _special_entry_data_0_T : sectored_entries_0_3_data_2;
  wire [40:0] _GEN_145 = 2'h3 == idx ? _special_entry_data_0_T : sectored_entries_0_3_data_3;
  wire  _GEN_146 = invalidate_refill ? 1'h0 : _GEN_138;
  wire  _GEN_147 = invalidate_refill ? 1'h0 : _GEN_139;
  wire  _GEN_148 = invalidate_refill ? 1'h0 : _GEN_140;
  wire  _GEN_149 = invalidate_refill ? 1'h0 : _GEN_141;
  wire  _GEN_150 = waddr_1 == 3'h3 ? _GEN_146 : sectored_entries_0_3_valid_0;
  wire  _GEN_151 = waddr_1 == 3'h3 ? _GEN_147 : sectored_entries_0_3_valid_1;
  wire  _GEN_152 = waddr_1 == 3'h3 ? _GEN_148 : sectored_entries_0_3_valid_2;
  wire  _GEN_153 = waddr_1 == 3'h3 ? _GEN_149 : sectored_entries_0_3_valid_3;
  wire  _GEN_161 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_4_valid_0;
  wire  _GEN_162 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_4_valid_1;
  wire  _GEN_163 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_4_valid_2;
  wire  _GEN_164 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_4_valid_3;
  wire  _GEN_165 = 2'h0 == idx | _GEN_161;
  wire  _GEN_166 = 2'h1 == idx | _GEN_162;
  wire  _GEN_167 = 2'h2 == idx | _GEN_163;
  wire  _GEN_168 = 2'h3 == idx | _GEN_164;
  wire [40:0] _GEN_169 = 2'h0 == idx ? _special_entry_data_0_T : sectored_entries_0_4_data_0;
  wire [40:0] _GEN_170 = 2'h1 == idx ? _special_entry_data_0_T : sectored_entries_0_4_data_1;
  wire [40:0] _GEN_171 = 2'h2 == idx ? _special_entry_data_0_T : sectored_entries_0_4_data_2;
  wire [40:0] _GEN_172 = 2'h3 == idx ? _special_entry_data_0_T : sectored_entries_0_4_data_3;
  wire  _GEN_173 = invalidate_refill ? 1'h0 : _GEN_165;
  wire  _GEN_174 = invalidate_refill ? 1'h0 : _GEN_166;
  wire  _GEN_175 = invalidate_refill ? 1'h0 : _GEN_167;
  wire  _GEN_176 = invalidate_refill ? 1'h0 : _GEN_168;
  wire  _GEN_177 = waddr_1 == 3'h4 ? _GEN_173 : sectored_entries_0_4_valid_0;
  wire  _GEN_178 = waddr_1 == 3'h4 ? _GEN_174 : sectored_entries_0_4_valid_1;
  wire  _GEN_179 = waddr_1 == 3'h4 ? _GEN_175 : sectored_entries_0_4_valid_2;
  wire  _GEN_180 = waddr_1 == 3'h4 ? _GEN_176 : sectored_entries_0_4_valid_3;
  wire  _GEN_188 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_5_valid_0;
  wire  _GEN_189 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_5_valid_1;
  wire  _GEN_190 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_5_valid_2;
  wire  _GEN_191 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_5_valid_3;
  wire  _GEN_192 = 2'h0 == idx | _GEN_188;
  wire  _GEN_193 = 2'h1 == idx | _GEN_189;
  wire  _GEN_194 = 2'h2 == idx | _GEN_190;
  wire  _GEN_195 = 2'h3 == idx | _GEN_191;
  wire [40:0] _GEN_196 = 2'h0 == idx ? _special_entry_data_0_T : sectored_entries_0_5_data_0;
  wire [40:0] _GEN_197 = 2'h1 == idx ? _special_entry_data_0_T : sectored_entries_0_5_data_1;
  wire [40:0] _GEN_198 = 2'h2 == idx ? _special_entry_data_0_T : sectored_entries_0_5_data_2;
  wire [40:0] _GEN_199 = 2'h3 == idx ? _special_entry_data_0_T : sectored_entries_0_5_data_3;
  wire  _GEN_200 = invalidate_refill ? 1'h0 : _GEN_192;
  wire  _GEN_201 = invalidate_refill ? 1'h0 : _GEN_193;
  wire  _GEN_202 = invalidate_refill ? 1'h0 : _GEN_194;
  wire  _GEN_203 = invalidate_refill ? 1'h0 : _GEN_195;
  wire  _GEN_204 = waddr_1 == 3'h5 ? _GEN_200 : sectored_entries_0_5_valid_0;
  wire  _GEN_205 = waddr_1 == 3'h5 ? _GEN_201 : sectored_entries_0_5_valid_1;
  wire  _GEN_206 = waddr_1 == 3'h5 ? _GEN_202 : sectored_entries_0_5_valid_2;
  wire  _GEN_207 = waddr_1 == 3'h5 ? _GEN_203 : sectored_entries_0_5_valid_3;
  wire  _GEN_215 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_6_valid_0;
  wire  _GEN_216 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_6_valid_1;
  wire  _GEN_217 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_6_valid_2;
  wire  _GEN_218 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_6_valid_3;
  wire  _GEN_219 = 2'h0 == idx | _GEN_215;
  wire  _GEN_220 = 2'h1 == idx | _GEN_216;
  wire  _GEN_221 = 2'h2 == idx | _GEN_217;
  wire  _GEN_222 = 2'h3 == idx | _GEN_218;
  wire [40:0] _GEN_223 = 2'h0 == idx ? _special_entry_data_0_T : sectored_entries_0_6_data_0;
  wire [40:0] _GEN_224 = 2'h1 == idx ? _special_entry_data_0_T : sectored_entries_0_6_data_1;
  wire [40:0] _GEN_225 = 2'h2 == idx ? _special_entry_data_0_T : sectored_entries_0_6_data_2;
  wire [40:0] _GEN_226 = 2'h3 == idx ? _special_entry_data_0_T : sectored_entries_0_6_data_3;
  wire  _GEN_227 = invalidate_refill ? 1'h0 : _GEN_219;
  wire  _GEN_228 = invalidate_refill ? 1'h0 : _GEN_220;
  wire  _GEN_229 = invalidate_refill ? 1'h0 : _GEN_221;
  wire  _GEN_230 = invalidate_refill ? 1'h0 : _GEN_222;
  wire  _GEN_231 = waddr_1 == 3'h6 ? _GEN_227 : sectored_entries_0_6_valid_0;
  wire  _GEN_232 = waddr_1 == 3'h6 ? _GEN_228 : sectored_entries_0_6_valid_1;
  wire  _GEN_233 = waddr_1 == 3'h6 ? _GEN_229 : sectored_entries_0_6_valid_2;
  wire  _GEN_234 = waddr_1 == 3'h6 ? _GEN_230 : sectored_entries_0_6_valid_3;
  wire  _GEN_242 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_7_valid_0;
  wire  _GEN_243 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_7_valid_1;
  wire  _GEN_244 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_7_valid_2;
  wire  _GEN_245 = ~r_sectored_hit_valid ? 1'h0 : sectored_entries_0_7_valid_3;
  wire  _GEN_246 = 2'h0 == idx | _GEN_242;
  wire  _GEN_247 = 2'h1 == idx | _GEN_243;
  wire  _GEN_248 = 2'h2 == idx | _GEN_244;
  wire  _GEN_249 = 2'h3 == idx | _GEN_245;
  wire [40:0] _GEN_250 = 2'h0 == idx ? _special_entry_data_0_T : sectored_entries_0_7_data_0;
  wire [40:0] _GEN_251 = 2'h1 == idx ? _special_entry_data_0_T : sectored_entries_0_7_data_1;
  wire [40:0] _GEN_252 = 2'h2 == idx ? _special_entry_data_0_T : sectored_entries_0_7_data_2;
  wire [40:0] _GEN_253 = 2'h3 == idx ? _special_entry_data_0_T : sectored_entries_0_7_data_3;
  wire  _GEN_254 = invalidate_refill ? 1'h0 : _GEN_246;
  wire  _GEN_255 = invalidate_refill ? 1'h0 : _GEN_247;
  wire  _GEN_256 = invalidate_refill ? 1'h0 : _GEN_248;
  wire  _GEN_257 = invalidate_refill ? 1'h0 : _GEN_249;
  wire  _GEN_258 = waddr_1 == 3'h7 ? _GEN_254 : sectored_entries_0_7_valid_0;
  wire  _GEN_259 = waddr_1 == 3'h7 ? _GEN_255 : sectored_entries_0_7_valid_1;
  wire  _GEN_260 = waddr_1 == 3'h7 ? _GEN_256 : sectored_entries_0_7_valid_2;
  wire  _GEN_261 = waddr_1 == 3'h7 ? _GEN_257 : sectored_entries_0_7_valid_3;
  wire  _GEN_272 = io_ptw_resp_bits_level < 1'h1 ? _GEN_36 : superpage_entries_0_valid_0;
  wire  _GEN_277 = io_ptw_resp_bits_level < 1'h1 ? _GEN_41 : superpage_entries_1_valid_0;
  wire  _GEN_282 = io_ptw_resp_bits_level < 1'h1 ? _GEN_46 : superpage_entries_2_valid_0;
  wire  _GEN_287 = io_ptw_resp_bits_level < 1'h1 ? _GEN_51 : superpage_entries_3_valid_0;
  wire  _GEN_289 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_0_valid_0 : _GEN_69;
  wire  _GEN_290 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_0_valid_1 : _GEN_70;
  wire  _GEN_291 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_0_valid_2 : _GEN_71;
  wire  _GEN_292 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_0_valid_3 : _GEN_72;
  wire  _GEN_300 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_1_valid_0 : _GEN_96;
  wire  _GEN_301 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_1_valid_1 : _GEN_97;
  wire  _GEN_302 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_1_valid_2 : _GEN_98;
  wire  _GEN_303 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_1_valid_3 : _GEN_99;
  wire  _GEN_311 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_2_valid_0 : _GEN_123;
  wire  _GEN_312 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_2_valid_1 : _GEN_124;
  wire  _GEN_313 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_2_valid_2 : _GEN_125;
  wire  _GEN_314 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_2_valid_3 : _GEN_126;
  wire  _GEN_322 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_3_valid_0 : _GEN_150;
  wire  _GEN_323 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_3_valid_1 : _GEN_151;
  wire  _GEN_324 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_3_valid_2 : _GEN_152;
  wire  _GEN_325 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_3_valid_3 : _GEN_153;
  wire  _GEN_333 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_4_valid_0 : _GEN_177;
  wire  _GEN_334 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_4_valid_1 : _GEN_178;
  wire  _GEN_335 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_4_valid_2 : _GEN_179;
  wire  _GEN_336 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_4_valid_3 : _GEN_180;
  wire  _GEN_344 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_5_valid_0 : _GEN_204;
  wire  _GEN_345 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_5_valid_1 : _GEN_205;
  wire  _GEN_346 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_5_valid_2 : _GEN_206;
  wire  _GEN_347 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_5_valid_3 : _GEN_207;
  wire  _GEN_355 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_6_valid_0 : _GEN_231;
  wire  _GEN_356 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_6_valid_1 : _GEN_232;
  wire  _GEN_357 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_6_valid_2 : _GEN_233;
  wire  _GEN_358 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_6_valid_3 : _GEN_234;
  wire  _GEN_366 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_7_valid_0 : _GEN_258;
  wire  _GEN_367 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_7_valid_1 : _GEN_259;
  wire  _GEN_368 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_7_valid_2 : _GEN_260;
  wire  _GEN_369 = io_ptw_resp_bits_level < 1'h1 ? sectored_entries_0_7_valid_3 : _GEN_261;
  wire  _GEN_380 = ~io_ptw_resp_bits_homogeneous | special_entry_valid_0;
  wire  _GEN_385 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_0_valid_0 : _GEN_272;
  wire  _GEN_390 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_1_valid_0 : _GEN_277;
  wire  _GEN_395 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_2_valid_0 : _GEN_282;
  wire  _GEN_400 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_3_valid_0 : _GEN_287;
  wire  _GEN_402 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_0_valid_0 : _GEN_289;
  wire  _GEN_403 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_0_valid_1 : _GEN_290;
  wire  _GEN_404 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_0_valid_2 : _GEN_291;
  wire  _GEN_405 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_0_valid_3 : _GEN_292;
  wire  _GEN_413 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_1_valid_0 : _GEN_300;
  wire  _GEN_414 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_1_valid_1 : _GEN_301;
  wire  _GEN_415 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_1_valid_2 : _GEN_302;
  wire  _GEN_416 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_1_valid_3 : _GEN_303;
  wire  _GEN_424 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_2_valid_0 : _GEN_311;
  wire  _GEN_425 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_2_valid_1 : _GEN_312;
  wire  _GEN_426 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_2_valid_2 : _GEN_313;
  wire  _GEN_427 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_2_valid_3 : _GEN_314;
  wire  _GEN_435 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_3_valid_0 : _GEN_322;
  wire  _GEN_436 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_3_valid_1 : _GEN_323;
  wire  _GEN_437 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_3_valid_2 : _GEN_324;
  wire  _GEN_438 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_3_valid_3 : _GEN_325;
  wire  _GEN_446 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_4_valid_0 : _GEN_333;
  wire  _GEN_447 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_4_valid_1 : _GEN_334;
  wire  _GEN_448 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_4_valid_2 : _GEN_335;
  wire  _GEN_449 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_4_valid_3 : _GEN_336;
  wire  _GEN_457 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_5_valid_0 : _GEN_344;
  wire  _GEN_458 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_5_valid_1 : _GEN_345;
  wire  _GEN_459 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_5_valid_2 : _GEN_346;
  wire  _GEN_460 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_5_valid_3 : _GEN_347;
  wire  _GEN_468 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_6_valid_0 : _GEN_355;
  wire  _GEN_469 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_6_valid_1 : _GEN_356;
  wire  _GEN_470 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_6_valid_2 : _GEN_357;
  wire  _GEN_471 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_6_valid_3 : _GEN_358;
  wire  _GEN_479 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_7_valid_0 : _GEN_366;
  wire  _GEN_480 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_7_valid_1 : _GEN_367;
  wire  _GEN_481 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_7_valid_2 : _GEN_368;
  wire  _GEN_482 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_7_valid_3 : _GEN_369;
  wire  _GEN_493 = io_ptw_resp_valid ? _GEN_380 : special_entry_valid_0;
  wire  _GEN_498 = io_ptw_resp_valid ? _GEN_385 : superpage_entries_0_valid_0;
  wire  _GEN_503 = io_ptw_resp_valid ? _GEN_390 : superpage_entries_1_valid_0;
  wire  _GEN_508 = io_ptw_resp_valid ? _GEN_395 : superpage_entries_2_valid_0;
  wire  _GEN_513 = io_ptw_resp_valid ? _GEN_400 : superpage_entries_3_valid_0;
  wire  _GEN_515 = io_ptw_resp_valid ? _GEN_402 : sectored_entries_0_0_valid_0;
  wire  _GEN_516 = io_ptw_resp_valid ? _GEN_403 : sectored_entries_0_0_valid_1;
  wire  _GEN_517 = io_ptw_resp_valid ? _GEN_404 : sectored_entries_0_0_valid_2;
  wire  _GEN_518 = io_ptw_resp_valid ? _GEN_405 : sectored_entries_0_0_valid_3;
  wire  _GEN_526 = io_ptw_resp_valid ? _GEN_413 : sectored_entries_0_1_valid_0;
  wire  _GEN_527 = io_ptw_resp_valid ? _GEN_414 : sectored_entries_0_1_valid_1;
  wire  _GEN_528 = io_ptw_resp_valid ? _GEN_415 : sectored_entries_0_1_valid_2;
  wire  _GEN_529 = io_ptw_resp_valid ? _GEN_416 : sectored_entries_0_1_valid_3;
  wire  _GEN_537 = io_ptw_resp_valid ? _GEN_424 : sectored_entries_0_2_valid_0;
  wire  _GEN_538 = io_ptw_resp_valid ? _GEN_425 : sectored_entries_0_2_valid_1;
  wire  _GEN_539 = io_ptw_resp_valid ? _GEN_426 : sectored_entries_0_2_valid_2;
  wire  _GEN_540 = io_ptw_resp_valid ? _GEN_427 : sectored_entries_0_2_valid_3;
  wire  _GEN_548 = io_ptw_resp_valid ? _GEN_435 : sectored_entries_0_3_valid_0;
  wire  _GEN_549 = io_ptw_resp_valid ? _GEN_436 : sectored_entries_0_3_valid_1;
  wire  _GEN_550 = io_ptw_resp_valid ? _GEN_437 : sectored_entries_0_3_valid_2;
  wire  _GEN_551 = io_ptw_resp_valid ? _GEN_438 : sectored_entries_0_3_valid_3;
  wire  _GEN_559 = io_ptw_resp_valid ? _GEN_446 : sectored_entries_0_4_valid_0;
  wire  _GEN_560 = io_ptw_resp_valid ? _GEN_447 : sectored_entries_0_4_valid_1;
  wire  _GEN_561 = io_ptw_resp_valid ? _GEN_448 : sectored_entries_0_4_valid_2;
  wire  _GEN_562 = io_ptw_resp_valid ? _GEN_449 : sectored_entries_0_4_valid_3;
  wire  _GEN_570 = io_ptw_resp_valid ? _GEN_457 : sectored_entries_0_5_valid_0;
  wire  _GEN_571 = io_ptw_resp_valid ? _GEN_458 : sectored_entries_0_5_valid_1;
  wire  _GEN_572 = io_ptw_resp_valid ? _GEN_459 : sectored_entries_0_5_valid_2;
  wire  _GEN_573 = io_ptw_resp_valid ? _GEN_460 : sectored_entries_0_5_valid_3;
  wire  _GEN_581 = io_ptw_resp_valid ? _GEN_468 : sectored_entries_0_6_valid_0;
  wire  _GEN_582 = io_ptw_resp_valid ? _GEN_469 : sectored_entries_0_6_valid_1;
  wire  _GEN_583 = io_ptw_resp_valid ? _GEN_470 : sectored_entries_0_6_valid_2;
  wire  _GEN_584 = io_ptw_resp_valid ? _GEN_471 : sectored_entries_0_6_valid_3;
  wire  _GEN_592 = io_ptw_resp_valid ? _GEN_479 : sectored_entries_0_7_valid_0;
  wire  _GEN_593 = io_ptw_resp_valid ? _GEN_480 : sectored_entries_0_7_valid_1;
  wire  _GEN_594 = io_ptw_resp_valid ? _GEN_481 : sectored_entries_0_7_valid_2;
  wire  _GEN_595 = io_ptw_resp_valid ? _GEN_482 : sectored_entries_0_7_valid_3;
  wire [40:0] _GEN_607 = 2'h1 == hitsVec_idx ? sectored_entries_0_0_data_1 : sectored_entries_0_0_data_0;
  wire [40:0] _GEN_608 = 2'h2 == hitsVec_idx ? sectored_entries_0_0_data_2 : _GEN_607;
  wire [40:0] _GEN_609 = 2'h3 == hitsVec_idx ? sectored_entries_0_0_data_3 : _GEN_608;
  wire [40:0] _GEN_611 = 2'h1 == hitsVec_idx ? sectored_entries_0_1_data_1 : sectored_entries_0_1_data_0;
  wire [40:0] _GEN_612 = 2'h2 == hitsVec_idx ? sectored_entries_0_1_data_2 : _GEN_611;
  wire [40:0] _GEN_613 = 2'h3 == hitsVec_idx ? sectored_entries_0_1_data_3 : _GEN_612;
  wire [40:0] _GEN_615 = 2'h1 == hitsVec_idx ? sectored_entries_0_2_data_1 : sectored_entries_0_2_data_0;
  wire [40:0] _GEN_616 = 2'h2 == hitsVec_idx ? sectored_entries_0_2_data_2 : _GEN_615;
  wire [40:0] _GEN_617 = 2'h3 == hitsVec_idx ? sectored_entries_0_2_data_3 : _GEN_616;
  wire [40:0] _GEN_619 = 2'h1 == hitsVec_idx ? sectored_entries_0_3_data_1 : sectored_entries_0_3_data_0;
  wire [40:0] _GEN_620 = 2'h2 == hitsVec_idx ? sectored_entries_0_3_data_2 : _GEN_619;
  wire [40:0] _GEN_621 = 2'h3 == hitsVec_idx ? sectored_entries_0_3_data_3 : _GEN_620;
  wire [40:0] _GEN_623 = 2'h1 == hitsVec_idx ? sectored_entries_0_4_data_1 : sectored_entries_0_4_data_0;
  wire [40:0] _GEN_624 = 2'h2 == hitsVec_idx ? sectored_entries_0_4_data_2 : _GEN_623;
  wire [40:0] _GEN_625 = 2'h3 == hitsVec_idx ? sectored_entries_0_4_data_3 : _GEN_624;
  wire [40:0] _GEN_627 = 2'h1 == hitsVec_idx ? sectored_entries_0_5_data_1 : sectored_entries_0_5_data_0;
  wire [40:0] _GEN_628 = 2'h2 == hitsVec_idx ? sectored_entries_0_5_data_2 : _GEN_627;
  wire [40:0] _GEN_629 = 2'h3 == hitsVec_idx ? sectored_entries_0_5_data_3 : _GEN_628;
  wire [40:0] _GEN_631 = 2'h1 == hitsVec_idx ? sectored_entries_0_6_data_1 : sectored_entries_0_6_data_0;
  wire [40:0] _GEN_632 = 2'h2 == hitsVec_idx ? sectored_entries_0_6_data_2 : _GEN_631;
  wire [40:0] _GEN_633 = 2'h3 == hitsVec_idx ? sectored_entries_0_6_data_3 : _GEN_632;
  wire [40:0] _GEN_635 = 2'h1 == hitsVec_idx ? sectored_entries_0_7_data_1 : sectored_entries_0_7_data_0;
  wire [40:0] _GEN_636 = 2'h2 == hitsVec_idx ? sectored_entries_0_7_data_2 : _GEN_635;
  wire [40:0] _GEN_637 = 2'h3 == hitsVec_idx ? sectored_entries_0_7_data_3 : _GEN_636;
  wire [9:0] ppn_res = entries_barrier_8_io_y_ppn[19:10];
  wire [19:0] _ppn_T_2 = vpn | entries_barrier_8_io_y_ppn;
  wire [19:0] _ppn_T_4 = {ppn_res,_ppn_T_2[9:0]};
  wire [9:0] ppn_res_1 = entries_barrier_9_io_y_ppn[19:10];
  wire [19:0] _ppn_T_6 = vpn | entries_barrier_9_io_y_ppn;
  wire [19:0] _ppn_T_8 = {ppn_res_1,_ppn_T_6[9:0]};
  wire [9:0] ppn_res_2 = entries_barrier_10_io_y_ppn[19:10];
  wire [19:0] _ppn_T_10 = vpn | entries_barrier_10_io_y_ppn;
  wire [19:0] _ppn_T_12 = {ppn_res_2,_ppn_T_10[9:0]};
  wire [9:0] ppn_res_3 = entries_barrier_11_io_y_ppn[19:10];
  wire [19:0] _ppn_T_14 = vpn | entries_barrier_11_io_y_ppn;
  wire [19:0] _ppn_T_16 = {ppn_res_3,_ppn_T_14[9:0]};
  wire [9:0] ppn_res_4 = entries_barrier_12_io_y_ppn[19:10];
  wire [19:0] _ppn_T_18 = _mpu_ppn_T_23 | entries_barrier_12_io_y_ppn;
  wire [19:0] _ppn_T_20 = {ppn_res_4,_ppn_T_18[9:0]};
  wire [19:0] _ppn_T_22 = hitsVec_0 ? entries_barrier_io_y_ppn : 20'h0;
  wire [19:0] _ppn_T_23 = hitsVec_1 ? entries_barrier_1_io_y_ppn : 20'h0;
  wire [19:0] _ppn_T_24 = hitsVec_2 ? entries_barrier_2_io_y_ppn : 20'h0;
  wire [19:0] _ppn_T_25 = hitsVec_3 ? entries_barrier_3_io_y_ppn : 20'h0;
  wire [19:0] _ppn_T_26 = hitsVec_4 ? entries_barrier_4_io_y_ppn : 20'h0;
  wire [19:0] _ppn_T_27 = hitsVec_5 ? entries_barrier_5_io_y_ppn : 20'h0;
  wire [19:0] _ppn_T_28 = hitsVec_6 ? entries_barrier_6_io_y_ppn : 20'h0;
  wire [19:0] _ppn_T_29 = hitsVec_7 ? entries_barrier_7_io_y_ppn : 20'h0;
  wire [19:0] _ppn_T_30 = hitsVec_8 ? _ppn_T_4 : 20'h0;
  wire [19:0] _ppn_T_31 = hitsVec_9 ? _ppn_T_8 : 20'h0;
  wire [19:0] _ppn_T_32 = hitsVec_10 ? _ppn_T_12 : 20'h0;
  wire [19:0] _ppn_T_33 = hitsVec_11 ? _ppn_T_16 : 20'h0;
  wire [19:0] _ppn_T_34 = hitsVec_12 ? _ppn_T_20 : 20'h0;
  wire [19:0] _ppn_T_35 = _hits_T ? vpn : 20'h0;
  wire [19:0] _ppn_T_36 = _ppn_T_22 | _ppn_T_23;
  wire [19:0] _ppn_T_37 = _ppn_T_36 | _ppn_T_24;
  wire [19:0] _ppn_T_38 = _ppn_T_37 | _ppn_T_25;
  wire [19:0] _ppn_T_39 = _ppn_T_38 | _ppn_T_26;
  wire [19:0] _ppn_T_40 = _ppn_T_39 | _ppn_T_27;
  wire [19:0] _ppn_T_41 = _ppn_T_40 | _ppn_T_28;
  wire [19:0] _ppn_T_42 = _ppn_T_41 | _ppn_T_29;
  wire [19:0] _ppn_T_43 = _ppn_T_42 | _ppn_T_30;
  wire [19:0] _ppn_T_44 = _ppn_T_43 | _ppn_T_31;
  wire [19:0] _ppn_T_45 = _ppn_T_44 | _ppn_T_32;
  wire [19:0] _ppn_T_46 = _ppn_T_45 | _ppn_T_33;
  wire [19:0] _ppn_T_47 = _ppn_T_46 | _ppn_T_34;
  wire [19:0] ppn = _ppn_T_47 | _ppn_T_35;
  wire [5:0] ptw_ae_array_lo = {entries_barrier_5_io_y_ae_ptw,entries_barrier_4_io_y_ae_ptw,
    entries_barrier_3_io_y_ae_ptw,entries_barrier_2_io_y_ae_ptw,entries_barrier_1_io_y_ae_ptw,
    entries_barrier_io_y_ae_ptw};
  wire [13:0] ptw_ae_array = {1'h0,entries_barrier_12_io_y_ae_ptw,entries_barrier_11_io_y_ae_ptw,
    entries_barrier_10_io_y_ae_ptw,entries_barrier_9_io_y_ae_ptw,entries_barrier_8_io_y_ae_ptw,
    entries_barrier_7_io_y_ae_ptw,entries_barrier_6_io_y_ae_ptw,ptw_ae_array_lo};
  wire [5:0] final_ae_array_lo = {entries_barrier_5_io_y_ae_final,entries_barrier_4_io_y_ae_final,
    entries_barrier_3_io_y_ae_final,entries_barrier_2_io_y_ae_final,entries_barrier_1_io_y_ae_final,
    entries_barrier_io_y_ae_final};
  wire [13:0] final_ae_array = {1'h0,entries_barrier_12_io_y_ae_final,entries_barrier_11_io_y_ae_final,
    entries_barrier_10_io_y_ae_final,entries_barrier_9_io_y_ae_final,entries_barrier_8_io_y_ae_final,
    entries_barrier_7_io_y_ae_final,entries_barrier_6_io_y_ae_final,final_ae_array_lo};
  wire [5:0] ptw_pf_array_lo = {entries_barrier_5_io_y_pf,entries_barrier_4_io_y_pf,entries_barrier_3_io_y_pf,
    entries_barrier_2_io_y_pf,entries_barrier_1_io_y_pf,entries_barrier_io_y_pf};
  wire [13:0] ptw_pf_array = {1'h0,entries_barrier_12_io_y_pf,entries_barrier_11_io_y_pf,entries_barrier_10_io_y_pf,
    entries_barrier_9_io_y_pf,entries_barrier_8_io_y_pf,entries_barrier_7_io_y_pf,entries_barrier_6_io_y_pf,
    ptw_pf_array_lo};
  wire [5:0] ptw_gf_array_lo = {entries_barrier_5_io_y_gf,entries_barrier_4_io_y_gf,entries_barrier_3_io_y_gf,
    entries_barrier_2_io_y_gf,entries_barrier_1_io_y_gf,entries_barrier_io_y_gf};
  wire [13:0] ptw_gf_array = {1'h0,entries_barrier_12_io_y_gf,entries_barrier_11_io_y_gf,entries_barrier_10_io_y_gf,
    entries_barrier_9_io_y_gf,entries_barrier_8_io_y_gf,entries_barrier_7_io_y_gf,entries_barrier_6_io_y_gf,
    ptw_gf_array_lo};
  wire [5:0] priv_rw_ok_lo = {entries_barrier_5_io_y_u,entries_barrier_4_io_y_u,entries_barrier_3_io_y_u,
    entries_barrier_2_io_y_u,entries_barrier_1_io_y_u,entries_barrier_io_y_u};
  wire [12:0] _priv_rw_ok_T_2 = {entries_barrier_12_io_y_u,entries_barrier_11_io_y_u,entries_barrier_10_io_y_u,
    entries_barrier_9_io_y_u,entries_barrier_8_io_y_u,entries_barrier_7_io_y_u,entries_barrier_6_io_y_u,priv_rw_ok_lo};
  wire [12:0] _priv_rw_ok_T_5 = ~_priv_rw_ok_T_2;
  wire [12:0] priv_x_ok = priv_s ? _priv_rw_ok_T_5 : _priv_rw_ok_T_2;
  wire [5:0] r_array_lo_1 = {entries_barrier_5_io_y_sx,entries_barrier_4_io_y_sx,entries_barrier_3_io_y_sx,
    entries_barrier_2_io_y_sx,entries_barrier_1_io_y_sx,entries_barrier_io_y_sx};
  wire [12:0] _r_array_T_1 = {entries_barrier_12_io_y_sx,entries_barrier_11_io_y_sx,entries_barrier_10_io_y_sx,
    entries_barrier_9_io_y_sx,entries_barrier_8_io_y_sx,entries_barrier_7_io_y_sx,entries_barrier_6_io_y_sx,r_array_lo_1
    };
  wire [12:0] _x_array_T_1 = priv_x_ok & _r_array_T_1;
  wire [13:0] x_array = {1'h1,_x_array_T_1};
  wire [13:0] _pr_array_T_4 = ptw_ae_array | final_ae_array;
  wire [13:0] _pr_array_T_5 = ~_pr_array_T_4;
  wire [1:0] _px_array_T_1 = prot_x ? 2'h3 : 2'h0;
  wire [5:0] px_array_lo = {entries_barrier_5_io_y_px,entries_barrier_4_io_y_px,entries_barrier_3_io_y_px,
    entries_barrier_2_io_y_px,entries_barrier_1_io_y_px,entries_barrier_io_y_px};
  wire [13:0] _px_array_T_3 = {_px_array_T_1,entries_barrier_11_io_y_px,entries_barrier_10_io_y_px,
    entries_barrier_9_io_y_px,entries_barrier_8_io_y_px,entries_barrier_7_io_y_px,entries_barrier_6_io_y_px,px_array_lo}
    ;
  wire [13:0] px_array = _px_array_T_3 & _pr_array_T_5;
  wire [1:0] _c_array_T_1 = cacheable ? 2'h3 : 2'h0;
  wire [5:0] c_array_lo = {entries_barrier_5_io_y_c,entries_barrier_4_io_y_c,entries_barrier_3_io_y_c,
    entries_barrier_2_io_y_c,entries_barrier_1_io_y_c,entries_barrier_io_y_c};
  wire [13:0] c_array = {_c_array_T_1,entries_barrier_11_io_y_c,entries_barrier_10_io_y_c,entries_barrier_9_io_y_c,
    entries_barrier_8_io_y_c,entries_barrier_7_io_y_c,entries_barrier_6_io_y_c,c_array_lo};
  wire [13:0] _pf_ld_array_T_2 = ~ptw_ae_array;
  wire [13:0] _pf_ld_array_T_5 = ~ptw_gf_array;
  wire [13:0] _pf_inst_array_T = ~x_array;
  wire [13:0] _pf_inst_array_T_2 = _pf_inst_array_T & _pf_ld_array_T_2;
  wire [13:0] _pf_inst_array_T_3 = _pf_inst_array_T_2 | ptw_pf_array;
  wire [13:0] pf_inst_array = _pf_inst_array_T_3 & _pf_ld_array_T_5;
  wire  tlb_hit_if_not_gpa_miss = |real_hits;
  wire  tlb_miss = vm_enabled & ~tlb_hit_if_not_gpa_miss;
  reg [6:0] state_vec_0;
  reg [2:0] state_reg_1;
  wire  _T_30 = sector_hits_0 | sector_hits_1 | sector_hits_2 | sector_hits_3 | sector_hits_4 | sector_hits_5 |
    sector_hits_6 | sector_hits_7;
  wire [7:0] _T_31 = {sector_hits_7,sector_hits_6,sector_hits_5,sector_hits_4,sector_hits_3,sector_hits_2,sector_hits_1,
    sector_hits_0};
  wire [3:0] hi_1 = _T_31[7:4];
  wire [3:0] lo_1 = _T_31[3:0];
  wire  _T_32 = |hi_1;
  wire [3:0] _T_33 = hi_1 | lo_1;
  wire [1:0] hi_2 = _T_33[3:2];
  wire [1:0] lo_2 = _T_33[1:0];
  wire  _T_34 = |hi_2;
  wire [1:0] _T_35 = hi_2 | lo_2;
  wire [2:0] state_vec_0_touch_way_sized = {_T_32,_T_34,_T_35[1]};
  wire  state_vec_0_set_left_older = ~state_vec_0_touch_way_sized[2];
  wire [2:0] state_vec_0_left_subtree_state = state_vec_0[5:3];
  wire [2:0] state_vec_0_right_subtree_state = state_vec_0[2:0];
  wire  state_vec_0_set_left_older_1 = ~state_vec_0_touch_way_sized[1];
  wire  state_vec_0_left_subtree_state_1 = state_vec_0_left_subtree_state[1];
  wire  state_vec_0_right_subtree_state_1 = state_vec_0_left_subtree_state[0];
  wire  _state_vec_0_T_3 = ~state_vec_0_touch_way_sized[0];
  wire  _state_vec_0_T_4 = state_vec_0_set_left_older_1 ? state_vec_0_left_subtree_state_1 : _state_vec_0_T_3;
  wire  _state_vec_0_T_8 = state_vec_0_set_left_older_1 ? _state_vec_0_T_3 : state_vec_0_right_subtree_state_1;
  wire [2:0] _state_vec_0_T_9 = {state_vec_0_set_left_older_1,_state_vec_0_T_4,_state_vec_0_T_8};
  wire [2:0] _state_vec_0_T_10 = state_vec_0_set_left_older ? state_vec_0_left_subtree_state : _state_vec_0_T_9;
  wire  state_vec_0_left_subtree_state_2 = state_vec_0_right_subtree_state[1];
  wire  state_vec_0_right_subtree_state_2 = state_vec_0_right_subtree_state[0];
  wire  _state_vec_0_T_15 = state_vec_0_set_left_older_1 ? state_vec_0_left_subtree_state_2 : _state_vec_0_T_3;
  wire  _state_vec_0_T_19 = state_vec_0_set_left_older_1 ? _state_vec_0_T_3 : state_vec_0_right_subtree_state_2;
  wire [2:0] _state_vec_0_T_20 = {state_vec_0_set_left_older_1,_state_vec_0_T_15,_state_vec_0_T_19};
  wire [2:0] _state_vec_0_T_21 = state_vec_0_set_left_older ? _state_vec_0_T_20 : state_vec_0_right_subtree_state;
  wire [6:0] _state_vec_0_T_22 = {state_vec_0_set_left_older,_state_vec_0_T_10,_state_vec_0_T_21};
  wire  _T_41 = superpage_hits_0 | superpage_hits_1 | superpage_hits_2 | superpage_hits_3;
  wire [3:0] _T_42 = {superpage_hits_3,superpage_hits_2,superpage_hits_1,superpage_hits_0};
  wire [1:0] hi_4 = _T_42[3:2];
  wire [1:0] lo_4 = _T_42[1:0];
  wire  _T_43 = |hi_4;
  wire [1:0] _T_44 = hi_4 | lo_4;
  wire [1:0] state_reg_touch_way_sized = {_T_43,_T_44[1]};
  wire  state_reg_set_left_older = ~state_reg_touch_way_sized[1];
  wire  state_reg_left_subtree_state = state_reg_1[1];
  wire  state_reg_right_subtree_state = state_reg_1[0];
  wire  _state_reg_T_2 = ~state_reg_touch_way_sized[0];
  wire  _state_reg_T_3 = state_reg_set_left_older ? state_reg_left_subtree_state : _state_reg_T_2;
  wire  _state_reg_T_7 = state_reg_set_left_older ? _state_reg_T_2 : state_reg_right_subtree_state;
  wire [2:0] _state_reg_T_8 = {state_reg_set_left_older,_state_reg_T_3,_state_reg_T_7};
  wire  multipleHits_leftOne = real_hits[0];
  wire  multipleHits_leftOne_1 = real_hits[1];
  wire  multipleHits_rightOne = real_hits[2];
  wire  multipleHits_rightOne_1 = multipleHits_leftOne_1 | multipleHits_rightOne;
  wire  multipleHits_rightTwo = multipleHits_leftOne_1 & multipleHits_rightOne;
  wire  multipleHits_leftOne_2 = multipleHits_leftOne | multipleHits_rightOne_1;
  wire  multipleHits_leftTwo = multipleHits_rightTwo | multipleHits_leftOne & multipleHits_rightOne_1;
  wire  multipleHits_leftOne_3 = real_hits[3];
  wire  multipleHits_leftOne_4 = real_hits[4];
  wire  multipleHits_rightOne_2 = real_hits[5];
  wire  multipleHits_rightOne_3 = multipleHits_leftOne_4 | multipleHits_rightOne_2;
  wire  multipleHits_rightTwo_1 = multipleHits_leftOne_4 & multipleHits_rightOne_2;
  wire  multipleHits_rightOne_4 = multipleHits_leftOne_3 | multipleHits_rightOne_3;
  wire  multipleHits_rightTwo_2 = multipleHits_rightTwo_1 | multipleHits_leftOne_3 & multipleHits_rightOne_3;
  wire  multipleHits_leftOne_5 = multipleHits_leftOne_2 | multipleHits_rightOne_4;
  wire  multipleHits_leftTwo_1 = multipleHits_leftTwo | multipleHits_rightTwo_2 | multipleHits_leftOne_2 &
    multipleHits_rightOne_4;
  wire  multipleHits_leftOne_6 = real_hits[6];
  wire  multipleHits_leftOne_7 = real_hits[7];
  wire  multipleHits_rightOne_5 = real_hits[8];
  wire  multipleHits_rightOne_6 = multipleHits_leftOne_7 | multipleHits_rightOne_5;
  wire  multipleHits_rightTwo_3 = multipleHits_leftOne_7 & multipleHits_rightOne_5;
  wire  multipleHits_leftOne_8 = multipleHits_leftOne_6 | multipleHits_rightOne_6;
  wire  multipleHits_leftTwo_2 = multipleHits_rightTwo_3 | multipleHits_leftOne_6 & multipleHits_rightOne_6;
  wire  multipleHits_leftOne_9 = real_hits[9];
  wire  multipleHits_rightOne_7 = real_hits[10];
  wire  multipleHits_leftOne_10 = multipleHits_leftOne_9 | multipleHits_rightOne_7;
  wire  multipleHits_leftTwo_3 = multipleHits_leftOne_9 & multipleHits_rightOne_7;
  wire  multipleHits_leftOne_11 = real_hits[11];
  wire  multipleHits_rightOne_8 = real_hits[12];
  wire  multipleHits_rightOne_9 = multipleHits_leftOne_11 | multipleHits_rightOne_8;
  wire  multipleHits_rightTwo_4 = multipleHits_leftOne_11 & multipleHits_rightOne_8;
  wire  multipleHits_rightOne_10 = multipleHits_leftOne_10 | multipleHits_rightOne_9;
  wire  multipleHits_rightTwo_5 = multipleHits_leftTwo_3 | multipleHits_rightTwo_4 | multipleHits_leftOne_10 &
    multipleHits_rightOne_9;
  wire  multipleHits_rightOne_11 = multipleHits_leftOne_8 | multipleHits_rightOne_10;
  wire  multipleHits_rightTwo_6 = multipleHits_leftTwo_2 | multipleHits_rightTwo_5 | multipleHits_leftOne_8 &
    multipleHits_rightOne_10;
  wire  multipleHits = multipleHits_leftTwo_1 | multipleHits_rightTwo_6 | multipleHits_leftOne_5 &
    multipleHits_rightOne_11;
  wire [13:0] _io_resp_pf_inst_T = pf_inst_array & hits;
  wire [13:0] _io_resp_ae_inst_T = ~px_array;
  wire [13:0] _io_resp_ae_inst_T_1 = _io_resp_ae_inst_T & hits;
  wire [13:0] _io_resp_cacheable_T = c_array & hits;
  wire  _T_49 = io_req_ready & io_req_valid;
  wire  r_superpage_repl_addr_left_subtree_older = state_reg_1[2];
  wire  _r_superpage_repl_addr_T_2 = r_superpage_repl_addr_left_subtree_older ? state_reg_left_subtree_state :
    state_reg_right_subtree_state;
  wire [1:0] _r_superpage_repl_addr_T_3 = {r_superpage_repl_addr_left_subtree_older,_r_superpage_repl_addr_T_2};
  wire [3:0] r_superpage_repl_addr_valids = {superpage_entries_3_valid_0,superpage_entries_2_valid_0,
    superpage_entries_1_valid_0,superpage_entries_0_valid_0};
  wire [3:0] _r_superpage_repl_addr_T_5 = ~r_superpage_repl_addr_valids;
  wire [1:0] _r_superpage_repl_addr_T_10 = _r_superpage_repl_addr_T_5[2] ? 2'h2 : 2'h3;
  wire  r_sectored_repl_addr_left_subtree_older = state_vec_0[6];
  wire  r_sectored_repl_addr_left_subtree_older_1 = state_vec_0_left_subtree_state[2];
  wire  _r_sectored_repl_addr_T_2 = r_sectored_repl_addr_left_subtree_older_1 ? state_vec_0_left_subtree_state_1 :
    state_vec_0_right_subtree_state_1;
  wire [1:0] _r_sectored_repl_addr_T_3 = {r_sectored_repl_addr_left_subtree_older_1,_r_sectored_repl_addr_T_2};
  wire  r_sectored_repl_addr_left_subtree_older_2 = state_vec_0_right_subtree_state[2];
  wire  _r_sectored_repl_addr_T_6 = r_sectored_repl_addr_left_subtree_older_2 ? state_vec_0_left_subtree_state_2 :
    state_vec_0_right_subtree_state_2;
  wire [1:0] _r_sectored_repl_addr_T_7 = {r_sectored_repl_addr_left_subtree_older_2,_r_sectored_repl_addr_T_6};
  wire [1:0] _r_sectored_repl_addr_T_8 = r_sectored_repl_addr_left_subtree_older ? _r_sectored_repl_addr_T_3 :
    _r_sectored_repl_addr_T_7;
  wire [2:0] _r_sectored_repl_addr_T_9 = {r_sectored_repl_addr_left_subtree_older,_r_sectored_repl_addr_T_8};
  wire [7:0] r_sectored_repl_addr_valids = {_sector_hits_T_58,_sector_hits_T_50,_sector_hits_T_42,_sector_hits_T_34,
    _sector_hits_T_26,_sector_hits_T_18,_sector_hits_T_10,_sector_hits_T_2};
  wire [7:0] _r_sectored_repl_addr_T_11 = ~r_sectored_repl_addr_valids;
  wire [2:0] _r_sectored_repl_addr_T_20 = _r_sectored_repl_addr_T_11[6] ? 3'h6 : 3'h7;
  wire [2:0] _r_sectored_repl_addr_T_21 = _r_sectored_repl_addr_T_11[5] ? 3'h5 : _r_sectored_repl_addr_T_20;
  wire [2:0] _r_sectored_repl_addr_T_22 = _r_sectored_repl_addr_T_11[4] ? 3'h4 : _r_sectored_repl_addr_T_21;
  wire [2:0] _r_sectored_repl_addr_T_23 = _r_sectored_repl_addr_T_11[3] ? 3'h3 : _r_sectored_repl_addr_T_22;
  wire [2:0] _r_sectored_repl_addr_T_24 = _r_sectored_repl_addr_T_11[2] ? 3'h2 : _r_sectored_repl_addr_T_23;
  wire [1:0] _GEN_644 = _T_49 & tlb_miss ? 2'h1 : state;
  wire [1:0] _GEN_655 = io_sfence_valid ? 2'h0 : _GEN_644;
  wire [1:0] _state_T = io_sfence_valid ? 2'h3 : 2'h2;
  wire [1:0] _GEN_656 = io_ptw_req_ready ? _state_T : _GEN_655;
  wire [1:0] _GEN_657 = io_kill ? 2'h0 : _GEN_656;
  wire  _GEN_661 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_515;
  wire  _GEN_662 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_516;
  wire  _GEN_663 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_517;
  wire  _GEN_664 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_518;
  wire  _GEN_665 = _sector_hits_T_5 ? _GEN_661 : _GEN_515;
  wire  _GEN_666 = _sector_hits_T_5 ? _GEN_662 : _GEN_516;
  wire  _GEN_667 = _sector_hits_T_5 ? _GEN_663 : _GEN_517;
  wire  _GEN_668 = _sector_hits_T_5 ? _GEN_664 : _GEN_518;
  wire  _GEN_669 = sectored_entries_0_0_data_0[0] ? 1'h0 : _GEN_665;
  wire  _GEN_670 = sectored_entries_0_0_data_1[0] ? 1'h0 : _GEN_666;
  wire  _GEN_671 = sectored_entries_0_0_data_2[0] ? 1'h0 : _GEN_667;
  wire  _GEN_672 = sectored_entries_0_0_data_3[0] ? 1'h0 : _GEN_668;
  wire  _GEN_677 = ~sectored_entries_0_0_data_0[19] ? 1'h0 : _GEN_515;
  wire  _GEN_678 = ~sectored_entries_0_0_data_1[19] ? 1'h0 : _GEN_516;
  wire  _GEN_679 = ~sectored_entries_0_0_data_2[19] ? 1'h0 : _GEN_517;
  wire  _GEN_680 = ~sectored_entries_0_0_data_3[19] ? 1'h0 : _GEN_518;
  wire  _GEN_685 = io_sfence_bits_rs2 & _GEN_677;
  wire  _GEN_686 = io_sfence_bits_rs2 & _GEN_678;
  wire  _GEN_687 = io_sfence_bits_rs2 & _GEN_679;
  wire  _GEN_688 = io_sfence_bits_rs2 & _GEN_680;
  wire  _GEN_693 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_526;
  wire  _GEN_694 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_527;
  wire  _GEN_695 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_528;
  wire  _GEN_696 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_529;
  wire  _GEN_697 = _sector_hits_T_13 ? _GEN_693 : _GEN_526;
  wire  _GEN_698 = _sector_hits_T_13 ? _GEN_694 : _GEN_527;
  wire  _GEN_699 = _sector_hits_T_13 ? _GEN_695 : _GEN_528;
  wire  _GEN_700 = _sector_hits_T_13 ? _GEN_696 : _GEN_529;
  wire  _GEN_701 = sectored_entries_0_1_data_0[0] ? 1'h0 : _GEN_697;
  wire  _GEN_702 = sectored_entries_0_1_data_1[0] ? 1'h0 : _GEN_698;
  wire  _GEN_703 = sectored_entries_0_1_data_2[0] ? 1'h0 : _GEN_699;
  wire  _GEN_704 = sectored_entries_0_1_data_3[0] ? 1'h0 : _GEN_700;
  wire  _GEN_709 = ~sectored_entries_0_1_data_0[19] ? 1'h0 : _GEN_526;
  wire  _GEN_710 = ~sectored_entries_0_1_data_1[19] ? 1'h0 : _GEN_527;
  wire  _GEN_711 = ~sectored_entries_0_1_data_2[19] ? 1'h0 : _GEN_528;
  wire  _GEN_712 = ~sectored_entries_0_1_data_3[19] ? 1'h0 : _GEN_529;
  wire  _GEN_717 = io_sfence_bits_rs2 & _GEN_709;
  wire  _GEN_718 = io_sfence_bits_rs2 & _GEN_710;
  wire  _GEN_719 = io_sfence_bits_rs2 & _GEN_711;
  wire  _GEN_720 = io_sfence_bits_rs2 & _GEN_712;
  wire  _GEN_725 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_537;
  wire  _GEN_726 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_538;
  wire  _GEN_727 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_539;
  wire  _GEN_728 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_540;
  wire  _GEN_729 = _sector_hits_T_21 ? _GEN_725 : _GEN_537;
  wire  _GEN_730 = _sector_hits_T_21 ? _GEN_726 : _GEN_538;
  wire  _GEN_731 = _sector_hits_T_21 ? _GEN_727 : _GEN_539;
  wire  _GEN_732 = _sector_hits_T_21 ? _GEN_728 : _GEN_540;
  wire  _GEN_733 = sectored_entries_0_2_data_0[0] ? 1'h0 : _GEN_729;
  wire  _GEN_734 = sectored_entries_0_2_data_1[0] ? 1'h0 : _GEN_730;
  wire  _GEN_735 = sectored_entries_0_2_data_2[0] ? 1'h0 : _GEN_731;
  wire  _GEN_736 = sectored_entries_0_2_data_3[0] ? 1'h0 : _GEN_732;
  wire  _GEN_741 = ~sectored_entries_0_2_data_0[19] ? 1'h0 : _GEN_537;
  wire  _GEN_742 = ~sectored_entries_0_2_data_1[19] ? 1'h0 : _GEN_538;
  wire  _GEN_743 = ~sectored_entries_0_2_data_2[19] ? 1'h0 : _GEN_539;
  wire  _GEN_744 = ~sectored_entries_0_2_data_3[19] ? 1'h0 : _GEN_540;
  wire  _GEN_749 = io_sfence_bits_rs2 & _GEN_741;
  wire  _GEN_750 = io_sfence_bits_rs2 & _GEN_742;
  wire  _GEN_751 = io_sfence_bits_rs2 & _GEN_743;
  wire  _GEN_752 = io_sfence_bits_rs2 & _GEN_744;
  wire  _GEN_757 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_548;
  wire  _GEN_758 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_549;
  wire  _GEN_759 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_550;
  wire  _GEN_760 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_551;
  wire  _GEN_761 = _sector_hits_T_29 ? _GEN_757 : _GEN_548;
  wire  _GEN_762 = _sector_hits_T_29 ? _GEN_758 : _GEN_549;
  wire  _GEN_763 = _sector_hits_T_29 ? _GEN_759 : _GEN_550;
  wire  _GEN_764 = _sector_hits_T_29 ? _GEN_760 : _GEN_551;
  wire  _GEN_765 = sectored_entries_0_3_data_0[0] ? 1'h0 : _GEN_761;
  wire  _GEN_766 = sectored_entries_0_3_data_1[0] ? 1'h0 : _GEN_762;
  wire  _GEN_767 = sectored_entries_0_3_data_2[0] ? 1'h0 : _GEN_763;
  wire  _GEN_768 = sectored_entries_0_3_data_3[0] ? 1'h0 : _GEN_764;
  wire  _GEN_773 = ~sectored_entries_0_3_data_0[19] ? 1'h0 : _GEN_548;
  wire  _GEN_774 = ~sectored_entries_0_3_data_1[19] ? 1'h0 : _GEN_549;
  wire  _GEN_775 = ~sectored_entries_0_3_data_2[19] ? 1'h0 : _GEN_550;
  wire  _GEN_776 = ~sectored_entries_0_3_data_3[19] ? 1'h0 : _GEN_551;
  wire  _GEN_781 = io_sfence_bits_rs2 & _GEN_773;
  wire  _GEN_782 = io_sfence_bits_rs2 & _GEN_774;
  wire  _GEN_783 = io_sfence_bits_rs2 & _GEN_775;
  wire  _GEN_784 = io_sfence_bits_rs2 & _GEN_776;
  wire  _GEN_789 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_559;
  wire  _GEN_790 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_560;
  wire  _GEN_791 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_561;
  wire  _GEN_792 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_562;
  wire  _GEN_793 = _sector_hits_T_37 ? _GEN_789 : _GEN_559;
  wire  _GEN_794 = _sector_hits_T_37 ? _GEN_790 : _GEN_560;
  wire  _GEN_795 = _sector_hits_T_37 ? _GEN_791 : _GEN_561;
  wire  _GEN_796 = _sector_hits_T_37 ? _GEN_792 : _GEN_562;
  wire  _GEN_797 = sectored_entries_0_4_data_0[0] ? 1'h0 : _GEN_793;
  wire  _GEN_798 = sectored_entries_0_4_data_1[0] ? 1'h0 : _GEN_794;
  wire  _GEN_799 = sectored_entries_0_4_data_2[0] ? 1'h0 : _GEN_795;
  wire  _GEN_800 = sectored_entries_0_4_data_3[0] ? 1'h0 : _GEN_796;
  wire  _GEN_805 = ~sectored_entries_0_4_data_0[19] ? 1'h0 : _GEN_559;
  wire  _GEN_806 = ~sectored_entries_0_4_data_1[19] ? 1'h0 : _GEN_560;
  wire  _GEN_807 = ~sectored_entries_0_4_data_2[19] ? 1'h0 : _GEN_561;
  wire  _GEN_808 = ~sectored_entries_0_4_data_3[19] ? 1'h0 : _GEN_562;
  wire  _GEN_813 = io_sfence_bits_rs2 & _GEN_805;
  wire  _GEN_814 = io_sfence_bits_rs2 & _GEN_806;
  wire  _GEN_815 = io_sfence_bits_rs2 & _GEN_807;
  wire  _GEN_816 = io_sfence_bits_rs2 & _GEN_808;
  wire  _GEN_821 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_570;
  wire  _GEN_822 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_571;
  wire  _GEN_823 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_572;
  wire  _GEN_824 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_573;
  wire  _GEN_825 = _sector_hits_T_45 ? _GEN_821 : _GEN_570;
  wire  _GEN_826 = _sector_hits_T_45 ? _GEN_822 : _GEN_571;
  wire  _GEN_827 = _sector_hits_T_45 ? _GEN_823 : _GEN_572;
  wire  _GEN_828 = _sector_hits_T_45 ? _GEN_824 : _GEN_573;
  wire  _GEN_829 = sectored_entries_0_5_data_0[0] ? 1'h0 : _GEN_825;
  wire  _GEN_830 = sectored_entries_0_5_data_1[0] ? 1'h0 : _GEN_826;
  wire  _GEN_831 = sectored_entries_0_5_data_2[0] ? 1'h0 : _GEN_827;
  wire  _GEN_832 = sectored_entries_0_5_data_3[0] ? 1'h0 : _GEN_828;
  wire  _GEN_837 = ~sectored_entries_0_5_data_0[19] ? 1'h0 : _GEN_570;
  wire  _GEN_838 = ~sectored_entries_0_5_data_1[19] ? 1'h0 : _GEN_571;
  wire  _GEN_839 = ~sectored_entries_0_5_data_2[19] ? 1'h0 : _GEN_572;
  wire  _GEN_840 = ~sectored_entries_0_5_data_3[19] ? 1'h0 : _GEN_573;
  wire  _GEN_845 = io_sfence_bits_rs2 & _GEN_837;
  wire  _GEN_846 = io_sfence_bits_rs2 & _GEN_838;
  wire  _GEN_847 = io_sfence_bits_rs2 & _GEN_839;
  wire  _GEN_848 = io_sfence_bits_rs2 & _GEN_840;
  wire  _GEN_853 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_581;
  wire  _GEN_854 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_582;
  wire  _GEN_855 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_583;
  wire  _GEN_856 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_584;
  wire  _GEN_857 = _sector_hits_T_53 ? _GEN_853 : _GEN_581;
  wire  _GEN_858 = _sector_hits_T_53 ? _GEN_854 : _GEN_582;
  wire  _GEN_859 = _sector_hits_T_53 ? _GEN_855 : _GEN_583;
  wire  _GEN_860 = _sector_hits_T_53 ? _GEN_856 : _GEN_584;
  wire  _GEN_861 = sectored_entries_0_6_data_0[0] ? 1'h0 : _GEN_857;
  wire  _GEN_862 = sectored_entries_0_6_data_1[0] ? 1'h0 : _GEN_858;
  wire  _GEN_863 = sectored_entries_0_6_data_2[0] ? 1'h0 : _GEN_859;
  wire  _GEN_864 = sectored_entries_0_6_data_3[0] ? 1'h0 : _GEN_860;
  wire  _GEN_869 = ~sectored_entries_0_6_data_0[19] ? 1'h0 : _GEN_581;
  wire  _GEN_870 = ~sectored_entries_0_6_data_1[19] ? 1'h0 : _GEN_582;
  wire  _GEN_871 = ~sectored_entries_0_6_data_2[19] ? 1'h0 : _GEN_583;
  wire  _GEN_872 = ~sectored_entries_0_6_data_3[19] ? 1'h0 : _GEN_584;
  wire  _GEN_877 = io_sfence_bits_rs2 & _GEN_869;
  wire  _GEN_878 = io_sfence_bits_rs2 & _GEN_870;
  wire  _GEN_879 = io_sfence_bits_rs2 & _GEN_871;
  wire  _GEN_880 = io_sfence_bits_rs2 & _GEN_872;
  wire  _GEN_885 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_592;
  wire  _GEN_886 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_593;
  wire  _GEN_887 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_594;
  wire  _GEN_888 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_595;
  wire  _GEN_889 = _sector_hits_T_61 ? _GEN_885 : _GEN_592;
  wire  _GEN_890 = _sector_hits_T_61 ? _GEN_886 : _GEN_593;
  wire  _GEN_891 = _sector_hits_T_61 ? _GEN_887 : _GEN_594;
  wire  _GEN_892 = _sector_hits_T_61 ? _GEN_888 : _GEN_595;
  wire  _GEN_893 = sectored_entries_0_7_data_0[0] ? 1'h0 : _GEN_889;
  wire  _GEN_894 = sectored_entries_0_7_data_1[0] ? 1'h0 : _GEN_890;
  wire  _GEN_895 = sectored_entries_0_7_data_2[0] ? 1'h0 : _GEN_891;
  wire  _GEN_896 = sectored_entries_0_7_data_3[0] ? 1'h0 : _GEN_892;
  wire  _GEN_901 = ~sectored_entries_0_7_data_0[19] ? 1'h0 : _GEN_592;
  wire  _GEN_902 = ~sectored_entries_0_7_data_1[19] ? 1'h0 : _GEN_593;
  wire  _GEN_903 = ~sectored_entries_0_7_data_2[19] ? 1'h0 : _GEN_594;
  wire  _GEN_904 = ~sectored_entries_0_7_data_3[19] ? 1'h0 : _GEN_595;
  wire  _GEN_909 = io_sfence_bits_rs2 & _GEN_901;
  wire  _GEN_910 = io_sfence_bits_rs2 & _GEN_902;
  wire  _GEN_911 = io_sfence_bits_rs2 & _GEN_903;
  wire  _GEN_912 = io_sfence_bits_rs2 & _GEN_904;
  wire  _GEN_918 = ~superpage_entries_0_data_0[19] ? 1'h0 : _GEN_498;
  wire  _GEN_920 = io_sfence_bits_rs2 & _GEN_918;
  wire  _GEN_923 = ~superpage_entries_1_data_0[19] ? 1'h0 : _GEN_503;
  wire  _GEN_925 = io_sfence_bits_rs2 & _GEN_923;
  wire  _GEN_928 = ~superpage_entries_2_data_0[19] ? 1'h0 : _GEN_508;
  wire  _GEN_930 = io_sfence_bits_rs2 & _GEN_928;
  wire  _GEN_933 = ~superpage_entries_3_data_0[19] ? 1'h0 : _GEN_513;
  wire  _GEN_935 = io_sfence_bits_rs2 & _GEN_933;
  wire  _GEN_938 = ~special_entry_data_0[19] ? 1'h0 : _GEN_493;
  wire  _GEN_940 = io_sfence_bits_rs2 & _GEN_938;
  OptimizationBarrier mpu_ppn_barrier (
    .io_x_ppn(mpu_ppn_barrier_io_x_ppn),
    .io_x_u(mpu_ppn_barrier_io_x_u),
    .io_x_ae_ptw(mpu_ppn_barrier_io_x_ae_ptw),
    .io_x_ae_final(mpu_ppn_barrier_io_x_ae_final),
    .io_x_pf(mpu_ppn_barrier_io_x_pf),
    .io_x_gf(mpu_ppn_barrier_io_x_gf),
    .io_x_sw(mpu_ppn_barrier_io_x_sw),
    .io_x_sx(mpu_ppn_barrier_io_x_sx),
    .io_x_sr(mpu_ppn_barrier_io_x_sr),
    .io_x_pw(mpu_ppn_barrier_io_x_pw),
    .io_x_px(mpu_ppn_barrier_io_x_px),
    .io_x_pr(mpu_ppn_barrier_io_x_pr),
    .io_x_ppp(mpu_ppn_barrier_io_x_ppp),
    .io_x_pal(mpu_ppn_barrier_io_x_pal),
    .io_x_paa(mpu_ppn_barrier_io_x_paa),
    .io_x_eff(mpu_ppn_barrier_io_x_eff),
    .io_x_c(mpu_ppn_barrier_io_x_c),
    .io_y_ppn(mpu_ppn_barrier_io_y_ppn),
    .io_y_u(mpu_ppn_barrier_io_y_u),
    .io_y_ae_ptw(mpu_ppn_barrier_io_y_ae_ptw),
    .io_y_ae_final(mpu_ppn_barrier_io_y_ae_final),
    .io_y_pf(mpu_ppn_barrier_io_y_pf),
    .io_y_gf(mpu_ppn_barrier_io_y_gf),
    .io_y_sw(mpu_ppn_barrier_io_y_sw),
    .io_y_sx(mpu_ppn_barrier_io_y_sx),
    .io_y_sr(mpu_ppn_barrier_io_y_sr),
    .io_y_pw(mpu_ppn_barrier_io_y_pw),
    .io_y_px(mpu_ppn_barrier_io_y_px),
    .io_y_pr(mpu_ppn_barrier_io_y_pr),
    .io_y_ppp(mpu_ppn_barrier_io_y_ppp),
    .io_y_pal(mpu_ppn_barrier_io_y_pal),
    .io_y_paa(mpu_ppn_barrier_io_y_paa),
    .io_y_eff(mpu_ppn_barrier_io_y_eff),
    .io_y_c(mpu_ppn_barrier_io_y_c)
  );
  PMPChecker pmp (
    .io_prv(pmp_io_prv),
    .io_pmp_0_cfg_l(pmp_io_pmp_0_cfg_l),
    .io_pmp_0_cfg_a(pmp_io_pmp_0_cfg_a),
    .io_pmp_0_cfg_x(pmp_io_pmp_0_cfg_x),
    .io_pmp_0_cfg_w(pmp_io_pmp_0_cfg_w),
    .io_pmp_0_cfg_r(pmp_io_pmp_0_cfg_r),
    .io_pmp_0_addr(pmp_io_pmp_0_addr),
    .io_pmp_0_mask(pmp_io_pmp_0_mask),
    .io_pmp_1_cfg_l(pmp_io_pmp_1_cfg_l),
    .io_pmp_1_cfg_a(pmp_io_pmp_1_cfg_a),
    .io_pmp_1_cfg_x(pmp_io_pmp_1_cfg_x),
    .io_pmp_1_cfg_w(pmp_io_pmp_1_cfg_w),
    .io_pmp_1_cfg_r(pmp_io_pmp_1_cfg_r),
    .io_pmp_1_addr(pmp_io_pmp_1_addr),
    .io_pmp_1_mask(pmp_io_pmp_1_mask),
    .io_pmp_2_cfg_l(pmp_io_pmp_2_cfg_l),
    .io_pmp_2_cfg_a(pmp_io_pmp_2_cfg_a),
    .io_pmp_2_cfg_x(pmp_io_pmp_2_cfg_x),
    .io_pmp_2_cfg_w(pmp_io_pmp_2_cfg_w),
    .io_pmp_2_cfg_r(pmp_io_pmp_2_cfg_r),
    .io_pmp_2_addr(pmp_io_pmp_2_addr),
    .io_pmp_2_mask(pmp_io_pmp_2_mask),
    .io_pmp_3_cfg_l(pmp_io_pmp_3_cfg_l),
    .io_pmp_3_cfg_a(pmp_io_pmp_3_cfg_a),
    .io_pmp_3_cfg_x(pmp_io_pmp_3_cfg_x),
    .io_pmp_3_cfg_w(pmp_io_pmp_3_cfg_w),
    .io_pmp_3_cfg_r(pmp_io_pmp_3_cfg_r),
    .io_pmp_3_addr(pmp_io_pmp_3_addr),
    .io_pmp_3_mask(pmp_io_pmp_3_mask),
    .io_pmp_4_cfg_l(pmp_io_pmp_4_cfg_l),
    .io_pmp_4_cfg_a(pmp_io_pmp_4_cfg_a),
    .io_pmp_4_cfg_x(pmp_io_pmp_4_cfg_x),
    .io_pmp_4_cfg_w(pmp_io_pmp_4_cfg_w),
    .io_pmp_4_cfg_r(pmp_io_pmp_4_cfg_r),
    .io_pmp_4_addr(pmp_io_pmp_4_addr),
    .io_pmp_4_mask(pmp_io_pmp_4_mask),
    .io_pmp_5_cfg_l(pmp_io_pmp_5_cfg_l),
    .io_pmp_5_cfg_a(pmp_io_pmp_5_cfg_a),
    .io_pmp_5_cfg_x(pmp_io_pmp_5_cfg_x),
    .io_pmp_5_cfg_w(pmp_io_pmp_5_cfg_w),
    .io_pmp_5_cfg_r(pmp_io_pmp_5_cfg_r),
    .io_pmp_5_addr(pmp_io_pmp_5_addr),
    .io_pmp_5_mask(pmp_io_pmp_5_mask),
    .io_pmp_6_cfg_l(pmp_io_pmp_6_cfg_l),
    .io_pmp_6_cfg_a(pmp_io_pmp_6_cfg_a),
    .io_pmp_6_cfg_x(pmp_io_pmp_6_cfg_x),
    .io_pmp_6_cfg_w(pmp_io_pmp_6_cfg_w),
    .io_pmp_6_cfg_r(pmp_io_pmp_6_cfg_r),
    .io_pmp_6_addr(pmp_io_pmp_6_addr),
    .io_pmp_6_mask(pmp_io_pmp_6_mask),
    .io_pmp_7_cfg_l(pmp_io_pmp_7_cfg_l),
    .io_pmp_7_cfg_a(pmp_io_pmp_7_cfg_a),
    .io_pmp_7_cfg_x(pmp_io_pmp_7_cfg_x),
    .io_pmp_7_cfg_w(pmp_io_pmp_7_cfg_w),
    .io_pmp_7_cfg_r(pmp_io_pmp_7_cfg_r),
    .io_pmp_7_addr(pmp_io_pmp_7_addr),
    .io_pmp_7_mask(pmp_io_pmp_7_mask),
    .io_addr(pmp_io_addr),
    .io_r(pmp_io_r),
    .io_w(pmp_io_w),
    .io_x(pmp_io_x)
  );
  OptimizationBarrier entries_barrier (
    .io_x_ppn(entries_barrier_io_x_ppn),
    .io_x_u(entries_barrier_io_x_u),
    .io_x_ae_ptw(entries_barrier_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_io_x_ae_final),
    .io_x_pf(entries_barrier_io_x_pf),
    .io_x_gf(entries_barrier_io_x_gf),
    .io_x_sw(entries_barrier_io_x_sw),
    .io_x_sx(entries_barrier_io_x_sx),
    .io_x_sr(entries_barrier_io_x_sr),
    .io_x_pw(entries_barrier_io_x_pw),
    .io_x_px(entries_barrier_io_x_px),
    .io_x_pr(entries_barrier_io_x_pr),
    .io_x_ppp(entries_barrier_io_x_ppp),
    .io_x_pal(entries_barrier_io_x_pal),
    .io_x_paa(entries_barrier_io_x_paa),
    .io_x_eff(entries_barrier_io_x_eff),
    .io_x_c(entries_barrier_io_x_c),
    .io_y_ppn(entries_barrier_io_y_ppn),
    .io_y_u(entries_barrier_io_y_u),
    .io_y_ae_ptw(entries_barrier_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_io_y_ae_final),
    .io_y_pf(entries_barrier_io_y_pf),
    .io_y_gf(entries_barrier_io_y_gf),
    .io_y_sw(entries_barrier_io_y_sw),
    .io_y_sx(entries_barrier_io_y_sx),
    .io_y_sr(entries_barrier_io_y_sr),
    .io_y_pw(entries_barrier_io_y_pw),
    .io_y_px(entries_barrier_io_y_px),
    .io_y_pr(entries_barrier_io_y_pr),
    .io_y_ppp(entries_barrier_io_y_ppp),
    .io_y_pal(entries_barrier_io_y_pal),
    .io_y_paa(entries_barrier_io_y_paa),
    .io_y_eff(entries_barrier_io_y_eff),
    .io_y_c(entries_barrier_io_y_c)
  );
  OptimizationBarrier entries_barrier_1 (
    .io_x_ppn(entries_barrier_1_io_x_ppn),
    .io_x_u(entries_barrier_1_io_x_u),
    .io_x_ae_ptw(entries_barrier_1_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_1_io_x_ae_final),
    .io_x_pf(entries_barrier_1_io_x_pf),
    .io_x_gf(entries_barrier_1_io_x_gf),
    .io_x_sw(entries_barrier_1_io_x_sw),
    .io_x_sx(entries_barrier_1_io_x_sx),
    .io_x_sr(entries_barrier_1_io_x_sr),
    .io_x_pw(entries_barrier_1_io_x_pw),
    .io_x_px(entries_barrier_1_io_x_px),
    .io_x_pr(entries_barrier_1_io_x_pr),
    .io_x_ppp(entries_barrier_1_io_x_ppp),
    .io_x_pal(entries_barrier_1_io_x_pal),
    .io_x_paa(entries_barrier_1_io_x_paa),
    .io_x_eff(entries_barrier_1_io_x_eff),
    .io_x_c(entries_barrier_1_io_x_c),
    .io_y_ppn(entries_barrier_1_io_y_ppn),
    .io_y_u(entries_barrier_1_io_y_u),
    .io_y_ae_ptw(entries_barrier_1_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_1_io_y_ae_final),
    .io_y_pf(entries_barrier_1_io_y_pf),
    .io_y_gf(entries_barrier_1_io_y_gf),
    .io_y_sw(entries_barrier_1_io_y_sw),
    .io_y_sx(entries_barrier_1_io_y_sx),
    .io_y_sr(entries_barrier_1_io_y_sr),
    .io_y_pw(entries_barrier_1_io_y_pw),
    .io_y_px(entries_barrier_1_io_y_px),
    .io_y_pr(entries_barrier_1_io_y_pr),
    .io_y_ppp(entries_barrier_1_io_y_ppp),
    .io_y_pal(entries_barrier_1_io_y_pal),
    .io_y_paa(entries_barrier_1_io_y_paa),
    .io_y_eff(entries_barrier_1_io_y_eff),
    .io_y_c(entries_barrier_1_io_y_c)
  );
  OptimizationBarrier entries_barrier_2 (
    .io_x_ppn(entries_barrier_2_io_x_ppn),
    .io_x_u(entries_barrier_2_io_x_u),
    .io_x_ae_ptw(entries_barrier_2_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_2_io_x_ae_final),
    .io_x_pf(entries_barrier_2_io_x_pf),
    .io_x_gf(entries_barrier_2_io_x_gf),
    .io_x_sw(entries_barrier_2_io_x_sw),
    .io_x_sx(entries_barrier_2_io_x_sx),
    .io_x_sr(entries_barrier_2_io_x_sr),
    .io_x_pw(entries_barrier_2_io_x_pw),
    .io_x_px(entries_barrier_2_io_x_px),
    .io_x_pr(entries_barrier_2_io_x_pr),
    .io_x_ppp(entries_barrier_2_io_x_ppp),
    .io_x_pal(entries_barrier_2_io_x_pal),
    .io_x_paa(entries_barrier_2_io_x_paa),
    .io_x_eff(entries_barrier_2_io_x_eff),
    .io_x_c(entries_barrier_2_io_x_c),
    .io_y_ppn(entries_barrier_2_io_y_ppn),
    .io_y_u(entries_barrier_2_io_y_u),
    .io_y_ae_ptw(entries_barrier_2_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_2_io_y_ae_final),
    .io_y_pf(entries_barrier_2_io_y_pf),
    .io_y_gf(entries_barrier_2_io_y_gf),
    .io_y_sw(entries_barrier_2_io_y_sw),
    .io_y_sx(entries_barrier_2_io_y_sx),
    .io_y_sr(entries_barrier_2_io_y_sr),
    .io_y_pw(entries_barrier_2_io_y_pw),
    .io_y_px(entries_barrier_2_io_y_px),
    .io_y_pr(entries_barrier_2_io_y_pr),
    .io_y_ppp(entries_barrier_2_io_y_ppp),
    .io_y_pal(entries_barrier_2_io_y_pal),
    .io_y_paa(entries_barrier_2_io_y_paa),
    .io_y_eff(entries_barrier_2_io_y_eff),
    .io_y_c(entries_barrier_2_io_y_c)
  );
  OptimizationBarrier entries_barrier_3 (
    .io_x_ppn(entries_barrier_3_io_x_ppn),
    .io_x_u(entries_barrier_3_io_x_u),
    .io_x_ae_ptw(entries_barrier_3_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_3_io_x_ae_final),
    .io_x_pf(entries_barrier_3_io_x_pf),
    .io_x_gf(entries_barrier_3_io_x_gf),
    .io_x_sw(entries_barrier_3_io_x_sw),
    .io_x_sx(entries_barrier_3_io_x_sx),
    .io_x_sr(entries_barrier_3_io_x_sr),
    .io_x_pw(entries_barrier_3_io_x_pw),
    .io_x_px(entries_barrier_3_io_x_px),
    .io_x_pr(entries_barrier_3_io_x_pr),
    .io_x_ppp(entries_barrier_3_io_x_ppp),
    .io_x_pal(entries_barrier_3_io_x_pal),
    .io_x_paa(entries_barrier_3_io_x_paa),
    .io_x_eff(entries_barrier_3_io_x_eff),
    .io_x_c(entries_barrier_3_io_x_c),
    .io_y_ppn(entries_barrier_3_io_y_ppn),
    .io_y_u(entries_barrier_3_io_y_u),
    .io_y_ae_ptw(entries_barrier_3_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_3_io_y_ae_final),
    .io_y_pf(entries_barrier_3_io_y_pf),
    .io_y_gf(entries_barrier_3_io_y_gf),
    .io_y_sw(entries_barrier_3_io_y_sw),
    .io_y_sx(entries_barrier_3_io_y_sx),
    .io_y_sr(entries_barrier_3_io_y_sr),
    .io_y_pw(entries_barrier_3_io_y_pw),
    .io_y_px(entries_barrier_3_io_y_px),
    .io_y_pr(entries_barrier_3_io_y_pr),
    .io_y_ppp(entries_barrier_3_io_y_ppp),
    .io_y_pal(entries_barrier_3_io_y_pal),
    .io_y_paa(entries_barrier_3_io_y_paa),
    .io_y_eff(entries_barrier_3_io_y_eff),
    .io_y_c(entries_barrier_3_io_y_c)
  );
  OptimizationBarrier entries_barrier_4 (
    .io_x_ppn(entries_barrier_4_io_x_ppn),
    .io_x_u(entries_barrier_4_io_x_u),
    .io_x_ae_ptw(entries_barrier_4_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_4_io_x_ae_final),
    .io_x_pf(entries_barrier_4_io_x_pf),
    .io_x_gf(entries_barrier_4_io_x_gf),
    .io_x_sw(entries_barrier_4_io_x_sw),
    .io_x_sx(entries_barrier_4_io_x_sx),
    .io_x_sr(entries_barrier_4_io_x_sr),
    .io_x_pw(entries_barrier_4_io_x_pw),
    .io_x_px(entries_barrier_4_io_x_px),
    .io_x_pr(entries_barrier_4_io_x_pr),
    .io_x_ppp(entries_barrier_4_io_x_ppp),
    .io_x_pal(entries_barrier_4_io_x_pal),
    .io_x_paa(entries_barrier_4_io_x_paa),
    .io_x_eff(entries_barrier_4_io_x_eff),
    .io_x_c(entries_barrier_4_io_x_c),
    .io_y_ppn(entries_barrier_4_io_y_ppn),
    .io_y_u(entries_barrier_4_io_y_u),
    .io_y_ae_ptw(entries_barrier_4_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_4_io_y_ae_final),
    .io_y_pf(entries_barrier_4_io_y_pf),
    .io_y_gf(entries_barrier_4_io_y_gf),
    .io_y_sw(entries_barrier_4_io_y_sw),
    .io_y_sx(entries_barrier_4_io_y_sx),
    .io_y_sr(entries_barrier_4_io_y_sr),
    .io_y_pw(entries_barrier_4_io_y_pw),
    .io_y_px(entries_barrier_4_io_y_px),
    .io_y_pr(entries_barrier_4_io_y_pr),
    .io_y_ppp(entries_barrier_4_io_y_ppp),
    .io_y_pal(entries_barrier_4_io_y_pal),
    .io_y_paa(entries_barrier_4_io_y_paa),
    .io_y_eff(entries_barrier_4_io_y_eff),
    .io_y_c(entries_barrier_4_io_y_c)
  );
  OptimizationBarrier entries_barrier_5 (
    .io_x_ppn(entries_barrier_5_io_x_ppn),
    .io_x_u(entries_barrier_5_io_x_u),
    .io_x_ae_ptw(entries_barrier_5_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_5_io_x_ae_final),
    .io_x_pf(entries_barrier_5_io_x_pf),
    .io_x_gf(entries_barrier_5_io_x_gf),
    .io_x_sw(entries_barrier_5_io_x_sw),
    .io_x_sx(entries_barrier_5_io_x_sx),
    .io_x_sr(entries_barrier_5_io_x_sr),
    .io_x_pw(entries_barrier_5_io_x_pw),
    .io_x_px(entries_barrier_5_io_x_px),
    .io_x_pr(entries_barrier_5_io_x_pr),
    .io_x_ppp(entries_barrier_5_io_x_ppp),
    .io_x_pal(entries_barrier_5_io_x_pal),
    .io_x_paa(entries_barrier_5_io_x_paa),
    .io_x_eff(entries_barrier_5_io_x_eff),
    .io_x_c(entries_barrier_5_io_x_c),
    .io_y_ppn(entries_barrier_5_io_y_ppn),
    .io_y_u(entries_barrier_5_io_y_u),
    .io_y_ae_ptw(entries_barrier_5_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_5_io_y_ae_final),
    .io_y_pf(entries_barrier_5_io_y_pf),
    .io_y_gf(entries_barrier_5_io_y_gf),
    .io_y_sw(entries_barrier_5_io_y_sw),
    .io_y_sx(entries_barrier_5_io_y_sx),
    .io_y_sr(entries_barrier_5_io_y_sr),
    .io_y_pw(entries_barrier_5_io_y_pw),
    .io_y_px(entries_barrier_5_io_y_px),
    .io_y_pr(entries_barrier_5_io_y_pr),
    .io_y_ppp(entries_barrier_5_io_y_ppp),
    .io_y_pal(entries_barrier_5_io_y_pal),
    .io_y_paa(entries_barrier_5_io_y_paa),
    .io_y_eff(entries_barrier_5_io_y_eff),
    .io_y_c(entries_barrier_5_io_y_c)
  );
  OptimizationBarrier entries_barrier_6 (
    .io_x_ppn(entries_barrier_6_io_x_ppn),
    .io_x_u(entries_barrier_6_io_x_u),
    .io_x_ae_ptw(entries_barrier_6_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_6_io_x_ae_final),
    .io_x_pf(entries_barrier_6_io_x_pf),
    .io_x_gf(entries_barrier_6_io_x_gf),
    .io_x_sw(entries_barrier_6_io_x_sw),
    .io_x_sx(entries_barrier_6_io_x_sx),
    .io_x_sr(entries_barrier_6_io_x_sr),
    .io_x_pw(entries_barrier_6_io_x_pw),
    .io_x_px(entries_barrier_6_io_x_px),
    .io_x_pr(entries_barrier_6_io_x_pr),
    .io_x_ppp(entries_barrier_6_io_x_ppp),
    .io_x_pal(entries_barrier_6_io_x_pal),
    .io_x_paa(entries_barrier_6_io_x_paa),
    .io_x_eff(entries_barrier_6_io_x_eff),
    .io_x_c(entries_barrier_6_io_x_c),
    .io_y_ppn(entries_barrier_6_io_y_ppn),
    .io_y_u(entries_barrier_6_io_y_u),
    .io_y_ae_ptw(entries_barrier_6_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_6_io_y_ae_final),
    .io_y_pf(entries_barrier_6_io_y_pf),
    .io_y_gf(entries_barrier_6_io_y_gf),
    .io_y_sw(entries_barrier_6_io_y_sw),
    .io_y_sx(entries_barrier_6_io_y_sx),
    .io_y_sr(entries_barrier_6_io_y_sr),
    .io_y_pw(entries_barrier_6_io_y_pw),
    .io_y_px(entries_barrier_6_io_y_px),
    .io_y_pr(entries_barrier_6_io_y_pr),
    .io_y_ppp(entries_barrier_6_io_y_ppp),
    .io_y_pal(entries_barrier_6_io_y_pal),
    .io_y_paa(entries_barrier_6_io_y_paa),
    .io_y_eff(entries_barrier_6_io_y_eff),
    .io_y_c(entries_barrier_6_io_y_c)
  );
  OptimizationBarrier entries_barrier_7 (
    .io_x_ppn(entries_barrier_7_io_x_ppn),
    .io_x_u(entries_barrier_7_io_x_u),
    .io_x_ae_ptw(entries_barrier_7_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_7_io_x_ae_final),
    .io_x_pf(entries_barrier_7_io_x_pf),
    .io_x_gf(entries_barrier_7_io_x_gf),
    .io_x_sw(entries_barrier_7_io_x_sw),
    .io_x_sx(entries_barrier_7_io_x_sx),
    .io_x_sr(entries_barrier_7_io_x_sr),
    .io_x_pw(entries_barrier_7_io_x_pw),
    .io_x_px(entries_barrier_7_io_x_px),
    .io_x_pr(entries_barrier_7_io_x_pr),
    .io_x_ppp(entries_barrier_7_io_x_ppp),
    .io_x_pal(entries_barrier_7_io_x_pal),
    .io_x_paa(entries_barrier_7_io_x_paa),
    .io_x_eff(entries_barrier_7_io_x_eff),
    .io_x_c(entries_barrier_7_io_x_c),
    .io_y_ppn(entries_barrier_7_io_y_ppn),
    .io_y_u(entries_barrier_7_io_y_u),
    .io_y_ae_ptw(entries_barrier_7_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_7_io_y_ae_final),
    .io_y_pf(entries_barrier_7_io_y_pf),
    .io_y_gf(entries_barrier_7_io_y_gf),
    .io_y_sw(entries_barrier_7_io_y_sw),
    .io_y_sx(entries_barrier_7_io_y_sx),
    .io_y_sr(entries_barrier_7_io_y_sr),
    .io_y_pw(entries_barrier_7_io_y_pw),
    .io_y_px(entries_barrier_7_io_y_px),
    .io_y_pr(entries_barrier_7_io_y_pr),
    .io_y_ppp(entries_barrier_7_io_y_ppp),
    .io_y_pal(entries_barrier_7_io_y_pal),
    .io_y_paa(entries_barrier_7_io_y_paa),
    .io_y_eff(entries_barrier_7_io_y_eff),
    .io_y_c(entries_barrier_7_io_y_c)
  );
  OptimizationBarrier entries_barrier_8 (
    .io_x_ppn(entries_barrier_8_io_x_ppn),
    .io_x_u(entries_barrier_8_io_x_u),
    .io_x_ae_ptw(entries_barrier_8_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_8_io_x_ae_final),
    .io_x_pf(entries_barrier_8_io_x_pf),
    .io_x_gf(entries_barrier_8_io_x_gf),
    .io_x_sw(entries_barrier_8_io_x_sw),
    .io_x_sx(entries_barrier_8_io_x_sx),
    .io_x_sr(entries_barrier_8_io_x_sr),
    .io_x_pw(entries_barrier_8_io_x_pw),
    .io_x_px(entries_barrier_8_io_x_px),
    .io_x_pr(entries_barrier_8_io_x_pr),
    .io_x_ppp(entries_barrier_8_io_x_ppp),
    .io_x_pal(entries_barrier_8_io_x_pal),
    .io_x_paa(entries_barrier_8_io_x_paa),
    .io_x_eff(entries_barrier_8_io_x_eff),
    .io_x_c(entries_barrier_8_io_x_c),
    .io_y_ppn(entries_barrier_8_io_y_ppn),
    .io_y_u(entries_barrier_8_io_y_u),
    .io_y_ae_ptw(entries_barrier_8_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_8_io_y_ae_final),
    .io_y_pf(entries_barrier_8_io_y_pf),
    .io_y_gf(entries_barrier_8_io_y_gf),
    .io_y_sw(entries_barrier_8_io_y_sw),
    .io_y_sx(entries_barrier_8_io_y_sx),
    .io_y_sr(entries_barrier_8_io_y_sr),
    .io_y_pw(entries_barrier_8_io_y_pw),
    .io_y_px(entries_barrier_8_io_y_px),
    .io_y_pr(entries_barrier_8_io_y_pr),
    .io_y_ppp(entries_barrier_8_io_y_ppp),
    .io_y_pal(entries_barrier_8_io_y_pal),
    .io_y_paa(entries_barrier_8_io_y_paa),
    .io_y_eff(entries_barrier_8_io_y_eff),
    .io_y_c(entries_barrier_8_io_y_c)
  );
  OptimizationBarrier entries_barrier_9 (
    .io_x_ppn(entries_barrier_9_io_x_ppn),
    .io_x_u(entries_barrier_9_io_x_u),
    .io_x_ae_ptw(entries_barrier_9_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_9_io_x_ae_final),
    .io_x_pf(entries_barrier_9_io_x_pf),
    .io_x_gf(entries_barrier_9_io_x_gf),
    .io_x_sw(entries_barrier_9_io_x_sw),
    .io_x_sx(entries_barrier_9_io_x_sx),
    .io_x_sr(entries_barrier_9_io_x_sr),
    .io_x_pw(entries_barrier_9_io_x_pw),
    .io_x_px(entries_barrier_9_io_x_px),
    .io_x_pr(entries_barrier_9_io_x_pr),
    .io_x_ppp(entries_barrier_9_io_x_ppp),
    .io_x_pal(entries_barrier_9_io_x_pal),
    .io_x_paa(entries_barrier_9_io_x_paa),
    .io_x_eff(entries_barrier_9_io_x_eff),
    .io_x_c(entries_barrier_9_io_x_c),
    .io_y_ppn(entries_barrier_9_io_y_ppn),
    .io_y_u(entries_barrier_9_io_y_u),
    .io_y_ae_ptw(entries_barrier_9_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_9_io_y_ae_final),
    .io_y_pf(entries_barrier_9_io_y_pf),
    .io_y_gf(entries_barrier_9_io_y_gf),
    .io_y_sw(entries_barrier_9_io_y_sw),
    .io_y_sx(entries_barrier_9_io_y_sx),
    .io_y_sr(entries_barrier_9_io_y_sr),
    .io_y_pw(entries_barrier_9_io_y_pw),
    .io_y_px(entries_barrier_9_io_y_px),
    .io_y_pr(entries_barrier_9_io_y_pr),
    .io_y_ppp(entries_barrier_9_io_y_ppp),
    .io_y_pal(entries_barrier_9_io_y_pal),
    .io_y_paa(entries_barrier_9_io_y_paa),
    .io_y_eff(entries_barrier_9_io_y_eff),
    .io_y_c(entries_barrier_9_io_y_c)
  );
  OptimizationBarrier entries_barrier_10 (
    .io_x_ppn(entries_barrier_10_io_x_ppn),
    .io_x_u(entries_barrier_10_io_x_u),
    .io_x_ae_ptw(entries_barrier_10_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_10_io_x_ae_final),
    .io_x_pf(entries_barrier_10_io_x_pf),
    .io_x_gf(entries_barrier_10_io_x_gf),
    .io_x_sw(entries_barrier_10_io_x_sw),
    .io_x_sx(entries_barrier_10_io_x_sx),
    .io_x_sr(entries_barrier_10_io_x_sr),
    .io_x_pw(entries_barrier_10_io_x_pw),
    .io_x_px(entries_barrier_10_io_x_px),
    .io_x_pr(entries_barrier_10_io_x_pr),
    .io_x_ppp(entries_barrier_10_io_x_ppp),
    .io_x_pal(entries_barrier_10_io_x_pal),
    .io_x_paa(entries_barrier_10_io_x_paa),
    .io_x_eff(entries_barrier_10_io_x_eff),
    .io_x_c(entries_barrier_10_io_x_c),
    .io_y_ppn(entries_barrier_10_io_y_ppn),
    .io_y_u(entries_barrier_10_io_y_u),
    .io_y_ae_ptw(entries_barrier_10_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_10_io_y_ae_final),
    .io_y_pf(entries_barrier_10_io_y_pf),
    .io_y_gf(entries_barrier_10_io_y_gf),
    .io_y_sw(entries_barrier_10_io_y_sw),
    .io_y_sx(entries_barrier_10_io_y_sx),
    .io_y_sr(entries_barrier_10_io_y_sr),
    .io_y_pw(entries_barrier_10_io_y_pw),
    .io_y_px(entries_barrier_10_io_y_px),
    .io_y_pr(entries_barrier_10_io_y_pr),
    .io_y_ppp(entries_barrier_10_io_y_ppp),
    .io_y_pal(entries_barrier_10_io_y_pal),
    .io_y_paa(entries_barrier_10_io_y_paa),
    .io_y_eff(entries_barrier_10_io_y_eff),
    .io_y_c(entries_barrier_10_io_y_c)
  );
  OptimizationBarrier entries_barrier_11 (
    .io_x_ppn(entries_barrier_11_io_x_ppn),
    .io_x_u(entries_barrier_11_io_x_u),
    .io_x_ae_ptw(entries_barrier_11_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_11_io_x_ae_final),
    .io_x_pf(entries_barrier_11_io_x_pf),
    .io_x_gf(entries_barrier_11_io_x_gf),
    .io_x_sw(entries_barrier_11_io_x_sw),
    .io_x_sx(entries_barrier_11_io_x_sx),
    .io_x_sr(entries_barrier_11_io_x_sr),
    .io_x_pw(entries_barrier_11_io_x_pw),
    .io_x_px(entries_barrier_11_io_x_px),
    .io_x_pr(entries_barrier_11_io_x_pr),
    .io_x_ppp(entries_barrier_11_io_x_ppp),
    .io_x_pal(entries_barrier_11_io_x_pal),
    .io_x_paa(entries_barrier_11_io_x_paa),
    .io_x_eff(entries_barrier_11_io_x_eff),
    .io_x_c(entries_barrier_11_io_x_c),
    .io_y_ppn(entries_barrier_11_io_y_ppn),
    .io_y_u(entries_barrier_11_io_y_u),
    .io_y_ae_ptw(entries_barrier_11_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_11_io_y_ae_final),
    .io_y_pf(entries_barrier_11_io_y_pf),
    .io_y_gf(entries_barrier_11_io_y_gf),
    .io_y_sw(entries_barrier_11_io_y_sw),
    .io_y_sx(entries_barrier_11_io_y_sx),
    .io_y_sr(entries_barrier_11_io_y_sr),
    .io_y_pw(entries_barrier_11_io_y_pw),
    .io_y_px(entries_barrier_11_io_y_px),
    .io_y_pr(entries_barrier_11_io_y_pr),
    .io_y_ppp(entries_barrier_11_io_y_ppp),
    .io_y_pal(entries_barrier_11_io_y_pal),
    .io_y_paa(entries_barrier_11_io_y_paa),
    .io_y_eff(entries_barrier_11_io_y_eff),
    .io_y_c(entries_barrier_11_io_y_c)
  );
  OptimizationBarrier entries_barrier_12 (
    .io_x_ppn(entries_barrier_12_io_x_ppn),
    .io_x_u(entries_barrier_12_io_x_u),
    .io_x_ae_ptw(entries_barrier_12_io_x_ae_ptw),
    .io_x_ae_final(entries_barrier_12_io_x_ae_final),
    .io_x_pf(entries_barrier_12_io_x_pf),
    .io_x_gf(entries_barrier_12_io_x_gf),
    .io_x_sw(entries_barrier_12_io_x_sw),
    .io_x_sx(entries_barrier_12_io_x_sx),
    .io_x_sr(entries_barrier_12_io_x_sr),
    .io_x_pw(entries_barrier_12_io_x_pw),
    .io_x_px(entries_barrier_12_io_x_px),
    .io_x_pr(entries_barrier_12_io_x_pr),
    .io_x_ppp(entries_barrier_12_io_x_ppp),
    .io_x_pal(entries_barrier_12_io_x_pal),
    .io_x_paa(entries_barrier_12_io_x_paa),
    .io_x_eff(entries_barrier_12_io_x_eff),
    .io_x_c(entries_barrier_12_io_x_c),
    .io_y_ppn(entries_barrier_12_io_y_ppn),
    .io_y_u(entries_barrier_12_io_y_u),
    .io_y_ae_ptw(entries_barrier_12_io_y_ae_ptw),
    .io_y_ae_final(entries_barrier_12_io_y_ae_final),
    .io_y_pf(entries_barrier_12_io_y_pf),
    .io_y_gf(entries_barrier_12_io_y_gf),
    .io_y_sw(entries_barrier_12_io_y_sw),
    .io_y_sx(entries_barrier_12_io_y_sx),
    .io_y_sr(entries_barrier_12_io_y_sr),
    .io_y_pw(entries_barrier_12_io_y_pw),
    .io_y_px(entries_barrier_12_io_y_px),
    .io_y_pr(entries_barrier_12_io_y_pr),
    .io_y_ppp(entries_barrier_12_io_y_ppp),
    .io_y_pal(entries_barrier_12_io_y_pal),
    .io_y_paa(entries_barrier_12_io_y_paa),
    .io_y_eff(entries_barrier_12_io_y_eff),
    .io_y_c(entries_barrier_12_io_y_c)
  );
  assign io_req_ready = state == 2'h0;
  assign io_resp_miss = io_ptw_resp_valid | tlb_miss | multipleHits;
  assign io_resp_paddr = {ppn,io_req_bits_vaddr[11:0]};
  assign io_resp_pf_inst = |_io_resp_pf_inst_T;
  assign io_resp_ae_inst = |_io_resp_ae_inst_T_1;
  assign io_resp_cacheable = |_io_resp_cacheable_T;
  assign io_ptw_req_valid = state == 2'h1;
  assign io_ptw_req_bits_valid = ~io_kill;
  assign io_ptw_req_bits_bits_addr = r_refill_tag;
  assign io_ptw_req_bits_bits_need_gpa = r_need_gpa;
  assign mpu_ppn_barrier_io_x_ppn = special_entry_data_0[40:21];
  assign mpu_ppn_barrier_io_x_u = special_entry_data_0[20];
  assign mpu_ppn_barrier_io_x_ae_ptw = special_entry_data_0[18];
  assign mpu_ppn_barrier_io_x_ae_final = special_entry_data_0[17];
  assign mpu_ppn_barrier_io_x_pf = special_entry_data_0[16];
  assign mpu_ppn_barrier_io_x_gf = special_entry_data_0[15];
  assign mpu_ppn_barrier_io_x_sw = special_entry_data_0[14];
  assign mpu_ppn_barrier_io_x_sx = special_entry_data_0[13];
  assign mpu_ppn_barrier_io_x_sr = special_entry_data_0[12];
  assign mpu_ppn_barrier_io_x_pw = special_entry_data_0[8];
  assign mpu_ppn_barrier_io_x_px = special_entry_data_0[7];
  assign mpu_ppn_barrier_io_x_pr = special_entry_data_0[6];
  assign mpu_ppn_barrier_io_x_ppp = special_entry_data_0[5];
  assign mpu_ppn_barrier_io_x_pal = special_entry_data_0[4];
  assign mpu_ppn_barrier_io_x_paa = special_entry_data_0[3];
  assign mpu_ppn_barrier_io_x_eff = special_entry_data_0[2];
  assign mpu_ppn_barrier_io_x_c = special_entry_data_0[1];
  assign pmp_io_prv = mpu_priv[1:0];
  assign pmp_io_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l;
  assign pmp_io_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a;
  assign pmp_io_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x;
  assign pmp_io_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w;
  assign pmp_io_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r;
  assign pmp_io_pmp_0_addr = io_ptw_pmp_0_addr;
  assign pmp_io_pmp_0_mask = io_ptw_pmp_0_mask;
  assign pmp_io_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l;
  assign pmp_io_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a;
  assign pmp_io_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x;
  assign pmp_io_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w;
  assign pmp_io_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r;
  assign pmp_io_pmp_1_addr = io_ptw_pmp_1_addr;
  assign pmp_io_pmp_1_mask = io_ptw_pmp_1_mask;
  assign pmp_io_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l;
  assign pmp_io_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a;
  assign pmp_io_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x;
  assign pmp_io_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w;
  assign pmp_io_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r;
  assign pmp_io_pmp_2_addr = io_ptw_pmp_2_addr;
  assign pmp_io_pmp_2_mask = io_ptw_pmp_2_mask;
  assign pmp_io_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l;
  assign pmp_io_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a;
  assign pmp_io_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x;
  assign pmp_io_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w;
  assign pmp_io_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r;
  assign pmp_io_pmp_3_addr = io_ptw_pmp_3_addr;
  assign pmp_io_pmp_3_mask = io_ptw_pmp_3_mask;
  assign pmp_io_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l;
  assign pmp_io_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a;
  assign pmp_io_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x;
  assign pmp_io_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w;
  assign pmp_io_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r;
  assign pmp_io_pmp_4_addr = io_ptw_pmp_4_addr;
  assign pmp_io_pmp_4_mask = io_ptw_pmp_4_mask;
  assign pmp_io_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l;
  assign pmp_io_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a;
  assign pmp_io_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x;
  assign pmp_io_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w;
  assign pmp_io_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r;
  assign pmp_io_pmp_5_addr = io_ptw_pmp_5_addr;
  assign pmp_io_pmp_5_mask = io_ptw_pmp_5_mask;
  assign pmp_io_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l;
  assign pmp_io_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a;
  assign pmp_io_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x;
  assign pmp_io_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w;
  assign pmp_io_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r;
  assign pmp_io_pmp_6_addr = io_ptw_pmp_6_addr;
  assign pmp_io_pmp_6_mask = io_ptw_pmp_6_mask;
  assign pmp_io_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l;
  assign pmp_io_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a;
  assign pmp_io_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x;
  assign pmp_io_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w;
  assign pmp_io_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r;
  assign pmp_io_pmp_7_addr = io_ptw_pmp_7_addr;
  assign pmp_io_pmp_7_mask = io_ptw_pmp_7_mask;
  assign pmp_io_addr = {mpu_ppn,io_req_bits_vaddr[11:0]};
  assign entries_barrier_io_x_ppn = _GEN_609[40:21];
  assign entries_barrier_io_x_u = _GEN_609[20];
  assign entries_barrier_io_x_ae_ptw = _GEN_609[18];
  assign entries_barrier_io_x_ae_final = _GEN_609[17];
  assign entries_barrier_io_x_pf = _GEN_609[16];
  assign entries_barrier_io_x_gf = _GEN_609[15];
  assign entries_barrier_io_x_sw = _GEN_609[14];
  assign entries_barrier_io_x_sx = _GEN_609[13];
  assign entries_barrier_io_x_sr = _GEN_609[12];
  assign entries_barrier_io_x_pw = _GEN_609[8];
  assign entries_barrier_io_x_px = _GEN_609[7];
  assign entries_barrier_io_x_pr = _GEN_609[6];
  assign entries_barrier_io_x_ppp = _GEN_609[5];
  assign entries_barrier_io_x_pal = _GEN_609[4];
  assign entries_barrier_io_x_paa = _GEN_609[3];
  assign entries_barrier_io_x_eff = _GEN_609[2];
  assign entries_barrier_io_x_c = _GEN_609[1];
  assign entries_barrier_1_io_x_ppn = _GEN_613[40:21];
  assign entries_barrier_1_io_x_u = _GEN_613[20];
  assign entries_barrier_1_io_x_ae_ptw = _GEN_613[18];
  assign entries_barrier_1_io_x_ae_final = _GEN_613[17];
  assign entries_barrier_1_io_x_pf = _GEN_613[16];
  assign entries_barrier_1_io_x_gf = _GEN_613[15];
  assign entries_barrier_1_io_x_sw = _GEN_613[14];
  assign entries_barrier_1_io_x_sx = _GEN_613[13];
  assign entries_barrier_1_io_x_sr = _GEN_613[12];
  assign entries_barrier_1_io_x_pw = _GEN_613[8];
  assign entries_barrier_1_io_x_px = _GEN_613[7];
  assign entries_barrier_1_io_x_pr = _GEN_613[6];
  assign entries_barrier_1_io_x_ppp = _GEN_613[5];
  assign entries_barrier_1_io_x_pal = _GEN_613[4];
  assign entries_barrier_1_io_x_paa = _GEN_613[3];
  assign entries_barrier_1_io_x_eff = _GEN_613[2];
  assign entries_barrier_1_io_x_c = _GEN_613[1];
  assign entries_barrier_2_io_x_ppn = _GEN_617[40:21];
  assign entries_barrier_2_io_x_u = _GEN_617[20];
  assign entries_barrier_2_io_x_ae_ptw = _GEN_617[18];
  assign entries_barrier_2_io_x_ae_final = _GEN_617[17];
  assign entries_barrier_2_io_x_pf = _GEN_617[16];
  assign entries_barrier_2_io_x_gf = _GEN_617[15];
  assign entries_barrier_2_io_x_sw = _GEN_617[14];
  assign entries_barrier_2_io_x_sx = _GEN_617[13];
  assign entries_barrier_2_io_x_sr = _GEN_617[12];
  assign entries_barrier_2_io_x_pw = _GEN_617[8];
  assign entries_barrier_2_io_x_px = _GEN_617[7];
  assign entries_barrier_2_io_x_pr = _GEN_617[6];
  assign entries_barrier_2_io_x_ppp = _GEN_617[5];
  assign entries_barrier_2_io_x_pal = _GEN_617[4];
  assign entries_barrier_2_io_x_paa = _GEN_617[3];
  assign entries_barrier_2_io_x_eff = _GEN_617[2];
  assign entries_barrier_2_io_x_c = _GEN_617[1];
  assign entries_barrier_3_io_x_ppn = _GEN_621[40:21];
  assign entries_barrier_3_io_x_u = _GEN_621[20];
  assign entries_barrier_3_io_x_ae_ptw = _GEN_621[18];
  assign entries_barrier_3_io_x_ae_final = _GEN_621[17];
  assign entries_barrier_3_io_x_pf = _GEN_621[16];
  assign entries_barrier_3_io_x_gf = _GEN_621[15];
  assign entries_barrier_3_io_x_sw = _GEN_621[14];
  assign entries_barrier_3_io_x_sx = _GEN_621[13];
  assign entries_barrier_3_io_x_sr = _GEN_621[12];
  assign entries_barrier_3_io_x_pw = _GEN_621[8];
  assign entries_barrier_3_io_x_px = _GEN_621[7];
  assign entries_barrier_3_io_x_pr = _GEN_621[6];
  assign entries_barrier_3_io_x_ppp = _GEN_621[5];
  assign entries_barrier_3_io_x_pal = _GEN_621[4];
  assign entries_barrier_3_io_x_paa = _GEN_621[3];
  assign entries_barrier_3_io_x_eff = _GEN_621[2];
  assign entries_barrier_3_io_x_c = _GEN_621[1];
  assign entries_barrier_4_io_x_ppn = _GEN_625[40:21];
  assign entries_barrier_4_io_x_u = _GEN_625[20];
  assign entries_barrier_4_io_x_ae_ptw = _GEN_625[18];
  assign entries_barrier_4_io_x_ae_final = _GEN_625[17];
  assign entries_barrier_4_io_x_pf = _GEN_625[16];
  assign entries_barrier_4_io_x_gf = _GEN_625[15];
  assign entries_barrier_4_io_x_sw = _GEN_625[14];
  assign entries_barrier_4_io_x_sx = _GEN_625[13];
  assign entries_barrier_4_io_x_sr = _GEN_625[12];
  assign entries_barrier_4_io_x_pw = _GEN_625[8];
  assign entries_barrier_4_io_x_px = _GEN_625[7];
  assign entries_barrier_4_io_x_pr = _GEN_625[6];
  assign entries_barrier_4_io_x_ppp = _GEN_625[5];
  assign entries_barrier_4_io_x_pal = _GEN_625[4];
  assign entries_barrier_4_io_x_paa = _GEN_625[3];
  assign entries_barrier_4_io_x_eff = _GEN_625[2];
  assign entries_barrier_4_io_x_c = _GEN_625[1];
  assign entries_barrier_5_io_x_ppn = _GEN_629[40:21];
  assign entries_barrier_5_io_x_u = _GEN_629[20];
  assign entries_barrier_5_io_x_ae_ptw = _GEN_629[18];
  assign entries_barrier_5_io_x_ae_final = _GEN_629[17];
  assign entries_barrier_5_io_x_pf = _GEN_629[16];
  assign entries_barrier_5_io_x_gf = _GEN_629[15];
  assign entries_barrier_5_io_x_sw = _GEN_629[14];
  assign entries_barrier_5_io_x_sx = _GEN_629[13];
  assign entries_barrier_5_io_x_sr = _GEN_629[12];
  assign entries_barrier_5_io_x_pw = _GEN_629[8];
  assign entries_barrier_5_io_x_px = _GEN_629[7];
  assign entries_barrier_5_io_x_pr = _GEN_629[6];
  assign entries_barrier_5_io_x_ppp = _GEN_629[5];
  assign entries_barrier_5_io_x_pal = _GEN_629[4];
  assign entries_barrier_5_io_x_paa = _GEN_629[3];
  assign entries_barrier_5_io_x_eff = _GEN_629[2];
  assign entries_barrier_5_io_x_c = _GEN_629[1];
  assign entries_barrier_6_io_x_ppn = _GEN_633[40:21];
  assign entries_barrier_6_io_x_u = _GEN_633[20];
  assign entries_barrier_6_io_x_ae_ptw = _GEN_633[18];
  assign entries_barrier_6_io_x_ae_final = _GEN_633[17];
  assign entries_barrier_6_io_x_pf = _GEN_633[16];
  assign entries_barrier_6_io_x_gf = _GEN_633[15];
  assign entries_barrier_6_io_x_sw = _GEN_633[14];
  assign entries_barrier_6_io_x_sx = _GEN_633[13];
  assign entries_barrier_6_io_x_sr = _GEN_633[12];
  assign entries_barrier_6_io_x_pw = _GEN_633[8];
  assign entries_barrier_6_io_x_px = _GEN_633[7];
  assign entries_barrier_6_io_x_pr = _GEN_633[6];
  assign entries_barrier_6_io_x_ppp = _GEN_633[5];
  assign entries_barrier_6_io_x_pal = _GEN_633[4];
  assign entries_barrier_6_io_x_paa = _GEN_633[3];
  assign entries_barrier_6_io_x_eff = _GEN_633[2];
  assign entries_barrier_6_io_x_c = _GEN_633[1];
  assign entries_barrier_7_io_x_ppn = _GEN_637[40:21];
  assign entries_barrier_7_io_x_u = _GEN_637[20];
  assign entries_barrier_7_io_x_ae_ptw = _GEN_637[18];
  assign entries_barrier_7_io_x_ae_final = _GEN_637[17];
  assign entries_barrier_7_io_x_pf = _GEN_637[16];
  assign entries_barrier_7_io_x_gf = _GEN_637[15];
  assign entries_barrier_7_io_x_sw = _GEN_637[14];
  assign entries_barrier_7_io_x_sx = _GEN_637[13];
  assign entries_barrier_7_io_x_sr = _GEN_637[12];
  assign entries_barrier_7_io_x_pw = _GEN_637[8];
  assign entries_barrier_7_io_x_px = _GEN_637[7];
  assign entries_barrier_7_io_x_pr = _GEN_637[6];
  assign entries_barrier_7_io_x_ppp = _GEN_637[5];
  assign entries_barrier_7_io_x_pal = _GEN_637[4];
  assign entries_barrier_7_io_x_paa = _GEN_637[3];
  assign entries_barrier_7_io_x_eff = _GEN_637[2];
  assign entries_barrier_7_io_x_c = _GEN_637[1];
  assign entries_barrier_8_io_x_ppn = superpage_entries_0_data_0[40:21];
  assign entries_barrier_8_io_x_u = superpage_entries_0_data_0[20];
  assign entries_barrier_8_io_x_ae_ptw = superpage_entries_0_data_0[18];
  assign entries_barrier_8_io_x_ae_final = superpage_entries_0_data_0[17];
  assign entries_barrier_8_io_x_pf = superpage_entries_0_data_0[16];
  assign entries_barrier_8_io_x_gf = superpage_entries_0_data_0[15];
  assign entries_barrier_8_io_x_sw = superpage_entries_0_data_0[14];
  assign entries_barrier_8_io_x_sx = superpage_entries_0_data_0[13];
  assign entries_barrier_8_io_x_sr = superpage_entries_0_data_0[12];
  assign entries_barrier_8_io_x_pw = superpage_entries_0_data_0[8];
  assign entries_barrier_8_io_x_px = superpage_entries_0_data_0[7];
  assign entries_barrier_8_io_x_pr = superpage_entries_0_data_0[6];
  assign entries_barrier_8_io_x_ppp = superpage_entries_0_data_0[5];
  assign entries_barrier_8_io_x_pal = superpage_entries_0_data_0[4];
  assign entries_barrier_8_io_x_paa = superpage_entries_0_data_0[3];
  assign entries_barrier_8_io_x_eff = superpage_entries_0_data_0[2];
  assign entries_barrier_8_io_x_c = superpage_entries_0_data_0[1];
  assign entries_barrier_9_io_x_ppn = superpage_entries_1_data_0[40:21];
  assign entries_barrier_9_io_x_u = superpage_entries_1_data_0[20];
  assign entries_barrier_9_io_x_ae_ptw = superpage_entries_1_data_0[18];
  assign entries_barrier_9_io_x_ae_final = superpage_entries_1_data_0[17];
  assign entries_barrier_9_io_x_pf = superpage_entries_1_data_0[16];
  assign entries_barrier_9_io_x_gf = superpage_entries_1_data_0[15];
  assign entries_barrier_9_io_x_sw = superpage_entries_1_data_0[14];
  assign entries_barrier_9_io_x_sx = superpage_entries_1_data_0[13];
  assign entries_barrier_9_io_x_sr = superpage_entries_1_data_0[12];
  assign entries_barrier_9_io_x_pw = superpage_entries_1_data_0[8];
  assign entries_barrier_9_io_x_px = superpage_entries_1_data_0[7];
  assign entries_barrier_9_io_x_pr = superpage_entries_1_data_0[6];
  assign entries_barrier_9_io_x_ppp = superpage_entries_1_data_0[5];
  assign entries_barrier_9_io_x_pal = superpage_entries_1_data_0[4];
  assign entries_barrier_9_io_x_paa = superpage_entries_1_data_0[3];
  assign entries_barrier_9_io_x_eff = superpage_entries_1_data_0[2];
  assign entries_barrier_9_io_x_c = superpage_entries_1_data_0[1];
  assign entries_barrier_10_io_x_ppn = superpage_entries_2_data_0[40:21];
  assign entries_barrier_10_io_x_u = superpage_entries_2_data_0[20];
  assign entries_barrier_10_io_x_ae_ptw = superpage_entries_2_data_0[18];
  assign entries_barrier_10_io_x_ae_final = superpage_entries_2_data_0[17];
  assign entries_barrier_10_io_x_pf = superpage_entries_2_data_0[16];
  assign entries_barrier_10_io_x_gf = superpage_entries_2_data_0[15];
  assign entries_barrier_10_io_x_sw = superpage_entries_2_data_0[14];
  assign entries_barrier_10_io_x_sx = superpage_entries_2_data_0[13];
  assign entries_barrier_10_io_x_sr = superpage_entries_2_data_0[12];
  assign entries_barrier_10_io_x_pw = superpage_entries_2_data_0[8];
  assign entries_barrier_10_io_x_px = superpage_entries_2_data_0[7];
  assign entries_barrier_10_io_x_pr = superpage_entries_2_data_0[6];
  assign entries_barrier_10_io_x_ppp = superpage_entries_2_data_0[5];
  assign entries_barrier_10_io_x_pal = superpage_entries_2_data_0[4];
  assign entries_barrier_10_io_x_paa = superpage_entries_2_data_0[3];
  assign entries_barrier_10_io_x_eff = superpage_entries_2_data_0[2];
  assign entries_barrier_10_io_x_c = superpage_entries_2_data_0[1];
  assign entries_barrier_11_io_x_ppn = superpage_entries_3_data_0[40:21];
  assign entries_barrier_11_io_x_u = superpage_entries_3_data_0[20];
  assign entries_barrier_11_io_x_ae_ptw = superpage_entries_3_data_0[18];
  assign entries_barrier_11_io_x_ae_final = superpage_entries_3_data_0[17];
  assign entries_barrier_11_io_x_pf = superpage_entries_3_data_0[16];
  assign entries_barrier_11_io_x_gf = superpage_entries_3_data_0[15];
  assign entries_barrier_11_io_x_sw = superpage_entries_3_data_0[14];
  assign entries_barrier_11_io_x_sx = superpage_entries_3_data_0[13];
  assign entries_barrier_11_io_x_sr = superpage_entries_3_data_0[12];
  assign entries_barrier_11_io_x_pw = superpage_entries_3_data_0[8];
  assign entries_barrier_11_io_x_px = superpage_entries_3_data_0[7];
  assign entries_barrier_11_io_x_pr = superpage_entries_3_data_0[6];
  assign entries_barrier_11_io_x_ppp = superpage_entries_3_data_0[5];
  assign entries_barrier_11_io_x_pal = superpage_entries_3_data_0[4];
  assign entries_barrier_11_io_x_paa = superpage_entries_3_data_0[3];
  assign entries_barrier_11_io_x_eff = superpage_entries_3_data_0[2];
  assign entries_barrier_11_io_x_c = superpage_entries_3_data_0[1];
  assign entries_barrier_12_io_x_ppn = special_entry_data_0[40:21];
  assign entries_barrier_12_io_x_u = special_entry_data_0[20];
  assign entries_barrier_12_io_x_ae_ptw = special_entry_data_0[18];
  assign entries_barrier_12_io_x_ae_final = special_entry_data_0[17];
  assign entries_barrier_12_io_x_pf = special_entry_data_0[16];
  assign entries_barrier_12_io_x_gf = special_entry_data_0[15];
  assign entries_barrier_12_io_x_sw = special_entry_data_0[14];
  assign entries_barrier_12_io_x_sx = special_entry_data_0[13];
  assign entries_barrier_12_io_x_sr = special_entry_data_0[12];
  assign entries_barrier_12_io_x_pw = special_entry_data_0[8];
  assign entries_barrier_12_io_x_px = special_entry_data_0[7];
  assign entries_barrier_12_io_x_pr = special_entry_data_0[6];
  assign entries_barrier_12_io_x_ppp = special_entry_data_0[5];
  assign entries_barrier_12_io_x_pal = special_entry_data_0[4];
  assign entries_barrier_12_io_x_paa = special_entry_data_0[3];
  assign entries_barrier_12_io_x_eff = special_entry_data_0[2];
  assign entries_barrier_12_io_x_c = special_entry_data_0[1];
  always @(posedge clock) begin
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h0) begin
            sectored_entries_0_0_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h0) begin
            sectored_entries_0_0_data_0 <= _GEN_61;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h0) begin
            sectored_entries_0_0_data_1 <= _GEN_62;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h0) begin
            sectored_entries_0_0_data_2 <= _GEN_63;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h0) begin
            sectored_entries_0_0_data_3 <= _GEN_64;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_0_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_3[19:10] == 10'h0) begin
          sectored_entries_0_0_valid_0 <= _GEN_669;
        end else begin
          sectored_entries_0_0_valid_0 <= _GEN_665;
        end
      end else begin
        sectored_entries_0_0_valid_0 <= _GEN_685;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_0_valid_0 <= _GEN_289;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_0_valid_1 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_3[19:10] == 10'h0) begin
          sectored_entries_0_0_valid_1 <= _GEN_670;
        end else begin
          sectored_entries_0_0_valid_1 <= _GEN_666;
        end
      end else begin
        sectored_entries_0_0_valid_1 <= _GEN_686;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_0_valid_1 <= _GEN_290;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_0_valid_2 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_3[19:10] == 10'h0) begin
          sectored_entries_0_0_valid_2 <= _GEN_671;
        end else begin
          sectored_entries_0_0_valid_2 <= _GEN_667;
        end
      end else begin
        sectored_entries_0_0_valid_2 <= _GEN_687;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_0_valid_2 <= _GEN_291;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_0_valid_3 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_3[19:10] == 10'h0) begin
          sectored_entries_0_0_valid_3 <= _GEN_672;
        end else begin
          sectored_entries_0_0_valid_3 <= _GEN_668;
        end
      end else begin
        sectored_entries_0_0_valid_3 <= _GEN_688;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_0_valid_3 <= _GEN_292;
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h1) begin
            sectored_entries_0_1_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h1) begin
            sectored_entries_0_1_data_0 <= _GEN_88;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h1) begin
            sectored_entries_0_1_data_1 <= _GEN_89;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h1) begin
            sectored_entries_0_1_data_2 <= _GEN_90;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h1) begin
            sectored_entries_0_1_data_3 <= _GEN_91;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_1_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_11[19:10] == 10'h0) begin
          sectored_entries_0_1_valid_0 <= _GEN_701;
        end else begin
          sectored_entries_0_1_valid_0 <= _GEN_697;
        end
      end else begin
        sectored_entries_0_1_valid_0 <= _GEN_717;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_1_valid_0 <= _GEN_300;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_1_valid_1 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_11[19:10] == 10'h0) begin
          sectored_entries_0_1_valid_1 <= _GEN_702;
        end else begin
          sectored_entries_0_1_valid_1 <= _GEN_698;
        end
      end else begin
        sectored_entries_0_1_valid_1 <= _GEN_718;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_1_valid_1 <= _GEN_301;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_1_valid_2 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_11[19:10] == 10'h0) begin
          sectored_entries_0_1_valid_2 <= _GEN_703;
        end else begin
          sectored_entries_0_1_valid_2 <= _GEN_699;
        end
      end else begin
        sectored_entries_0_1_valid_2 <= _GEN_719;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_1_valid_2 <= _GEN_302;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_1_valid_3 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_11[19:10] == 10'h0) begin
          sectored_entries_0_1_valid_3 <= _GEN_704;
        end else begin
          sectored_entries_0_1_valid_3 <= _GEN_700;
        end
      end else begin
        sectored_entries_0_1_valid_3 <= _GEN_720;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_1_valid_3 <= _GEN_303;
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h2) begin
            sectored_entries_0_2_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h2) begin
            sectored_entries_0_2_data_0 <= _GEN_115;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h2) begin
            sectored_entries_0_2_data_1 <= _GEN_116;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h2) begin
            sectored_entries_0_2_data_2 <= _GEN_117;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h2) begin
            sectored_entries_0_2_data_3 <= _GEN_118;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_2_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_19[19:10] == 10'h0) begin
          sectored_entries_0_2_valid_0 <= _GEN_733;
        end else begin
          sectored_entries_0_2_valid_0 <= _GEN_729;
        end
      end else begin
        sectored_entries_0_2_valid_0 <= _GEN_749;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_2_valid_0 <= _GEN_311;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_2_valid_1 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_19[19:10] == 10'h0) begin
          sectored_entries_0_2_valid_1 <= _GEN_734;
        end else begin
          sectored_entries_0_2_valid_1 <= _GEN_730;
        end
      end else begin
        sectored_entries_0_2_valid_1 <= _GEN_750;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_2_valid_1 <= _GEN_312;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_2_valid_2 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_19[19:10] == 10'h0) begin
          sectored_entries_0_2_valid_2 <= _GEN_735;
        end else begin
          sectored_entries_0_2_valid_2 <= _GEN_731;
        end
      end else begin
        sectored_entries_0_2_valid_2 <= _GEN_751;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_2_valid_2 <= _GEN_313;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_2_valid_3 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_19[19:10] == 10'h0) begin
          sectored_entries_0_2_valid_3 <= _GEN_736;
        end else begin
          sectored_entries_0_2_valid_3 <= _GEN_732;
        end
      end else begin
        sectored_entries_0_2_valid_3 <= _GEN_752;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_2_valid_3 <= _GEN_314;
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h3) begin
            sectored_entries_0_3_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h3) begin
            sectored_entries_0_3_data_0 <= _GEN_142;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h3) begin
            sectored_entries_0_3_data_1 <= _GEN_143;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h3) begin
            sectored_entries_0_3_data_2 <= _GEN_144;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h3) begin
            sectored_entries_0_3_data_3 <= _GEN_145;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_3_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_27[19:10] == 10'h0) begin
          sectored_entries_0_3_valid_0 <= _GEN_765;
        end else begin
          sectored_entries_0_3_valid_0 <= _GEN_761;
        end
      end else begin
        sectored_entries_0_3_valid_0 <= _GEN_781;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_3_valid_0 <= _GEN_322;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_3_valid_1 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_27[19:10] == 10'h0) begin
          sectored_entries_0_3_valid_1 <= _GEN_766;
        end else begin
          sectored_entries_0_3_valid_1 <= _GEN_762;
        end
      end else begin
        sectored_entries_0_3_valid_1 <= _GEN_782;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_3_valid_1 <= _GEN_323;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_3_valid_2 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_27[19:10] == 10'h0) begin
          sectored_entries_0_3_valid_2 <= _GEN_767;
        end else begin
          sectored_entries_0_3_valid_2 <= _GEN_763;
        end
      end else begin
        sectored_entries_0_3_valid_2 <= _GEN_783;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_3_valid_2 <= _GEN_324;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_3_valid_3 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_27[19:10] == 10'h0) begin
          sectored_entries_0_3_valid_3 <= _GEN_768;
        end else begin
          sectored_entries_0_3_valid_3 <= _GEN_764;
        end
      end else begin
        sectored_entries_0_3_valid_3 <= _GEN_784;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_3_valid_3 <= _GEN_325;
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h4) begin
            sectored_entries_0_4_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h4) begin
            sectored_entries_0_4_data_0 <= _GEN_169;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h4) begin
            sectored_entries_0_4_data_1 <= _GEN_170;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h4) begin
            sectored_entries_0_4_data_2 <= _GEN_171;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h4) begin
            sectored_entries_0_4_data_3 <= _GEN_172;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_4_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_35[19:10] == 10'h0) begin
          sectored_entries_0_4_valid_0 <= _GEN_797;
        end else begin
          sectored_entries_0_4_valid_0 <= _GEN_793;
        end
      end else begin
        sectored_entries_0_4_valid_0 <= _GEN_813;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_4_valid_0 <= _GEN_333;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_4_valid_1 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_35[19:10] == 10'h0) begin
          sectored_entries_0_4_valid_1 <= _GEN_798;
        end else begin
          sectored_entries_0_4_valid_1 <= _GEN_794;
        end
      end else begin
        sectored_entries_0_4_valid_1 <= _GEN_814;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_4_valid_1 <= _GEN_334;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_4_valid_2 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_35[19:10] == 10'h0) begin
          sectored_entries_0_4_valid_2 <= _GEN_799;
        end else begin
          sectored_entries_0_4_valid_2 <= _GEN_795;
        end
      end else begin
        sectored_entries_0_4_valid_2 <= _GEN_815;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_4_valid_2 <= _GEN_335;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_4_valid_3 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_35[19:10] == 10'h0) begin
          sectored_entries_0_4_valid_3 <= _GEN_800;
        end else begin
          sectored_entries_0_4_valid_3 <= _GEN_796;
        end
      end else begin
        sectored_entries_0_4_valid_3 <= _GEN_816;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_4_valid_3 <= _GEN_336;
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h5) begin
            sectored_entries_0_5_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h5) begin
            sectored_entries_0_5_data_0 <= _GEN_196;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h5) begin
            sectored_entries_0_5_data_1 <= _GEN_197;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h5) begin
            sectored_entries_0_5_data_2 <= _GEN_198;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h5) begin
            sectored_entries_0_5_data_3 <= _GEN_199;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_5_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_43[19:10] == 10'h0) begin
          sectored_entries_0_5_valid_0 <= _GEN_829;
        end else begin
          sectored_entries_0_5_valid_0 <= _GEN_825;
        end
      end else begin
        sectored_entries_0_5_valid_0 <= _GEN_845;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_5_valid_0 <= _GEN_344;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_5_valid_1 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_43[19:10] == 10'h0) begin
          sectored_entries_0_5_valid_1 <= _GEN_830;
        end else begin
          sectored_entries_0_5_valid_1 <= _GEN_826;
        end
      end else begin
        sectored_entries_0_5_valid_1 <= _GEN_846;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_5_valid_1 <= _GEN_345;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_5_valid_2 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_43[19:10] == 10'h0) begin
          sectored_entries_0_5_valid_2 <= _GEN_831;
        end else begin
          sectored_entries_0_5_valid_2 <= _GEN_827;
        end
      end else begin
        sectored_entries_0_5_valid_2 <= _GEN_847;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_5_valid_2 <= _GEN_346;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_5_valid_3 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_43[19:10] == 10'h0) begin
          sectored_entries_0_5_valid_3 <= _GEN_832;
        end else begin
          sectored_entries_0_5_valid_3 <= _GEN_828;
        end
      end else begin
        sectored_entries_0_5_valid_3 <= _GEN_848;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_5_valid_3 <= _GEN_347;
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h6) begin
            sectored_entries_0_6_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h6) begin
            sectored_entries_0_6_data_0 <= _GEN_223;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h6) begin
            sectored_entries_0_6_data_1 <= _GEN_224;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h6) begin
            sectored_entries_0_6_data_2 <= _GEN_225;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h6) begin
            sectored_entries_0_6_data_3 <= _GEN_226;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_6_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_51[19:10] == 10'h0) begin
          sectored_entries_0_6_valid_0 <= _GEN_861;
        end else begin
          sectored_entries_0_6_valid_0 <= _GEN_857;
        end
      end else begin
        sectored_entries_0_6_valid_0 <= _GEN_877;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_6_valid_0 <= _GEN_355;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_6_valid_1 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_51[19:10] == 10'h0) begin
          sectored_entries_0_6_valid_1 <= _GEN_862;
        end else begin
          sectored_entries_0_6_valid_1 <= _GEN_858;
        end
      end else begin
        sectored_entries_0_6_valid_1 <= _GEN_878;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_6_valid_1 <= _GEN_356;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_6_valid_2 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_51[19:10] == 10'h0) begin
          sectored_entries_0_6_valid_2 <= _GEN_863;
        end else begin
          sectored_entries_0_6_valid_2 <= _GEN_859;
        end
      end else begin
        sectored_entries_0_6_valid_2 <= _GEN_879;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_6_valid_2 <= _GEN_357;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_6_valid_3 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_51[19:10] == 10'h0) begin
          sectored_entries_0_6_valid_3 <= _GEN_864;
        end else begin
          sectored_entries_0_6_valid_3 <= _GEN_860;
        end
      end else begin
        sectored_entries_0_6_valid_3 <= _GEN_880;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_6_valid_3 <= _GEN_358;
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h7) begin
            sectored_entries_0_7_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h7) begin
            sectored_entries_0_7_data_0 <= _GEN_250;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h7) begin
            sectored_entries_0_7_data_1 <= _GEN_251;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h7) begin
            sectored_entries_0_7_data_2 <= _GEN_252;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (!(io_ptw_resp_bits_level < 1'h1)) begin
          if (waddr_1 == 3'h7) begin
            sectored_entries_0_7_data_3 <= _GEN_253;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_7_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_59[19:10] == 10'h0) begin
          sectored_entries_0_7_valid_0 <= _GEN_893;
        end else begin
          sectored_entries_0_7_valid_0 <= _GEN_889;
        end
      end else begin
        sectored_entries_0_7_valid_0 <= _GEN_909;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_7_valid_0 <= _GEN_366;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_7_valid_1 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_59[19:10] == 10'h0) begin
          sectored_entries_0_7_valid_1 <= _GEN_894;
        end else begin
          sectored_entries_0_7_valid_1 <= _GEN_890;
        end
      end else begin
        sectored_entries_0_7_valid_1 <= _GEN_910;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_7_valid_1 <= _GEN_367;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_7_valid_2 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_59[19:10] == 10'h0) begin
          sectored_entries_0_7_valid_2 <= _GEN_895;
        end else begin
          sectored_entries_0_7_valid_2 <= _GEN_891;
        end
      end else begin
        sectored_entries_0_7_valid_2 <= _GEN_911;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_7_valid_2 <= _GEN_368;
      end
    end
    if (multipleHits | reset) begin
      sectored_entries_0_7_valid_3 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_sector_hits_T_59[19:10] == 10'h0) begin
          sectored_entries_0_7_valid_3 <= _GEN_896;
        end else begin
          sectored_entries_0_7_valid_3 <= _GEN_892;
        end
      end else begin
        sectored_entries_0_7_valid_3 <= _GEN_912;
      end
    end else if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        sectored_entries_0_7_valid_3 <= _GEN_369;
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (io_ptw_resp_bits_level < 1'h1) begin
          if (r_superpage_repl_addr == 2'h0) begin
            superpage_entries_0_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (io_ptw_resp_bits_level < 1'h1) begin
          if (r_superpage_repl_addr == 2'h0) begin
            superpage_entries_0_data_0 <= _special_entry_data_0_T;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      superpage_entries_0_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (superpage_hits_0) begin
          superpage_entries_0_valid_0 <= 1'h0;
        end else begin
          superpage_entries_0_valid_0 <= _GEN_498;
        end
      end else begin
        superpage_entries_0_valid_0 <= _GEN_920;
      end
    end else begin
      superpage_entries_0_valid_0 <= _GEN_498;
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (io_ptw_resp_bits_level < 1'h1) begin
          if (r_superpage_repl_addr == 2'h1) begin
            superpage_entries_1_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (io_ptw_resp_bits_level < 1'h1) begin
          if (r_superpage_repl_addr == 2'h1) begin
            superpage_entries_1_data_0 <= _special_entry_data_0_T;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      superpage_entries_1_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (superpage_hits_1) begin
          superpage_entries_1_valid_0 <= 1'h0;
        end else begin
          superpage_entries_1_valid_0 <= _GEN_503;
        end
      end else begin
        superpage_entries_1_valid_0 <= _GEN_925;
      end
    end else begin
      superpage_entries_1_valid_0 <= _GEN_503;
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (io_ptw_resp_bits_level < 1'h1) begin
          if (r_superpage_repl_addr == 2'h2) begin
            superpage_entries_2_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (io_ptw_resp_bits_level < 1'h1) begin
          if (r_superpage_repl_addr == 2'h2) begin
            superpage_entries_2_data_0 <= _special_entry_data_0_T;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      superpage_entries_2_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (superpage_hits_2) begin
          superpage_entries_2_valid_0 <= 1'h0;
        end else begin
          superpage_entries_2_valid_0 <= _GEN_508;
        end
      end else begin
        superpage_entries_2_valid_0 <= _GEN_930;
      end
    end else begin
      superpage_entries_2_valid_0 <= _GEN_508;
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (io_ptw_resp_bits_level < 1'h1) begin
          if (r_superpage_repl_addr == 2'h3) begin
            superpage_entries_3_tag_vpn <= r_refill_tag;
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (!(~io_ptw_resp_bits_homogeneous)) begin
        if (io_ptw_resp_bits_level < 1'h1) begin
          if (r_superpage_repl_addr == 2'h3) begin
            superpage_entries_3_data_0 <= _special_entry_data_0_T;
          end
        end
      end
    end
    if (multipleHits | reset) begin
      superpage_entries_3_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (superpage_hits_3) begin
          superpage_entries_3_valid_0 <= 1'h0;
        end else begin
          superpage_entries_3_valid_0 <= _GEN_513;
        end
      end else begin
        superpage_entries_3_valid_0 <= _GEN_935;
      end
    end else begin
      superpage_entries_3_valid_0 <= _GEN_513;
    end
    if (io_ptw_resp_valid) begin
      if (~io_ptw_resp_bits_homogeneous) begin
        special_entry_level <= io_ptw_resp_bits_level;
      end
    end
    if (io_ptw_resp_valid) begin
      if (~io_ptw_resp_bits_homogeneous) begin
        special_entry_tag_vpn <= r_refill_tag;
      end
    end
    if (io_ptw_resp_valid) begin
      if (~io_ptw_resp_bits_homogeneous) begin
        special_entry_data_0 <= _special_entry_data_0_T;
      end
    end
    if (multipleHits | reset) begin
      special_entry_valid_0 <= 1'h0;
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        if (_hitsVec_T_97) begin
          special_entry_valid_0 <= 1'h0;
        end else begin
          special_entry_valid_0 <= _GEN_493;
        end
      end else begin
        special_entry_valid_0 <= _GEN_940;
      end
    end else begin
      special_entry_valid_0 <= _GEN_493;
    end
    if (reset) begin
      state <= 2'h0;
    end else if (io_ptw_resp_valid) begin
      state <= 2'h0;
    end else if (state == 2'h2 & io_sfence_valid) begin
      state <= 2'h3;
    end else if (_invalidate_refill_T) begin
      state <= _GEN_657;
    end else begin
      state <= _GEN_644;
    end
    if (_T_49 & tlb_miss) begin
      r_refill_tag <= vpn;
    end
    if (_T_49 & tlb_miss) begin
      if (&r_superpage_repl_addr_valids) begin
        r_superpage_repl_addr <= _r_superpage_repl_addr_T_3;
      end else if (_r_superpage_repl_addr_T_5[0]) begin
        r_superpage_repl_addr <= 2'h0;
      end else if (_r_superpage_repl_addr_T_5[1]) begin
        r_superpage_repl_addr <= 2'h1;
      end else begin
        r_superpage_repl_addr <= _r_superpage_repl_addr_T_10;
      end
    end
    if (_T_49 & tlb_miss) begin
      if (&r_sectored_repl_addr_valids) begin
        r_sectored_repl_addr <= _r_sectored_repl_addr_T_9;
      end else if (_r_sectored_repl_addr_T_11[0]) begin
        r_sectored_repl_addr <= 3'h0;
      end else if (_r_sectored_repl_addr_T_11[1]) begin
        r_sectored_repl_addr <= 3'h1;
      end else begin
        r_sectored_repl_addr <= _r_sectored_repl_addr_T_24;
      end
    end
    if (_T_49 & tlb_miss) begin
      r_sectored_hit_valid <= _T_30;
    end
    if (_T_49 & tlb_miss) begin
      r_sectored_hit_bits <= state_vec_0_touch_way_sized;
    end
    if (_T_49 & tlb_miss) begin
      r_need_gpa <= tlb_hit_if_not_gpa_miss;
    end
    if (reset) begin
      state_vec_0 <= 7'h0;
    end else if (io_req_valid & vm_enabled) begin
      if (_T_30) begin
        state_vec_0 <= _state_vec_0_T_22;
      end
    end
    if (reset) begin
      state_reg_1 <= 3'h0;
    end else if (io_req_valid & vm_enabled) begin
      if (_T_41) begin
        state_reg_1 <= _state_reg_T_8;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~io_sfence_bits_rs1 | io_sfence_bits_addr[31:12] == vpn) & (io_sfence_valid & ~reset)) begin
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
        if (io_sfence_valid & ~reset & ~(~io_sfence_bits_rs1 | io_sfence_bits_addr[31:12] == vpn)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at TLB.scala:486 assert(!io.sfence.bits.rs1 || (io.sfence.bits.addr >> pgIdxBits) === vpn)\n"
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
  sectored_entries_0_0_tag_vpn = _RAND_0[19:0];
  _RAND_1 = {2{`RANDOM}};
  sectored_entries_0_0_data_0 = _RAND_1[40:0];
  _RAND_2 = {2{`RANDOM}};
  sectored_entries_0_0_data_1 = _RAND_2[40:0];
  _RAND_3 = {2{`RANDOM}};
  sectored_entries_0_0_data_2 = _RAND_3[40:0];
  _RAND_4 = {2{`RANDOM}};
  sectored_entries_0_0_data_3 = _RAND_4[40:0];
  _RAND_5 = {1{`RANDOM}};
  sectored_entries_0_0_valid_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  sectored_entries_0_0_valid_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  sectored_entries_0_0_valid_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sectored_entries_0_0_valid_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sectored_entries_0_1_tag_vpn = _RAND_9[19:0];
  _RAND_10 = {2{`RANDOM}};
  sectored_entries_0_1_data_0 = _RAND_10[40:0];
  _RAND_11 = {2{`RANDOM}};
  sectored_entries_0_1_data_1 = _RAND_11[40:0];
  _RAND_12 = {2{`RANDOM}};
  sectored_entries_0_1_data_2 = _RAND_12[40:0];
  _RAND_13 = {2{`RANDOM}};
  sectored_entries_0_1_data_3 = _RAND_13[40:0];
  _RAND_14 = {1{`RANDOM}};
  sectored_entries_0_1_valid_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  sectored_entries_0_1_valid_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  sectored_entries_0_1_valid_2 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  sectored_entries_0_1_valid_3 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  sectored_entries_0_2_tag_vpn = _RAND_18[19:0];
  _RAND_19 = {2{`RANDOM}};
  sectored_entries_0_2_data_0 = _RAND_19[40:0];
  _RAND_20 = {2{`RANDOM}};
  sectored_entries_0_2_data_1 = _RAND_20[40:0];
  _RAND_21 = {2{`RANDOM}};
  sectored_entries_0_2_data_2 = _RAND_21[40:0];
  _RAND_22 = {2{`RANDOM}};
  sectored_entries_0_2_data_3 = _RAND_22[40:0];
  _RAND_23 = {1{`RANDOM}};
  sectored_entries_0_2_valid_0 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  sectored_entries_0_2_valid_1 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  sectored_entries_0_2_valid_2 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  sectored_entries_0_2_valid_3 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  sectored_entries_0_3_tag_vpn = _RAND_27[19:0];
  _RAND_28 = {2{`RANDOM}};
  sectored_entries_0_3_data_0 = _RAND_28[40:0];
  _RAND_29 = {2{`RANDOM}};
  sectored_entries_0_3_data_1 = _RAND_29[40:0];
  _RAND_30 = {2{`RANDOM}};
  sectored_entries_0_3_data_2 = _RAND_30[40:0];
  _RAND_31 = {2{`RANDOM}};
  sectored_entries_0_3_data_3 = _RAND_31[40:0];
  _RAND_32 = {1{`RANDOM}};
  sectored_entries_0_3_valid_0 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  sectored_entries_0_3_valid_1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  sectored_entries_0_3_valid_2 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  sectored_entries_0_3_valid_3 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  sectored_entries_0_4_tag_vpn = _RAND_36[19:0];
  _RAND_37 = {2{`RANDOM}};
  sectored_entries_0_4_data_0 = _RAND_37[40:0];
  _RAND_38 = {2{`RANDOM}};
  sectored_entries_0_4_data_1 = _RAND_38[40:0];
  _RAND_39 = {2{`RANDOM}};
  sectored_entries_0_4_data_2 = _RAND_39[40:0];
  _RAND_40 = {2{`RANDOM}};
  sectored_entries_0_4_data_3 = _RAND_40[40:0];
  _RAND_41 = {1{`RANDOM}};
  sectored_entries_0_4_valid_0 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  sectored_entries_0_4_valid_1 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  sectored_entries_0_4_valid_2 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  sectored_entries_0_4_valid_3 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  sectored_entries_0_5_tag_vpn = _RAND_45[19:0];
  _RAND_46 = {2{`RANDOM}};
  sectored_entries_0_5_data_0 = _RAND_46[40:0];
  _RAND_47 = {2{`RANDOM}};
  sectored_entries_0_5_data_1 = _RAND_47[40:0];
  _RAND_48 = {2{`RANDOM}};
  sectored_entries_0_5_data_2 = _RAND_48[40:0];
  _RAND_49 = {2{`RANDOM}};
  sectored_entries_0_5_data_3 = _RAND_49[40:0];
  _RAND_50 = {1{`RANDOM}};
  sectored_entries_0_5_valid_0 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  sectored_entries_0_5_valid_1 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  sectored_entries_0_5_valid_2 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  sectored_entries_0_5_valid_3 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  sectored_entries_0_6_tag_vpn = _RAND_54[19:0];
  _RAND_55 = {2{`RANDOM}};
  sectored_entries_0_6_data_0 = _RAND_55[40:0];
  _RAND_56 = {2{`RANDOM}};
  sectored_entries_0_6_data_1 = _RAND_56[40:0];
  _RAND_57 = {2{`RANDOM}};
  sectored_entries_0_6_data_2 = _RAND_57[40:0];
  _RAND_58 = {2{`RANDOM}};
  sectored_entries_0_6_data_3 = _RAND_58[40:0];
  _RAND_59 = {1{`RANDOM}};
  sectored_entries_0_6_valid_0 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  sectored_entries_0_6_valid_1 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  sectored_entries_0_6_valid_2 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  sectored_entries_0_6_valid_3 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  sectored_entries_0_7_tag_vpn = _RAND_63[19:0];
  _RAND_64 = {2{`RANDOM}};
  sectored_entries_0_7_data_0 = _RAND_64[40:0];
  _RAND_65 = {2{`RANDOM}};
  sectored_entries_0_7_data_1 = _RAND_65[40:0];
  _RAND_66 = {2{`RANDOM}};
  sectored_entries_0_7_data_2 = _RAND_66[40:0];
  _RAND_67 = {2{`RANDOM}};
  sectored_entries_0_7_data_3 = _RAND_67[40:0];
  _RAND_68 = {1{`RANDOM}};
  sectored_entries_0_7_valid_0 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  sectored_entries_0_7_valid_1 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  sectored_entries_0_7_valid_2 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  sectored_entries_0_7_valid_3 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  superpage_entries_0_tag_vpn = _RAND_72[19:0];
  _RAND_73 = {2{`RANDOM}};
  superpage_entries_0_data_0 = _RAND_73[40:0];
  _RAND_74 = {1{`RANDOM}};
  superpage_entries_0_valid_0 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  superpage_entries_1_tag_vpn = _RAND_75[19:0];
  _RAND_76 = {2{`RANDOM}};
  superpage_entries_1_data_0 = _RAND_76[40:0];
  _RAND_77 = {1{`RANDOM}};
  superpage_entries_1_valid_0 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  superpage_entries_2_tag_vpn = _RAND_78[19:0];
  _RAND_79 = {2{`RANDOM}};
  superpage_entries_2_data_0 = _RAND_79[40:0];
  _RAND_80 = {1{`RANDOM}};
  superpage_entries_2_valid_0 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  superpage_entries_3_tag_vpn = _RAND_81[19:0];
  _RAND_82 = {2{`RANDOM}};
  superpage_entries_3_data_0 = _RAND_82[40:0];
  _RAND_83 = {1{`RANDOM}};
  superpage_entries_3_valid_0 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  special_entry_level = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  special_entry_tag_vpn = _RAND_85[19:0];
  _RAND_86 = {2{`RANDOM}};
  special_entry_data_0 = _RAND_86[40:0];
  _RAND_87 = {1{`RANDOM}};
  special_entry_valid_0 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  state = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  r_refill_tag = _RAND_89[19:0];
  _RAND_90 = {1{`RANDOM}};
  r_superpage_repl_addr = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  r_sectored_repl_addr = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  r_sectored_hit_valid = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  r_sectored_hit_bits = _RAND_93[2:0];
  _RAND_94 = {1{`RANDOM}};
  r_need_gpa = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  state_vec_0 = _RAND_95[6:0];
  _RAND_96 = {1{`RANDOM}};
  state_reg_1 = _RAND_96[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule