`default_nettype wire
module SystemBus(
  input         auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready,
  output        auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid,
  output [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id,
  output [31:0] auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr,
  output [7:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len,
  output [2:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size,
  output [1:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst,
  output        auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock,
  output [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache,
  output [2:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot,
  output [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos,
  input         auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready,
  output        auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid,
  output [31:0] auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data,
  output [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb,
  output        auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last,
  output        auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready,
  input         auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid,
  input  [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id,
  input  [1:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp,
  input         auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready,
  output        auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid,
  output [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id,
  output [31:0] auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr,
  output [7:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len,
  output [2:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size,
  output [1:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst,
  output        auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock,
  output [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache,
  output [2:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot,
  output [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos,
  output        auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready,
  input         auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid,
  input  [3:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id,
  input  [31:0] auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data,
  input  [1:0]  auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp,
  input         auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id,
  output [31:0] auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr,
  output [7:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len,
  output [2:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size,
  output [1:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache,
  output [2:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid,
  output [31:0] auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid,
  input  [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id,
  input  [1:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id,
  output [31:0] auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr,
  output [7:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len,
  output [2:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size,
  output [1:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache,
  output [2:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid,
  input  [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id,
  input  [31:0] auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data,
  input  [1:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last,
  output        auto_coupler_from_tile_tl_master_clock_xing_in_a_ready,
  input         auto_coupler_from_tile_tl_master_clock_xing_in_a_valid,
  input  [2:0]  auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode,
  input  [2:0]  auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param,
  input  [3:0]  auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size,
  input  [1:0]  auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source,
  input  [31:0] auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address,
  input  [3:0]  auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask,
  input  [31:0] auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data,
  input         auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt,
  output        auto_coupler_from_tile_tl_master_clock_xing_in_c_ready,
  input         auto_coupler_from_tile_tl_master_clock_xing_in_c_valid,
  input  [2:0]  auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode,
  input  [2:0]  auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param,
  input  [3:0]  auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size,
  input  [1:0]  auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source,
  input  [31:0] auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address,
  input  [31:0] auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data,
  input         auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt,
  input         auto_coupler_from_tile_tl_master_clock_xing_in_d_ready,
  output        auto_coupler_from_tile_tl_master_clock_xing_in_d_valid,
  output [2:0]  auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode,
  output [1:0]  auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param,
  output [3:0]  auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size,
  output [1:0]  auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source,
  output [2:0]  auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink,
  output        auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied,
  output [31:0] auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data,
  output        auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt,
  input         auto_coupler_from_tile_tl_master_clock_xing_in_e_valid,
  input  [2:0]  auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid,
  input  [2:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode,
  input  [2:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param,
  input  [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size,
  input  [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source,
  input  [31:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch,
  input  [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask,
  input  [31:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid,
  output [2:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param,
  output [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size,
  output [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied,
  output [31:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param,
  output [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size,
  output [4:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source,
  output [27:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address,
  output [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask,
  output [31:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt,
  output        auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param,
  input  [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size,
  input  [4:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied,
  input  [31:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt,
  output        auto_fixedClockNode_out_1_clock,
  output        auto_fixedClockNode_out_1_reset,
  output        auto_fixedClockNode_out_0_clock,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset,
  output        auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock,
  output        auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset,
  output        auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock,
  output        auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset,
  output        auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock,
  output        auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset
);
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_3_clock;
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_3_reset;
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_2_clock;
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_2_reset;
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_clock;
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_reset;
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_clock;
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_reset;
  wire  subsystem_sbus_clock_groups_auto_out_2_member_subsystem_fbus_0_clock;
  wire  subsystem_sbus_clock_groups_auto_out_2_member_subsystem_fbus_0_reset;
  wire  subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_1_clock;
  wire  subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_1_reset;
  wire  subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_0_clock;
  wire  subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_0_reset;
  wire  subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_clock;
  wire  subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_reset;
  wire  clockGroup_auto_in_member_subsystem_sbus_0_clock;
  wire  clockGroup_auto_in_member_subsystem_sbus_0_reset;
  wire  clockGroup_auto_out_clock;
  wire  clockGroup_auto_out_reset;
  wire  fixedClockNode_auto_in_clock;
  wire  fixedClockNode_auto_in_reset;
  wire  fixedClockNode_auto_out_2_clock;
  wire  fixedClockNode_auto_out_2_reset;
  wire  fixedClockNode_auto_out_1_clock;
  wire  fixedClockNode_auto_out_0_clock;
  wire  fixedClockNode_auto_out_0_reset;
  wire  system_bus_xbar_clock;
  wire  system_bus_xbar_reset;
  wire  system_bus_xbar_auto_in_1_a_ready;
  wire  system_bus_xbar_auto_in_1_a_valid;
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_opcode;
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_param;
  wire [3:0] system_bus_xbar_auto_in_1_a_bits_size;
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_source;
  wire [31:0] system_bus_xbar_auto_in_1_a_bits_address;
  wire [3:0] system_bus_xbar_auto_in_1_a_bits_mask;
  wire [31:0] system_bus_xbar_auto_in_1_a_bits_data;
  wire  system_bus_xbar_auto_in_1_a_bits_corrupt;
  wire  system_bus_xbar_auto_in_1_d_ready;
  wire  system_bus_xbar_auto_in_1_d_valid;
  wire [2:0] system_bus_xbar_auto_in_1_d_bits_opcode;
  wire [1:0] system_bus_xbar_auto_in_1_d_bits_param;
  wire [3:0] system_bus_xbar_auto_in_1_d_bits_size;
  wire [2:0] system_bus_xbar_auto_in_1_d_bits_source;
  wire  system_bus_xbar_auto_in_1_d_bits_sink;
  wire  system_bus_xbar_auto_in_1_d_bits_denied;
  wire [31:0] system_bus_xbar_auto_in_1_d_bits_data;
  wire  system_bus_xbar_auto_in_1_d_bits_corrupt;
  wire  system_bus_xbar_auto_in_0_a_ready;
  wire  system_bus_xbar_auto_in_0_a_valid;
  wire [2:0] system_bus_xbar_auto_in_0_a_bits_opcode;
  wire [2:0] system_bus_xbar_auto_in_0_a_bits_param;
  wire [3:0] system_bus_xbar_auto_in_0_a_bits_size;
  wire [3:0] system_bus_xbar_auto_in_0_a_bits_source;
  wire [31:0] system_bus_xbar_auto_in_0_a_bits_address;
  wire  system_bus_xbar_auto_in_0_a_bits_user_amba_prot_bufferable;
  wire  system_bus_xbar_auto_in_0_a_bits_user_amba_prot_modifiable;
  wire  system_bus_xbar_auto_in_0_a_bits_user_amba_prot_readalloc;
  wire  system_bus_xbar_auto_in_0_a_bits_user_amba_prot_writealloc;
  wire  system_bus_xbar_auto_in_0_a_bits_user_amba_prot_privileged;
  wire  system_bus_xbar_auto_in_0_a_bits_user_amba_prot_secure;
  wire  system_bus_xbar_auto_in_0_a_bits_user_amba_prot_fetch;
  wire [3:0] system_bus_xbar_auto_in_0_a_bits_mask;
  wire [31:0] system_bus_xbar_auto_in_0_a_bits_data;
  wire  system_bus_xbar_auto_in_0_a_bits_corrupt;
  wire  system_bus_xbar_auto_in_0_d_ready;
  wire  system_bus_xbar_auto_in_0_d_valid;
  wire [2:0] system_bus_xbar_auto_in_0_d_bits_opcode;
  wire [1:0] system_bus_xbar_auto_in_0_d_bits_param;
  wire [3:0] system_bus_xbar_auto_in_0_d_bits_size;
  wire [3:0] system_bus_xbar_auto_in_0_d_bits_source;
  wire  system_bus_xbar_auto_in_0_d_bits_sink;
  wire  system_bus_xbar_auto_in_0_d_bits_denied;
  wire [31:0] system_bus_xbar_auto_in_0_d_bits_data;
  wire  system_bus_xbar_auto_in_0_d_bits_corrupt;
  wire  system_bus_xbar_auto_out_2_a_ready;
  wire  system_bus_xbar_auto_out_2_a_valid;
  wire [2:0] system_bus_xbar_auto_out_2_a_bits_opcode;
  wire [2:0] system_bus_xbar_auto_out_2_a_bits_param;
  wire [3:0] system_bus_xbar_auto_out_2_a_bits_size;
  wire [4:0] system_bus_xbar_auto_out_2_a_bits_source;
  wire [31:0] system_bus_xbar_auto_out_2_a_bits_address;
  wire  system_bus_xbar_auto_out_2_a_bits_user_amba_prot_bufferable;
  wire  system_bus_xbar_auto_out_2_a_bits_user_amba_prot_modifiable;
  wire  system_bus_xbar_auto_out_2_a_bits_user_amba_prot_readalloc;
  wire  system_bus_xbar_auto_out_2_a_bits_user_amba_prot_writealloc;
  wire  system_bus_xbar_auto_out_2_a_bits_user_amba_prot_privileged;
  wire  system_bus_xbar_auto_out_2_a_bits_user_amba_prot_secure;
  wire  system_bus_xbar_auto_out_2_a_bits_user_amba_prot_fetch;
  wire [3:0] system_bus_xbar_auto_out_2_a_bits_mask;
  wire [31:0] system_bus_xbar_auto_out_2_a_bits_data;
  wire  system_bus_xbar_auto_out_2_a_bits_corrupt;
  wire  system_bus_xbar_auto_out_2_d_ready;
  wire  system_bus_xbar_auto_out_2_d_valid;
  wire [2:0] system_bus_xbar_auto_out_2_d_bits_opcode;
  wire [3:0] system_bus_xbar_auto_out_2_d_bits_size;
  wire [4:0] system_bus_xbar_auto_out_2_d_bits_source;
  wire  system_bus_xbar_auto_out_2_d_bits_denied;
  wire [31:0] system_bus_xbar_auto_out_2_d_bits_data;
  wire  system_bus_xbar_auto_out_2_d_bits_corrupt;
  wire  system_bus_xbar_auto_out_1_a_ready;
  wire  system_bus_xbar_auto_out_1_a_valid;
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_opcode;
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_param;
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_size;
  wire [4:0] system_bus_xbar_auto_out_1_a_bits_source;
  wire [31:0] system_bus_xbar_auto_out_1_a_bits_address;
  wire  system_bus_xbar_auto_out_1_a_bits_user_amba_prot_bufferable;
  wire  system_bus_xbar_auto_out_1_a_bits_user_amba_prot_modifiable;
  wire  system_bus_xbar_auto_out_1_a_bits_user_amba_prot_readalloc;
  wire  system_bus_xbar_auto_out_1_a_bits_user_amba_prot_writealloc;
  wire  system_bus_xbar_auto_out_1_a_bits_user_amba_prot_privileged;
  wire  system_bus_xbar_auto_out_1_a_bits_user_amba_prot_secure;
  wire  system_bus_xbar_auto_out_1_a_bits_user_amba_prot_fetch;
  wire [3:0] system_bus_xbar_auto_out_1_a_bits_mask;
  wire [31:0] system_bus_xbar_auto_out_1_a_bits_data;
  wire  system_bus_xbar_auto_out_1_a_bits_corrupt;
  wire  system_bus_xbar_auto_out_1_d_ready;
  wire  system_bus_xbar_auto_out_1_d_valid;
  wire [2:0] system_bus_xbar_auto_out_1_d_bits_opcode;
  wire [2:0] system_bus_xbar_auto_out_1_d_bits_size;
  wire [4:0] system_bus_xbar_auto_out_1_d_bits_source;
  wire  system_bus_xbar_auto_out_1_d_bits_denied;
  wire [31:0] system_bus_xbar_auto_out_1_d_bits_data;
  wire  system_bus_xbar_auto_out_1_d_bits_corrupt;
  wire  system_bus_xbar_auto_out_0_a_ready;
  wire  system_bus_xbar_auto_out_0_a_valid;
  wire [2:0] system_bus_xbar_auto_out_0_a_bits_opcode;
  wire [2:0] system_bus_xbar_auto_out_0_a_bits_param;
  wire [3:0] system_bus_xbar_auto_out_0_a_bits_size;
  wire [4:0] system_bus_xbar_auto_out_0_a_bits_source;
  wire [27:0] system_bus_xbar_auto_out_0_a_bits_address;
  wire [3:0] system_bus_xbar_auto_out_0_a_bits_mask;
  wire [31:0] system_bus_xbar_auto_out_0_a_bits_data;
  wire  system_bus_xbar_auto_out_0_a_bits_corrupt;
  wire  system_bus_xbar_auto_out_0_d_ready;
  wire  system_bus_xbar_auto_out_0_d_valid;
  wire [2:0] system_bus_xbar_auto_out_0_d_bits_opcode;
  wire [1:0] system_bus_xbar_auto_out_0_d_bits_param;
  wire [3:0] system_bus_xbar_auto_out_0_d_bits_size;
  wire [4:0] system_bus_xbar_auto_out_0_d_bits_source;
  wire  system_bus_xbar_auto_out_0_d_bits_sink;
  wire  system_bus_xbar_auto_out_0_d_bits_denied;
  wire [31:0] system_bus_xbar_auto_out_0_d_bits_data;
  wire  system_bus_xbar_auto_out_0_d_bits_corrupt;
  wire  fixer_clock;
  wire  fixer_reset;
  wire  fixer_auto_in_1_a_ready;
  wire  fixer_auto_in_1_a_valid;
  wire [2:0] fixer_auto_in_1_a_bits_opcode;
  wire [2:0] fixer_auto_in_1_a_bits_param;
  wire [3:0] fixer_auto_in_1_a_bits_size;
  wire [2:0] fixer_auto_in_1_a_bits_source;
  wire [31:0] fixer_auto_in_1_a_bits_address;
  wire [3:0] fixer_auto_in_1_a_bits_mask;
  wire [31:0] fixer_auto_in_1_a_bits_data;
  wire  fixer_auto_in_1_a_bits_corrupt;
  wire  fixer_auto_in_1_d_ready;
  wire  fixer_auto_in_1_d_valid;
  wire [2:0] fixer_auto_in_1_d_bits_opcode;
  wire [1:0] fixer_auto_in_1_d_bits_param;
  wire [3:0] fixer_auto_in_1_d_bits_size;
  wire [2:0] fixer_auto_in_1_d_bits_source;
  wire  fixer_auto_in_1_d_bits_denied;
  wire [31:0] fixer_auto_in_1_d_bits_data;
  wire  fixer_auto_in_1_d_bits_corrupt;
  wire  fixer_auto_in_0_a_ready;
  wire  fixer_auto_in_0_a_valid;
  wire [2:0] fixer_auto_in_0_a_bits_opcode;
  wire [2:0] fixer_auto_in_0_a_bits_param;
  wire [3:0] fixer_auto_in_0_a_bits_size;
  wire [3:0] fixer_auto_in_0_a_bits_source;
  wire [31:0] fixer_auto_in_0_a_bits_address;
  wire  fixer_auto_in_0_a_bits_user_amba_prot_bufferable;
  wire  fixer_auto_in_0_a_bits_user_amba_prot_modifiable;
  wire  fixer_auto_in_0_a_bits_user_amba_prot_readalloc;
  wire  fixer_auto_in_0_a_bits_user_amba_prot_writealloc;
  wire  fixer_auto_in_0_a_bits_user_amba_prot_privileged;
  wire  fixer_auto_in_0_a_bits_user_amba_prot_secure;
  wire  fixer_auto_in_0_a_bits_user_amba_prot_fetch;
  wire [3:0] fixer_auto_in_0_a_bits_mask;
  wire [31:0] fixer_auto_in_0_a_bits_data;
  wire  fixer_auto_in_0_a_bits_corrupt;
  wire  fixer_auto_in_0_d_ready;
  wire  fixer_auto_in_0_d_valid;
  wire [2:0] fixer_auto_in_0_d_bits_opcode;
  wire [1:0] fixer_auto_in_0_d_bits_param;
  wire [3:0] fixer_auto_in_0_d_bits_size;
  wire [3:0] fixer_auto_in_0_d_bits_source;
  wire  fixer_auto_in_0_d_bits_sink;
  wire  fixer_auto_in_0_d_bits_denied;
  wire [31:0] fixer_auto_in_0_d_bits_data;
  wire  fixer_auto_in_0_d_bits_corrupt;
  wire  fixer_auto_out_1_a_ready;
  wire  fixer_auto_out_1_a_valid;
  wire [2:0] fixer_auto_out_1_a_bits_opcode;
  wire [2:0] fixer_auto_out_1_a_bits_param;
  wire [3:0] fixer_auto_out_1_a_bits_size;
  wire [2:0] fixer_auto_out_1_a_bits_source;
  wire [31:0] fixer_auto_out_1_a_bits_address;
  wire [3:0] fixer_auto_out_1_a_bits_mask;
  wire [31:0] fixer_auto_out_1_a_bits_data;
  wire  fixer_auto_out_1_a_bits_corrupt;
  wire  fixer_auto_out_1_d_ready;
  wire  fixer_auto_out_1_d_valid;
  wire [2:0] fixer_auto_out_1_d_bits_opcode;
  wire [1:0] fixer_auto_out_1_d_bits_param;
  wire [3:0] fixer_auto_out_1_d_bits_size;
  wire [2:0] fixer_auto_out_1_d_bits_source;
  wire  fixer_auto_out_1_d_bits_sink;
  wire  fixer_auto_out_1_d_bits_denied;
  wire [31:0] fixer_auto_out_1_d_bits_data;
  wire  fixer_auto_out_1_d_bits_corrupt;
  wire  fixer_auto_out_0_a_ready;
  wire  fixer_auto_out_0_a_valid;
  wire [2:0] fixer_auto_out_0_a_bits_opcode;
  wire [2:0] fixer_auto_out_0_a_bits_param;
  wire [3:0] fixer_auto_out_0_a_bits_size;
  wire [3:0] fixer_auto_out_0_a_bits_source;
  wire [31:0] fixer_auto_out_0_a_bits_address;
  wire  fixer_auto_out_0_a_bits_user_amba_prot_bufferable;
  wire  fixer_auto_out_0_a_bits_user_amba_prot_modifiable;
  wire  fixer_auto_out_0_a_bits_user_amba_prot_readalloc;
  wire  fixer_auto_out_0_a_bits_user_amba_prot_writealloc;
  wire  fixer_auto_out_0_a_bits_user_amba_prot_privileged;
  wire  fixer_auto_out_0_a_bits_user_amba_prot_secure;
  wire  fixer_auto_out_0_a_bits_user_amba_prot_fetch;
  wire [3:0] fixer_auto_out_0_a_bits_mask;
  wire [31:0] fixer_auto_out_0_a_bits_data;
  wire  fixer_auto_out_0_a_bits_corrupt;
  wire  fixer_auto_out_0_d_ready;
  wire  fixer_auto_out_0_d_valid;
  wire [2:0] fixer_auto_out_0_d_bits_opcode;
  wire [1:0] fixer_auto_out_0_d_bits_param;
  wire [3:0] fixer_auto_out_0_d_bits_size;
  wire [3:0] fixer_auto_out_0_d_bits_source;
  wire  fixer_auto_out_0_d_bits_sink;
  wire  fixer_auto_out_0_d_bits_denied;
  wire [31:0] fixer_auto_out_0_d_bits_data;
  wire  fixer_auto_out_0_d_bits_corrupt;
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_ready;
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_valid;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_opcode;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_param;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_size;
  wire [4:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_source;
  wire [27:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_address;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_mask;
  wire [31:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_data;
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_corrupt;
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_ready;
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_valid;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_opcode;
  wire [1:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_param;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_size;
  wire [4:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_source;
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_sink;
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_denied;
  wire [31:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_data;
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_corrupt;
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_ready;
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_valid;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_opcode;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_param;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_size;
  wire [4:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_source;
  wire [27:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_address;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_mask;
  wire [31:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_data;
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_corrupt;
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_ready;
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_valid;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_opcode;
  wire [1:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_param;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_size;
  wire [4:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_source;
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_sink;
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_denied;
  wire [31:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_data;
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_corrupt;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_ready;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_valid;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_opcode;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_param;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_size;
  wire [4:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_source;
  wire [27:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_address;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_mask;
  wire [31:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_data;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_corrupt;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_ready;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_valid;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_opcode;
  wire [1:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_param;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_size;
  wire [4:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_source;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_sink;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_denied;
  wire [31:0] coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_data;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_corrupt;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_ready;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_valid;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_opcode;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_param;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_size;
  wire [4:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_source;
  wire [27:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_address;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_mask;
  wire [31:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_data;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_corrupt;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_ready;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_valid;
  wire [2:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_opcode;
  wire [1:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_param;
  wire [3:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_size;
  wire [4:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_source;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_sink;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_denied;
  wire [31:0] coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_data;
  wire  coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_corrupt;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_ready;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_valid;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_opcode;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_param;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_size;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_source;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_address;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_bufferable;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_modifiable;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_readalloc;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_writealloc;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_privileged;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_secure;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_fetch;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_mask;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_data;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_corrupt;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_ready;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_valid;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_opcode;
  wire [1:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_param;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_size;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_source;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_sink;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_denied;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_data;
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_corrupt;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_ready;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_valid;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_opcode;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_param;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_size;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_source;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_address;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_bufferable;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_modifiable;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_readalloc;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_writealloc;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_privileged;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_secure;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_fetch;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_mask;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_data;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_corrupt;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_ready;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_valid;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_opcode;
  wire [1:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_param;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_size;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_source;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_sink;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_denied;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_data;
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_corrupt;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_ready;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_valid;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_opcode;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_param;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_size;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_source;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_address;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_bufferable;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_modifiable;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_readalloc;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_writealloc;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_privileged;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_secure;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_fetch;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_mask;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_data;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_corrupt;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_ready;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_valid;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_opcode;
  wire [1:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_param;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_size;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_source;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_sink;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_denied;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_data;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_corrupt;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_ready;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_valid;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_opcode;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_param;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_size;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_source;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_address;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_bufferable;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_modifiable;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_readalloc;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_writealloc;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_privileged;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_secure;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_fetch;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_mask;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_data;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_corrupt;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_ready;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_valid;
  wire [2:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_opcode;
  wire [1:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_param;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_size;
  wire [3:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_source;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_sink;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_denied;
  wire [31:0] coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_data;
  wire  coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_corrupt;
  wire  coupler_from_tile_clock;
  wire  coupler_from_tile_reset;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_a_ready;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_a_valid;
  wire [2:0] coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_opcode;
  wire [2:0] coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_param;
  wire [3:0] coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_size;
  wire [1:0] coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_source;
  wire [31:0] coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_address;
  wire [3:0] coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_mask;
  wire [31:0] coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_data;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_corrupt;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_c_ready;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_c_valid;
  wire [2:0] coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_opcode;
  wire [2:0] coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_param;
  wire [3:0] coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_size;
  wire [1:0] coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_source;
  wire [31:0] coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_address;
  wire [31:0] coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_data;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_corrupt;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_d_ready;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_d_valid;
  wire [2:0] coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_opcode;
  wire [1:0] coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_param;
  wire [3:0] coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_size;
  wire [1:0] coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_source;
  wire [2:0] coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_sink;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_denied;
  wire [31:0] coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_data;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_corrupt;
  wire  coupler_from_tile_auto_tl_master_clock_xing_in_e_valid;
  wire [2:0] coupler_from_tile_auto_tl_master_clock_xing_in_e_bits_sink;
  wire  coupler_from_tile_auto_tl_out_a_ready;
  wire  coupler_from_tile_auto_tl_out_a_valid;
  wire [2:0] coupler_from_tile_auto_tl_out_a_bits_opcode;
  wire [2:0] coupler_from_tile_auto_tl_out_a_bits_param;
  wire [3:0] coupler_from_tile_auto_tl_out_a_bits_size;
  wire [2:0] coupler_from_tile_auto_tl_out_a_bits_source;
  wire [31:0] coupler_from_tile_auto_tl_out_a_bits_address;
  wire [3:0] coupler_from_tile_auto_tl_out_a_bits_mask;
  wire [31:0] coupler_from_tile_auto_tl_out_a_bits_data;
  wire  coupler_from_tile_auto_tl_out_a_bits_corrupt;
  wire  coupler_from_tile_auto_tl_out_d_ready;
  wire  coupler_from_tile_auto_tl_out_d_valid;
  wire [2:0] coupler_from_tile_auto_tl_out_d_bits_opcode;
  wire [1:0] coupler_from_tile_auto_tl_out_d_bits_param;
  wire [3:0] coupler_from_tile_auto_tl_out_d_bits_size;
  wire [2:0] coupler_from_tile_auto_tl_out_d_bits_source;
  wire  coupler_from_tile_auto_tl_out_d_bits_denied;
  wire [31:0] coupler_from_tile_auto_tl_out_d_bits_data;
  wire  coupler_from_tile_auto_tl_out_d_bits_corrupt;
  wire  xbar_auto_in_a_ready;
  wire  xbar_auto_in_a_valid;
  wire [2:0] xbar_auto_in_a_bits_opcode;
  wire [2:0] xbar_auto_in_a_bits_param;
  wire [2:0] xbar_auto_in_a_bits_size;
  wire [4:0] xbar_auto_in_a_bits_source;
  wire [31:0] xbar_auto_in_a_bits_address;
  wire  xbar_auto_in_a_bits_user_amba_prot_bufferable;
  wire  xbar_auto_in_a_bits_user_amba_prot_modifiable;
  wire  xbar_auto_in_a_bits_user_amba_prot_readalloc;
  wire  xbar_auto_in_a_bits_user_amba_prot_writealloc;
  wire  xbar_auto_in_a_bits_user_amba_prot_privileged;
  wire  xbar_auto_in_a_bits_user_amba_prot_secure;
  wire  xbar_auto_in_a_bits_user_amba_prot_fetch;
  wire [3:0] xbar_auto_in_a_bits_mask;
  wire [31:0] xbar_auto_in_a_bits_data;
  wire  xbar_auto_in_a_bits_corrupt;
  wire  xbar_auto_in_d_ready;
  wire  xbar_auto_in_d_valid;
  wire [2:0] xbar_auto_in_d_bits_opcode;
  wire [2:0] xbar_auto_in_d_bits_size;
  wire [4:0] xbar_auto_in_d_bits_source;
  wire  xbar_auto_in_d_bits_denied;
  wire [31:0] xbar_auto_in_d_bits_data;
  wire  xbar_auto_in_d_bits_corrupt;
  wire  xbar_auto_out_a_ready;
  wire  xbar_auto_out_a_valid;
  wire [2:0] xbar_auto_out_a_bits_opcode;
  wire [2:0] xbar_auto_out_a_bits_param;
  wire [2:0] xbar_auto_out_a_bits_size;
  wire [4:0] xbar_auto_out_a_bits_source;
  wire [31:0] xbar_auto_out_a_bits_address;
  wire  xbar_auto_out_a_bits_user_amba_prot_bufferable;
  wire  xbar_auto_out_a_bits_user_amba_prot_modifiable;
  wire  xbar_auto_out_a_bits_user_amba_prot_readalloc;
  wire  xbar_auto_out_a_bits_user_amba_prot_writealloc;
  wire  xbar_auto_out_a_bits_user_amba_prot_privileged;
  wire  xbar_auto_out_a_bits_user_amba_prot_secure;
  wire  xbar_auto_out_a_bits_user_amba_prot_fetch;
  wire [3:0] xbar_auto_out_a_bits_mask;
  wire [31:0] xbar_auto_out_a_bits_data;
  wire  xbar_auto_out_a_bits_corrupt;
  wire  xbar_auto_out_d_ready;
  wire  xbar_auto_out_d_valid;
  wire [2:0] xbar_auto_out_d_bits_opcode;
  wire [2:0] xbar_auto_out_d_bits_size;
  wire [4:0] xbar_auto_out_d_bits_source;
  wire  xbar_auto_out_d_bits_denied;
  wire [31:0] xbar_auto_out_d_bits_data;
  wire  xbar_auto_out_d_bits_corrupt;
  wire  coupler_to_memory_controller_port_named_axi4_clock;
  wire  coupler_to_memory_controller_port_named_axi4_reset;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_valid;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_opcode;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_param;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_size;
  wire [4:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_source;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_address;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_bufferable;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_modifiable;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_readalloc;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_writealloc;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_privileged;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_secure;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_fetch;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_mask;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_data;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_corrupt;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_valid;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_opcode;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_size;
  wire [4:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_source;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_denied;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_data;
  wire  coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_corrupt;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_valid;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_id;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_addr;
  wire [7:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_len;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_size;
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_burst;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_lock;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_cache;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_prot;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_qos;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_valid;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_data;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_strb;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_last;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_valid;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_id;
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_resp;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_valid;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_id;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_addr;
  wire [7:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_len;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_size;
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_burst;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_lock;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_cache;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_prot;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_qos;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_valid;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_id;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_data;
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_resp;
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_last;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_valid;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_opcode;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_param;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_size;
  wire [4:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_source;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_address;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_bufferable;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_modifiable;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_readalloc;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_writealloc;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_privileged;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_secure;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_fetch;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_mask;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_data;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_corrupt;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_valid;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_opcode;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_size;
  wire [4:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_source;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_denied;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_data;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_corrupt;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_valid;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_opcode;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_param;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_size;
  wire [4:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_source;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_address;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_privileged;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_secure;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_fetch;
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_mask;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_data;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_corrupt;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_ready;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_valid;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_opcode;
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_size;
  wire [4:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_source;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_denied;
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_data;
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_corrupt;
  wire  coupler_to_port_named_mmio_port_axi4_clock;
  wire  coupler_to_port_named_mmio_port_axi4_reset;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_ready;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_valid;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_id;
  wire [31:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_addr;
  wire [7:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_len;
  wire [2:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_size;
  wire [1:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_burst;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_lock;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_cache;
  wire [2:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_prot;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_qos;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_ready;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_valid;
  wire [31:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_data;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_strb;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_last;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_ready;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_valid;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_bits_id;
  wire [1:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_bits_resp;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_ready;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_valid;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_id;
  wire [31:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_addr;
  wire [7:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_len;
  wire [2:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_size;
  wire [1:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_burst;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_lock;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_cache;
  wire [2:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_prot;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_qos;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_ready;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_valid;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_id;
  wire [31:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_data;
  wire [1:0] coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_resp;
  wire  coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_last;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_ready;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_valid;
  wire [2:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_opcode;
  wire [2:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_param;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_size;
  wire [4:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_source;
  wire [31:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_address;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_bufferable;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_modifiable;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_readalloc;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_writealloc;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_privileged;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_secure;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_fetch;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_mask;
  wire [31:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_data;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_corrupt;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_ready;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_valid;
  wire [2:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_opcode;
  wire [3:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_size;
  wire [4:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_source;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_denied;
  wire [31:0] coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_data;
  wire  coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_corrupt;
  FixedClockBroadcast fixedClockNode (
    .auto_in_clock(fixedClockNode_auto_in_clock),
    .auto_in_reset(fixedClockNode_auto_in_reset),
    .auto_out_2_clock(fixedClockNode_auto_out_2_clock),
    .auto_out_2_reset(fixedClockNode_auto_out_2_reset),
    .auto_out_1_clock(fixedClockNode_auto_out_1_clock),
    .auto_out_0_clock(fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset(fixedClockNode_auto_out_0_reset)
  );
  TLXbar system_bus_xbar (
    .clock(system_bus_xbar_clock),
    .reset(system_bus_xbar_reset),
    .auto_in_1_a_ready(system_bus_xbar_auto_in_1_a_ready),
    .auto_in_1_a_valid(system_bus_xbar_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(system_bus_xbar_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(system_bus_xbar_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(system_bus_xbar_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(system_bus_xbar_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(system_bus_xbar_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(system_bus_xbar_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(system_bus_xbar_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(system_bus_xbar_auto_in_1_a_bits_corrupt),
    .auto_in_1_d_ready(system_bus_xbar_auto_in_1_d_ready),
    .auto_in_1_d_valid(system_bus_xbar_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(system_bus_xbar_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param(system_bus_xbar_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size(system_bus_xbar_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source(system_bus_xbar_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_sink(system_bus_xbar_auto_in_1_d_bits_sink),
    .auto_in_1_d_bits_denied(system_bus_xbar_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data(system_bus_xbar_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(system_bus_xbar_auto_in_1_d_bits_corrupt),
    .auto_in_0_a_ready(system_bus_xbar_auto_in_0_a_ready),
    .auto_in_0_a_valid(system_bus_xbar_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(system_bus_xbar_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(system_bus_xbar_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(system_bus_xbar_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(system_bus_xbar_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(system_bus_xbar_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_user_amba_prot_bufferable(system_bus_xbar_auto_in_0_a_bits_user_amba_prot_bufferable),
    .auto_in_0_a_bits_user_amba_prot_modifiable(system_bus_xbar_auto_in_0_a_bits_user_amba_prot_modifiable),
    .auto_in_0_a_bits_user_amba_prot_readalloc(system_bus_xbar_auto_in_0_a_bits_user_amba_prot_readalloc),
    .auto_in_0_a_bits_user_amba_prot_writealloc(system_bus_xbar_auto_in_0_a_bits_user_amba_prot_writealloc),
    .auto_in_0_a_bits_user_amba_prot_privileged(system_bus_xbar_auto_in_0_a_bits_user_amba_prot_privileged),
    .auto_in_0_a_bits_user_amba_prot_secure(system_bus_xbar_auto_in_0_a_bits_user_amba_prot_secure),
    .auto_in_0_a_bits_user_amba_prot_fetch(system_bus_xbar_auto_in_0_a_bits_user_amba_prot_fetch),
    .auto_in_0_a_bits_mask(system_bus_xbar_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(system_bus_xbar_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(system_bus_xbar_auto_in_0_a_bits_corrupt),
    .auto_in_0_d_ready(system_bus_xbar_auto_in_0_d_ready),
    .auto_in_0_d_valid(system_bus_xbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(system_bus_xbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(system_bus_xbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(system_bus_xbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(system_bus_xbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(system_bus_xbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(system_bus_xbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(system_bus_xbar_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt(system_bus_xbar_auto_in_0_d_bits_corrupt),
    .auto_out_2_a_ready(system_bus_xbar_auto_out_2_a_ready),
    .auto_out_2_a_valid(system_bus_xbar_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode(system_bus_xbar_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param(system_bus_xbar_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size(system_bus_xbar_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source(system_bus_xbar_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address(system_bus_xbar_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_user_amba_prot_bufferable(system_bus_xbar_auto_out_2_a_bits_user_amba_prot_bufferable),
    .auto_out_2_a_bits_user_amba_prot_modifiable(system_bus_xbar_auto_out_2_a_bits_user_amba_prot_modifiable),
    .auto_out_2_a_bits_user_amba_prot_readalloc(system_bus_xbar_auto_out_2_a_bits_user_amba_prot_readalloc),
    .auto_out_2_a_bits_user_amba_prot_writealloc(system_bus_xbar_auto_out_2_a_bits_user_amba_prot_writealloc),
    .auto_out_2_a_bits_user_amba_prot_privileged(system_bus_xbar_auto_out_2_a_bits_user_amba_prot_privileged),
    .auto_out_2_a_bits_user_amba_prot_secure(system_bus_xbar_auto_out_2_a_bits_user_amba_prot_secure),
    .auto_out_2_a_bits_user_amba_prot_fetch(system_bus_xbar_auto_out_2_a_bits_user_amba_prot_fetch),
    .auto_out_2_a_bits_mask(system_bus_xbar_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data(system_bus_xbar_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt(system_bus_xbar_auto_out_2_a_bits_corrupt),
    .auto_out_2_d_ready(system_bus_xbar_auto_out_2_d_ready),
    .auto_out_2_d_valid(system_bus_xbar_auto_out_2_d_valid),
    .auto_out_2_d_bits_opcode(system_bus_xbar_auto_out_2_d_bits_opcode),
    .auto_out_2_d_bits_size(system_bus_xbar_auto_out_2_d_bits_size),
    .auto_out_2_d_bits_source(system_bus_xbar_auto_out_2_d_bits_source),
    .auto_out_2_d_bits_denied(system_bus_xbar_auto_out_2_d_bits_denied),
    .auto_out_2_d_bits_data(system_bus_xbar_auto_out_2_d_bits_data),
    .auto_out_2_d_bits_corrupt(system_bus_xbar_auto_out_2_d_bits_corrupt),
    .auto_out_1_a_ready(system_bus_xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(system_bus_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(system_bus_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(system_bus_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(system_bus_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(system_bus_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(system_bus_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_user_amba_prot_bufferable(system_bus_xbar_auto_out_1_a_bits_user_amba_prot_bufferable),
    .auto_out_1_a_bits_user_amba_prot_modifiable(system_bus_xbar_auto_out_1_a_bits_user_amba_prot_modifiable),
    .auto_out_1_a_bits_user_amba_prot_readalloc(system_bus_xbar_auto_out_1_a_bits_user_amba_prot_readalloc),
    .auto_out_1_a_bits_user_amba_prot_writealloc(system_bus_xbar_auto_out_1_a_bits_user_amba_prot_writealloc),
    .auto_out_1_a_bits_user_amba_prot_privileged(system_bus_xbar_auto_out_1_a_bits_user_amba_prot_privileged),
    .auto_out_1_a_bits_user_amba_prot_secure(system_bus_xbar_auto_out_1_a_bits_user_amba_prot_secure),
    .auto_out_1_a_bits_user_amba_prot_fetch(system_bus_xbar_auto_out_1_a_bits_user_amba_prot_fetch),
    .auto_out_1_a_bits_mask(system_bus_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(system_bus_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(system_bus_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(system_bus_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(system_bus_xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(system_bus_xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_size(system_bus_xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(system_bus_xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_denied(system_bus_xbar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(system_bus_xbar_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(system_bus_xbar_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(system_bus_xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(system_bus_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(system_bus_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(system_bus_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(system_bus_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(system_bus_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(system_bus_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(system_bus_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(system_bus_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(system_bus_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(system_bus_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(system_bus_xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(system_bus_xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(system_bus_xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(system_bus_xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(system_bus_xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(system_bus_xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(system_bus_xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(system_bus_xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(system_bus_xbar_auto_out_0_d_bits_corrupt)
  );
  TLFIFOFixer fixer (
    .clock(fixer_clock),
    .reset(fixer_reset),
    .auto_in_1_a_ready(fixer_auto_in_1_a_ready),
    .auto_in_1_a_valid(fixer_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(fixer_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(fixer_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(fixer_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(fixer_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(fixer_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(fixer_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(fixer_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(fixer_auto_in_1_a_bits_corrupt),
    .auto_in_1_d_ready(fixer_auto_in_1_d_ready),
    .auto_in_1_d_valid(fixer_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(fixer_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param(fixer_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size(fixer_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source(fixer_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_denied(fixer_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data(fixer_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(fixer_auto_in_1_d_bits_corrupt),
    .auto_in_0_a_ready(fixer_auto_in_0_a_ready),
    .auto_in_0_a_valid(fixer_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(fixer_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(fixer_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(fixer_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(fixer_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(fixer_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_user_amba_prot_bufferable(fixer_auto_in_0_a_bits_user_amba_prot_bufferable),
    .auto_in_0_a_bits_user_amba_prot_modifiable(fixer_auto_in_0_a_bits_user_amba_prot_modifiable),
    .auto_in_0_a_bits_user_amba_prot_readalloc(fixer_auto_in_0_a_bits_user_amba_prot_readalloc),
    .auto_in_0_a_bits_user_amba_prot_writealloc(fixer_auto_in_0_a_bits_user_amba_prot_writealloc),
    .auto_in_0_a_bits_user_amba_prot_privileged(fixer_auto_in_0_a_bits_user_amba_prot_privileged),
    .auto_in_0_a_bits_user_amba_prot_secure(fixer_auto_in_0_a_bits_user_amba_prot_secure),
    .auto_in_0_a_bits_user_amba_prot_fetch(fixer_auto_in_0_a_bits_user_amba_prot_fetch),
    .auto_in_0_a_bits_mask(fixer_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(fixer_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(fixer_auto_in_0_a_bits_corrupt),
    .auto_in_0_d_ready(fixer_auto_in_0_d_ready),
    .auto_in_0_d_valid(fixer_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(fixer_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(fixer_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(fixer_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(fixer_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(fixer_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(fixer_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(fixer_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt(fixer_auto_in_0_d_bits_corrupt),
    .auto_out_1_a_ready(fixer_auto_out_1_a_ready),
    .auto_out_1_a_valid(fixer_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(fixer_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(fixer_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(fixer_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(fixer_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(fixer_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(fixer_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(fixer_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(fixer_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(fixer_auto_out_1_d_ready),
    .auto_out_1_d_valid(fixer_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(fixer_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(fixer_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(fixer_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(fixer_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(fixer_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(fixer_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(fixer_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(fixer_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(fixer_auto_out_0_a_ready),
    .auto_out_0_a_valid(fixer_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(fixer_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(fixer_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(fixer_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(fixer_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(fixer_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_user_amba_prot_bufferable(fixer_auto_out_0_a_bits_user_amba_prot_bufferable),
    .auto_out_0_a_bits_user_amba_prot_modifiable(fixer_auto_out_0_a_bits_user_amba_prot_modifiable),
    .auto_out_0_a_bits_user_amba_prot_readalloc(fixer_auto_out_0_a_bits_user_amba_prot_readalloc),
    .auto_out_0_a_bits_user_amba_prot_writealloc(fixer_auto_out_0_a_bits_user_amba_prot_writealloc),
    .auto_out_0_a_bits_user_amba_prot_privileged(fixer_auto_out_0_a_bits_user_amba_prot_privileged),
    .auto_out_0_a_bits_user_amba_prot_secure(fixer_auto_out_0_a_bits_user_amba_prot_secure),
    .auto_out_0_a_bits_user_amba_prot_fetch(fixer_auto_out_0_a_bits_user_amba_prot_fetch),
    .auto_out_0_a_bits_mask(fixer_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(fixer_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(fixer_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(fixer_auto_out_0_d_ready),
    .auto_out_0_d_valid(fixer_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(fixer_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(fixer_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(fixer_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(fixer_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(fixer_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(fixer_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(fixer_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(fixer_auto_out_0_d_bits_corrupt)
  );
  TLInterconnectCoupler_2 coupler_from_tile (
    .clock(coupler_from_tile_clock),
    .reset(coupler_from_tile_reset),
    .auto_tl_master_clock_xing_in_a_ready(coupler_from_tile_auto_tl_master_clock_xing_in_a_ready),
    .auto_tl_master_clock_xing_in_a_valid(coupler_from_tile_auto_tl_master_clock_xing_in_a_valid),
    .auto_tl_master_clock_xing_in_a_bits_opcode(coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_opcode),
    .auto_tl_master_clock_xing_in_a_bits_param(coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_param),
    .auto_tl_master_clock_xing_in_a_bits_size(coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_size),
    .auto_tl_master_clock_xing_in_a_bits_source(coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_source),
    .auto_tl_master_clock_xing_in_a_bits_address(coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_address),
    .auto_tl_master_clock_xing_in_a_bits_mask(coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_mask),
    .auto_tl_master_clock_xing_in_a_bits_data(coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_data),
    .auto_tl_master_clock_xing_in_a_bits_corrupt(coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_corrupt),
    .auto_tl_master_clock_xing_in_c_ready(coupler_from_tile_auto_tl_master_clock_xing_in_c_ready),
    .auto_tl_master_clock_xing_in_c_valid(coupler_from_tile_auto_tl_master_clock_xing_in_c_valid),
    .auto_tl_master_clock_xing_in_c_bits_opcode(coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_opcode),
    .auto_tl_master_clock_xing_in_c_bits_param(coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_param),
    .auto_tl_master_clock_xing_in_c_bits_size(coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_size),
    .auto_tl_master_clock_xing_in_c_bits_source(coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_source),
    .auto_tl_master_clock_xing_in_c_bits_address(coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_address),
    .auto_tl_master_clock_xing_in_c_bits_data(coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_data),
    .auto_tl_master_clock_xing_in_c_bits_corrupt(coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_corrupt),
    .auto_tl_master_clock_xing_in_d_ready(coupler_from_tile_auto_tl_master_clock_xing_in_d_ready),
    .auto_tl_master_clock_xing_in_d_valid(coupler_from_tile_auto_tl_master_clock_xing_in_d_valid),
    .auto_tl_master_clock_xing_in_d_bits_opcode(coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_opcode),
    .auto_tl_master_clock_xing_in_d_bits_param(coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_param),
    .auto_tl_master_clock_xing_in_d_bits_size(coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_size),
    .auto_tl_master_clock_xing_in_d_bits_source(coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_source),
    .auto_tl_master_clock_xing_in_d_bits_sink(coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_sink),
    .auto_tl_master_clock_xing_in_d_bits_denied(coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_denied),
    .auto_tl_master_clock_xing_in_d_bits_data(coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_data),
    .auto_tl_master_clock_xing_in_d_bits_corrupt(coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_corrupt),
    .auto_tl_master_clock_xing_in_e_valid(coupler_from_tile_auto_tl_master_clock_xing_in_e_valid),
    .auto_tl_master_clock_xing_in_e_bits_sink(coupler_from_tile_auto_tl_master_clock_xing_in_e_bits_sink),
    .auto_tl_out_a_ready(coupler_from_tile_auto_tl_out_a_ready),
    .auto_tl_out_a_valid(coupler_from_tile_auto_tl_out_a_valid),
    .auto_tl_out_a_bits_opcode(coupler_from_tile_auto_tl_out_a_bits_opcode),
    .auto_tl_out_a_bits_param(coupler_from_tile_auto_tl_out_a_bits_param),
    .auto_tl_out_a_bits_size(coupler_from_tile_auto_tl_out_a_bits_size),
    .auto_tl_out_a_bits_source(coupler_from_tile_auto_tl_out_a_bits_source),
    .auto_tl_out_a_bits_address(coupler_from_tile_auto_tl_out_a_bits_address),
    .auto_tl_out_a_bits_mask(coupler_from_tile_auto_tl_out_a_bits_mask),
    .auto_tl_out_a_bits_data(coupler_from_tile_auto_tl_out_a_bits_data),
    .auto_tl_out_a_bits_corrupt(coupler_from_tile_auto_tl_out_a_bits_corrupt),
    .auto_tl_out_d_ready(coupler_from_tile_auto_tl_out_d_ready),
    .auto_tl_out_d_valid(coupler_from_tile_auto_tl_out_d_valid),
    .auto_tl_out_d_bits_opcode(coupler_from_tile_auto_tl_out_d_bits_opcode),
    .auto_tl_out_d_bits_param(coupler_from_tile_auto_tl_out_d_bits_param),
    .auto_tl_out_d_bits_size(coupler_from_tile_auto_tl_out_d_bits_size),
    .auto_tl_out_d_bits_source(coupler_from_tile_auto_tl_out_d_bits_source),
    .auto_tl_out_d_bits_denied(coupler_from_tile_auto_tl_out_d_bits_denied),
    .auto_tl_out_d_bits_data(coupler_from_tile_auto_tl_out_d_bits_data),
    .auto_tl_out_d_bits_corrupt(coupler_from_tile_auto_tl_out_d_bits_corrupt)
  );
  TLInterconnectCoupler_3 coupler_to_memory_controller_port_named_axi4 (
    .clock(coupler_to_memory_controller_port_named_axi4_clock),
    .reset(coupler_to_memory_controller_port_named_axi4_reset),
    .auto_widget_in_a_ready(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_ready),
    .auto_widget_in_a_valid(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_valid),
    .auto_widget_in_a_bits_opcode(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_opcode),
    .auto_widget_in_a_bits_param(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_param),
    .auto_widget_in_a_bits_size(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_size),
    .auto_widget_in_a_bits_source(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_source),
    .auto_widget_in_a_bits_address(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_address),
    .auto_widget_in_a_bits_user_amba_prot_bufferable(
      coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_bufferable),
    .auto_widget_in_a_bits_user_amba_prot_modifiable(
      coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_modifiable),
    .auto_widget_in_a_bits_user_amba_prot_readalloc(
      coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_readalloc),
    .auto_widget_in_a_bits_user_amba_prot_writealloc(
      coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_writealloc),
    .auto_widget_in_a_bits_user_amba_prot_privileged(
      coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_privileged),
    .auto_widget_in_a_bits_user_amba_prot_secure(
      coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_secure),
    .auto_widget_in_a_bits_user_amba_prot_fetch(
      coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_fetch),
    .auto_widget_in_a_bits_mask(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_mask),
    .auto_widget_in_a_bits_data(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_data),
    .auto_widget_in_a_bits_corrupt(coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_corrupt),
    .auto_widget_in_d_ready(coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_ready),
    .auto_widget_in_d_valid(coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_valid),
    .auto_widget_in_d_bits_opcode(coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_opcode),
    .auto_widget_in_d_bits_size(coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_size),
    .auto_widget_in_d_bits_source(coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_source),
    .auto_widget_in_d_bits_denied(coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_denied),
    .auto_widget_in_d_bits_data(coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_data),
    .auto_widget_in_d_bits_corrupt(coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_corrupt),
    .auto_axi4yank_out_aw_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_ready),
    .auto_axi4yank_out_aw_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_valid),
    .auto_axi4yank_out_aw_bits_id(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_id),
    .auto_axi4yank_out_aw_bits_addr(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_addr),
    .auto_axi4yank_out_aw_bits_len(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_len),
    .auto_axi4yank_out_aw_bits_size(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_size),
    .auto_axi4yank_out_aw_bits_burst(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_burst),
    .auto_axi4yank_out_aw_bits_lock(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_lock),
    .auto_axi4yank_out_aw_bits_cache(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_cache),
    .auto_axi4yank_out_aw_bits_prot(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_prot),
    .auto_axi4yank_out_aw_bits_qos(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_qos),
    .auto_axi4yank_out_w_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_ready),
    .auto_axi4yank_out_w_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_valid),
    .auto_axi4yank_out_w_bits_data(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_data),
    .auto_axi4yank_out_w_bits_strb(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_strb),
    .auto_axi4yank_out_w_bits_last(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_last),
    .auto_axi4yank_out_b_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_ready),
    .auto_axi4yank_out_b_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_valid),
    .auto_axi4yank_out_b_bits_id(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_id),
    .auto_axi4yank_out_b_bits_resp(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_resp),
    .auto_axi4yank_out_ar_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_ready),
    .auto_axi4yank_out_ar_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_valid),
    .auto_axi4yank_out_ar_bits_id(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_id),
    .auto_axi4yank_out_ar_bits_addr(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_addr),
    .auto_axi4yank_out_ar_bits_len(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_len),
    .auto_axi4yank_out_ar_bits_size(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_size),
    .auto_axi4yank_out_ar_bits_burst(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_burst),
    .auto_axi4yank_out_ar_bits_lock(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_lock),
    .auto_axi4yank_out_ar_bits_cache(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_cache),
    .auto_axi4yank_out_ar_bits_prot(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_prot),
    .auto_axi4yank_out_ar_bits_qos(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_qos),
    .auto_axi4yank_out_r_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_ready),
    .auto_axi4yank_out_r_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_valid),
    .auto_axi4yank_out_r_bits_id(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_id),
    .auto_axi4yank_out_r_bits_data(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_data),
    .auto_axi4yank_out_r_bits_resp(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_resp),
    .auto_axi4yank_out_r_bits_last(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_last),
    .auto_tl_in_a_ready(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_user_amba_prot_bufferable(
      coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_bufferable),
    .auto_tl_in_a_bits_user_amba_prot_modifiable(
      coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_modifiable),
    .auto_tl_in_a_bits_user_amba_prot_readalloc(
      coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_readalloc),
    .auto_tl_in_a_bits_user_amba_prot_writealloc(
      coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_writealloc),
    .auto_tl_in_a_bits_user_amba_prot_privileged(
      coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_privileged),
    .auto_tl_in_a_bits_user_amba_prot_secure(
      coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_secure),
    .auto_tl_in_a_bits_user_amba_prot_fetch(
      coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_fetch),
    .auto_tl_in_a_bits_mask(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_denied(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_corrupt),
    .auto_tl_out_a_ready(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_ready),
    .auto_tl_out_a_valid(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_valid),
    .auto_tl_out_a_bits_opcode(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_opcode),
    .auto_tl_out_a_bits_param(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_param),
    .auto_tl_out_a_bits_size(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_size),
    .auto_tl_out_a_bits_source(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_source),
    .auto_tl_out_a_bits_address(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_address),
    .auto_tl_out_a_bits_user_amba_prot_bufferable(
      coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable),
    .auto_tl_out_a_bits_user_amba_prot_modifiable(
      coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable),
    .auto_tl_out_a_bits_user_amba_prot_readalloc(
      coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc),
    .auto_tl_out_a_bits_user_amba_prot_writealloc(
      coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc),
    .auto_tl_out_a_bits_user_amba_prot_privileged(
      coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_privileged),
    .auto_tl_out_a_bits_user_amba_prot_secure(
      coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_secure),
    .auto_tl_out_a_bits_user_amba_prot_fetch(
      coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_fetch),
    .auto_tl_out_a_bits_mask(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_mask),
    .auto_tl_out_a_bits_data(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_data),
    .auto_tl_out_a_bits_corrupt(coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_corrupt),
    .auto_tl_out_d_ready(coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_ready),
    .auto_tl_out_d_valid(coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_valid),
    .auto_tl_out_d_bits_opcode(coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_opcode),
    .auto_tl_out_d_bits_size(coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_size),
    .auto_tl_out_d_bits_source(coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_source),
    .auto_tl_out_d_bits_denied(coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_denied),
    .auto_tl_out_d_bits_data(coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_data),
    .auto_tl_out_d_bits_corrupt(coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_corrupt)
  );
  TLInterconnectCoupler_4 coupler_to_port_named_mmio_port_axi4 (
    .clock(coupler_to_port_named_mmio_port_axi4_clock),
    .reset(coupler_to_port_named_mmio_port_axi4_reset),
    .auto_axi4buf_out_aw_ready(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_ready),
    .auto_axi4buf_out_aw_valid(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_valid),
    .auto_axi4buf_out_aw_bits_id(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_id),
    .auto_axi4buf_out_aw_bits_addr(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_addr),
    .auto_axi4buf_out_aw_bits_len(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_len),
    .auto_axi4buf_out_aw_bits_size(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_size),
    .auto_axi4buf_out_aw_bits_burst(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_burst),
    .auto_axi4buf_out_aw_bits_lock(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_lock),
    .auto_axi4buf_out_aw_bits_cache(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_cache),
    .auto_axi4buf_out_aw_bits_prot(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_prot),
    .auto_axi4buf_out_aw_bits_qos(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_qos),
    .auto_axi4buf_out_w_ready(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_ready),
    .auto_axi4buf_out_w_valid(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_valid),
    .auto_axi4buf_out_w_bits_data(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_data),
    .auto_axi4buf_out_w_bits_strb(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_strb),
    .auto_axi4buf_out_w_bits_last(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_last),
    .auto_axi4buf_out_b_ready(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_ready),
    .auto_axi4buf_out_b_valid(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_valid),
    .auto_axi4buf_out_b_bits_id(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_bits_id),
    .auto_axi4buf_out_b_bits_resp(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_bits_resp),
    .auto_axi4buf_out_ar_ready(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_ready),
    .auto_axi4buf_out_ar_valid(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_valid),
    .auto_axi4buf_out_ar_bits_id(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_id),
    .auto_axi4buf_out_ar_bits_addr(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_addr),
    .auto_axi4buf_out_ar_bits_len(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_len),
    .auto_axi4buf_out_ar_bits_size(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_size),
    .auto_axi4buf_out_ar_bits_burst(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_burst),
    .auto_axi4buf_out_ar_bits_lock(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_lock),
    .auto_axi4buf_out_ar_bits_cache(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_cache),
    .auto_axi4buf_out_ar_bits_prot(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_prot),
    .auto_axi4buf_out_ar_bits_qos(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_qos),
    .auto_axi4buf_out_r_ready(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_ready),
    .auto_axi4buf_out_r_valid(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_valid),
    .auto_axi4buf_out_r_bits_id(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_id),
    .auto_axi4buf_out_r_bits_data(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_data),
    .auto_axi4buf_out_r_bits_resp(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_resp),
    .auto_axi4buf_out_r_bits_last(coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_last),
    .auto_tl_in_a_ready(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_user_amba_prot_bufferable(
      coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_bufferable),
    .auto_tl_in_a_bits_user_amba_prot_modifiable(
      coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_modifiable),
    .auto_tl_in_a_bits_user_amba_prot_readalloc(
      coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_readalloc),
    .auto_tl_in_a_bits_user_amba_prot_writealloc(
      coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_writealloc),
    .auto_tl_in_a_bits_user_amba_prot_privileged(
      coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_privileged),
    .auto_tl_in_a_bits_user_amba_prot_secure(
      coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_secure),
    .auto_tl_in_a_bits_user_amba_prot_fetch(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_fetch)
      ,
    .auto_tl_in_a_bits_mask(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_denied(coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_corrupt)
  );
  assign subsystem_sbus_clock_groups_auto_out_2_member_subsystem_fbus_0_clock =
    subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_3_clock;
  assign subsystem_sbus_clock_groups_auto_out_2_member_subsystem_fbus_0_reset =
    subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_3_reset;
  assign subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_1_clock =
    subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_2_clock;
  assign subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_1_reset =
    subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_2_reset;
  assign subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_0_clock =
    subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_clock;
  assign subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_0_reset =
    subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_reset;
  assign subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_clock =
    subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_clock;
  assign subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_reset =
    subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_reset;
  assign clockGroup_auto_out_clock = clockGroup_auto_in_member_subsystem_sbus_0_clock;
  assign clockGroup_auto_out_reset = clockGroup_auto_in_member_subsystem_sbus_0_reset;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_ready =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_ready;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_valid =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_valid;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_opcode =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_opcode;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_param =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_param;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_size =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_size;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_source =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_source;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_sink =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_sink;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_denied =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_denied;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_data =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_data;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_corrupt =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_corrupt;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_valid =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_valid;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_opcode =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_opcode;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_param =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_param;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_size =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_size;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_source =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_source;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_address =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_address;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_mask =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_mask;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_data =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_data;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_corrupt =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_corrupt;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_ready =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_ready;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_ready =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_ready;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_valid =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_valid;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_opcode =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_opcode;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_param =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_param;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_size =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_size;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_source =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_source;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_sink =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_sink;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_denied =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_denied;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_data =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_data;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_corrupt =
    coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_bits_corrupt;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_valid =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_valid;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_opcode =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_opcode;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_param =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_param;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_size =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_size;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_source =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_source;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_address =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_address;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_mask =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_mask;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_data =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_data;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_corrupt =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_bits_corrupt;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_ready =
    coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_ready;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_valid =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_valid;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_opcode =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_opcode;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_param =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_param;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_size =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_size;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_source =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_source;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_address =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_address;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_mask =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_mask;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_data =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_data;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_a_bits_corrupt =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_corrupt;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_in_d_ready =
    coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_ready;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_a_ready =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_ready;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_valid =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_valid;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_opcode =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_opcode;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_param =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_param;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_size =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_size;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_source =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_source;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_sink =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_sink;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_denied =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_denied;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_data =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_data;
  assign coupler_to_bus_named_subsystem_cbus_widget_auto_out_d_bits_corrupt =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_ready =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_ready;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_valid =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_valid;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_opcode =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_opcode;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_param =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_param;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_size =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_size;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_source =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_source;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_sink =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_sink;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_denied =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_denied;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_data =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_data;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_corrupt =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_valid =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_valid;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_opcode =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_opcode;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_param =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_param;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_size =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_size;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_source =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_source;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_address =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_address;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_bufferable =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_bufferable;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_modifiable =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_modifiable;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_readalloc =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_readalloc;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_writealloc =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_writealloc;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_privileged =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_privileged;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_secure =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_secure;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_fetch =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_fetch;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_mask =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_mask;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_data =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_data;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_corrupt =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_ready =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_ready;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_valid =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_valid;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_opcode =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_opcode;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_param =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_param;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_size =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_size;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_source =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_source;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_address =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_address;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_bufferable =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_bufferable;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_modifiable =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_modifiable;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_readalloc =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_readalloc;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_writealloc =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_writealloc;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_privileged =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_privileged;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_secure =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_secure;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_fetch =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_user_amba_prot_fetch;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_mask =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_mask;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_data =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_data;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_corrupt =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_ready =
    coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_ready;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_ready =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_ready;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_valid =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_valid;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_opcode =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_opcode;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_param =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_param;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_size =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_size;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_source =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_source;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_sink =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_sink;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_denied =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_denied;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_data =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_data;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_corrupt =
    coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_valid =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_valid;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_opcode =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_opcode;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_param =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_param;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_size =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_size;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_source =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_source;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_address =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_address;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_bufferable =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_bufferable;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_modifiable =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_modifiable;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_readalloc =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_readalloc;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_writealloc =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_writealloc;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_privileged =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_privileged;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_secure =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_secure;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_user_amba_prot_fetch =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_fetch;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_mask =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_mask;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_data =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_data;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_a_bits_corrupt =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_in_d_ready =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_ready;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_a_ready =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_ready;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_valid =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_valid;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_opcode =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_opcode;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_param =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_param;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_size =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_size;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_source =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_source;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_sink =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_sink;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_denied =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_denied;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_data =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_data;
  assign coupler_from_bus_named_subsystem_fbus_widget_auto_out_d_bits_corrupt =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_corrupt;
  assign xbar_auto_in_a_ready = xbar_auto_out_a_ready;
  assign xbar_auto_in_d_valid = xbar_auto_out_d_valid;
  assign xbar_auto_in_d_bits_opcode = xbar_auto_out_d_bits_opcode;
  assign xbar_auto_in_d_bits_size = xbar_auto_out_d_bits_size;
  assign xbar_auto_in_d_bits_source = xbar_auto_out_d_bits_source;
  assign xbar_auto_in_d_bits_denied = xbar_auto_out_d_bits_denied;
  assign xbar_auto_in_d_bits_data = xbar_auto_out_d_bits_data;
  assign xbar_auto_in_d_bits_corrupt = xbar_auto_out_d_bits_corrupt;
  assign xbar_auto_out_a_valid = xbar_auto_in_a_valid;
  assign xbar_auto_out_a_bits_opcode = xbar_auto_in_a_bits_opcode;
  assign xbar_auto_out_a_bits_param = xbar_auto_in_a_bits_param;
  assign xbar_auto_out_a_bits_size = xbar_auto_in_a_bits_size;
  assign xbar_auto_out_a_bits_source = xbar_auto_in_a_bits_source;
  assign xbar_auto_out_a_bits_address = xbar_auto_in_a_bits_address;
  assign xbar_auto_out_a_bits_user_amba_prot_bufferable = xbar_auto_in_a_bits_user_amba_prot_bufferable;
  assign xbar_auto_out_a_bits_user_amba_prot_modifiable = xbar_auto_in_a_bits_user_amba_prot_modifiable;
  assign xbar_auto_out_a_bits_user_amba_prot_readalloc = xbar_auto_in_a_bits_user_amba_prot_readalloc;
  assign xbar_auto_out_a_bits_user_amba_prot_writealloc = xbar_auto_in_a_bits_user_amba_prot_writealloc;
  assign xbar_auto_out_a_bits_user_amba_prot_privileged = xbar_auto_in_a_bits_user_amba_prot_privileged;
  assign xbar_auto_out_a_bits_user_amba_prot_secure = xbar_auto_in_a_bits_user_amba_prot_secure;
  assign xbar_auto_out_a_bits_user_amba_prot_fetch = xbar_auto_in_a_bits_user_amba_prot_fetch;
  assign xbar_auto_out_a_bits_mask = xbar_auto_in_a_bits_mask;
  assign xbar_auto_out_a_bits_data = xbar_auto_in_a_bits_data;
  assign xbar_auto_out_a_bits_corrupt = xbar_auto_in_a_bits_corrupt;
  assign xbar_auto_out_d_ready = xbar_auto_in_d_ready;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_valid;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_id;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_addr;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_len;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_size;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_burst;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_lock;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_cache;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_prot;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_bits_qos;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_valid;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_data;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_strb;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_bits_last;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_ready;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_valid;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_id;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_addr;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_len;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_size;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_burst;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_lock;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_cache;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_prot;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_bits_qos;
  assign auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready =
    coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_ready;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_valid;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_id;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_addr;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_len;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_size;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_burst;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_lock;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_cache;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_prot;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_qos;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_valid;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_data;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_strb;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_last;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_ready;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_valid;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_id;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_addr;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_len;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_size;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_burst;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_lock;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_cache;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_prot;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_qos;
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_ready;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_a_ready = coupler_from_tile_auto_tl_master_clock_xing_in_a_ready
    ;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_c_ready = coupler_from_tile_auto_tl_master_clock_xing_in_c_ready
    ;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_valid = coupler_from_tile_auto_tl_master_clock_xing_in_d_valid
    ;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode =
    coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_opcode;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param =
    coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_param;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size =
    coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_size;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source =
    coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_source;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink =
    coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_sink;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied =
    coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_denied;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data =
    coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_data;
  assign auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt =
    coupler_from_tile_auto_tl_master_clock_xing_in_d_bits_corrupt;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_ready;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_valid;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_opcode;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_param;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_size;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_source;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_sink;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_denied;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_data;
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_corrupt;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_valid;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_opcode;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_param;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_size;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_source;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_address;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_mask;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_data;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_corrupt;
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_ready;
  assign auto_fixedClockNode_out_1_clock = fixedClockNode_auto_out_2_clock;
  assign auto_fixedClockNode_out_1_reset = fixedClockNode_auto_out_2_reset;
  assign auto_fixedClockNode_out_0_clock = fixedClockNode_auto_out_1_clock;
  assign auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock =
    subsystem_sbus_clock_groups_auto_out_2_member_subsystem_fbus_0_clock;
  assign auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset =
    subsystem_sbus_clock_groups_auto_out_2_member_subsystem_fbus_0_reset;
  assign auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock =
    subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_1_clock;
  assign auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset =
    subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_1_reset;
  assign auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock =
    subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_0_clock;
  assign auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset =
    subsystem_sbus_clock_groups_auto_out_1_member_subsystem_cbus_0_reset;
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_3_clock =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock;
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_3_reset =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset;
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_2_clock =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock;
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_2_reset =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset;
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_clock =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock;
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_reset =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset;
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_clock =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock;
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_reset =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset;
  assign clockGroup_auto_in_member_subsystem_sbus_0_clock =
    subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_clock;
  assign clockGroup_auto_in_member_subsystem_sbus_0_reset =
    subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_reset;
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock;
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset;
  assign system_bus_xbar_clock = fixedClockNode_auto_out_0_clock;
  assign system_bus_xbar_reset = fixedClockNode_auto_out_0_reset;
  assign system_bus_xbar_auto_in_1_a_valid = fixer_auto_out_1_a_valid;
  assign system_bus_xbar_auto_in_1_a_bits_opcode = fixer_auto_out_1_a_bits_opcode;
  assign system_bus_xbar_auto_in_1_a_bits_param = fixer_auto_out_1_a_bits_param;
  assign system_bus_xbar_auto_in_1_a_bits_size = fixer_auto_out_1_a_bits_size;
  assign system_bus_xbar_auto_in_1_a_bits_source = fixer_auto_out_1_a_bits_source;
  assign system_bus_xbar_auto_in_1_a_bits_address = fixer_auto_out_1_a_bits_address;
  assign system_bus_xbar_auto_in_1_a_bits_mask = fixer_auto_out_1_a_bits_mask;
  assign system_bus_xbar_auto_in_1_a_bits_data = fixer_auto_out_1_a_bits_data;
  assign system_bus_xbar_auto_in_1_a_bits_corrupt = fixer_auto_out_1_a_bits_corrupt;
  assign system_bus_xbar_auto_in_1_d_ready = fixer_auto_out_1_d_ready;
  assign system_bus_xbar_auto_in_0_a_valid = fixer_auto_out_0_a_valid;
  assign system_bus_xbar_auto_in_0_a_bits_opcode = fixer_auto_out_0_a_bits_opcode;
  assign system_bus_xbar_auto_in_0_a_bits_param = fixer_auto_out_0_a_bits_param;
  assign system_bus_xbar_auto_in_0_a_bits_size = fixer_auto_out_0_a_bits_size;
  assign system_bus_xbar_auto_in_0_a_bits_source = fixer_auto_out_0_a_bits_source;
  assign system_bus_xbar_auto_in_0_a_bits_address = fixer_auto_out_0_a_bits_address;
  assign system_bus_xbar_auto_in_0_a_bits_user_amba_prot_bufferable = fixer_auto_out_0_a_bits_user_amba_prot_bufferable;
  assign system_bus_xbar_auto_in_0_a_bits_user_amba_prot_modifiable = fixer_auto_out_0_a_bits_user_amba_prot_modifiable;
  assign system_bus_xbar_auto_in_0_a_bits_user_amba_prot_readalloc = fixer_auto_out_0_a_bits_user_amba_prot_readalloc;
  assign system_bus_xbar_auto_in_0_a_bits_user_amba_prot_writealloc = fixer_auto_out_0_a_bits_user_amba_prot_writealloc;
  assign system_bus_xbar_auto_in_0_a_bits_user_amba_prot_privileged = fixer_auto_out_0_a_bits_user_amba_prot_privileged;
  assign system_bus_xbar_auto_in_0_a_bits_user_amba_prot_secure = fixer_auto_out_0_a_bits_user_amba_prot_secure;
  assign system_bus_xbar_auto_in_0_a_bits_user_amba_prot_fetch = fixer_auto_out_0_a_bits_user_amba_prot_fetch;
  assign system_bus_xbar_auto_in_0_a_bits_mask = fixer_auto_out_0_a_bits_mask;
  assign system_bus_xbar_auto_in_0_a_bits_data = fixer_auto_out_0_a_bits_data;
  assign system_bus_xbar_auto_in_0_a_bits_corrupt = fixer_auto_out_0_a_bits_corrupt;
  assign system_bus_xbar_auto_in_0_d_ready = fixer_auto_out_0_d_ready;
  assign system_bus_xbar_auto_out_2_a_ready = coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_ready;
  assign system_bus_xbar_auto_out_2_d_valid = coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_valid;
  assign system_bus_xbar_auto_out_2_d_bits_opcode = coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_opcode;
  assign system_bus_xbar_auto_out_2_d_bits_size = coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_size;
  assign system_bus_xbar_auto_out_2_d_bits_source = coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_source;
  assign system_bus_xbar_auto_out_2_d_bits_denied = coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_denied;
  assign system_bus_xbar_auto_out_2_d_bits_data = coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_data;
  assign system_bus_xbar_auto_out_2_d_bits_corrupt = coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_bits_corrupt;
  assign system_bus_xbar_auto_out_1_a_ready = coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_ready;
  assign system_bus_xbar_auto_out_1_d_valid = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_valid;
  assign system_bus_xbar_auto_out_1_d_bits_opcode =
    coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_opcode;
  assign system_bus_xbar_auto_out_1_d_bits_size = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_size;
  assign system_bus_xbar_auto_out_1_d_bits_source =
    coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_source;
  assign system_bus_xbar_auto_out_1_d_bits_denied =
    coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_denied;
  assign system_bus_xbar_auto_out_1_d_bits_data = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_data;
  assign system_bus_xbar_auto_out_1_d_bits_corrupt =
    coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_corrupt;
  assign system_bus_xbar_auto_out_0_a_ready = coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_ready;
  assign system_bus_xbar_auto_out_0_d_valid = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_valid;
  assign system_bus_xbar_auto_out_0_d_bits_opcode = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_opcode;
  assign system_bus_xbar_auto_out_0_d_bits_param = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_param;
  assign system_bus_xbar_auto_out_0_d_bits_size = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_size;
  assign system_bus_xbar_auto_out_0_d_bits_source = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_source;
  assign system_bus_xbar_auto_out_0_d_bits_sink = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_sink;
  assign system_bus_xbar_auto_out_0_d_bits_denied = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_denied;
  assign system_bus_xbar_auto_out_0_d_bits_data = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_data;
  assign system_bus_xbar_auto_out_0_d_bits_corrupt = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_corrupt;
  assign fixer_clock = fixedClockNode_auto_out_0_clock;
  assign fixer_reset = fixedClockNode_auto_out_0_reset;
  assign fixer_auto_in_1_a_valid = coupler_from_tile_auto_tl_out_a_valid;
  assign fixer_auto_in_1_a_bits_opcode = coupler_from_tile_auto_tl_out_a_bits_opcode;
  assign fixer_auto_in_1_a_bits_param = coupler_from_tile_auto_tl_out_a_bits_param;
  assign fixer_auto_in_1_a_bits_size = coupler_from_tile_auto_tl_out_a_bits_size;
  assign fixer_auto_in_1_a_bits_source = coupler_from_tile_auto_tl_out_a_bits_source;
  assign fixer_auto_in_1_a_bits_address = coupler_from_tile_auto_tl_out_a_bits_address;
  assign fixer_auto_in_1_a_bits_mask = coupler_from_tile_auto_tl_out_a_bits_mask;
  assign fixer_auto_in_1_a_bits_data = coupler_from_tile_auto_tl_out_a_bits_data;
  assign fixer_auto_in_1_a_bits_corrupt = coupler_from_tile_auto_tl_out_a_bits_corrupt;
  assign fixer_auto_in_1_d_ready = coupler_from_tile_auto_tl_out_d_ready;
  assign fixer_auto_in_0_a_valid = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_valid;
  assign fixer_auto_in_0_a_bits_opcode = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_opcode;
  assign fixer_auto_in_0_a_bits_param = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_param;
  assign fixer_auto_in_0_a_bits_size = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_size;
  assign fixer_auto_in_0_a_bits_source = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_source;
  assign fixer_auto_in_0_a_bits_address = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_address;
  assign fixer_auto_in_0_a_bits_user_amba_prot_bufferable =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_bufferable;
  assign fixer_auto_in_0_a_bits_user_amba_prot_modifiable =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_modifiable;
  assign fixer_auto_in_0_a_bits_user_amba_prot_readalloc =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_readalloc;
  assign fixer_auto_in_0_a_bits_user_amba_prot_writealloc =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_writealloc;
  assign fixer_auto_in_0_a_bits_user_amba_prot_privileged =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_privileged;
  assign fixer_auto_in_0_a_bits_user_amba_prot_secure =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_secure;
  assign fixer_auto_in_0_a_bits_user_amba_prot_fetch =
    coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_user_amba_prot_fetch;
  assign fixer_auto_in_0_a_bits_mask = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_mask;
  assign fixer_auto_in_0_a_bits_data = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_data;
  assign fixer_auto_in_0_a_bits_corrupt = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_corrupt;
  assign fixer_auto_in_0_d_ready = coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_ready;
  assign fixer_auto_out_1_a_ready = system_bus_xbar_auto_in_1_a_ready;
  assign fixer_auto_out_1_d_valid = system_bus_xbar_auto_in_1_d_valid;
  assign fixer_auto_out_1_d_bits_opcode = system_bus_xbar_auto_in_1_d_bits_opcode;
  assign fixer_auto_out_1_d_bits_param = system_bus_xbar_auto_in_1_d_bits_param;
  assign fixer_auto_out_1_d_bits_size = system_bus_xbar_auto_in_1_d_bits_size;
  assign fixer_auto_out_1_d_bits_source = system_bus_xbar_auto_in_1_d_bits_source;
  assign fixer_auto_out_1_d_bits_sink = system_bus_xbar_auto_in_1_d_bits_sink;
  assign fixer_auto_out_1_d_bits_denied = system_bus_xbar_auto_in_1_d_bits_denied;
  assign fixer_auto_out_1_d_bits_data = system_bus_xbar_auto_in_1_d_bits_data;
  assign fixer_auto_out_1_d_bits_corrupt = system_bus_xbar_auto_in_1_d_bits_corrupt;
  assign fixer_auto_out_0_a_ready = system_bus_xbar_auto_in_0_a_ready;
  assign fixer_auto_out_0_d_valid = system_bus_xbar_auto_in_0_d_valid;
  assign fixer_auto_out_0_d_bits_opcode = system_bus_xbar_auto_in_0_d_bits_opcode;
  assign fixer_auto_out_0_d_bits_param = system_bus_xbar_auto_in_0_d_bits_param;
  assign fixer_auto_out_0_d_bits_size = system_bus_xbar_auto_in_0_d_bits_size;
  assign fixer_auto_out_0_d_bits_source = system_bus_xbar_auto_in_0_d_bits_source;
  assign fixer_auto_out_0_d_bits_sink = system_bus_xbar_auto_in_0_d_bits_sink;
  assign fixer_auto_out_0_d_bits_denied = system_bus_xbar_auto_in_0_d_bits_denied;
  assign fixer_auto_out_0_d_bits_data = system_bus_xbar_auto_in_0_d_bits_data;
  assign fixer_auto_out_0_d_bits_corrupt = system_bus_xbar_auto_in_0_d_bits_corrupt;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_valid = system_bus_xbar_auto_out_0_a_valid;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_opcode = system_bus_xbar_auto_out_0_a_bits_opcode;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_param = system_bus_xbar_auto_out_0_a_bits_param;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_size = system_bus_xbar_auto_out_0_a_bits_size;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_source = system_bus_xbar_auto_out_0_a_bits_source;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_address = system_bus_xbar_auto_out_0_a_bits_address;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_mask = system_bus_xbar_auto_out_0_a_bits_mask;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_data = system_bus_xbar_auto_out_0_a_bits_data;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_corrupt = system_bus_xbar_auto_out_0_a_bits_corrupt;
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_ready = system_bus_xbar_auto_out_0_d_ready;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_ready =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_valid =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_opcode =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_param =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_size =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_source =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_sink =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_denied =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_data =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data;
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_corrupt =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_ready = fixer_auto_in_0_a_ready;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_valid = fixer_auto_in_0_d_valid;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_opcode = fixer_auto_in_0_d_bits_opcode;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_param = fixer_auto_in_0_d_bits_param;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_size = fixer_auto_in_0_d_bits_size;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_source = fixer_auto_in_0_d_bits_source;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_sink = fixer_auto_in_0_d_bits_sink;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_denied = fixer_auto_in_0_d_bits_denied;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_data = fixer_auto_in_0_d_bits_data;
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_corrupt = fixer_auto_in_0_d_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_valid =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_opcode =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_param =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_size =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_source =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_address =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_bufferable =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_modifiable =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_readalloc =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_writealloc =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_privileged =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_secure =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_user_amba_prot_fetch =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_mask =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_data =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_corrupt =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt;
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_ready =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready;
  assign coupler_from_tile_clock = fixedClockNode_auto_out_0_clock;
  assign coupler_from_tile_reset = fixedClockNode_auto_out_0_reset;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_valid = auto_coupler_from_tile_tl_master_clock_xing_in_a_valid
    ;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_opcode =
    auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_param =
    auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_size =
    auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_source =
    auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_address =
    auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_mask =
    auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_data =
    auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_a_bits_corrupt =
    auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_c_valid = auto_coupler_from_tile_tl_master_clock_xing_in_c_valid
    ;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_opcode =
    auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_param =
    auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_size =
    auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_source =
    auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_address =
    auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_data =
    auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_c_bits_corrupt =
    auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_d_ready = auto_coupler_from_tile_tl_master_clock_xing_in_d_ready
    ;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_e_valid = auto_coupler_from_tile_tl_master_clock_xing_in_e_valid
    ;
  assign coupler_from_tile_auto_tl_master_clock_xing_in_e_bits_sink =
    auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink;
  assign coupler_from_tile_auto_tl_out_a_ready = fixer_auto_in_1_a_ready;
  assign coupler_from_tile_auto_tl_out_d_valid = fixer_auto_in_1_d_valid;
  assign coupler_from_tile_auto_tl_out_d_bits_opcode = fixer_auto_in_1_d_bits_opcode;
  assign coupler_from_tile_auto_tl_out_d_bits_param = fixer_auto_in_1_d_bits_param;
  assign coupler_from_tile_auto_tl_out_d_bits_size = fixer_auto_in_1_d_bits_size;
  assign coupler_from_tile_auto_tl_out_d_bits_source = fixer_auto_in_1_d_bits_source;
  assign coupler_from_tile_auto_tl_out_d_bits_denied = fixer_auto_in_1_d_bits_denied;
  assign coupler_from_tile_auto_tl_out_d_bits_data = fixer_auto_in_1_d_bits_data;
  assign coupler_from_tile_auto_tl_out_d_bits_corrupt = fixer_auto_in_1_d_bits_corrupt;
  assign xbar_auto_in_a_valid = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_valid;
  assign xbar_auto_in_a_bits_opcode = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_opcode;
  assign xbar_auto_in_a_bits_param = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_param;
  assign xbar_auto_in_a_bits_size = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_size;
  assign xbar_auto_in_a_bits_source = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_source;
  assign xbar_auto_in_a_bits_address = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_address;
  assign xbar_auto_in_a_bits_user_amba_prot_bufferable =
    coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable;
  assign xbar_auto_in_a_bits_user_amba_prot_modifiable =
    coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable;
  assign xbar_auto_in_a_bits_user_amba_prot_readalloc =
    coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc;
  assign xbar_auto_in_a_bits_user_amba_prot_writealloc =
    coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc;
  assign xbar_auto_in_a_bits_user_amba_prot_privileged =
    coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_privileged;
  assign xbar_auto_in_a_bits_user_amba_prot_secure =
    coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_secure;
  assign xbar_auto_in_a_bits_user_amba_prot_fetch =
    coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_user_amba_prot_fetch;
  assign xbar_auto_in_a_bits_mask = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_mask;
  assign xbar_auto_in_a_bits_data = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_data;
  assign xbar_auto_in_a_bits_corrupt = coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_bits_corrupt;
  assign xbar_auto_in_d_ready = coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_ready;
  assign xbar_auto_out_a_ready = coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_ready;
  assign xbar_auto_out_d_valid = coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_valid;
  assign xbar_auto_out_d_bits_opcode = coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_opcode;
  assign xbar_auto_out_d_bits_size = coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_size;
  assign xbar_auto_out_d_bits_source = coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_source;
  assign xbar_auto_out_d_bits_denied = coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_denied;
  assign xbar_auto_out_d_bits_data = coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_data;
  assign xbar_auto_out_d_bits_corrupt = coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_bits_corrupt;
  assign coupler_to_memory_controller_port_named_axi4_clock = fixedClockNode_auto_out_0_clock;
  assign coupler_to_memory_controller_port_named_axi4_reset = fixedClockNode_auto_out_0_reset;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_valid = xbar_auto_out_a_valid;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_opcode = xbar_auto_out_a_bits_opcode;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_param = xbar_auto_out_a_bits_param;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_size = xbar_auto_out_a_bits_size;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_source = xbar_auto_out_a_bits_source;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_address = xbar_auto_out_a_bits_address;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_bufferable =
    xbar_auto_out_a_bits_user_amba_prot_bufferable;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_modifiable =
    xbar_auto_out_a_bits_user_amba_prot_modifiable;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_readalloc =
    xbar_auto_out_a_bits_user_amba_prot_readalloc;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_writealloc =
    xbar_auto_out_a_bits_user_amba_prot_writealloc;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_privileged =
    xbar_auto_out_a_bits_user_amba_prot_privileged;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_secure =
    xbar_auto_out_a_bits_user_amba_prot_secure;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_user_amba_prot_fetch =
    xbar_auto_out_a_bits_user_amba_prot_fetch;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_mask = xbar_auto_out_a_bits_mask;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_data = xbar_auto_out_a_bits_data;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_a_bits_corrupt = xbar_auto_out_a_bits_corrupt;
  assign coupler_to_memory_controller_port_named_axi4_auto_widget_in_d_ready = xbar_auto_out_d_ready;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_ready =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_ready =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_valid =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_id =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_resp =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_ready =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_valid =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_id =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_data =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_resp =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp;
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_last =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_valid = system_bus_xbar_auto_out_1_a_valid;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_opcode =
    system_bus_xbar_auto_out_1_a_bits_opcode;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_param = system_bus_xbar_auto_out_1_a_bits_param;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_size = system_bus_xbar_auto_out_1_a_bits_size;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_source =
    system_bus_xbar_auto_out_1_a_bits_source;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_address =
    system_bus_xbar_auto_out_1_a_bits_address;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_bufferable =
    system_bus_xbar_auto_out_1_a_bits_user_amba_prot_bufferable;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_modifiable =
    system_bus_xbar_auto_out_1_a_bits_user_amba_prot_modifiable;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_readalloc =
    system_bus_xbar_auto_out_1_a_bits_user_amba_prot_readalloc;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_writealloc =
    system_bus_xbar_auto_out_1_a_bits_user_amba_prot_writealloc;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_privileged =
    system_bus_xbar_auto_out_1_a_bits_user_amba_prot_privileged;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_secure =
    system_bus_xbar_auto_out_1_a_bits_user_amba_prot_secure;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_user_amba_prot_fetch =
    system_bus_xbar_auto_out_1_a_bits_user_amba_prot_fetch;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_mask = system_bus_xbar_auto_out_1_a_bits_mask;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_data = system_bus_xbar_auto_out_1_a_bits_data;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_corrupt =
    system_bus_xbar_auto_out_1_a_bits_corrupt;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_ready = system_bus_xbar_auto_out_1_d_ready;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_out_a_ready = xbar_auto_in_a_ready;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_valid = xbar_auto_in_d_valid;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_opcode = xbar_auto_in_d_bits_opcode;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_size = xbar_auto_in_d_bits_size;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_source = xbar_auto_in_d_bits_source;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_denied = xbar_auto_in_d_bits_denied;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_data = xbar_auto_in_d_bits_data;
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_out_d_bits_corrupt = xbar_auto_in_d_bits_corrupt;
  assign coupler_to_port_named_mmio_port_axi4_clock = fixedClockNode_auto_out_0_clock;
  assign coupler_to_port_named_mmio_port_axi4_reset = fixedClockNode_auto_out_0_reset;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_aw_ready =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_w_ready =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_valid =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_bits_id =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_b_bits_resp =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_ar_ready =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_valid =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_id =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_data =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_resp =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp;
  assign coupler_to_port_named_mmio_port_axi4_auto_axi4buf_out_r_bits_last =
    auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_valid = system_bus_xbar_auto_out_2_a_valid;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_opcode = system_bus_xbar_auto_out_2_a_bits_opcode;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_param = system_bus_xbar_auto_out_2_a_bits_param;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_size = system_bus_xbar_auto_out_2_a_bits_size;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_source = system_bus_xbar_auto_out_2_a_bits_source;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_address = system_bus_xbar_auto_out_2_a_bits_address;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_bufferable =
    system_bus_xbar_auto_out_2_a_bits_user_amba_prot_bufferable;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_modifiable =
    system_bus_xbar_auto_out_2_a_bits_user_amba_prot_modifiable;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_readalloc =
    system_bus_xbar_auto_out_2_a_bits_user_amba_prot_readalloc;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_writealloc =
    system_bus_xbar_auto_out_2_a_bits_user_amba_prot_writealloc;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_privileged =
    system_bus_xbar_auto_out_2_a_bits_user_amba_prot_privileged;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_secure =
    system_bus_xbar_auto_out_2_a_bits_user_amba_prot_secure;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_user_amba_prot_fetch =
    system_bus_xbar_auto_out_2_a_bits_user_amba_prot_fetch;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_mask = system_bus_xbar_auto_out_2_a_bits_mask;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_data = system_bus_xbar_auto_out_2_a_bits_data;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_a_bits_corrupt = system_bus_xbar_auto_out_2_a_bits_corrupt;
  assign coupler_to_port_named_mmio_port_axi4_auto_tl_in_d_ready = system_bus_xbar_auto_out_2_d_ready;
endmodule