`default_nettype wire
module ExampleRocketSystem(
  input         clock,
  input         reset,
  input         mem_axi4_0_aw_ready,
  output        mem_axi4_0_aw_valid,
  output [3:0]  mem_axi4_0_aw_bits_id,
  output [31:0] mem_axi4_0_aw_bits_addr,
  output [7:0]  mem_axi4_0_aw_bits_len,
  output [2:0]  mem_axi4_0_aw_bits_size,
  output [1:0]  mem_axi4_0_aw_bits_burst,
  output        mem_axi4_0_aw_bits_lock,
  output [3:0]  mem_axi4_0_aw_bits_cache,
  output [2:0]  mem_axi4_0_aw_bits_prot,
  output [3:0]  mem_axi4_0_aw_bits_qos,
  input         mem_axi4_0_w_ready,
  output        mem_axi4_0_w_valid,
  output [31:0] mem_axi4_0_w_bits_data,
  output [3:0]  mem_axi4_0_w_bits_strb,
  output        mem_axi4_0_w_bits_last,
  output        mem_axi4_0_b_ready,
  input         mem_axi4_0_b_valid,
  input  [3:0]  mem_axi4_0_b_bits_id,
  input  [1:0]  mem_axi4_0_b_bits_resp,
  input         mem_axi4_0_ar_ready,
  output        mem_axi4_0_ar_valid,
  output [3:0]  mem_axi4_0_ar_bits_id,
  output [31:0] mem_axi4_0_ar_bits_addr,
  output [7:0]  mem_axi4_0_ar_bits_len,
  output [2:0]  mem_axi4_0_ar_bits_size,
  output [1:0]  mem_axi4_0_ar_bits_burst,
  output        mem_axi4_0_ar_bits_lock,
  output [3:0]  mem_axi4_0_ar_bits_cache,
  output [2:0]  mem_axi4_0_ar_bits_prot,
  output [3:0]  mem_axi4_0_ar_bits_qos,
  output        mem_axi4_0_r_ready,
  input         mem_axi4_0_r_valid,
  input  [3:0]  mem_axi4_0_r_bits_id,
  input  [31:0] mem_axi4_0_r_bits_data,
  input  [1:0]  mem_axi4_0_r_bits_resp,
  input         mem_axi4_0_r_bits_last,
  input         mmio_axi4_0_aw_ready,
  output        mmio_axi4_0_aw_valid,
  output [3:0]  mmio_axi4_0_aw_bits_id,
  output [31:0] mmio_axi4_0_aw_bits_addr,
  output [7:0]  mmio_axi4_0_aw_bits_len,
  output [2:0]  mmio_axi4_0_aw_bits_size,
  output [1:0]  mmio_axi4_0_aw_bits_burst,
  output        mmio_axi4_0_aw_bits_lock,
  output [3:0]  mmio_axi4_0_aw_bits_cache,
  output [2:0]  mmio_axi4_0_aw_bits_prot,
  output [3:0]  mmio_axi4_0_aw_bits_qos,
  input         mmio_axi4_0_w_ready,
  output        mmio_axi4_0_w_valid,
  output [31:0] mmio_axi4_0_w_bits_data,
  output [3:0]  mmio_axi4_0_w_bits_strb,
  output        mmio_axi4_0_w_bits_last,
  output        mmio_axi4_0_b_ready,
  input         mmio_axi4_0_b_valid,
  input  [3:0]  mmio_axi4_0_b_bits_id,
  input  [1:0]  mmio_axi4_0_b_bits_resp,
  input         mmio_axi4_0_ar_ready,
  output        mmio_axi4_0_ar_valid,
  output [3:0]  mmio_axi4_0_ar_bits_id,
  output [31:0] mmio_axi4_0_ar_bits_addr,
  output [7:0]  mmio_axi4_0_ar_bits_len,
  output [2:0]  mmio_axi4_0_ar_bits_size,
  output [1:0]  mmio_axi4_0_ar_bits_burst,
  output        mmio_axi4_0_ar_bits_lock,
  output [3:0]  mmio_axi4_0_ar_bits_cache,
  output [2:0]  mmio_axi4_0_ar_bits_prot,
  output [3:0]  mmio_axi4_0_ar_bits_qos,
  output        mmio_axi4_0_r_ready,
  input         mmio_axi4_0_r_valid,
  input  [3:0]  mmio_axi4_0_r_bits_id,
  input  [31:0] mmio_axi4_0_r_bits_data,
  input  [1:0]  mmio_axi4_0_r_bits_resp,
  input         mmio_axi4_0_r_bits_last,
  output        l2_frontend_bus_axi4_0_aw_ready,
  input         l2_frontend_bus_axi4_0_aw_valid,
  input  [7:0]  l2_frontend_bus_axi4_0_aw_bits_id,
  input  [31:0] l2_frontend_bus_axi4_0_aw_bits_addr,
  input  [7:0]  l2_frontend_bus_axi4_0_aw_bits_len,
  input  [2:0]  l2_frontend_bus_axi4_0_aw_bits_size,
  input  [1:0]  l2_frontend_bus_axi4_0_aw_bits_burst,
  input         l2_frontend_bus_axi4_0_aw_bits_lock,
  input  [3:0]  l2_frontend_bus_axi4_0_aw_bits_cache,
  input  [2:0]  l2_frontend_bus_axi4_0_aw_bits_prot,
  input  [3:0]  l2_frontend_bus_axi4_0_aw_bits_qos,
  output        l2_frontend_bus_axi4_0_w_ready,
  input         l2_frontend_bus_axi4_0_w_valid,
  input  [63:0] l2_frontend_bus_axi4_0_w_bits_data,
  input  [7:0]  l2_frontend_bus_axi4_0_w_bits_strb,
  input         l2_frontend_bus_axi4_0_w_bits_last,
  input         l2_frontend_bus_axi4_0_b_ready,
  output        l2_frontend_bus_axi4_0_b_valid,
  output [7:0]  l2_frontend_bus_axi4_0_b_bits_id,
  output [1:0]  l2_frontend_bus_axi4_0_b_bits_resp,
  output        l2_frontend_bus_axi4_0_ar_ready,
  input         l2_frontend_bus_axi4_0_ar_valid,
  input  [7:0]  l2_frontend_bus_axi4_0_ar_bits_id,
  input  [31:0] l2_frontend_bus_axi4_0_ar_bits_addr,
  input  [7:0]  l2_frontend_bus_axi4_0_ar_bits_len,
  input  [2:0]  l2_frontend_bus_axi4_0_ar_bits_size,
  input  [1:0]  l2_frontend_bus_axi4_0_ar_bits_burst,
  input         l2_frontend_bus_axi4_0_ar_bits_lock,
  input  [3:0]  l2_frontend_bus_axi4_0_ar_bits_cache,
  input  [2:0]  l2_frontend_bus_axi4_0_ar_bits_prot,
  input  [3:0]  l2_frontend_bus_axi4_0_ar_bits_qos,
  input         l2_frontend_bus_axi4_0_r_ready,
  output        l2_frontend_bus_axi4_0_r_valid,
  output [7:0]  l2_frontend_bus_axi4_0_r_bits_id,
  output [63:0] l2_frontend_bus_axi4_0_r_bits_data,
  output [1:0]  l2_frontend_bus_axi4_0_r_bits_resp,
  output        l2_frontend_bus_axi4_0_r_bits_last,
  input         resetctrl_hartIsInReset_0,
  input         debug_clock,
  input         debug_reset,
  output        debug_clockeddmi_dmi_req_ready,
  input         debug_clockeddmi_dmi_req_valid,
  input  [6:0]  debug_clockeddmi_dmi_req_bits_addr,
  input  [31:0] debug_clockeddmi_dmi_req_bits_data,
  input  [1:0]  debug_clockeddmi_dmi_req_bits_op,
  input         debug_clockeddmi_dmi_resp_ready,
  output        debug_clockeddmi_dmi_resp_valid,
  output [31:0] debug_clockeddmi_dmi_resp_bits_data,
  output [1:0]  debug_clockeddmi_dmi_resp_bits_resp,
  input         debug_clockeddmi_dmiClock,
  input         debug_clockeddmi_dmiReset,
  output        debug_ndreset,
  output        debug_dmactive,
  input         debug_dmactiveAck,
  input  [1:0]  interrupts
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  ibus_auto_int_bus_int_out_0;
  wire  ibus_auto_int_bus_int_out_1;
  wire  ibus_auto_int_in_xing_in_sync_0;
  wire  ibus_auto_int_in_xing_in_sync_1;
  wire  ibus_auto_clock_in_clock;
  wire  ibus_int_bus_auto_int_in_0;
  wire  ibus_int_bus_auto_int_in_1;
  wire  ibus_int_bus_auto_int_out_0;
  wire  ibus_int_bus_auto_int_out_1;
  wire  ibus_intsink_clock;
  wire  ibus_intsink_auto_in_sync_0;
  wire  ibus_intsink_auto_in_sync_1;
  wire  ibus_intsink_auto_out_0;
  wire  ibus_intsink_auto_out_1;
  wire  dummyClockGroupSourceNode_clock;
  wire  dummyClockGroupSourceNode_reset;
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_clock;
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_reset;
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_clock;
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_reset;
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_clock;
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_reset;
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_clock;
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_reset;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id;
  wire [31:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr;
  wire [7:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len;
  wire [2:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size;
  wire [1:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache;
  wire [2:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid;
  wire [31:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id;
  wire [1:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id;
  wire [31:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr;
  wire [7:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len;
  wire [2:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size;
  wire [1:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache;
  wire [2:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid;
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id;
  wire [31:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data;
  wire [1:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp;
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id;
  wire [31:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr;
  wire [7:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len;
  wire [2:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size;
  wire [1:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache;
  wire [2:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid;
  wire [31:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id;
  wire [1:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id;
  wire [31:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr;
  wire [7:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len;
  wire [2:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size;
  wire [1:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache;
  wire [2:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid;
  wire [3:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id;
  wire [31:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data;
  wire [1:0] subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp;
  wire  subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_ready;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_valid;
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode;
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param;
  wire [3:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size;
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source;
  wire [31:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address;
  wire [3:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask;
  wire [31:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_ready;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_valid;
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode;
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param;
  wire [3:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size;
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source;
  wire [31:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address;
  wire [31:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_ready;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_valid;
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode;
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param;
  wire [3:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size;
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source;
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied;
  wire [31:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt;
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_valid;
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid;
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode;
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param;
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size;
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source;
  wire [31:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch;
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask;
  wire [31:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid;
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode;
  wire [1:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param;
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size;
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied;
  wire [31:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data;
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt;
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready;
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid;
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode;
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param;
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size;
  wire [4:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source;
  wire [27:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address;
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask;
  wire [31:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data;
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt;
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready;
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid;
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode;
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param;
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size;
  wire [4:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source;
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink;
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied;
  wire [31:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data;
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt;
  wire  subsystem_sbus_auto_fixedClockNode_out_1_clock;
  wire  subsystem_sbus_auto_fixedClockNode_out_1_reset;
  wire  subsystem_sbus_auto_fixedClockNode_out_0_clock;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock;
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset;
  wire  subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock;
  wire  subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset;
  wire  subsystem_pbus_clock;
  wire  subsystem_pbus_reset;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id;
  wire [31:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len;
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size;
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst;
  wire [3:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_cache;
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_prot;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid;
  wire [63:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id;
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id;
  wire [31:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len;
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size;
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst;
  wire [3:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_cache;
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_prot;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id;
  wire [63:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data;
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last;
  wire  subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock;
  wire  subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset;
  wire  subsystem_fbus_auto_bus_xing_out_a_ready;
  wire  subsystem_fbus_auto_bus_xing_out_a_valid;
  wire [2:0] subsystem_fbus_auto_bus_xing_out_a_bits_opcode;
  wire [2:0] subsystem_fbus_auto_bus_xing_out_a_bits_param;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_a_bits_size;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_a_bits_source;
  wire [31:0] subsystem_fbus_auto_bus_xing_out_a_bits_address;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_fetch;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_a_bits_mask;
  wire [31:0] subsystem_fbus_auto_bus_xing_out_a_bits_data;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_corrupt;
  wire  subsystem_fbus_auto_bus_xing_out_d_ready;
  wire  subsystem_fbus_auto_bus_xing_out_d_valid;
  wire [2:0] subsystem_fbus_auto_bus_xing_out_d_bits_opcode;
  wire [1:0] subsystem_fbus_auto_bus_xing_out_d_bits_param;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_d_bits_size;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_d_bits_source;
  wire  subsystem_fbus_auto_bus_xing_out_d_bits_sink;
  wire  subsystem_fbus_auto_bus_xing_out_d_bits_denied;
  wire [31:0] subsystem_fbus_auto_bus_xing_out_d_bits_data;
  wire  subsystem_fbus_auto_bus_xing_out_d_bits_corrupt;
  wire  subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock;
  wire  subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset;
  wire  subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock;
  wire  subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset;
  wire  subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_clock;
  wire  subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_reset;
  wire  subsystem_fbus_clockGroup_auto_out_clock;
  wire  subsystem_fbus_clockGroup_auto_out_reset;
  wire  subsystem_fbus_fixedClockNode_auto_in_clock;
  wire  subsystem_fbus_fixedClockNode_auto_in_reset;
  wire  subsystem_fbus_fixedClockNode_auto_out_clock;
  wire  subsystem_fbus_fixedClockNode_auto_out_reset;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_ready;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_valid;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_opcode;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_param;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_size;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_source;
  wire [31:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_address;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_fetch;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_mask;
  wire [31:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_data;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_corrupt;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_ready;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_valid;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_opcode;
  wire [1:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_param;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_size;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_source;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_sink;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_denied;
  wire [31:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_data;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_corrupt;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_ready;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_valid;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_opcode;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_param;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_size;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_source;
  wire [31:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_address;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_fetch;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_mask;
  wire [31:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_data;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_corrupt;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_ready;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_valid;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_opcode;
  wire [1:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_param;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_size;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_source;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_sink;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_denied;
  wire [31:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_data;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_corrupt;
  wire  subsystem_fbus_buffer_clock;
  wire  subsystem_fbus_buffer_reset;
  wire  subsystem_fbus_buffer_auto_in_a_ready;
  wire  subsystem_fbus_buffer_auto_in_a_valid;
  wire [2:0] subsystem_fbus_buffer_auto_in_a_bits_opcode;
  wire [2:0] subsystem_fbus_buffer_auto_in_a_bits_param;
  wire [3:0] subsystem_fbus_buffer_auto_in_a_bits_size;
  wire [3:0] subsystem_fbus_buffer_auto_in_a_bits_source;
  wire [31:0] subsystem_fbus_buffer_auto_in_a_bits_address;
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_fetch;
  wire [3:0] subsystem_fbus_buffer_auto_in_a_bits_mask;
  wire [31:0] subsystem_fbus_buffer_auto_in_a_bits_data;
  wire  subsystem_fbus_buffer_auto_in_a_bits_corrupt;
  wire  subsystem_fbus_buffer_auto_in_d_ready;
  wire  subsystem_fbus_buffer_auto_in_d_valid;
  wire [2:0] subsystem_fbus_buffer_auto_in_d_bits_opcode;
  wire [1:0] subsystem_fbus_buffer_auto_in_d_bits_param;
  wire [3:0] subsystem_fbus_buffer_auto_in_d_bits_size;
  wire [3:0] subsystem_fbus_buffer_auto_in_d_bits_source;
  wire  subsystem_fbus_buffer_auto_in_d_bits_sink;
  wire  subsystem_fbus_buffer_auto_in_d_bits_denied;
  wire [31:0] subsystem_fbus_buffer_auto_in_d_bits_data;
  wire  subsystem_fbus_buffer_auto_in_d_bits_corrupt;
  wire  subsystem_fbus_buffer_auto_out_a_ready;
  wire  subsystem_fbus_buffer_auto_out_a_valid;
  wire [2:0] subsystem_fbus_buffer_auto_out_a_bits_opcode;
  wire [2:0] subsystem_fbus_buffer_auto_out_a_bits_param;
  wire [3:0] subsystem_fbus_buffer_auto_out_a_bits_size;
  wire [3:0] subsystem_fbus_buffer_auto_out_a_bits_source;
  wire [31:0] subsystem_fbus_buffer_auto_out_a_bits_address;
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_fetch;
  wire [3:0] subsystem_fbus_buffer_auto_out_a_bits_mask;
  wire [31:0] subsystem_fbus_buffer_auto_out_a_bits_data;
  wire  subsystem_fbus_buffer_auto_out_a_bits_corrupt;
  wire  subsystem_fbus_buffer_auto_out_d_ready;
  wire  subsystem_fbus_buffer_auto_out_d_valid;
  wire [2:0] subsystem_fbus_buffer_auto_out_d_bits_opcode;
  wire [1:0] subsystem_fbus_buffer_auto_out_d_bits_param;
  wire [3:0] subsystem_fbus_buffer_auto_out_d_bits_size;
  wire [3:0] subsystem_fbus_buffer_auto_out_d_bits_source;
  wire  subsystem_fbus_buffer_auto_out_d_bits_sink;
  wire  subsystem_fbus_buffer_auto_out_d_bits_denied;
  wire [31:0] subsystem_fbus_buffer_auto_out_d_bits_data;
  wire  subsystem_fbus_buffer_auto_out_d_bits_corrupt;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_clock;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_reset;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_ready;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_valid;
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_id;
  wire [31:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_addr;
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_len;
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_size;
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_burst;
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_cache;
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_prot;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_ready;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_valid;
  wire [63:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_data;
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_strb;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_last;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_ready;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_valid;
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_id;
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_resp;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_ready;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_valid;
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_id;
  wire [31:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_addr;
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_len;
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_size;
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_burst;
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_cache;
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_prot;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_ready;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_valid;
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_id;
  wire [63:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_data;
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_resp;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_last;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_ready;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_valid;
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_opcode;
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_param;
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_size;
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_source;
  wire [31:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_address;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_fetch;
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_mask;
  wire [31:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_data;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_corrupt;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_ready;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_valid;
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_opcode;
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_param;
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_size;
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_source;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_sink;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_denied;
  wire [31:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_data;
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_corrupt;
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready;
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid;
  wire [2:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode;
  wire [2:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param;
  wire [1:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size;
  wire [9:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source;
  wire [16:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address;
  wire [3:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask;
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt;
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready;
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid;
  wire [1:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size;
  wire [9:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source;
  wire [31:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data;
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready;
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid;
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode;
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param;
  wire [1:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size;
  wire [9:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source;
  wire [11:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address;
  wire [3:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask;
  wire [31:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data;
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt;
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready;
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid;
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode;
  wire [1:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size;
  wire [9:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source;
  wire [31:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data;
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready;
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid;
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode;
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param;
  wire [1:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size;
  wire [9:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source;
  wire [25:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address;
  wire [3:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask;
  wire [31:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data;
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt;
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready;
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid;
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode;
  wire [1:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size;
  wire [9:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source;
  wire [31:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data;
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready;
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid;
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode;
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param;
  wire [1:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size;
  wire [9:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source;
  wire [27:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address;
  wire [3:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask;
  wire [31:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data;
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt;
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready;
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid;
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode;
  wire [1:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size;
  wire [9:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source;
  wire [31:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data;
  wire  subsystem_cbus_auto_fixedClockNode_out_2_clock;
  wire  subsystem_cbus_auto_fixedClockNode_out_2_reset;
  wire  subsystem_cbus_auto_fixedClockNode_out_0_clock;
  wire  subsystem_cbus_auto_fixedClockNode_out_0_reset;
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock;
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset;
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock;
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset;
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock;
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset;
  wire  subsystem_cbus_auto_bus_xing_in_a_ready;
  wire  subsystem_cbus_auto_bus_xing_in_a_valid;
  wire [2:0] subsystem_cbus_auto_bus_xing_in_a_bits_opcode;
  wire [2:0] subsystem_cbus_auto_bus_xing_in_a_bits_param;
  wire [3:0] subsystem_cbus_auto_bus_xing_in_a_bits_size;
  wire [4:0] subsystem_cbus_auto_bus_xing_in_a_bits_source;
  wire [27:0] subsystem_cbus_auto_bus_xing_in_a_bits_address;
  wire [3:0] subsystem_cbus_auto_bus_xing_in_a_bits_mask;
  wire [31:0] subsystem_cbus_auto_bus_xing_in_a_bits_data;
  wire  subsystem_cbus_auto_bus_xing_in_a_bits_corrupt;
  wire  subsystem_cbus_auto_bus_xing_in_d_ready;
  wire  subsystem_cbus_auto_bus_xing_in_d_valid;
  wire [2:0] subsystem_cbus_auto_bus_xing_in_d_bits_opcode;
  wire [1:0] subsystem_cbus_auto_bus_xing_in_d_bits_param;
  wire [3:0] subsystem_cbus_auto_bus_xing_in_d_bits_size;
  wire [4:0] subsystem_cbus_auto_bus_xing_in_d_bits_source;
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_sink;
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_denied;
  wire [31:0] subsystem_cbus_auto_bus_xing_in_d_bits_data;
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_corrupt;
  wire  subsystem_cbus_clock;
  wire  subsystem_cbus_reset;
  wire  tile_prci_domain_auto_intsink_in_sync_0;
  wire  tile_prci_domain_auto_tile_reset_domain_tile_hartid_in;
  wire  tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0;
  wire  tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0;
  wire  tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0;
  wire  tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0;
  wire  tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0;
  wire  tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0;
  wire  tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_ready;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_valid;
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode;
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param;
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size;
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source;
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address;
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask;
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_ready;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_valid;
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode;
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param;
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size;
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source;
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address;
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_ready;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_valid;
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode;
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param;
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size;
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source;
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied;
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt;
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_e_valid;
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink;
  wire  tile_prci_domain_auto_tap_clock_in_clock;
  wire  tile_prci_domain_auto_tap_clock_in_reset;
  wire  plicDomainWrapper_auto_plic_int_in_0;
  wire  plicDomainWrapper_auto_plic_int_in_1;
  wire  plicDomainWrapper_auto_plic_int_out_1_0;
  wire  plicDomainWrapper_auto_plic_int_out_0_0;
  wire  plicDomainWrapper_auto_plic_in_a_ready;
  wire  plicDomainWrapper_auto_plic_in_a_valid;
  wire [2:0] plicDomainWrapper_auto_plic_in_a_bits_opcode;
  wire [2:0] plicDomainWrapper_auto_plic_in_a_bits_param;
  wire [1:0] plicDomainWrapper_auto_plic_in_a_bits_size;
  wire [9:0] plicDomainWrapper_auto_plic_in_a_bits_source;
  wire [27:0] plicDomainWrapper_auto_plic_in_a_bits_address;
  wire [3:0] plicDomainWrapper_auto_plic_in_a_bits_mask;
  wire [31:0] plicDomainWrapper_auto_plic_in_a_bits_data;
  wire  plicDomainWrapper_auto_plic_in_a_bits_corrupt;
  wire  plicDomainWrapper_auto_plic_in_d_ready;
  wire  plicDomainWrapper_auto_plic_in_d_valid;
  wire [2:0] plicDomainWrapper_auto_plic_in_d_bits_opcode;
  wire [1:0] plicDomainWrapper_auto_plic_in_d_bits_size;
  wire [9:0] plicDomainWrapper_auto_plic_in_d_bits_source;
  wire [31:0] plicDomainWrapper_auto_plic_in_d_bits_data;
  wire  plicDomainWrapper_auto_clock_in_clock;
  wire  plicDomainWrapper_auto_clock_in_reset;
  wire  clint_clock;
  wire  clint_reset;
  wire  clint_auto_int_out_0;
  wire  clint_auto_int_out_1;
  wire  clint_auto_in_a_ready;
  wire  clint_auto_in_a_valid;
  wire [2:0] clint_auto_in_a_bits_opcode;
  wire [2:0] clint_auto_in_a_bits_param;
  wire [1:0] clint_auto_in_a_bits_size;
  wire [9:0] clint_auto_in_a_bits_source;
  wire [25:0] clint_auto_in_a_bits_address;
  wire [3:0] clint_auto_in_a_bits_mask;
  wire [31:0] clint_auto_in_a_bits_data;
  wire  clint_auto_in_a_bits_corrupt;
  wire  clint_auto_in_d_ready;
  wire  clint_auto_in_d_valid;
  wire [2:0] clint_auto_in_d_bits_opcode;
  wire [1:0] clint_auto_in_d_bits_size;
  wire [9:0] clint_auto_in_d_bits_source;
  wire [31:0] clint_auto_in_d_bits_data;
  wire  clint_io_rtcTick;
  wire  tlDM_auto_dmInner_dmInner_tl_in_a_ready;
  wire  tlDM_auto_dmInner_dmInner_tl_in_a_valid;
  wire [2:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_opcode;
  wire [2:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_param;
  wire [1:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_size;
  wire [9:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_source;
  wire [11:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_address;
  wire [3:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_mask;
  wire [31:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_data;
  wire  tlDM_auto_dmInner_dmInner_tl_in_a_bits_corrupt;
  wire  tlDM_auto_dmInner_dmInner_tl_in_d_ready;
  wire  tlDM_auto_dmInner_dmInner_tl_in_d_valid;
  wire [2:0] tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode;
  wire [1:0] tlDM_auto_dmInner_dmInner_tl_in_d_bits_size;
  wire [9:0] tlDM_auto_dmInner_dmInner_tl_in_d_bits_source;
  wire [31:0] tlDM_auto_dmInner_dmInner_tl_in_d_bits_data;
  wire  tlDM_auto_dmOuter_intsource_out_sync_0;
  wire  tlDM_io_debug_clock;
  wire  tlDM_io_debug_reset;
  wire  tlDM_io_ctrl_ndreset;
  wire  tlDM_io_ctrl_dmactive;
  wire  tlDM_io_ctrl_dmactiveAck;
  wire  tlDM_io_dmi_dmi_req_ready;
  wire  tlDM_io_dmi_dmi_req_valid;
  wire [6:0] tlDM_io_dmi_dmi_req_bits_addr;
  wire [31:0] tlDM_io_dmi_dmi_req_bits_data;
  wire [1:0] tlDM_io_dmi_dmi_req_bits_op;
  wire  tlDM_io_dmi_dmi_resp_ready;
  wire  tlDM_io_dmi_dmi_resp_valid;
  wire [31:0] tlDM_io_dmi_dmi_resp_bits_data;
  wire [1:0] tlDM_io_dmi_dmi_resp_bits_resp;
  wire  tlDM_io_dmi_dmiClock;
  wire  tlDM_io_dmi_dmiReset;
  wire  tlDM_io_hartIsInReset_0;
  wire  tileHartIdNexusNode_auto_out;
  wire  intsource_clock;
  wire  intsource_reset;
  wire  intsource_auto_in_0;
  wire  intsource_auto_in_1;
  wire  intsource_auto_out_sync_0;
  wire  intsource_auto_out_sync_1;
  wire  intsource_1_clock;
  wire  intsource_1_reset;
  wire  intsource_1_auto_in_0;
  wire  intsource_1_auto_out_sync_0;
  wire  intsource_2_clock;
  wire  intsource_2_reset;
  wire  intsource_2_auto_in_0;
  wire  intsource_2_auto_out_sync_0;
  wire  intsink_1_auto_in_sync_0;
  wire  intsink_1_auto_out_0;
  wire  intsink_2_auto_in_sync_0;
  wire  intsink_2_auto_out_0;
  wire  intsink_3_auto_in_sync_0;
  wire  intsink_3_auto_out_0;
  wire  intsource_3_clock;
  wire  intsource_3_reset;
  wire  intsource_3_auto_in_0;
  wire  intsource_3_auto_in_1;
  wire  intsource_3_auto_out_sync_0;
  wire  intsource_3_auto_out_sync_1;
  wire  bootROMDomainWrapper_auto_bootrom_in_a_ready;
  wire  bootROMDomainWrapper_auto_bootrom_in_a_valid;
  wire [2:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode;
  wire [2:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_param;
  wire [1:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_size;
  wire [9:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_source;
  wire [16:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_address;
  wire [3:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_mask;
  wire  bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt;
  wire  bootROMDomainWrapper_auto_bootrom_in_d_ready;
  wire  bootROMDomainWrapper_auto_bootrom_in_d_valid;
  wire [1:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_size;
  wire [9:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_source;
  wire [31:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_data;
  wire  bootROMDomainWrapper_auto_clock_in_clock;
  wire  bootROMDomainWrapper_auto_clock_in_reset;
  reg [6:0] int_rtc_tick_value;
  wire  int_rtc_tick_wrap_wrap = int_rtc_tick_value == 7'h63;
  wire [6:0] _int_rtc_tick_wrap_value_T_1 = int_rtc_tick_value + 7'h1;
  IntXbar ibus_int_bus (
    .auto_int_in_0(ibus_int_bus_auto_int_in_0),
    .auto_int_in_1(ibus_int_bus_auto_int_in_1),
    .auto_int_out_0(ibus_int_bus_auto_int_out_0),
    .auto_int_out_1(ibus_int_bus_auto_int_out_1)
  );
  IntSyncAsyncCrossingSink ibus_intsink (
    .clock(ibus_intsink_clock),
    .auto_in_sync_0(ibus_intsink_auto_in_sync_0),
    .auto_in_sync_1(ibus_intsink_auto_in_sync_1),
    .auto_out_0(ibus_intsink_auto_out_0),
    .auto_out_1(ibus_intsink_auto_out_1)
  );
  SimpleClockGroupSource dummyClockGroupSourceNode (
    .clock(dummyClockGroupSourceNode_clock),
    .reset(dummyClockGroupSourceNode_reset),
    .auto_out_member_subsystem_sbus_3_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_clock),
    .auto_out_member_subsystem_sbus_3_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_reset),
    .auto_out_member_subsystem_sbus_2_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_clock),
    .auto_out_member_subsystem_sbus_2_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_reset),
    .auto_out_member_subsystem_sbus_1_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_clock),
    .auto_out_member_subsystem_sbus_1_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_reset),
    .auto_out_member_subsystem_sbus_0_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_clock),
    .auto_out_member_subsystem_sbus_0_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_reset)
  );
  SystemBus subsystem_sbus (
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last(
      subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_ready(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_ready),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_ready(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_ready),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_ready(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_ready),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt),
    .auto_coupler_from_tile_tl_master_clock_xing_in_e_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt),
    .auto_fixedClockNode_out_1_clock(subsystem_sbus_auto_fixedClockNode_out_1_clock),
    .auto_fixedClockNode_out_1_reset(subsystem_sbus_auto_fixedClockNode_out_1_reset),
    .auto_fixedClockNode_out_0_clock(subsystem_sbus_auto_fixedClockNode_out_0_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset),
    .auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock),
    .auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset),
    .auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock),
    .auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset),
    .auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock),
    .auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset)
  );
  PeripheryBus subsystem_pbus (
    .auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock(
      subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset(
      subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .clock(subsystem_pbus_clock),
    .reset(subsystem_pbus_reset)
  );
  TLBuffer_2 subsystem_fbus_buffer (
    .clock(subsystem_fbus_buffer_clock),
    .reset(subsystem_fbus_buffer_reset),
    .auto_in_a_ready(subsystem_fbus_buffer_auto_in_a_ready),
    .auto_in_a_valid(subsystem_fbus_buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(subsystem_fbus_buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(subsystem_fbus_buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(subsystem_fbus_buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(subsystem_fbus_buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(subsystem_fbus_buffer_auto_in_a_bits_address),
    .auto_in_a_bits_user_amba_prot_bufferable(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_bufferable),
    .auto_in_a_bits_user_amba_prot_modifiable(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_modifiable),
    .auto_in_a_bits_user_amba_prot_readalloc(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_readalloc),
    .auto_in_a_bits_user_amba_prot_writealloc(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_writealloc),
    .auto_in_a_bits_user_amba_prot_privileged(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_privileged),
    .auto_in_a_bits_user_amba_prot_secure(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_secure),
    .auto_in_a_bits_user_amba_prot_fetch(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_fetch),
    .auto_in_a_bits_mask(subsystem_fbus_buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(subsystem_fbus_buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(subsystem_fbus_buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(subsystem_fbus_buffer_auto_in_d_ready),
    .auto_in_d_valid(subsystem_fbus_buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(subsystem_fbus_buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(subsystem_fbus_buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(subsystem_fbus_buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(subsystem_fbus_buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(subsystem_fbus_buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(subsystem_fbus_buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(subsystem_fbus_buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(subsystem_fbus_buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(subsystem_fbus_buffer_auto_out_a_ready),
    .auto_out_a_valid(subsystem_fbus_buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(subsystem_fbus_buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(subsystem_fbus_buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(subsystem_fbus_buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(subsystem_fbus_buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(subsystem_fbus_buffer_auto_out_a_bits_address),
    .auto_out_a_bits_user_amba_prot_bufferable(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_bufferable),
    .auto_out_a_bits_user_amba_prot_modifiable(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_modifiable),
    .auto_out_a_bits_user_amba_prot_readalloc(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_readalloc),
    .auto_out_a_bits_user_amba_prot_writealloc(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_writealloc),
    .auto_out_a_bits_user_amba_prot_privileged(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_privileged),
    .auto_out_a_bits_user_amba_prot_secure(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_secure),
    .auto_out_a_bits_user_amba_prot_fetch(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_fetch),
    .auto_out_a_bits_mask(subsystem_fbus_buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(subsystem_fbus_buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(subsystem_fbus_buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(subsystem_fbus_buffer_auto_out_d_ready),
    .auto_out_d_valid(subsystem_fbus_buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(subsystem_fbus_buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(subsystem_fbus_buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(subsystem_fbus_buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(subsystem_fbus_buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(subsystem_fbus_buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(subsystem_fbus_buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(subsystem_fbus_buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(subsystem_fbus_buffer_auto_out_d_bits_corrupt)
  );
  TLInterconnectCoupler_5 subsystem_fbus_coupler_from_port_named_slave_port_axi4 (
    .clock(subsystem_fbus_coupler_from_port_named_slave_port_axi4_clock),
    .reset(subsystem_fbus_coupler_from_port_named_slave_port_axi4_reset),
    .auto_axi4index_in_aw_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_ready),
    .auto_axi4index_in_aw_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_valid),
    .auto_axi4index_in_aw_bits_id(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_id),
    .auto_axi4index_in_aw_bits_addr(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_addr),
    .auto_axi4index_in_aw_bits_len(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_len)
      ,
    .auto_axi4index_in_aw_bits_size(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_size),
    .auto_axi4index_in_aw_bits_burst(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_burst),
    .auto_axi4index_in_aw_bits_cache(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_cache),
    .auto_axi4index_in_aw_bits_prot(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_prot),
    .auto_axi4index_in_w_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_ready),
    .auto_axi4index_in_w_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_valid),
    .auto_axi4index_in_w_bits_data(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_data)
      ,
    .auto_axi4index_in_w_bits_strb(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_strb)
      ,
    .auto_axi4index_in_w_bits_last(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_last)
      ,
    .auto_axi4index_in_b_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_ready),
    .auto_axi4index_in_b_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_valid),
    .auto_axi4index_in_b_bits_id(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_id),
    .auto_axi4index_in_b_bits_resp(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_resp)
      ,
    .auto_axi4index_in_ar_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_ready),
    .auto_axi4index_in_ar_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_valid),
    .auto_axi4index_in_ar_bits_id(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_id),
    .auto_axi4index_in_ar_bits_addr(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_addr),
    .auto_axi4index_in_ar_bits_len(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_len)
      ,
    .auto_axi4index_in_ar_bits_size(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_size),
    .auto_axi4index_in_ar_bits_burst(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_burst),
    .auto_axi4index_in_ar_bits_cache(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_cache),
    .auto_axi4index_in_ar_bits_prot(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_prot),
    .auto_axi4index_in_r_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_ready),
    .auto_axi4index_in_r_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_valid),
    .auto_axi4index_in_r_bits_id(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_id),
    .auto_axi4index_in_r_bits_data(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_data)
      ,
    .auto_axi4index_in_r_bits_resp(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_resp)
      ,
    .auto_axi4index_in_r_bits_last(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_last)
      ,
    .auto_tl_out_a_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_ready),
    .auto_tl_out_a_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_valid),
    .auto_tl_out_a_bits_opcode(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_opcode),
    .auto_tl_out_a_bits_param(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_param),
    .auto_tl_out_a_bits_size(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_size),
    .auto_tl_out_a_bits_source(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_source),
    .auto_tl_out_a_bits_address(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_address),
    .auto_tl_out_a_bits_user_amba_prot_bufferable(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable),
    .auto_tl_out_a_bits_user_amba_prot_modifiable(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable),
    .auto_tl_out_a_bits_user_amba_prot_readalloc(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc),
    .auto_tl_out_a_bits_user_amba_prot_writealloc(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc),
    .auto_tl_out_a_bits_user_amba_prot_privileged(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_privileged),
    .auto_tl_out_a_bits_user_amba_prot_secure(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_secure),
    .auto_tl_out_a_bits_user_amba_prot_fetch(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_fetch),
    .auto_tl_out_a_bits_mask(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_mask),
    .auto_tl_out_a_bits_data(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_data),
    .auto_tl_out_a_bits_corrupt(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_corrupt),
    .auto_tl_out_d_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_ready),
    .auto_tl_out_d_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_valid),
    .auto_tl_out_d_bits_opcode(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_opcode),
    .auto_tl_out_d_bits_param(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_param),
    .auto_tl_out_d_bits_size(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_size),
    .auto_tl_out_d_bits_source(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_source),
    .auto_tl_out_d_bits_sink(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_sink),
    .auto_tl_out_d_bits_denied(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_denied),
    .auto_tl_out_d_bits_data(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_data),
    .auto_tl_out_d_bits_corrupt(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_corrupt)
  );
  PeripheryBus_1 subsystem_cbus (
    .auto_coupler_to_bootrom_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready),
    .auto_coupler_to_bootrom_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_param(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_size(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_mask(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_bootrom_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready),
    .auto_coupler_to_bootrom_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_size(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_data(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready),
    .auto_coupler_to_debug_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid),
    .auto_coupler_to_debug_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param)
      ,
    .auto_coupler_to_debug_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size),
    .auto_coupler_to_debug_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source),
    .auto_coupler_to_debug_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address),
    .auto_coupler_to_debug_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask),
    .auto_coupler_to_debug_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_debug_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready),
    .auto_coupler_to_debug_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid),
    .auto_coupler_to_debug_fragmenter_out_d_bits_opcode(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size),
    .auto_coupler_to_debug_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source),
    .auto_coupler_to_debug_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready),
    .auto_coupler_to_clint_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid),
    .auto_coupler_to_clint_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param)
      ,
    .auto_coupler_to_clint_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size),
    .auto_coupler_to_clint_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source),
    .auto_coupler_to_clint_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address),
    .auto_coupler_to_clint_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask),
    .auto_coupler_to_clint_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_clint_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready),
    .auto_coupler_to_clint_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid),
    .auto_coupler_to_clint_fragmenter_out_d_bits_opcode(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size),
    .auto_coupler_to_clint_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source),
    .auto_coupler_to_clint_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready),
    .auto_coupler_to_plic_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid),
    .auto_coupler_to_plic_fragmenter_out_a_bits_opcode(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode)
      ,
    .auto_coupler_to_plic_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param),
    .auto_coupler_to_plic_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size),
    .auto_coupler_to_plic_fragmenter_out_a_bits_source(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source)
      ,
    .auto_coupler_to_plic_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address),
    .auto_coupler_to_plic_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask),
    .auto_coupler_to_plic_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_plic_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready),
    .auto_coupler_to_plic_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid),
    .auto_coupler_to_plic_fragmenter_out_d_bits_opcode(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode)
      ,
    .auto_coupler_to_plic_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size),
    .auto_coupler_to_plic_fragmenter_out_d_bits_source(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source)
      ,
    .auto_coupler_to_plic_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data),
    .auto_fixedClockNode_out_2_clock(subsystem_cbus_auto_fixedClockNode_out_2_clock),
    .auto_fixedClockNode_out_2_reset(subsystem_cbus_auto_fixedClockNode_out_2_reset),
    .auto_fixedClockNode_out_0_clock(subsystem_cbus_auto_fixedClockNode_out_0_clock),
    .auto_fixedClockNode_out_0_reset(subsystem_cbus_auto_fixedClockNode_out_0_reset),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset),
    .auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock),
    .auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset),
    .auto_bus_xing_in_a_ready(subsystem_cbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid(subsystem_cbus_auto_bus_xing_in_a_valid),
    .auto_bus_xing_in_a_bits_opcode(subsystem_cbus_auto_bus_xing_in_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param(subsystem_cbus_auto_bus_xing_in_a_bits_param),
    .auto_bus_xing_in_a_bits_size(subsystem_cbus_auto_bus_xing_in_a_bits_size),
    .auto_bus_xing_in_a_bits_source(subsystem_cbus_auto_bus_xing_in_a_bits_source),
    .auto_bus_xing_in_a_bits_address(subsystem_cbus_auto_bus_xing_in_a_bits_address),
    .auto_bus_xing_in_a_bits_mask(subsystem_cbus_auto_bus_xing_in_a_bits_mask),
    .auto_bus_xing_in_a_bits_data(subsystem_cbus_auto_bus_xing_in_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt(subsystem_cbus_auto_bus_xing_in_a_bits_corrupt),
    .auto_bus_xing_in_d_ready(subsystem_cbus_auto_bus_xing_in_d_ready),
    .auto_bus_xing_in_d_valid(subsystem_cbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode(subsystem_cbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param(subsystem_cbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size(subsystem_cbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source(subsystem_cbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink(subsystem_cbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied(subsystem_cbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data(subsystem_cbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt(subsystem_cbus_auto_bus_xing_in_d_bits_corrupt),
    .clock(subsystem_cbus_clock),
    .reset(subsystem_cbus_reset)
  );
  TilePRCIDomain tile_prci_domain (
    .auto_intsink_in_sync_0(tile_prci_domain_auto_intsink_in_sync_0),
    .auto_tile_reset_domain_tile_hartid_in(tile_prci_domain_auto_tile_reset_domain_tile_hartid_in),
    .auto_int_out_clock_xing_out_2_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0),
    .auto_int_out_clock_xing_out_1_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0),
    .auto_int_out_clock_xing_out_0_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0),
    .auto_int_in_clock_xing_in_2_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0),
    .auto_int_in_clock_xing_in_1_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0),
    .auto_int_in_clock_xing_in_0_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0),
    .auto_int_in_clock_xing_in_0_sync_1(tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1),
    .auto_tl_master_clock_xing_out_a_ready(tile_prci_domain_auto_tl_master_clock_xing_out_a_ready),
    .auto_tl_master_clock_xing_out_a_valid(tile_prci_domain_auto_tl_master_clock_xing_out_a_valid),
    .auto_tl_master_clock_xing_out_a_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode),
    .auto_tl_master_clock_xing_out_a_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param),
    .auto_tl_master_clock_xing_out_a_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size),
    .auto_tl_master_clock_xing_out_a_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source),
    .auto_tl_master_clock_xing_out_a_bits_address(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address),
    .auto_tl_master_clock_xing_out_a_bits_mask(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask),
    .auto_tl_master_clock_xing_out_a_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data),
    .auto_tl_master_clock_xing_out_a_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt),
    .auto_tl_master_clock_xing_out_c_ready(tile_prci_domain_auto_tl_master_clock_xing_out_c_ready),
    .auto_tl_master_clock_xing_out_c_valid(tile_prci_domain_auto_tl_master_clock_xing_out_c_valid),
    .auto_tl_master_clock_xing_out_c_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode),
    .auto_tl_master_clock_xing_out_c_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param),
    .auto_tl_master_clock_xing_out_c_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size),
    .auto_tl_master_clock_xing_out_c_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source),
    .auto_tl_master_clock_xing_out_c_bits_address(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address),
    .auto_tl_master_clock_xing_out_c_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data),
    .auto_tl_master_clock_xing_out_c_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt),
    .auto_tl_master_clock_xing_out_d_ready(tile_prci_domain_auto_tl_master_clock_xing_out_d_ready),
    .auto_tl_master_clock_xing_out_d_valid(tile_prci_domain_auto_tl_master_clock_xing_out_d_valid),
    .auto_tl_master_clock_xing_out_d_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode),
    .auto_tl_master_clock_xing_out_d_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param),
    .auto_tl_master_clock_xing_out_d_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size),
    .auto_tl_master_clock_xing_out_d_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source),
    .auto_tl_master_clock_xing_out_d_bits_sink(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink),
    .auto_tl_master_clock_xing_out_d_bits_denied(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied),
    .auto_tl_master_clock_xing_out_d_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data),
    .auto_tl_master_clock_xing_out_d_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt),
    .auto_tl_master_clock_xing_out_e_valid(tile_prci_domain_auto_tl_master_clock_xing_out_e_valid),
    .auto_tl_master_clock_xing_out_e_bits_sink(tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink),
    .auto_tap_clock_in_clock(tile_prci_domain_auto_tap_clock_in_clock),
    .auto_tap_clock_in_reset(tile_prci_domain_auto_tap_clock_in_reset)
  );
  ClockSinkDomain plicDomainWrapper (
    .auto_plic_int_in_0(plicDomainWrapper_auto_plic_int_in_0),
    .auto_plic_int_in_1(plicDomainWrapper_auto_plic_int_in_1),
    .auto_plic_int_out_1_0(plicDomainWrapper_auto_plic_int_out_1_0),
    .auto_plic_int_out_0_0(plicDomainWrapper_auto_plic_int_out_0_0),
    .auto_plic_in_a_ready(plicDomainWrapper_auto_plic_in_a_ready),
    .auto_plic_in_a_valid(plicDomainWrapper_auto_plic_in_a_valid),
    .auto_plic_in_a_bits_opcode(plicDomainWrapper_auto_plic_in_a_bits_opcode),
    .auto_plic_in_a_bits_param(plicDomainWrapper_auto_plic_in_a_bits_param),
    .auto_plic_in_a_bits_size(plicDomainWrapper_auto_plic_in_a_bits_size),
    .auto_plic_in_a_bits_source(plicDomainWrapper_auto_plic_in_a_bits_source),
    .auto_plic_in_a_bits_address(plicDomainWrapper_auto_plic_in_a_bits_address),
    .auto_plic_in_a_bits_mask(plicDomainWrapper_auto_plic_in_a_bits_mask),
    .auto_plic_in_a_bits_data(plicDomainWrapper_auto_plic_in_a_bits_data),
    .auto_plic_in_a_bits_corrupt(plicDomainWrapper_auto_plic_in_a_bits_corrupt),
    .auto_plic_in_d_ready(plicDomainWrapper_auto_plic_in_d_ready),
    .auto_plic_in_d_valid(plicDomainWrapper_auto_plic_in_d_valid),
    .auto_plic_in_d_bits_opcode(plicDomainWrapper_auto_plic_in_d_bits_opcode),
    .auto_plic_in_d_bits_size(plicDomainWrapper_auto_plic_in_d_bits_size),
    .auto_plic_in_d_bits_source(plicDomainWrapper_auto_plic_in_d_bits_source),
    .auto_plic_in_d_bits_data(plicDomainWrapper_auto_plic_in_d_bits_data),
    .auto_clock_in_clock(plicDomainWrapper_auto_clock_in_clock),
    .auto_clock_in_reset(plicDomainWrapper_auto_clock_in_reset)
  );
  CLINT clint (
    .clock(clint_clock),
    .reset(clint_reset),
    .auto_int_out_0(clint_auto_int_out_0),
    .auto_int_out_1(clint_auto_int_out_1),
    .auto_in_a_ready(clint_auto_in_a_ready),
    .auto_in_a_valid(clint_auto_in_a_valid),
    .auto_in_a_bits_opcode(clint_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(clint_auto_in_a_bits_param),
    .auto_in_a_bits_size(clint_auto_in_a_bits_size),
    .auto_in_a_bits_source(clint_auto_in_a_bits_source),
    .auto_in_a_bits_address(clint_auto_in_a_bits_address),
    .auto_in_a_bits_mask(clint_auto_in_a_bits_mask),
    .auto_in_a_bits_data(clint_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(clint_auto_in_a_bits_corrupt),
    .auto_in_d_ready(clint_auto_in_d_ready),
    .auto_in_d_valid(clint_auto_in_d_valid),
    .auto_in_d_bits_opcode(clint_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(clint_auto_in_d_bits_size),
    .auto_in_d_bits_source(clint_auto_in_d_bits_source),
    .auto_in_d_bits_data(clint_auto_in_d_bits_data),
    .io_rtcTick(clint_io_rtcTick)
  );
  TLDebugModule tlDM (
    .auto_dmInner_dmInner_tl_in_a_ready(tlDM_auto_dmInner_dmInner_tl_in_a_ready),
    .auto_dmInner_dmInner_tl_in_a_valid(tlDM_auto_dmInner_dmInner_tl_in_a_valid),
    .auto_dmInner_dmInner_tl_in_a_bits_opcode(tlDM_auto_dmInner_dmInner_tl_in_a_bits_opcode),
    .auto_dmInner_dmInner_tl_in_a_bits_param(tlDM_auto_dmInner_dmInner_tl_in_a_bits_param),
    .auto_dmInner_dmInner_tl_in_a_bits_size(tlDM_auto_dmInner_dmInner_tl_in_a_bits_size),
    .auto_dmInner_dmInner_tl_in_a_bits_source(tlDM_auto_dmInner_dmInner_tl_in_a_bits_source),
    .auto_dmInner_dmInner_tl_in_a_bits_address(tlDM_auto_dmInner_dmInner_tl_in_a_bits_address),
    .auto_dmInner_dmInner_tl_in_a_bits_mask(tlDM_auto_dmInner_dmInner_tl_in_a_bits_mask),
    .auto_dmInner_dmInner_tl_in_a_bits_data(tlDM_auto_dmInner_dmInner_tl_in_a_bits_data),
    .auto_dmInner_dmInner_tl_in_a_bits_corrupt(tlDM_auto_dmInner_dmInner_tl_in_a_bits_corrupt),
    .auto_dmInner_dmInner_tl_in_d_ready(tlDM_auto_dmInner_dmInner_tl_in_d_ready),
    .auto_dmInner_dmInner_tl_in_d_valid(tlDM_auto_dmInner_dmInner_tl_in_d_valid),
    .auto_dmInner_dmInner_tl_in_d_bits_opcode(tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode),
    .auto_dmInner_dmInner_tl_in_d_bits_size(tlDM_auto_dmInner_dmInner_tl_in_d_bits_size),
    .auto_dmInner_dmInner_tl_in_d_bits_source(tlDM_auto_dmInner_dmInner_tl_in_d_bits_source),
    .auto_dmInner_dmInner_tl_in_d_bits_data(tlDM_auto_dmInner_dmInner_tl_in_d_bits_data),
    .auto_dmOuter_intsource_out_sync_0(tlDM_auto_dmOuter_intsource_out_sync_0),
    .io_debug_clock(tlDM_io_debug_clock),
    .io_debug_reset(tlDM_io_debug_reset),
    .io_ctrl_ndreset(tlDM_io_ctrl_ndreset),
    .io_ctrl_dmactive(tlDM_io_ctrl_dmactive),
    .io_ctrl_dmactiveAck(tlDM_io_ctrl_dmactiveAck),
    .io_dmi_dmi_req_ready(tlDM_io_dmi_dmi_req_ready),
    .io_dmi_dmi_req_valid(tlDM_io_dmi_dmi_req_valid),
    .io_dmi_dmi_req_bits_addr(tlDM_io_dmi_dmi_req_bits_addr),
    .io_dmi_dmi_req_bits_data(tlDM_io_dmi_dmi_req_bits_data),
    .io_dmi_dmi_req_bits_op(tlDM_io_dmi_dmi_req_bits_op),
    .io_dmi_dmi_resp_ready(tlDM_io_dmi_dmi_resp_ready),
    .io_dmi_dmi_resp_valid(tlDM_io_dmi_dmi_resp_valid),
    .io_dmi_dmi_resp_bits_data(tlDM_io_dmi_dmi_resp_bits_data),
    .io_dmi_dmi_resp_bits_resp(tlDM_io_dmi_dmi_resp_bits_resp),
    .io_dmi_dmiClock(tlDM_io_dmi_dmiClock),
    .io_dmi_dmiReset(tlDM_io_dmi_dmiReset),
    .io_hartIsInReset_0(tlDM_io_hartIsInReset_0)
  );
  BundleBridgeNexus_13 tileHartIdNexusNode (
    .auto_out(tileHartIdNexusNode_auto_out)
  );
  IntSyncCrossingSource_5 intsource (
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_in_1(intsource_auto_in_1),
    .auto_out_sync_0(intsource_auto_out_sync_0),
    .auto_out_sync_1(intsource_auto_out_sync_1)
  );
  IntSyncCrossingSource_1 intsource_1 (
    .clock(intsource_1_clock),
    .reset(intsource_1_reset),
    .auto_in_0(intsource_1_auto_in_0),
    .auto_out_sync_0(intsource_1_auto_out_sync_0)
  );
  IntSyncCrossingSource_1 intsource_2 (
    .clock(intsource_2_clock),
    .reset(intsource_2_reset),
    .auto_in_0(intsource_2_auto_in_0),
    .auto_out_sync_0(intsource_2_auto_out_sync_0)
  );
  IntSyncSyncCrossingSink_1 intsink_1 (
    .auto_in_sync_0(intsink_1_auto_in_sync_0),
    .auto_out_0(intsink_1_auto_out_0)
  );
  IntSyncSyncCrossingSink_1 intsink_2 (
    .auto_in_sync_0(intsink_2_auto_in_sync_0),
    .auto_out_0(intsink_2_auto_out_0)
  );
  IntSyncSyncCrossingSink_1 intsink_3 (
    .auto_in_sync_0(intsink_3_auto_in_sync_0),
    .auto_out_0(intsink_3_auto_out_0)
  );
  IntSyncCrossingSource_5 intsource_3 (
    .clock(intsource_3_clock),
    .reset(intsource_3_reset),
    .auto_in_0(intsource_3_auto_in_0),
    .auto_in_1(intsource_3_auto_in_1),
    .auto_out_sync_0(intsource_3_auto_out_sync_0),
    .auto_out_sync_1(intsource_3_auto_out_sync_1)
  );
  ClockSinkDomain_1 bootROMDomainWrapper (
    .auto_bootrom_in_a_ready(bootROMDomainWrapper_auto_bootrom_in_a_ready),
    .auto_bootrom_in_a_valid(bootROMDomainWrapper_auto_bootrom_in_a_valid),
    .auto_bootrom_in_a_bits_opcode(bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode),
    .auto_bootrom_in_a_bits_param(bootROMDomainWrapper_auto_bootrom_in_a_bits_param),
    .auto_bootrom_in_a_bits_size(bootROMDomainWrapper_auto_bootrom_in_a_bits_size),
    .auto_bootrom_in_a_bits_source(bootROMDomainWrapper_auto_bootrom_in_a_bits_source),
    .auto_bootrom_in_a_bits_address(bootROMDomainWrapper_auto_bootrom_in_a_bits_address),
    .auto_bootrom_in_a_bits_mask(bootROMDomainWrapper_auto_bootrom_in_a_bits_mask),
    .auto_bootrom_in_a_bits_corrupt(bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt),
    .auto_bootrom_in_d_ready(bootROMDomainWrapper_auto_bootrom_in_d_ready),
    .auto_bootrom_in_d_valid(bootROMDomainWrapper_auto_bootrom_in_d_valid),
    .auto_bootrom_in_d_bits_size(bootROMDomainWrapper_auto_bootrom_in_d_bits_size),
    .auto_bootrom_in_d_bits_source(bootROMDomainWrapper_auto_bootrom_in_d_bits_source),
    .auto_bootrom_in_d_bits_data(bootROMDomainWrapper_auto_bootrom_in_d_bits_data),
    .auto_clock_in_clock(bootROMDomainWrapper_auto_clock_in_clock),
    .auto_clock_in_reset(bootROMDomainWrapper_auto_clock_in_reset)
  );
  assign ibus_auto_int_bus_int_out_0 = ibus_int_bus_auto_int_out_0;
  assign ibus_auto_int_bus_int_out_1 = ibus_int_bus_auto_int_out_1;
  assign ibus_int_bus_auto_int_in_0 = ibus_intsink_auto_out_0;
  assign ibus_int_bus_auto_int_in_1 = ibus_intsink_auto_out_1;
  assign ibus_intsink_clock = ibus_auto_clock_in_clock;
  assign ibus_intsink_auto_in_sync_0 = ibus_auto_int_in_xing_in_sync_0;
  assign ibus_intsink_auto_in_sync_1 = ibus_auto_int_in_xing_in_sync_1;
  assign subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock =
    subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock;
  assign subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset =
    subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset;
  assign subsystem_fbus_clockGroup_auto_out_clock = subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_clock;
  assign subsystem_fbus_clockGroup_auto_out_reset = subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_reset;
  assign subsystem_fbus_fixedClockNode_auto_out_clock = subsystem_fbus_fixedClockNode_auto_in_clock;
  assign subsystem_fbus_fixedClockNode_auto_out_reset = subsystem_fbus_fixedClockNode_auto_in_reset;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_ready = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_ready;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_valid = subsystem_fbus_subsystem_fbus_xbar_auto_out_d_valid;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_opcode =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_opcode;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_param =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_param;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_size =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_size;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_source =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_source;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_sink =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_sink;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_denied =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_denied;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_data =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_data;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_corrupt =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_corrupt;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_valid = subsystem_fbus_subsystem_fbus_xbar_auto_in_a_valid;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_opcode =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_opcode;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_param =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_param;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_size =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_size;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_source =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_source;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_address =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_address;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_bufferable;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_modifiable;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_readalloc;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_writealloc;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_privileged =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_privileged;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_secure =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_secure;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_fetch =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_fetch;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_mask =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_mask;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_data =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_data;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_corrupt =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_corrupt;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_ready = subsystem_fbus_subsystem_fbus_xbar_auto_in_d_ready;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_ready;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_ready;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_valid;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_id;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_resp;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_ready;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_valid;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_id;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_data;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_resp;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_last;
  assign subsystem_fbus_auto_bus_xing_out_a_valid = subsystem_fbus_buffer_auto_out_a_valid;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_opcode = subsystem_fbus_buffer_auto_out_a_bits_opcode;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_param = subsystem_fbus_buffer_auto_out_a_bits_param;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_size = subsystem_fbus_buffer_auto_out_a_bits_size;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_source = subsystem_fbus_buffer_auto_out_a_bits_source;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_address = subsystem_fbus_buffer_auto_out_a_bits_address;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_bufferable;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_modifiable;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_readalloc;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_writealloc;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_privileged =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_privileged;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_secure =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_secure;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_fetch =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_fetch;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_mask = subsystem_fbus_buffer_auto_out_a_bits_mask;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_data = subsystem_fbus_buffer_auto_out_a_bits_data;
  assign subsystem_fbus_auto_bus_xing_out_a_bits_corrupt = subsystem_fbus_buffer_auto_out_a_bits_corrupt;
  assign subsystem_fbus_auto_bus_xing_out_d_ready = subsystem_fbus_buffer_auto_out_d_ready;
  assign subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock =
    subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock;
  assign subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset =
    subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset;
  assign subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_clock =
    subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock;
  assign subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_reset =
    subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset;
  assign subsystem_fbus_fixedClockNode_auto_in_clock = subsystem_fbus_clockGroup_auto_out_clock;
  assign subsystem_fbus_fixedClockNode_auto_in_reset = subsystem_fbus_clockGroup_auto_out_reset;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_valid =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_valid;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_opcode =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_opcode;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_param =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_param;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_size =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_size;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_source =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_source;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_address =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_address;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_privileged =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_privileged;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_secure =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_secure;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_fetch =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_fetch;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_mask =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_mask;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_data =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_data;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_corrupt =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_corrupt;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_ready =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_ready;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_ready = subsystem_fbus_buffer_auto_in_a_ready;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_valid = subsystem_fbus_buffer_auto_in_d_valid;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_opcode = subsystem_fbus_buffer_auto_in_d_bits_opcode;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_param = subsystem_fbus_buffer_auto_in_d_bits_param;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_size = subsystem_fbus_buffer_auto_in_d_bits_size;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_source = subsystem_fbus_buffer_auto_in_d_bits_source;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_sink = subsystem_fbus_buffer_auto_in_d_bits_sink;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_denied = subsystem_fbus_buffer_auto_in_d_bits_denied;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_data = subsystem_fbus_buffer_auto_in_d_bits_data;
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_corrupt = subsystem_fbus_buffer_auto_in_d_bits_corrupt;
  assign subsystem_fbus_buffer_clock = subsystem_fbus_fixedClockNode_auto_out_clock;
  assign subsystem_fbus_buffer_reset = subsystem_fbus_fixedClockNode_auto_out_reset;
  assign subsystem_fbus_buffer_auto_in_a_valid = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_valid;
  assign subsystem_fbus_buffer_auto_in_a_bits_opcode = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_opcode;
  assign subsystem_fbus_buffer_auto_in_a_bits_param = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_param;
  assign subsystem_fbus_buffer_auto_in_a_bits_size = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_size;
  assign subsystem_fbus_buffer_auto_in_a_bits_source = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_source;
  assign subsystem_fbus_buffer_auto_in_a_bits_address = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_address;
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_bufferable;
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_modifiable;
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_readalloc;
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_writealloc;
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_privileged =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_privileged;
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_secure =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_secure;
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_fetch =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_fetch;
  assign subsystem_fbus_buffer_auto_in_a_bits_mask = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_mask;
  assign subsystem_fbus_buffer_auto_in_a_bits_data = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_data;
  assign subsystem_fbus_buffer_auto_in_a_bits_corrupt = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_corrupt;
  assign subsystem_fbus_buffer_auto_in_d_ready = subsystem_fbus_subsystem_fbus_xbar_auto_out_d_ready;
  assign subsystem_fbus_buffer_auto_out_a_ready = subsystem_fbus_auto_bus_xing_out_a_ready;
  assign subsystem_fbus_buffer_auto_out_d_valid = subsystem_fbus_auto_bus_xing_out_d_valid;
  assign subsystem_fbus_buffer_auto_out_d_bits_opcode = subsystem_fbus_auto_bus_xing_out_d_bits_opcode;
  assign subsystem_fbus_buffer_auto_out_d_bits_param = subsystem_fbus_auto_bus_xing_out_d_bits_param;
  assign subsystem_fbus_buffer_auto_out_d_bits_size = subsystem_fbus_auto_bus_xing_out_d_bits_size;
  assign subsystem_fbus_buffer_auto_out_d_bits_source = subsystem_fbus_auto_bus_xing_out_d_bits_source;
  assign subsystem_fbus_buffer_auto_out_d_bits_sink = subsystem_fbus_auto_bus_xing_out_d_bits_sink;
  assign subsystem_fbus_buffer_auto_out_d_bits_denied = subsystem_fbus_auto_bus_xing_out_d_bits_denied;
  assign subsystem_fbus_buffer_auto_out_d_bits_data = subsystem_fbus_auto_bus_xing_out_d_bits_data;
  assign subsystem_fbus_buffer_auto_out_d_bits_corrupt = subsystem_fbus_auto_bus_xing_out_d_bits_corrupt;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_clock = subsystem_fbus_fixedClockNode_auto_out_clock;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_reset = subsystem_fbus_fixedClockNode_auto_out_reset;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_id =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_addr =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_len =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_size =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_burst =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_cache =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_cache;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_prot =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_prot;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_data =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_strb =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_last =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_id =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_addr =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_len =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_size =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_burst =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_cache =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_cache;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_prot =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_prot;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_ready =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_ready;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_valid =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_valid;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_opcode =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_opcode;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_param =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_param;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_size =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_size;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_source =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_source;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_sink =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_sink;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_denied =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_denied;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_data =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_data;
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_corrupt =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_corrupt;
  assign mem_axi4_0_aw_valid = subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid;
  assign mem_axi4_0_aw_bits_id =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id;
  assign mem_axi4_0_aw_bits_addr =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr;
  assign mem_axi4_0_aw_bits_len =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len;
  assign mem_axi4_0_aw_bits_size =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size;
  assign mem_axi4_0_aw_bits_burst =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst;
  assign mem_axi4_0_aw_bits_lock =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock;
  assign mem_axi4_0_aw_bits_cache =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache;
  assign mem_axi4_0_aw_bits_prot =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot;
  assign mem_axi4_0_aw_bits_qos =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos;
  assign mem_axi4_0_w_valid = subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid;
  assign mem_axi4_0_w_bits_data =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data;
  assign mem_axi4_0_w_bits_strb =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb;
  assign mem_axi4_0_w_bits_last =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last;
  assign mem_axi4_0_b_ready = subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready;
  assign mem_axi4_0_ar_valid = subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid;
  assign mem_axi4_0_ar_bits_id =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id;
  assign mem_axi4_0_ar_bits_addr =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr;
  assign mem_axi4_0_ar_bits_len =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len;
  assign mem_axi4_0_ar_bits_size =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size;
  assign mem_axi4_0_ar_bits_burst =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst;
  assign mem_axi4_0_ar_bits_lock =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock;
  assign mem_axi4_0_ar_bits_cache =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache;
  assign mem_axi4_0_ar_bits_prot =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot;
  assign mem_axi4_0_ar_bits_qos =
    subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos;
  assign mem_axi4_0_r_ready = subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready;
  assign mmio_axi4_0_aw_valid = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid;
  assign mmio_axi4_0_aw_bits_id = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id;
  assign mmio_axi4_0_aw_bits_addr = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr;
  assign mmio_axi4_0_aw_bits_len = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len;
  assign mmio_axi4_0_aw_bits_size = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size;
  assign mmio_axi4_0_aw_bits_burst = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst;
  assign mmio_axi4_0_aw_bits_lock = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock;
  assign mmio_axi4_0_aw_bits_cache = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache;
  assign mmio_axi4_0_aw_bits_prot = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot;
  assign mmio_axi4_0_aw_bits_qos = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos;
  assign mmio_axi4_0_w_valid = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid;
  assign mmio_axi4_0_w_bits_data = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data;
  assign mmio_axi4_0_w_bits_strb = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb;
  assign mmio_axi4_0_w_bits_last = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last;
  assign mmio_axi4_0_b_ready = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready;
  assign mmio_axi4_0_ar_valid = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid;
  assign mmio_axi4_0_ar_bits_id = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id;
  assign mmio_axi4_0_ar_bits_addr = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr;
  assign mmio_axi4_0_ar_bits_len = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len;
  assign mmio_axi4_0_ar_bits_size = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size;
  assign mmio_axi4_0_ar_bits_burst = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst;
  assign mmio_axi4_0_ar_bits_lock = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock;
  assign mmio_axi4_0_ar_bits_cache = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache;
  assign mmio_axi4_0_ar_bits_prot = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot;
  assign mmio_axi4_0_ar_bits_qos = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos;
  assign mmio_axi4_0_r_ready = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready;
  assign l2_frontend_bus_axi4_0_aw_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready;
  assign l2_frontend_bus_axi4_0_w_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready;
  assign l2_frontend_bus_axi4_0_b_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid;
  assign l2_frontend_bus_axi4_0_b_bits_id =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id;
  assign l2_frontend_bus_axi4_0_b_bits_resp =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp;
  assign l2_frontend_bus_axi4_0_ar_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready;
  assign l2_frontend_bus_axi4_0_r_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid;
  assign l2_frontend_bus_axi4_0_r_bits_id =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id;
  assign l2_frontend_bus_axi4_0_r_bits_data =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data;
  assign l2_frontend_bus_axi4_0_r_bits_resp =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp;
  assign l2_frontend_bus_axi4_0_r_bits_last =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last;
  assign debug_clockeddmi_dmi_req_ready = tlDM_io_dmi_dmi_req_ready;
  assign debug_clockeddmi_dmi_resp_valid = tlDM_io_dmi_dmi_resp_valid;
  assign debug_clockeddmi_dmi_resp_bits_data = tlDM_io_dmi_dmi_resp_bits_data;
  assign debug_clockeddmi_dmi_resp_bits_resp = tlDM_io_dmi_dmi_resp_bits_resp;
  assign debug_ndreset = tlDM_io_ctrl_ndreset;
  assign debug_dmactive = tlDM_io_ctrl_dmactive;
  assign ibus_auto_int_in_xing_in_sync_0 = intsource_3_auto_out_sync_0;
  assign ibus_auto_int_in_xing_in_sync_1 = intsource_3_auto_out_sync_1;
  assign ibus_auto_clock_in_clock = subsystem_sbus_auto_fixedClockNode_out_0_clock;
  assign dummyClockGroupSourceNode_clock = clock;
  assign dummyClockGroupSourceNode_reset = reset;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready = mmio_axi4_0_aw_ready;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready = mmio_axi4_0_w_ready;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid = mmio_axi4_0_b_valid;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id = mmio_axi4_0_b_bits_id;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp = mmio_axi4_0_b_bits_resp;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready = mmio_axi4_0_ar_ready;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid = mmio_axi4_0_r_valid;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id = mmio_axi4_0_r_bits_id;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data = mmio_axi4_0_r_bits_data;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp = mmio_axi4_0_r_bits_resp;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last = mmio_axi4_0_r_bits_last;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready = mem_axi4_0_aw_ready;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready = mem_axi4_0_w_ready;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid = mem_axi4_0_b_valid;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id = mem_axi4_0_b_bits_id;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp =
    mem_axi4_0_b_bits_resp;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready = mem_axi4_0_ar_ready;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid = mem_axi4_0_r_valid;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id = mem_axi4_0_r_bits_id;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data =
    mem_axi4_0_r_bits_data;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp =
    mem_axi4_0_r_bits_resp;
  assign subsystem_sbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last =
    mem_axi4_0_r_bits_last;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_valid;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_valid;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_ready =
    tile_prci_domain_auto_tl_master_clock_xing_out_d_ready;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_e_valid;
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink =
    tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid =
    subsystem_fbus_auto_bus_xing_out_a_valid;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode =
    subsystem_fbus_auto_bus_xing_out_a_bits_opcode;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param =
    subsystem_fbus_auto_bus_xing_out_a_bits_param;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size =
    subsystem_fbus_auto_bus_xing_out_a_bits_size;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source =
    subsystem_fbus_auto_bus_xing_out_a_bits_source;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address =
    subsystem_fbus_auto_bus_xing_out_a_bits_address;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_bufferable;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_modifiable;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_readalloc;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_writealloc;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_privileged;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_secure;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_fetch;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask =
    subsystem_fbus_auto_bus_xing_out_a_bits_mask;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data =
    subsystem_fbus_auto_bus_xing_out_a_bits_data;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt =
    subsystem_fbus_auto_bus_xing_out_a_bits_corrupt;
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready =
    subsystem_fbus_auto_bus_xing_out_d_ready;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready =
    subsystem_cbus_auto_bus_xing_in_a_ready;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid =
    subsystem_cbus_auto_bus_xing_in_d_valid;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode =
    subsystem_cbus_auto_bus_xing_in_d_bits_opcode;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param =
    subsystem_cbus_auto_bus_xing_in_d_bits_param;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size =
    subsystem_cbus_auto_bus_xing_in_d_bits_size;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source =
    subsystem_cbus_auto_bus_xing_in_d_bits_source;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink =
    subsystem_cbus_auto_bus_xing_in_d_bits_sink;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied =
    subsystem_cbus_auto_bus_xing_in_d_bits_denied;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data =
    subsystem_cbus_auto_bus_xing_in_d_bits_data;
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt =
    subsystem_cbus_auto_bus_xing_in_d_bits_corrupt;
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_clock;
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_reset;
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_clock;
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_reset;
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_clock;
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_reset;
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_clock;
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_reset;
  assign subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock =
    subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock;
  assign subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset =
    subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid =
    l2_frontend_bus_axi4_0_aw_valid;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id =
    l2_frontend_bus_axi4_0_aw_bits_id;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr =
    l2_frontend_bus_axi4_0_aw_bits_addr;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len =
    l2_frontend_bus_axi4_0_aw_bits_len;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size =
    l2_frontend_bus_axi4_0_aw_bits_size;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst =
    l2_frontend_bus_axi4_0_aw_bits_burst;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_cache =
    l2_frontend_bus_axi4_0_aw_bits_cache;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_prot =
    l2_frontend_bus_axi4_0_aw_bits_prot;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid =
    l2_frontend_bus_axi4_0_w_valid;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data =
    l2_frontend_bus_axi4_0_w_bits_data;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb =
    l2_frontend_bus_axi4_0_w_bits_strb;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last =
    l2_frontend_bus_axi4_0_w_bits_last;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready =
    l2_frontend_bus_axi4_0_b_ready;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid =
    l2_frontend_bus_axi4_0_ar_valid;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id =
    l2_frontend_bus_axi4_0_ar_bits_id;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr =
    l2_frontend_bus_axi4_0_ar_bits_addr;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len =
    l2_frontend_bus_axi4_0_ar_bits_len;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size =
    l2_frontend_bus_axi4_0_ar_bits_size;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst =
    l2_frontend_bus_axi4_0_ar_bits_burst;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_cache =
    l2_frontend_bus_axi4_0_ar_bits_cache;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_prot =
    l2_frontend_bus_axi4_0_ar_bits_prot;
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready =
    l2_frontend_bus_axi4_0_r_ready;
  assign subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock;
  assign subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset;
  assign subsystem_fbus_auto_bus_xing_out_a_ready =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready;
  assign subsystem_fbus_auto_bus_xing_out_d_valid =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid;
  assign subsystem_fbus_auto_bus_xing_out_d_bits_opcode =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode;
  assign subsystem_fbus_auto_bus_xing_out_d_bits_param =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param;
  assign subsystem_fbus_auto_bus_xing_out_d_bits_size =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size;
  assign subsystem_fbus_auto_bus_xing_out_d_bits_source =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source;
  assign subsystem_fbus_auto_bus_xing_out_d_bits_sink =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink;
  assign subsystem_fbus_auto_bus_xing_out_d_bits_denied =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied;
  assign subsystem_fbus_auto_bus_xing_out_d_bits_data =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data;
  assign subsystem_fbus_auto_bus_xing_out_d_bits_corrupt =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt;
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready = bootROMDomainWrapper_auto_bootrom_in_a_ready;
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid = bootROMDomainWrapper_auto_bootrom_in_d_valid;
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_size;
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_source;
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_data;
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready = tlDM_auto_dmInner_dmInner_tl_in_a_ready;
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid = tlDM_auto_dmInner_dmInner_tl_in_d_valid;
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode =
    tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode;
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size = tlDM_auto_dmInner_dmInner_tl_in_d_bits_size;
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source =
    tlDM_auto_dmInner_dmInner_tl_in_d_bits_source;
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data = tlDM_auto_dmInner_dmInner_tl_in_d_bits_data;
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready = clint_auto_in_a_ready;
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid = clint_auto_in_d_valid;
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode = clint_auto_in_d_bits_opcode;
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size = clint_auto_in_d_bits_size;
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source = clint_auto_in_d_bits_source;
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data = clint_auto_in_d_bits_data;
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready = plicDomainWrapper_auto_plic_in_a_ready;
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid = plicDomainWrapper_auto_plic_in_d_valid;
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode = plicDomainWrapper_auto_plic_in_d_bits_opcode
    ;
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size = plicDomainWrapper_auto_plic_in_d_bits_size;
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source = plicDomainWrapper_auto_plic_in_d_bits_source
    ;
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data = plicDomainWrapper_auto_plic_in_d_bits_data;
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock;
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset;
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock;
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset;
  assign subsystem_cbus_auto_bus_xing_in_a_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid;
  assign subsystem_cbus_auto_bus_xing_in_a_bits_opcode =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode;
  assign subsystem_cbus_auto_bus_xing_in_a_bits_param =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param;
  assign subsystem_cbus_auto_bus_xing_in_a_bits_size =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size;
  assign subsystem_cbus_auto_bus_xing_in_a_bits_source =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source;
  assign subsystem_cbus_auto_bus_xing_in_a_bits_address =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address;
  assign subsystem_cbus_auto_bus_xing_in_a_bits_mask =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask;
  assign subsystem_cbus_auto_bus_xing_in_a_bits_data =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data;
  assign subsystem_cbus_auto_bus_xing_in_a_bits_corrupt =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt;
  assign subsystem_cbus_auto_bus_xing_in_d_ready =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready;
  assign tile_prci_domain_auto_intsink_in_sync_0 = tlDM_auto_dmOuter_intsource_out_sync_0;
  assign tile_prci_domain_auto_tile_reset_domain_tile_hartid_in = tileHartIdNexusNode_auto_out;
  assign tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0 = intsource_2_auto_out_sync_0;
  assign tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0 = intsource_1_auto_out_sync_0;
  assign tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0 = intsource_auto_out_sync_0;
  assign tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1 = intsource_auto_out_sync_1;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_a_ready =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_ready;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_c_ready =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_ready;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_valid =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_valid;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data;
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt;
  assign tile_prci_domain_auto_tap_clock_in_clock = subsystem_sbus_auto_fixedClockNode_out_1_clock;
  assign tile_prci_domain_auto_tap_clock_in_reset = subsystem_sbus_auto_fixedClockNode_out_1_reset;
  assign plicDomainWrapper_auto_plic_int_in_0 = ibus_auto_int_bus_int_out_0;
  assign plicDomainWrapper_auto_plic_int_in_1 = ibus_auto_int_bus_int_out_1;
  assign plicDomainWrapper_auto_plic_in_a_valid = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid;
  assign plicDomainWrapper_auto_plic_in_a_bits_opcode = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode
    ;
  assign plicDomainWrapper_auto_plic_in_a_bits_param = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param;
  assign plicDomainWrapper_auto_plic_in_a_bits_size = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size;
  assign plicDomainWrapper_auto_plic_in_a_bits_source = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source
    ;
  assign plicDomainWrapper_auto_plic_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address;
  assign plicDomainWrapper_auto_plic_in_a_bits_mask = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask;
  assign plicDomainWrapper_auto_plic_in_a_bits_data = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data;
  assign plicDomainWrapper_auto_plic_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt;
  assign plicDomainWrapper_auto_plic_in_d_ready = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready;
  assign plicDomainWrapper_auto_clock_in_clock = subsystem_cbus_auto_fixedClockNode_out_0_clock;
  assign plicDomainWrapper_auto_clock_in_reset = subsystem_cbus_auto_fixedClockNode_out_0_reset;
  assign clint_clock = subsystem_cbus_clock;
  assign clint_reset = subsystem_cbus_reset;
  assign clint_auto_in_a_valid = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid;
  assign clint_auto_in_a_bits_opcode = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode;
  assign clint_auto_in_a_bits_param = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param;
  assign clint_auto_in_a_bits_size = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size;
  assign clint_auto_in_a_bits_source = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source;
  assign clint_auto_in_a_bits_address = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address;
  assign clint_auto_in_a_bits_mask = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask;
  assign clint_auto_in_a_bits_data = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data;
  assign clint_auto_in_a_bits_corrupt = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt;
  assign clint_auto_in_d_ready = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready;
  assign clint_io_rtcTick = int_rtc_tick_value == 7'h63;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_valid = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_opcode =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_param = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param
    ;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_size = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_source =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_mask = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_data = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data;
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt;
  assign tlDM_auto_dmInner_dmInner_tl_in_d_ready = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready;
  assign tlDM_io_debug_clock = debug_clock;
  assign tlDM_io_debug_reset = debug_reset;
  assign tlDM_io_ctrl_dmactiveAck = debug_dmactiveAck;
  assign tlDM_io_dmi_dmi_req_valid = debug_clockeddmi_dmi_req_valid;
  assign tlDM_io_dmi_dmi_req_bits_addr = debug_clockeddmi_dmi_req_bits_addr;
  assign tlDM_io_dmi_dmi_req_bits_data = debug_clockeddmi_dmi_req_bits_data;
  assign tlDM_io_dmi_dmi_req_bits_op = debug_clockeddmi_dmi_req_bits_op;
  assign tlDM_io_dmi_dmi_resp_ready = debug_clockeddmi_dmi_resp_ready;
  assign tlDM_io_dmi_dmiClock = debug_clockeddmi_dmiClock;
  assign tlDM_io_dmi_dmiReset = debug_clockeddmi_dmiReset;
  assign tlDM_io_hartIsInReset_0 = resetctrl_hartIsInReset_0;
  assign intsource_clock = clock;
  assign intsource_reset = reset;
  assign intsource_auto_in_0 = clint_auto_int_out_0;
  assign intsource_auto_in_1 = clint_auto_int_out_1;
  assign intsource_1_clock = clock;
  assign intsource_1_reset = reset;
  assign intsource_1_auto_in_0 = plicDomainWrapper_auto_plic_int_out_0_0;
  assign intsource_2_clock = clock;
  assign intsource_2_reset = reset;
  assign intsource_2_auto_in_0 = plicDomainWrapper_auto_plic_int_out_1_0;
  assign intsink_1_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0;
  assign intsink_2_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0;
  assign intsink_3_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0;
  assign intsource_3_clock = clock;
  assign intsource_3_reset = reset;
  assign intsource_3_auto_in_0 = interrupts[0];
  assign intsource_3_auto_in_1 = interrupts[1];
  assign bootROMDomainWrapper_auto_bootrom_in_a_valid = subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid;
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode;
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_param =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param;
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_size =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size;
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_source =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source;
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address;
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_mask =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask;
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt;
  assign bootROMDomainWrapper_auto_bootrom_in_d_ready = subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready;
  assign bootROMDomainWrapper_auto_clock_in_clock = subsystem_cbus_auto_fixedClockNode_out_2_clock;
  assign bootROMDomainWrapper_auto_clock_in_reset = subsystem_cbus_auto_fixedClockNode_out_2_reset;
  always @(posedge subsystem_pbus_clock) begin
    if (subsystem_pbus_reset) begin
      int_rtc_tick_value <= 7'h0;
    end else if (int_rtc_tick_wrap_wrap) begin
      int_rtc_tick_value <= 7'h0;
    end else begin
      int_rtc_tick_value <= _int_rtc_tick_wrap_value_T_1;
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
  int_rtc_tick_value = _RAND_0[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule