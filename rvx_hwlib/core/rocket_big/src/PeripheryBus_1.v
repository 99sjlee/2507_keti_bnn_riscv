`default_nettype wire
module PeripheryBus_1(
  input         auto_coupler_to_bootrom_fragmenter_out_a_ready,
  output        auto_coupler_to_bootrom_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_size,
  output [9:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_source,
  output [16:0] auto_coupler_to_bootrom_fragmenter_out_a_bits_address,
  output [3:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_mask,
  output        auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_bootrom_fragmenter_out_d_ready,
  input         auto_coupler_to_bootrom_fragmenter_out_d_valid,
  input  [1:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_size,
  input  [9:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_source,
  input  [31:0] auto_coupler_to_bootrom_fragmenter_out_d_bits_data,
  input         auto_coupler_to_debug_fragmenter_out_a_ready,
  output        auto_coupler_to_debug_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_debug_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_debug_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_debug_fragmenter_out_a_bits_size,
  output [9:0]  auto_coupler_to_debug_fragmenter_out_a_bits_source,
  output [11:0] auto_coupler_to_debug_fragmenter_out_a_bits_address,
  output [3:0]  auto_coupler_to_debug_fragmenter_out_a_bits_mask,
  output [31:0] auto_coupler_to_debug_fragmenter_out_a_bits_data,
  output        auto_coupler_to_debug_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_debug_fragmenter_out_d_ready,
  input         auto_coupler_to_debug_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_debug_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_debug_fragmenter_out_d_bits_size,
  input  [9:0]  auto_coupler_to_debug_fragmenter_out_d_bits_source,
  input  [31:0] auto_coupler_to_debug_fragmenter_out_d_bits_data,
  input         auto_coupler_to_clint_fragmenter_out_a_ready,
  output        auto_coupler_to_clint_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_clint_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_clint_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_clint_fragmenter_out_a_bits_size,
  output [9:0]  auto_coupler_to_clint_fragmenter_out_a_bits_source,
  output [25:0] auto_coupler_to_clint_fragmenter_out_a_bits_address,
  output [3:0]  auto_coupler_to_clint_fragmenter_out_a_bits_mask,
  output [31:0] auto_coupler_to_clint_fragmenter_out_a_bits_data,
  output        auto_coupler_to_clint_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_clint_fragmenter_out_d_ready,
  input         auto_coupler_to_clint_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_clint_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_clint_fragmenter_out_d_bits_size,
  input  [9:0]  auto_coupler_to_clint_fragmenter_out_d_bits_source,
  input  [31:0] auto_coupler_to_clint_fragmenter_out_d_bits_data,
  input         auto_coupler_to_plic_fragmenter_out_a_ready,
  output        auto_coupler_to_plic_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_plic_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_plic_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_plic_fragmenter_out_a_bits_size,
  output [9:0]  auto_coupler_to_plic_fragmenter_out_a_bits_source,
  output [27:0] auto_coupler_to_plic_fragmenter_out_a_bits_address,
  output [3:0]  auto_coupler_to_plic_fragmenter_out_a_bits_mask,
  output [31:0] auto_coupler_to_plic_fragmenter_out_a_bits_data,
  output        auto_coupler_to_plic_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_plic_fragmenter_out_d_ready,
  input         auto_coupler_to_plic_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_plic_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_plic_fragmenter_out_d_bits_size,
  input  [9:0]  auto_coupler_to_plic_fragmenter_out_d_bits_source,
  input  [31:0] auto_coupler_to_plic_fragmenter_out_d_bits_data,
  output        auto_fixedClockNode_out_2_clock,
  output        auto_fixedClockNode_out_2_reset,
  output        auto_fixedClockNode_out_0_clock,
  output        auto_fixedClockNode_out_0_reset,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset,
  output        auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock,
  output        auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset,
  output        auto_bus_xing_in_a_ready,
  input         auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
  input  [2:0]  auto_bus_xing_in_a_bits_param,
  input  [3:0]  auto_bus_xing_in_a_bits_size,
  input  [4:0]  auto_bus_xing_in_a_bits_source,
  input  [27:0] auto_bus_xing_in_a_bits_address,
  input  [3:0]  auto_bus_xing_in_a_bits_mask,
  input  [31:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
  input         auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [3:0]  auto_bus_xing_in_d_bits_size,
  output [4:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
  output        auto_bus_xing_in_d_bits_denied,
  output [31:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt,
  output        clock,
  output        reset
);
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_clock;
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_reset;
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock;
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset;
  wire  subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_clock;
  wire  subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_reset;
  wire  subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_clock;
  wire  subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_reset;
  wire  clockGroup_auto_in_member_subsystem_cbus_0_clock;
  wire  clockGroup_auto_in_member_subsystem_cbus_0_reset;
  wire  clockGroup_auto_out_clock;
  wire  clockGroup_auto_out_reset;
  wire  fixedClockNode_auto_in_clock;
  wire  fixedClockNode_auto_in_reset;
  wire  fixedClockNode_auto_out_3_clock;
  wire  fixedClockNode_auto_out_3_reset;
  wire  fixedClockNode_auto_out_1_clock;
  wire  fixedClockNode_auto_out_1_reset;
  wire  fixedClockNode_auto_out_0_clock;
  wire  fixedClockNode_auto_out_0_reset;
  wire  fixer_clock;
  wire  fixer_reset;
  wire  fixer_auto_in_a_ready;
  wire  fixer_auto_in_a_valid;
  wire [2:0] fixer_auto_in_a_bits_opcode;
  wire [2:0] fixer_auto_in_a_bits_param;
  wire [3:0] fixer_auto_in_a_bits_size;
  wire [4:0] fixer_auto_in_a_bits_source;
  wire [27:0] fixer_auto_in_a_bits_address;
  wire [3:0] fixer_auto_in_a_bits_mask;
  wire [31:0] fixer_auto_in_a_bits_data;
  wire  fixer_auto_in_a_bits_corrupt;
  wire  fixer_auto_in_d_ready;
  wire  fixer_auto_in_d_valid;
  wire [2:0] fixer_auto_in_d_bits_opcode;
  wire [1:0] fixer_auto_in_d_bits_param;
  wire [3:0] fixer_auto_in_d_bits_size;
  wire [4:0] fixer_auto_in_d_bits_source;
  wire  fixer_auto_in_d_bits_sink;
  wire  fixer_auto_in_d_bits_denied;
  wire [31:0] fixer_auto_in_d_bits_data;
  wire  fixer_auto_in_d_bits_corrupt;
  wire  fixer_auto_out_a_ready;
  wire  fixer_auto_out_a_valid;
  wire [2:0] fixer_auto_out_a_bits_opcode;
  wire [2:0] fixer_auto_out_a_bits_param;
  wire [3:0] fixer_auto_out_a_bits_size;
  wire [4:0] fixer_auto_out_a_bits_source;
  wire [27:0] fixer_auto_out_a_bits_address;
  wire [3:0] fixer_auto_out_a_bits_mask;
  wire [31:0] fixer_auto_out_a_bits_data;
  wire  fixer_auto_out_a_bits_corrupt;
  wire  fixer_auto_out_d_ready;
  wire  fixer_auto_out_d_valid;
  wire [2:0] fixer_auto_out_d_bits_opcode;
  wire [1:0] fixer_auto_out_d_bits_param;
  wire [3:0] fixer_auto_out_d_bits_size;
  wire [4:0] fixer_auto_out_d_bits_source;
  wire  fixer_auto_out_d_bits_sink;
  wire  fixer_auto_out_d_bits_denied;
  wire [31:0] fixer_auto_out_d_bits_data;
  wire  fixer_auto_out_d_bits_corrupt;
  wire  in_xbar_auto_in_a_ready;
  wire  in_xbar_auto_in_a_valid;
  wire [2:0] in_xbar_auto_in_a_bits_opcode;
  wire [2:0] in_xbar_auto_in_a_bits_param;
  wire [3:0] in_xbar_auto_in_a_bits_size;
  wire [4:0] in_xbar_auto_in_a_bits_source;
  wire [27:0] in_xbar_auto_in_a_bits_address;
  wire [3:0] in_xbar_auto_in_a_bits_mask;
  wire [31:0] in_xbar_auto_in_a_bits_data;
  wire  in_xbar_auto_in_a_bits_corrupt;
  wire  in_xbar_auto_in_d_ready;
  wire  in_xbar_auto_in_d_valid;
  wire [2:0] in_xbar_auto_in_d_bits_opcode;
  wire [1:0] in_xbar_auto_in_d_bits_param;
  wire [3:0] in_xbar_auto_in_d_bits_size;
  wire [4:0] in_xbar_auto_in_d_bits_source;
  wire  in_xbar_auto_in_d_bits_sink;
  wire  in_xbar_auto_in_d_bits_denied;
  wire [31:0] in_xbar_auto_in_d_bits_data;
  wire  in_xbar_auto_in_d_bits_corrupt;
  wire  in_xbar_auto_out_a_ready;
  wire  in_xbar_auto_out_a_valid;
  wire [2:0] in_xbar_auto_out_a_bits_opcode;
  wire [2:0] in_xbar_auto_out_a_bits_param;
  wire [3:0] in_xbar_auto_out_a_bits_size;
  wire [4:0] in_xbar_auto_out_a_bits_source;
  wire [27:0] in_xbar_auto_out_a_bits_address;
  wire [3:0] in_xbar_auto_out_a_bits_mask;
  wire [31:0] in_xbar_auto_out_a_bits_data;
  wire  in_xbar_auto_out_a_bits_corrupt;
  wire  in_xbar_auto_out_d_ready;
  wire  in_xbar_auto_out_d_valid;
  wire [2:0] in_xbar_auto_out_d_bits_opcode;
  wire [1:0] in_xbar_auto_out_d_bits_param;
  wire [3:0] in_xbar_auto_out_d_bits_size;
  wire [4:0] in_xbar_auto_out_d_bits_source;
  wire  in_xbar_auto_out_d_bits_sink;
  wire  in_xbar_auto_out_d_bits_denied;
  wire [31:0] in_xbar_auto_out_d_bits_data;
  wire  in_xbar_auto_out_d_bits_corrupt;
  wire  out_xbar_clock;
  wire  out_xbar_reset;
  wire  out_xbar_auto_in_a_ready;
  wire  out_xbar_auto_in_a_valid;
  wire [2:0] out_xbar_auto_in_a_bits_opcode;
  wire [2:0] out_xbar_auto_in_a_bits_param;
  wire [3:0] out_xbar_auto_in_a_bits_size;
  wire [4:0] out_xbar_auto_in_a_bits_source;
  wire [27:0] out_xbar_auto_in_a_bits_address;
  wire [3:0] out_xbar_auto_in_a_bits_mask;
  wire [31:0] out_xbar_auto_in_a_bits_data;
  wire  out_xbar_auto_in_a_bits_corrupt;
  wire  out_xbar_auto_in_d_ready;
  wire  out_xbar_auto_in_d_valid;
  wire [2:0] out_xbar_auto_in_d_bits_opcode;
  wire [1:0] out_xbar_auto_in_d_bits_param;
  wire [3:0] out_xbar_auto_in_d_bits_size;
  wire [4:0] out_xbar_auto_in_d_bits_source;
  wire  out_xbar_auto_in_d_bits_sink;
  wire  out_xbar_auto_in_d_bits_denied;
  wire [31:0] out_xbar_auto_in_d_bits_data;
  wire  out_xbar_auto_in_d_bits_corrupt;
  wire  out_xbar_auto_out_4_a_ready;
  wire  out_xbar_auto_out_4_a_valid;
  wire [2:0] out_xbar_auto_out_4_a_bits_opcode;
  wire [2:0] out_xbar_auto_out_4_a_bits_param;
  wire [2:0] out_xbar_auto_out_4_a_bits_size;
  wire [4:0] out_xbar_auto_out_4_a_bits_source;
  wire [16:0] out_xbar_auto_out_4_a_bits_address;
  wire [3:0] out_xbar_auto_out_4_a_bits_mask;
  wire  out_xbar_auto_out_4_a_bits_corrupt;
  wire  out_xbar_auto_out_4_d_ready;
  wire  out_xbar_auto_out_4_d_valid;
  wire [2:0] out_xbar_auto_out_4_d_bits_size;
  wire [4:0] out_xbar_auto_out_4_d_bits_source;
  wire [31:0] out_xbar_auto_out_4_d_bits_data;
  wire  out_xbar_auto_out_3_a_ready;
  wire  out_xbar_auto_out_3_a_valid;
  wire [2:0] out_xbar_auto_out_3_a_bits_opcode;
  wire [2:0] out_xbar_auto_out_3_a_bits_param;
  wire [2:0] out_xbar_auto_out_3_a_bits_size;
  wire [4:0] out_xbar_auto_out_3_a_bits_source;
  wire [11:0] out_xbar_auto_out_3_a_bits_address;
  wire [3:0] out_xbar_auto_out_3_a_bits_mask;
  wire [31:0] out_xbar_auto_out_3_a_bits_data;
  wire  out_xbar_auto_out_3_a_bits_corrupt;
  wire  out_xbar_auto_out_3_d_ready;
  wire  out_xbar_auto_out_3_d_valid;
  wire [2:0] out_xbar_auto_out_3_d_bits_opcode;
  wire [2:0] out_xbar_auto_out_3_d_bits_size;
  wire [4:0] out_xbar_auto_out_3_d_bits_source;
  wire [31:0] out_xbar_auto_out_3_d_bits_data;
  wire  out_xbar_auto_out_2_a_ready;
  wire  out_xbar_auto_out_2_a_valid;
  wire [2:0] out_xbar_auto_out_2_a_bits_opcode;
  wire [2:0] out_xbar_auto_out_2_a_bits_param;
  wire [2:0] out_xbar_auto_out_2_a_bits_size;
  wire [4:0] out_xbar_auto_out_2_a_bits_source;
  wire [25:0] out_xbar_auto_out_2_a_bits_address;
  wire [3:0] out_xbar_auto_out_2_a_bits_mask;
  wire [31:0] out_xbar_auto_out_2_a_bits_data;
  wire  out_xbar_auto_out_2_a_bits_corrupt;
  wire  out_xbar_auto_out_2_d_ready;
  wire  out_xbar_auto_out_2_d_valid;
  wire [2:0] out_xbar_auto_out_2_d_bits_opcode;
  wire [2:0] out_xbar_auto_out_2_d_bits_size;
  wire [4:0] out_xbar_auto_out_2_d_bits_source;
  wire [31:0] out_xbar_auto_out_2_d_bits_data;
  wire  out_xbar_auto_out_1_a_ready;
  wire  out_xbar_auto_out_1_a_valid;
  wire [2:0] out_xbar_auto_out_1_a_bits_opcode;
  wire [2:0] out_xbar_auto_out_1_a_bits_param;
  wire [2:0] out_xbar_auto_out_1_a_bits_size;
  wire [4:0] out_xbar_auto_out_1_a_bits_source;
  wire [27:0] out_xbar_auto_out_1_a_bits_address;
  wire [3:0] out_xbar_auto_out_1_a_bits_mask;
  wire [31:0] out_xbar_auto_out_1_a_bits_data;
  wire  out_xbar_auto_out_1_a_bits_corrupt;
  wire  out_xbar_auto_out_1_d_ready;
  wire  out_xbar_auto_out_1_d_valid;
  wire [2:0] out_xbar_auto_out_1_d_bits_opcode;
  wire [2:0] out_xbar_auto_out_1_d_bits_size;
  wire [4:0] out_xbar_auto_out_1_d_bits_source;
  wire [31:0] out_xbar_auto_out_1_d_bits_data;
  wire  out_xbar_auto_out_0_a_ready;
  wire  out_xbar_auto_out_0_a_valid;
  wire [2:0] out_xbar_auto_out_0_a_bits_opcode;
  wire [2:0] out_xbar_auto_out_0_a_bits_param;
  wire [3:0] out_xbar_auto_out_0_a_bits_size;
  wire [4:0] out_xbar_auto_out_0_a_bits_source;
  wire [13:0] out_xbar_auto_out_0_a_bits_address;
  wire [3:0] out_xbar_auto_out_0_a_bits_mask;
  wire  out_xbar_auto_out_0_a_bits_corrupt;
  wire  out_xbar_auto_out_0_d_ready;
  wire  out_xbar_auto_out_0_d_valid;
  wire [2:0] out_xbar_auto_out_0_d_bits_opcode;
  wire [1:0] out_xbar_auto_out_0_d_bits_param;
  wire [3:0] out_xbar_auto_out_0_d_bits_size;
  wire [4:0] out_xbar_auto_out_0_d_bits_source;
  wire  out_xbar_auto_out_0_d_bits_sink;
  wire  out_xbar_auto_out_0_d_bits_denied;
  wire [31:0] out_xbar_auto_out_0_d_bits_data;
  wire  out_xbar_auto_out_0_d_bits_corrupt;
  wire  buffer_clock;
  wire  buffer_reset;
  wire  buffer_auto_in_a_ready;
  wire  buffer_auto_in_a_valid;
  wire [2:0] buffer_auto_in_a_bits_opcode;
  wire [2:0] buffer_auto_in_a_bits_param;
  wire [3:0] buffer_auto_in_a_bits_size;
  wire [4:0] buffer_auto_in_a_bits_source;
  wire [27:0] buffer_auto_in_a_bits_address;
  wire [3:0] buffer_auto_in_a_bits_mask;
  wire [31:0] buffer_auto_in_a_bits_data;
  wire  buffer_auto_in_a_bits_corrupt;
  wire  buffer_auto_in_d_ready;
  wire  buffer_auto_in_d_valid;
  wire [2:0] buffer_auto_in_d_bits_opcode;
  wire [1:0] buffer_auto_in_d_bits_param;
  wire [3:0] buffer_auto_in_d_bits_size;
  wire [4:0] buffer_auto_in_d_bits_source;
  wire  buffer_auto_in_d_bits_sink;
  wire  buffer_auto_in_d_bits_denied;
  wire [31:0] buffer_auto_in_d_bits_data;
  wire  buffer_auto_in_d_bits_corrupt;
  wire  buffer_auto_out_a_ready;
  wire  buffer_auto_out_a_valid;
  wire [2:0] buffer_auto_out_a_bits_opcode;
  wire [2:0] buffer_auto_out_a_bits_param;
  wire [3:0] buffer_auto_out_a_bits_size;
  wire [4:0] buffer_auto_out_a_bits_source;
  wire [27:0] buffer_auto_out_a_bits_address;
  wire [3:0] buffer_auto_out_a_bits_mask;
  wire [31:0] buffer_auto_out_a_bits_data;
  wire  buffer_auto_out_a_bits_corrupt;
  wire  buffer_auto_out_d_ready;
  wire  buffer_auto_out_d_valid;
  wire [2:0] buffer_auto_out_d_bits_opcode;
  wire [1:0] buffer_auto_out_d_bits_param;
  wire [3:0] buffer_auto_out_d_bits_size;
  wire [4:0] buffer_auto_out_d_bits_source;
  wire  buffer_auto_out_d_bits_sink;
  wire  buffer_auto_out_d_bits_denied;
  wire [31:0] buffer_auto_out_d_bits_data;
  wire  buffer_auto_out_d_bits_corrupt;
  wire  atomics_clock;
  wire  atomics_reset;
  wire  atomics_auto_in_a_ready;
  wire  atomics_auto_in_a_valid;
  wire [2:0] atomics_auto_in_a_bits_opcode;
  wire [2:0] atomics_auto_in_a_bits_param;
  wire [3:0] atomics_auto_in_a_bits_size;
  wire [4:0] atomics_auto_in_a_bits_source;
  wire [27:0] atomics_auto_in_a_bits_address;
  wire [3:0] atomics_auto_in_a_bits_mask;
  wire [31:0] atomics_auto_in_a_bits_data;
  wire  atomics_auto_in_a_bits_corrupt;
  wire  atomics_auto_in_d_ready;
  wire  atomics_auto_in_d_valid;
  wire [2:0] atomics_auto_in_d_bits_opcode;
  wire [1:0] atomics_auto_in_d_bits_param;
  wire [3:0] atomics_auto_in_d_bits_size;
  wire [4:0] atomics_auto_in_d_bits_source;
  wire  atomics_auto_in_d_bits_sink;
  wire  atomics_auto_in_d_bits_denied;
  wire [31:0] atomics_auto_in_d_bits_data;
  wire  atomics_auto_in_d_bits_corrupt;
  wire  atomics_auto_out_a_ready;
  wire  atomics_auto_out_a_valid;
  wire [2:0] atomics_auto_out_a_bits_opcode;
  wire [2:0] atomics_auto_out_a_bits_param;
  wire [3:0] atomics_auto_out_a_bits_size;
  wire [4:0] atomics_auto_out_a_bits_source;
  wire [27:0] atomics_auto_out_a_bits_address;
  wire [3:0] atomics_auto_out_a_bits_mask;
  wire [31:0] atomics_auto_out_a_bits_data;
  wire  atomics_auto_out_a_bits_corrupt;
  wire  atomics_auto_out_d_ready;
  wire  atomics_auto_out_d_valid;
  wire [2:0] atomics_auto_out_d_bits_opcode;
  wire [1:0] atomics_auto_out_d_bits_param;
  wire [3:0] atomics_auto_out_d_bits_size;
  wire [4:0] atomics_auto_out_d_bits_source;
  wire  atomics_auto_out_d_bits_sink;
  wire  atomics_auto_out_d_bits_denied;
  wire [31:0] atomics_auto_out_d_bits_data;
  wire  atomics_auto_out_d_bits_corrupt;
  wire  wrapped_error_device_clock;
  wire  wrapped_error_device_reset;
  wire  wrapped_error_device_auto_buffer_in_a_ready;
  wire  wrapped_error_device_auto_buffer_in_a_valid;
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_opcode;
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_param;
  wire [3:0] wrapped_error_device_auto_buffer_in_a_bits_size;
  wire [4:0] wrapped_error_device_auto_buffer_in_a_bits_source;
  wire [13:0] wrapped_error_device_auto_buffer_in_a_bits_address;
  wire [3:0] wrapped_error_device_auto_buffer_in_a_bits_mask;
  wire  wrapped_error_device_auto_buffer_in_a_bits_corrupt;
  wire  wrapped_error_device_auto_buffer_in_d_ready;
  wire  wrapped_error_device_auto_buffer_in_d_valid;
  wire [2:0] wrapped_error_device_auto_buffer_in_d_bits_opcode;
  wire [1:0] wrapped_error_device_auto_buffer_in_d_bits_param;
  wire [3:0] wrapped_error_device_auto_buffer_in_d_bits_size;
  wire [4:0] wrapped_error_device_auto_buffer_in_d_bits_source;
  wire  wrapped_error_device_auto_buffer_in_d_bits_sink;
  wire  wrapped_error_device_auto_buffer_in_d_bits_denied;
  wire [31:0] wrapped_error_device_auto_buffer_in_d_bits_data;
  wire  wrapped_error_device_auto_buffer_in_d_bits_corrupt;
  wire  buffer_1_auto_in_a_ready;
  wire  buffer_1_auto_in_a_valid;
  wire [2:0] buffer_1_auto_in_a_bits_opcode;
  wire [2:0] buffer_1_auto_in_a_bits_param;
  wire [3:0] buffer_1_auto_in_a_bits_size;
  wire [4:0] buffer_1_auto_in_a_bits_source;
  wire [27:0] buffer_1_auto_in_a_bits_address;
  wire [3:0] buffer_1_auto_in_a_bits_mask;
  wire [31:0] buffer_1_auto_in_a_bits_data;
  wire  buffer_1_auto_in_a_bits_corrupt;
  wire  buffer_1_auto_in_d_ready;
  wire  buffer_1_auto_in_d_valid;
  wire [2:0] buffer_1_auto_in_d_bits_opcode;
  wire [1:0] buffer_1_auto_in_d_bits_param;
  wire [3:0] buffer_1_auto_in_d_bits_size;
  wire [4:0] buffer_1_auto_in_d_bits_source;
  wire  buffer_1_auto_in_d_bits_sink;
  wire  buffer_1_auto_in_d_bits_denied;
  wire [31:0] buffer_1_auto_in_d_bits_data;
  wire  buffer_1_auto_in_d_bits_corrupt;
  wire  buffer_1_auto_out_a_ready;
  wire  buffer_1_auto_out_a_valid;
  wire [2:0] buffer_1_auto_out_a_bits_opcode;
  wire [2:0] buffer_1_auto_out_a_bits_param;
  wire [3:0] buffer_1_auto_out_a_bits_size;
  wire [4:0] buffer_1_auto_out_a_bits_source;
  wire [27:0] buffer_1_auto_out_a_bits_address;
  wire [3:0] buffer_1_auto_out_a_bits_mask;
  wire [31:0] buffer_1_auto_out_a_bits_data;
  wire  buffer_1_auto_out_a_bits_corrupt;
  wire  buffer_1_auto_out_d_ready;
  wire  buffer_1_auto_out_d_valid;
  wire [2:0] buffer_1_auto_out_d_bits_opcode;
  wire [1:0] buffer_1_auto_out_d_bits_param;
  wire [3:0] buffer_1_auto_out_d_bits_size;
  wire [4:0] buffer_1_auto_out_d_bits_source;
  wire  buffer_1_auto_out_d_bits_sink;
  wire  buffer_1_auto_out_d_bits_denied;
  wire [31:0] buffer_1_auto_out_d_bits_data;
  wire  buffer_1_auto_out_d_bits_corrupt;
  wire  coupler_to_plic_clock;
  wire  coupler_to_plic_reset;
  wire  coupler_to_plic_auto_fragmenter_out_a_ready;
  wire  coupler_to_plic_auto_fragmenter_out_a_valid;
  wire [2:0] coupler_to_plic_auto_fragmenter_out_a_bits_opcode;
  wire [2:0] coupler_to_plic_auto_fragmenter_out_a_bits_param;
  wire [1:0] coupler_to_plic_auto_fragmenter_out_a_bits_size;
  wire [9:0] coupler_to_plic_auto_fragmenter_out_a_bits_source;
  wire [27:0] coupler_to_plic_auto_fragmenter_out_a_bits_address;
  wire [3:0] coupler_to_plic_auto_fragmenter_out_a_bits_mask;
  wire [31:0] coupler_to_plic_auto_fragmenter_out_a_bits_data;
  wire  coupler_to_plic_auto_fragmenter_out_a_bits_corrupt;
  wire  coupler_to_plic_auto_fragmenter_out_d_ready;
  wire  coupler_to_plic_auto_fragmenter_out_d_valid;
  wire [2:0] coupler_to_plic_auto_fragmenter_out_d_bits_opcode;
  wire [1:0] coupler_to_plic_auto_fragmenter_out_d_bits_size;
  wire [9:0] coupler_to_plic_auto_fragmenter_out_d_bits_source;
  wire [31:0] coupler_to_plic_auto_fragmenter_out_d_bits_data;
  wire  coupler_to_plic_auto_tl_in_a_ready;
  wire  coupler_to_plic_auto_tl_in_a_valid;
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_opcode;
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_param;
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_size;
  wire [4:0] coupler_to_plic_auto_tl_in_a_bits_source;
  wire [27:0] coupler_to_plic_auto_tl_in_a_bits_address;
  wire [3:0] coupler_to_plic_auto_tl_in_a_bits_mask;
  wire [31:0] coupler_to_plic_auto_tl_in_a_bits_data;
  wire  coupler_to_plic_auto_tl_in_a_bits_corrupt;
  wire  coupler_to_plic_auto_tl_in_d_ready;
  wire  coupler_to_plic_auto_tl_in_d_valid;
  wire [2:0] coupler_to_plic_auto_tl_in_d_bits_opcode;
  wire [2:0] coupler_to_plic_auto_tl_in_d_bits_size;
  wire [4:0] coupler_to_plic_auto_tl_in_d_bits_source;
  wire [31:0] coupler_to_plic_auto_tl_in_d_bits_data;
  wire  coupler_to_clint_clock;
  wire  coupler_to_clint_reset;
  wire  coupler_to_clint_auto_fragmenter_out_a_ready;
  wire  coupler_to_clint_auto_fragmenter_out_a_valid;
  wire [2:0] coupler_to_clint_auto_fragmenter_out_a_bits_opcode;
  wire [2:0] coupler_to_clint_auto_fragmenter_out_a_bits_param;
  wire [1:0] coupler_to_clint_auto_fragmenter_out_a_bits_size;
  wire [9:0] coupler_to_clint_auto_fragmenter_out_a_bits_source;
  wire [25:0] coupler_to_clint_auto_fragmenter_out_a_bits_address;
  wire [3:0] coupler_to_clint_auto_fragmenter_out_a_bits_mask;
  wire [31:0] coupler_to_clint_auto_fragmenter_out_a_bits_data;
  wire  coupler_to_clint_auto_fragmenter_out_a_bits_corrupt;
  wire  coupler_to_clint_auto_fragmenter_out_d_ready;
  wire  coupler_to_clint_auto_fragmenter_out_d_valid;
  wire [2:0] coupler_to_clint_auto_fragmenter_out_d_bits_opcode;
  wire [1:0] coupler_to_clint_auto_fragmenter_out_d_bits_size;
  wire [9:0] coupler_to_clint_auto_fragmenter_out_d_bits_source;
  wire [31:0] coupler_to_clint_auto_fragmenter_out_d_bits_data;
  wire  coupler_to_clint_auto_tl_in_a_ready;
  wire  coupler_to_clint_auto_tl_in_a_valid;
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_opcode;
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_param;
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_size;
  wire [4:0] coupler_to_clint_auto_tl_in_a_bits_source;
  wire [25:0] coupler_to_clint_auto_tl_in_a_bits_address;
  wire [3:0] coupler_to_clint_auto_tl_in_a_bits_mask;
  wire [31:0] coupler_to_clint_auto_tl_in_a_bits_data;
  wire  coupler_to_clint_auto_tl_in_a_bits_corrupt;
  wire  coupler_to_clint_auto_tl_in_d_ready;
  wire  coupler_to_clint_auto_tl_in_d_valid;
  wire [2:0] coupler_to_clint_auto_tl_in_d_bits_opcode;
  wire [2:0] coupler_to_clint_auto_tl_in_d_bits_size;
  wire [4:0] coupler_to_clint_auto_tl_in_d_bits_source;
  wire [31:0] coupler_to_clint_auto_tl_in_d_bits_data;
  wire  coupler_to_debug_clock;
  wire  coupler_to_debug_reset;
  wire  coupler_to_debug_auto_fragmenter_out_a_ready;
  wire  coupler_to_debug_auto_fragmenter_out_a_valid;
  wire [2:0] coupler_to_debug_auto_fragmenter_out_a_bits_opcode;
  wire [2:0] coupler_to_debug_auto_fragmenter_out_a_bits_param;
  wire [1:0] coupler_to_debug_auto_fragmenter_out_a_bits_size;
  wire [9:0] coupler_to_debug_auto_fragmenter_out_a_bits_source;
  wire [11:0] coupler_to_debug_auto_fragmenter_out_a_bits_address;
  wire [3:0] coupler_to_debug_auto_fragmenter_out_a_bits_mask;
  wire [31:0] coupler_to_debug_auto_fragmenter_out_a_bits_data;
  wire  coupler_to_debug_auto_fragmenter_out_a_bits_corrupt;
  wire  coupler_to_debug_auto_fragmenter_out_d_ready;
  wire  coupler_to_debug_auto_fragmenter_out_d_valid;
  wire [2:0] coupler_to_debug_auto_fragmenter_out_d_bits_opcode;
  wire [1:0] coupler_to_debug_auto_fragmenter_out_d_bits_size;
  wire [9:0] coupler_to_debug_auto_fragmenter_out_d_bits_source;
  wire [31:0] coupler_to_debug_auto_fragmenter_out_d_bits_data;
  wire  coupler_to_debug_auto_tl_in_a_ready;
  wire  coupler_to_debug_auto_tl_in_a_valid;
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_opcode;
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_param;
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_size;
  wire [4:0] coupler_to_debug_auto_tl_in_a_bits_source;
  wire [11:0] coupler_to_debug_auto_tl_in_a_bits_address;
  wire [3:0] coupler_to_debug_auto_tl_in_a_bits_mask;
  wire [31:0] coupler_to_debug_auto_tl_in_a_bits_data;
  wire  coupler_to_debug_auto_tl_in_a_bits_corrupt;
  wire  coupler_to_debug_auto_tl_in_d_ready;
  wire  coupler_to_debug_auto_tl_in_d_valid;
  wire [2:0] coupler_to_debug_auto_tl_in_d_bits_opcode;
  wire [2:0] coupler_to_debug_auto_tl_in_d_bits_size;
  wire [4:0] coupler_to_debug_auto_tl_in_d_bits_source;
  wire [31:0] coupler_to_debug_auto_tl_in_d_bits_data;
  wire  coupler_to_bootrom_clock;
  wire  coupler_to_bootrom_reset;
  wire  coupler_to_bootrom_auto_fragmenter_out_a_ready;
  wire  coupler_to_bootrom_auto_fragmenter_out_a_valid;
  wire [2:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode;
  wire [2:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_param;
  wire [1:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_size;
  wire [9:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_source;
  wire [16:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_address;
  wire [3:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_mask;
  wire  coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt;
  wire  coupler_to_bootrom_auto_fragmenter_out_d_ready;
  wire  coupler_to_bootrom_auto_fragmenter_out_d_valid;
  wire [1:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_size;
  wire [9:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_source;
  wire [31:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_data;
  wire  coupler_to_bootrom_auto_tl_in_a_ready;
  wire  coupler_to_bootrom_auto_tl_in_a_valid;
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_opcode;
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_param;
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_size;
  wire [4:0] coupler_to_bootrom_auto_tl_in_a_bits_source;
  wire [16:0] coupler_to_bootrom_auto_tl_in_a_bits_address;
  wire [3:0] coupler_to_bootrom_auto_tl_in_a_bits_mask;
  wire  coupler_to_bootrom_auto_tl_in_a_bits_corrupt;
  wire  coupler_to_bootrom_auto_tl_in_d_ready;
  wire  coupler_to_bootrom_auto_tl_in_d_valid;
  wire [2:0] coupler_to_bootrom_auto_tl_in_d_bits_size;
  wire [4:0] coupler_to_bootrom_auto_tl_in_d_bits_source;
  wire [31:0] coupler_to_bootrom_auto_tl_in_d_bits_data;
  FixedClockBroadcast_3 fixedClockNode (
    .auto_in_clock(fixedClockNode_auto_in_clock),
    .auto_in_reset(fixedClockNode_auto_in_reset),
    .auto_out_3_clock(fixedClockNode_auto_out_3_clock),
    .auto_out_3_reset(fixedClockNode_auto_out_3_reset),
    .auto_out_1_clock(fixedClockNode_auto_out_1_clock),
    .auto_out_1_reset(fixedClockNode_auto_out_1_reset),
    .auto_out_0_clock(fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset(fixedClockNode_auto_out_0_reset)
  );
  TLFIFOFixer_3 fixer (
    .clock(fixer_clock),
    .reset(fixer_reset),
    .auto_in_a_ready(fixer_auto_in_a_ready),
    .auto_in_a_valid(fixer_auto_in_a_valid),
    .auto_in_a_bits_opcode(fixer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fixer_auto_in_a_bits_param),
    .auto_in_a_bits_size(fixer_auto_in_a_bits_size),
    .auto_in_a_bits_source(fixer_auto_in_a_bits_source),
    .auto_in_a_bits_address(fixer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fixer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fixer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fixer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fixer_auto_in_d_ready),
    .auto_in_d_valid(fixer_auto_in_d_valid),
    .auto_in_d_bits_opcode(fixer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fixer_auto_in_d_bits_param),
    .auto_in_d_bits_size(fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source(fixer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(fixer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(fixer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fixer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fixer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(fixer_auto_out_a_ready),
    .auto_out_a_valid(fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode(fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fixer_auto_out_a_bits_param),
    .auto_out_a_bits_size(fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source(fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address(fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fixer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fixer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fixer_auto_out_d_ready),
    .auto_out_d_valid(fixer_auto_out_d_valid),
    .auto_out_d_bits_opcode(fixer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fixer_auto_out_d_bits_param),
    .auto_out_d_bits_size(fixer_auto_out_d_bits_size),
    .auto_out_d_bits_source(fixer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(fixer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(fixer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fixer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fixer_auto_out_d_bits_corrupt)
  );
  TLXbar_6 out_xbar (
    .clock(out_xbar_clock),
    .reset(out_xbar_reset),
    .auto_in_a_ready(out_xbar_auto_in_a_ready),
    .auto_in_a_valid(out_xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(out_xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(out_xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(out_xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(out_xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(out_xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(out_xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(out_xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(out_xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(out_xbar_auto_in_d_ready),
    .auto_in_d_valid(out_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(out_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(out_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(out_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(out_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(out_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(out_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(out_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(out_xbar_auto_in_d_bits_corrupt),
    .auto_out_4_a_ready(out_xbar_auto_out_4_a_ready),
    .auto_out_4_a_valid(out_xbar_auto_out_4_a_valid),
    .auto_out_4_a_bits_opcode(out_xbar_auto_out_4_a_bits_opcode),
    .auto_out_4_a_bits_param(out_xbar_auto_out_4_a_bits_param),
    .auto_out_4_a_bits_size(out_xbar_auto_out_4_a_bits_size),
    .auto_out_4_a_bits_source(out_xbar_auto_out_4_a_bits_source),
    .auto_out_4_a_bits_address(out_xbar_auto_out_4_a_bits_address),
    .auto_out_4_a_bits_mask(out_xbar_auto_out_4_a_bits_mask),
    .auto_out_4_a_bits_corrupt(out_xbar_auto_out_4_a_bits_corrupt),
    .auto_out_4_d_ready(out_xbar_auto_out_4_d_ready),
    .auto_out_4_d_valid(out_xbar_auto_out_4_d_valid),
    .auto_out_4_d_bits_size(out_xbar_auto_out_4_d_bits_size),
    .auto_out_4_d_bits_source(out_xbar_auto_out_4_d_bits_source),
    .auto_out_4_d_bits_data(out_xbar_auto_out_4_d_bits_data),
    .auto_out_3_a_ready(out_xbar_auto_out_3_a_ready),
    .auto_out_3_a_valid(out_xbar_auto_out_3_a_valid),
    .auto_out_3_a_bits_opcode(out_xbar_auto_out_3_a_bits_opcode),
    .auto_out_3_a_bits_param(out_xbar_auto_out_3_a_bits_param),
    .auto_out_3_a_bits_size(out_xbar_auto_out_3_a_bits_size),
    .auto_out_3_a_bits_source(out_xbar_auto_out_3_a_bits_source),
    .auto_out_3_a_bits_address(out_xbar_auto_out_3_a_bits_address),
    .auto_out_3_a_bits_mask(out_xbar_auto_out_3_a_bits_mask),
    .auto_out_3_a_bits_data(out_xbar_auto_out_3_a_bits_data),
    .auto_out_3_a_bits_corrupt(out_xbar_auto_out_3_a_bits_corrupt),
    .auto_out_3_d_ready(out_xbar_auto_out_3_d_ready),
    .auto_out_3_d_valid(out_xbar_auto_out_3_d_valid),
    .auto_out_3_d_bits_opcode(out_xbar_auto_out_3_d_bits_opcode),
    .auto_out_3_d_bits_size(out_xbar_auto_out_3_d_bits_size),
    .auto_out_3_d_bits_source(out_xbar_auto_out_3_d_bits_source),
    .auto_out_3_d_bits_data(out_xbar_auto_out_3_d_bits_data),
    .auto_out_2_a_ready(out_xbar_auto_out_2_a_ready),
    .auto_out_2_a_valid(out_xbar_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode(out_xbar_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param(out_xbar_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size(out_xbar_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source(out_xbar_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address(out_xbar_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_mask(out_xbar_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data(out_xbar_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt(out_xbar_auto_out_2_a_bits_corrupt),
    .auto_out_2_d_ready(out_xbar_auto_out_2_d_ready),
    .auto_out_2_d_valid(out_xbar_auto_out_2_d_valid),
    .auto_out_2_d_bits_opcode(out_xbar_auto_out_2_d_bits_opcode),
    .auto_out_2_d_bits_size(out_xbar_auto_out_2_d_bits_size),
    .auto_out_2_d_bits_source(out_xbar_auto_out_2_d_bits_source),
    .auto_out_2_d_bits_data(out_xbar_auto_out_2_d_bits_data),
    .auto_out_1_a_ready(out_xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(out_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(out_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(out_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(out_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(out_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(out_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(out_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(out_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(out_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(out_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(out_xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(out_xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_size(out_xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(out_xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_data(out_xbar_auto_out_1_d_bits_data),
    .auto_out_0_a_ready(out_xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(out_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(out_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(out_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(out_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(out_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(out_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(out_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_corrupt(out_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(out_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(out_xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(out_xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(out_xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(out_xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(out_xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(out_xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(out_xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(out_xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(out_xbar_auto_out_0_d_bits_corrupt)
  );
  TLBuffer_4 buffer (
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  TLAtomicAutomata_1 atomics (
    .clock(atomics_clock),
    .reset(atomics_reset),
    .auto_in_a_ready(atomics_auto_in_a_ready),
    .auto_in_a_valid(atomics_auto_in_a_valid),
    .auto_in_a_bits_opcode(atomics_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(atomics_auto_in_a_bits_param),
    .auto_in_a_bits_size(atomics_auto_in_a_bits_size),
    .auto_in_a_bits_source(atomics_auto_in_a_bits_source),
    .auto_in_a_bits_address(atomics_auto_in_a_bits_address),
    .auto_in_a_bits_mask(atomics_auto_in_a_bits_mask),
    .auto_in_a_bits_data(atomics_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(atomics_auto_in_a_bits_corrupt),
    .auto_in_d_ready(atomics_auto_in_d_ready),
    .auto_in_d_valid(atomics_auto_in_d_valid),
    .auto_in_d_bits_opcode(atomics_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(atomics_auto_in_d_bits_param),
    .auto_in_d_bits_size(atomics_auto_in_d_bits_size),
    .auto_in_d_bits_source(atomics_auto_in_d_bits_source),
    .auto_in_d_bits_sink(atomics_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(atomics_auto_in_d_bits_denied),
    .auto_in_d_bits_data(atomics_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(atomics_auto_in_d_bits_corrupt),
    .auto_out_a_ready(atomics_auto_out_a_ready),
    .auto_out_a_valid(atomics_auto_out_a_valid),
    .auto_out_a_bits_opcode(atomics_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(atomics_auto_out_a_bits_param),
    .auto_out_a_bits_size(atomics_auto_out_a_bits_size),
    .auto_out_a_bits_source(atomics_auto_out_a_bits_source),
    .auto_out_a_bits_address(atomics_auto_out_a_bits_address),
    .auto_out_a_bits_mask(atomics_auto_out_a_bits_mask),
    .auto_out_a_bits_data(atomics_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(atomics_auto_out_a_bits_corrupt),
    .auto_out_d_ready(atomics_auto_out_d_ready),
    .auto_out_d_valid(atomics_auto_out_d_valid),
    .auto_out_d_bits_opcode(atomics_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(atomics_auto_out_d_bits_param),
    .auto_out_d_bits_size(atomics_auto_out_d_bits_size),
    .auto_out_d_bits_source(atomics_auto_out_d_bits_source),
    .auto_out_d_bits_sink(atomics_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(atomics_auto_out_d_bits_denied),
    .auto_out_d_bits_data(atomics_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(atomics_auto_out_d_bits_corrupt)
  );
  ErrorDeviceWrapper wrapped_error_device (
    .clock(wrapped_error_device_clock),
    .reset(wrapped_error_device_reset),
    .auto_buffer_in_a_ready(wrapped_error_device_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(wrapped_error_device_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(wrapped_error_device_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(wrapped_error_device_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(wrapped_error_device_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(wrapped_error_device_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(wrapped_error_device_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(wrapped_error_device_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_corrupt(wrapped_error_device_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(wrapped_error_device_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(wrapped_error_device_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(wrapped_error_device_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(wrapped_error_device_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(wrapped_error_device_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(wrapped_error_device_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(wrapped_error_device_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(wrapped_error_device_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(wrapped_error_device_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(wrapped_error_device_auto_buffer_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_7 coupler_to_plic (
    .clock(coupler_to_plic_clock),
    .reset(coupler_to_plic_reset),
    .auto_fragmenter_out_a_ready(coupler_to_plic_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_plic_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_plic_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_plic_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_plic_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_plic_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_plic_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_plic_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_plic_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_plic_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_plic_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_plic_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_plic_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_plic_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_plic_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_plic_auto_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready(coupler_to_plic_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_plic_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_plic_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_plic_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_plic_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_plic_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_plic_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_plic_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_plic_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_plic_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_plic_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_plic_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_plic_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(coupler_to_plic_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_plic_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(coupler_to_plic_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_8 coupler_to_clint (
    .clock(coupler_to_clint_clock),
    .reset(coupler_to_clint_reset),
    .auto_fragmenter_out_a_ready(coupler_to_clint_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_clint_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_clint_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_clint_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_clint_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_clint_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_clint_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_clint_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_clint_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_clint_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_clint_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_clint_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_clint_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_clint_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_clint_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_clint_auto_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready(coupler_to_clint_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_clint_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_clint_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_clint_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_clint_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_clint_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_clint_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_clint_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_clint_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_clint_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_clint_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_clint_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_clint_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(coupler_to_clint_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_clint_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(coupler_to_clint_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_9 coupler_to_debug (
    .clock(coupler_to_debug_clock),
    .reset(coupler_to_debug_reset),
    .auto_fragmenter_out_a_ready(coupler_to_debug_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_debug_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_debug_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_debug_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_debug_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_debug_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_debug_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_debug_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_debug_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_debug_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_debug_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_debug_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_debug_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_debug_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_debug_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_debug_auto_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready(coupler_to_debug_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_debug_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_debug_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_debug_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_debug_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_debug_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_debug_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_debug_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_debug_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_debug_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_debug_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_debug_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_debug_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(coupler_to_debug_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_debug_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(coupler_to_debug_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_11 coupler_to_bootrom (
    .clock(coupler_to_bootrom_clock),
    .reset(coupler_to_bootrom_reset),
    .auto_fragmenter_out_a_ready(coupler_to_bootrom_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_bootrom_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_bootrom_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_bootrom_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_bootrom_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_bootrom_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_bootrom_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_bootrom_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_bootrom_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_size(coupler_to_bootrom_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_bootrom_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_bootrom_auto_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready(coupler_to_bootrom_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_bootrom_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_bootrom_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_bootrom_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_bootrom_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_bootrom_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_bootrom_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_bootrom_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_corrupt(coupler_to_bootrom_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_bootrom_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_bootrom_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_size(coupler_to_bootrom_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_bootrom_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(coupler_to_bootrom_auto_tl_in_d_bits_data)
  );
  assign subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_clock =
    subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_clock;
  assign subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_reset =
    subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_reset;
  assign subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_clock =
    subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock;
  assign subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_reset =
    subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset;
  assign clockGroup_auto_out_clock = clockGroup_auto_in_member_subsystem_cbus_0_clock;
  assign clockGroup_auto_out_reset = clockGroup_auto_in_member_subsystem_cbus_0_reset;
  assign in_xbar_auto_in_a_ready = in_xbar_auto_out_a_ready;
  assign in_xbar_auto_in_d_valid = in_xbar_auto_out_d_valid;
  assign in_xbar_auto_in_d_bits_opcode = in_xbar_auto_out_d_bits_opcode;
  assign in_xbar_auto_in_d_bits_param = in_xbar_auto_out_d_bits_param;
  assign in_xbar_auto_in_d_bits_size = in_xbar_auto_out_d_bits_size;
  assign in_xbar_auto_in_d_bits_source = in_xbar_auto_out_d_bits_source;
  assign in_xbar_auto_in_d_bits_sink = in_xbar_auto_out_d_bits_sink;
  assign in_xbar_auto_in_d_bits_denied = in_xbar_auto_out_d_bits_denied;
  assign in_xbar_auto_in_d_bits_data = in_xbar_auto_out_d_bits_data;
  assign in_xbar_auto_in_d_bits_corrupt = in_xbar_auto_out_d_bits_corrupt;
  assign in_xbar_auto_out_a_valid = in_xbar_auto_in_a_valid;
  assign in_xbar_auto_out_a_bits_opcode = in_xbar_auto_in_a_bits_opcode;
  assign in_xbar_auto_out_a_bits_param = in_xbar_auto_in_a_bits_param;
  assign in_xbar_auto_out_a_bits_size = in_xbar_auto_in_a_bits_size;
  assign in_xbar_auto_out_a_bits_source = in_xbar_auto_in_a_bits_source;
  assign in_xbar_auto_out_a_bits_address = in_xbar_auto_in_a_bits_address;
  assign in_xbar_auto_out_a_bits_mask = in_xbar_auto_in_a_bits_mask;
  assign in_xbar_auto_out_a_bits_data = in_xbar_auto_in_a_bits_data;
  assign in_xbar_auto_out_a_bits_corrupt = in_xbar_auto_in_a_bits_corrupt;
  assign in_xbar_auto_out_d_ready = in_xbar_auto_in_d_ready;
  assign buffer_1_auto_in_a_ready = buffer_1_auto_out_a_ready;
  assign buffer_1_auto_in_d_valid = buffer_1_auto_out_d_valid;
  assign buffer_1_auto_in_d_bits_opcode = buffer_1_auto_out_d_bits_opcode;
  assign buffer_1_auto_in_d_bits_param = buffer_1_auto_out_d_bits_param;
  assign buffer_1_auto_in_d_bits_size = buffer_1_auto_out_d_bits_size;
  assign buffer_1_auto_in_d_bits_source = buffer_1_auto_out_d_bits_source;
  assign buffer_1_auto_in_d_bits_sink = buffer_1_auto_out_d_bits_sink;
  assign buffer_1_auto_in_d_bits_denied = buffer_1_auto_out_d_bits_denied;
  assign buffer_1_auto_in_d_bits_data = buffer_1_auto_out_d_bits_data;
  assign buffer_1_auto_in_d_bits_corrupt = buffer_1_auto_out_d_bits_corrupt;
  assign buffer_1_auto_out_a_valid = buffer_1_auto_in_a_valid;
  assign buffer_1_auto_out_a_bits_opcode = buffer_1_auto_in_a_bits_opcode;
  assign buffer_1_auto_out_a_bits_param = buffer_1_auto_in_a_bits_param;
  assign buffer_1_auto_out_a_bits_size = buffer_1_auto_in_a_bits_size;
  assign buffer_1_auto_out_a_bits_source = buffer_1_auto_in_a_bits_source;
  assign buffer_1_auto_out_a_bits_address = buffer_1_auto_in_a_bits_address;
  assign buffer_1_auto_out_a_bits_mask = buffer_1_auto_in_a_bits_mask;
  assign buffer_1_auto_out_a_bits_data = buffer_1_auto_in_a_bits_data;
  assign buffer_1_auto_out_a_bits_corrupt = buffer_1_auto_in_a_bits_corrupt;
  assign buffer_1_auto_out_d_ready = buffer_1_auto_in_d_ready;
  assign auto_coupler_to_bootrom_fragmenter_out_a_valid = coupler_to_bootrom_auto_fragmenter_out_a_valid;
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode = coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode;
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_param = coupler_to_bootrom_auto_fragmenter_out_a_bits_param;
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_size = coupler_to_bootrom_auto_fragmenter_out_a_bits_size;
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_source = coupler_to_bootrom_auto_fragmenter_out_a_bits_source;
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_address = coupler_to_bootrom_auto_fragmenter_out_a_bits_address;
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_mask = coupler_to_bootrom_auto_fragmenter_out_a_bits_mask;
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt = coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt;
  assign auto_coupler_to_bootrom_fragmenter_out_d_ready = coupler_to_bootrom_auto_fragmenter_out_d_ready;
  assign auto_coupler_to_debug_fragmenter_out_a_valid = coupler_to_debug_auto_fragmenter_out_a_valid;
  assign auto_coupler_to_debug_fragmenter_out_a_bits_opcode = coupler_to_debug_auto_fragmenter_out_a_bits_opcode;
  assign auto_coupler_to_debug_fragmenter_out_a_bits_param = coupler_to_debug_auto_fragmenter_out_a_bits_param;
  assign auto_coupler_to_debug_fragmenter_out_a_bits_size = coupler_to_debug_auto_fragmenter_out_a_bits_size;
  assign auto_coupler_to_debug_fragmenter_out_a_bits_source = coupler_to_debug_auto_fragmenter_out_a_bits_source;
  assign auto_coupler_to_debug_fragmenter_out_a_bits_address = coupler_to_debug_auto_fragmenter_out_a_bits_address;
  assign auto_coupler_to_debug_fragmenter_out_a_bits_mask = coupler_to_debug_auto_fragmenter_out_a_bits_mask;
  assign auto_coupler_to_debug_fragmenter_out_a_bits_data = coupler_to_debug_auto_fragmenter_out_a_bits_data;
  assign auto_coupler_to_debug_fragmenter_out_a_bits_corrupt = coupler_to_debug_auto_fragmenter_out_a_bits_corrupt;
  assign auto_coupler_to_debug_fragmenter_out_d_ready = coupler_to_debug_auto_fragmenter_out_d_ready;
  assign auto_coupler_to_clint_fragmenter_out_a_valid = coupler_to_clint_auto_fragmenter_out_a_valid;
  assign auto_coupler_to_clint_fragmenter_out_a_bits_opcode = coupler_to_clint_auto_fragmenter_out_a_bits_opcode;
  assign auto_coupler_to_clint_fragmenter_out_a_bits_param = coupler_to_clint_auto_fragmenter_out_a_bits_param;
  assign auto_coupler_to_clint_fragmenter_out_a_bits_size = coupler_to_clint_auto_fragmenter_out_a_bits_size;
  assign auto_coupler_to_clint_fragmenter_out_a_bits_source = coupler_to_clint_auto_fragmenter_out_a_bits_source;
  assign auto_coupler_to_clint_fragmenter_out_a_bits_address = coupler_to_clint_auto_fragmenter_out_a_bits_address;
  assign auto_coupler_to_clint_fragmenter_out_a_bits_mask = coupler_to_clint_auto_fragmenter_out_a_bits_mask;
  assign auto_coupler_to_clint_fragmenter_out_a_bits_data = coupler_to_clint_auto_fragmenter_out_a_bits_data;
  assign auto_coupler_to_clint_fragmenter_out_a_bits_corrupt = coupler_to_clint_auto_fragmenter_out_a_bits_corrupt;
  assign auto_coupler_to_clint_fragmenter_out_d_ready = coupler_to_clint_auto_fragmenter_out_d_ready;
  assign auto_coupler_to_plic_fragmenter_out_a_valid = coupler_to_plic_auto_fragmenter_out_a_valid;
  assign auto_coupler_to_plic_fragmenter_out_a_bits_opcode = coupler_to_plic_auto_fragmenter_out_a_bits_opcode;
  assign auto_coupler_to_plic_fragmenter_out_a_bits_param = coupler_to_plic_auto_fragmenter_out_a_bits_param;
  assign auto_coupler_to_plic_fragmenter_out_a_bits_size = coupler_to_plic_auto_fragmenter_out_a_bits_size;
  assign auto_coupler_to_plic_fragmenter_out_a_bits_source = coupler_to_plic_auto_fragmenter_out_a_bits_source;
  assign auto_coupler_to_plic_fragmenter_out_a_bits_address = coupler_to_plic_auto_fragmenter_out_a_bits_address;
  assign auto_coupler_to_plic_fragmenter_out_a_bits_mask = coupler_to_plic_auto_fragmenter_out_a_bits_mask;
  assign auto_coupler_to_plic_fragmenter_out_a_bits_data = coupler_to_plic_auto_fragmenter_out_a_bits_data;
  assign auto_coupler_to_plic_fragmenter_out_a_bits_corrupt = coupler_to_plic_auto_fragmenter_out_a_bits_corrupt;
  assign auto_coupler_to_plic_fragmenter_out_d_ready = coupler_to_plic_auto_fragmenter_out_d_ready;
  assign auto_fixedClockNode_out_2_clock = fixedClockNode_auto_out_3_clock;
  assign auto_fixedClockNode_out_2_reset = fixedClockNode_auto_out_3_reset;
  assign auto_fixedClockNode_out_0_clock = fixedClockNode_auto_out_1_clock;
  assign auto_fixedClockNode_out_0_reset = fixedClockNode_auto_out_1_reset;
  assign auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock =
    subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_clock;
  assign auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset =
    subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_reset;
  assign auto_bus_xing_in_a_ready = buffer_1_auto_in_a_ready;
  assign auto_bus_xing_in_d_valid = buffer_1_auto_in_d_valid;
  assign auto_bus_xing_in_d_bits_opcode = buffer_1_auto_in_d_bits_opcode;
  assign auto_bus_xing_in_d_bits_param = buffer_1_auto_in_d_bits_param;
  assign auto_bus_xing_in_d_bits_size = buffer_1_auto_in_d_bits_size;
  assign auto_bus_xing_in_d_bits_source = buffer_1_auto_in_d_bits_source;
  assign auto_bus_xing_in_d_bits_sink = buffer_1_auto_in_d_bits_sink;
  assign auto_bus_xing_in_d_bits_denied = buffer_1_auto_in_d_bits_denied;
  assign auto_bus_xing_in_d_bits_data = buffer_1_auto_in_d_bits_data;
  assign auto_bus_xing_in_d_bits_corrupt = buffer_1_auto_in_d_bits_corrupt;
  assign clock = fixedClockNode_auto_out_0_clock;
  assign reset = fixedClockNode_auto_out_0_reset;
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_clock =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock;
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_reset =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset;
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock;
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset;
  assign clockGroup_auto_in_member_subsystem_cbus_0_clock =
    subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_clock;
  assign clockGroup_auto_in_member_subsystem_cbus_0_reset =
    subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_reset;
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock;
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset;
  assign fixer_clock = fixedClockNode_auto_out_0_clock;
  assign fixer_reset = fixedClockNode_auto_out_0_reset;
  assign fixer_auto_in_a_valid = buffer_auto_out_a_valid;
  assign fixer_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode;
  assign fixer_auto_in_a_bits_param = buffer_auto_out_a_bits_param;
  assign fixer_auto_in_a_bits_size = buffer_auto_out_a_bits_size;
  assign fixer_auto_in_a_bits_source = buffer_auto_out_a_bits_source;
  assign fixer_auto_in_a_bits_address = buffer_auto_out_a_bits_address;
  assign fixer_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask;
  assign fixer_auto_in_a_bits_data = buffer_auto_out_a_bits_data;
  assign fixer_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt;
  assign fixer_auto_in_d_ready = buffer_auto_out_d_ready;
  assign fixer_auto_out_a_ready = out_xbar_auto_in_a_ready;
  assign fixer_auto_out_d_valid = out_xbar_auto_in_d_valid;
  assign fixer_auto_out_d_bits_opcode = out_xbar_auto_in_d_bits_opcode;
  assign fixer_auto_out_d_bits_param = out_xbar_auto_in_d_bits_param;
  assign fixer_auto_out_d_bits_size = out_xbar_auto_in_d_bits_size;
  assign fixer_auto_out_d_bits_source = out_xbar_auto_in_d_bits_source;
  assign fixer_auto_out_d_bits_sink = out_xbar_auto_in_d_bits_sink;
  assign fixer_auto_out_d_bits_denied = out_xbar_auto_in_d_bits_denied;
  assign fixer_auto_out_d_bits_data = out_xbar_auto_in_d_bits_data;
  assign fixer_auto_out_d_bits_corrupt = out_xbar_auto_in_d_bits_corrupt;
  assign in_xbar_auto_in_a_valid = buffer_1_auto_out_a_valid;
  assign in_xbar_auto_in_a_bits_opcode = buffer_1_auto_out_a_bits_opcode;
  assign in_xbar_auto_in_a_bits_param = buffer_1_auto_out_a_bits_param;
  assign in_xbar_auto_in_a_bits_size = buffer_1_auto_out_a_bits_size;
  assign in_xbar_auto_in_a_bits_source = buffer_1_auto_out_a_bits_source;
  assign in_xbar_auto_in_a_bits_address = buffer_1_auto_out_a_bits_address;
  assign in_xbar_auto_in_a_bits_mask = buffer_1_auto_out_a_bits_mask;
  assign in_xbar_auto_in_a_bits_data = buffer_1_auto_out_a_bits_data;
  assign in_xbar_auto_in_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt;
  assign in_xbar_auto_in_d_ready = buffer_1_auto_out_d_ready;
  assign in_xbar_auto_out_a_ready = atomics_auto_in_a_ready;
  assign in_xbar_auto_out_d_valid = atomics_auto_in_d_valid;
  assign in_xbar_auto_out_d_bits_opcode = atomics_auto_in_d_bits_opcode;
  assign in_xbar_auto_out_d_bits_param = atomics_auto_in_d_bits_param;
  assign in_xbar_auto_out_d_bits_size = atomics_auto_in_d_bits_size;
  assign in_xbar_auto_out_d_bits_source = atomics_auto_in_d_bits_source;
  assign in_xbar_auto_out_d_bits_sink = atomics_auto_in_d_bits_sink;
  assign in_xbar_auto_out_d_bits_denied = atomics_auto_in_d_bits_denied;
  assign in_xbar_auto_out_d_bits_data = atomics_auto_in_d_bits_data;
  assign in_xbar_auto_out_d_bits_corrupt = atomics_auto_in_d_bits_corrupt;
  assign out_xbar_clock = fixedClockNode_auto_out_0_clock;
  assign out_xbar_reset = fixedClockNode_auto_out_0_reset;
  assign out_xbar_auto_in_a_valid = fixer_auto_out_a_valid;
  assign out_xbar_auto_in_a_bits_opcode = fixer_auto_out_a_bits_opcode;
  assign out_xbar_auto_in_a_bits_param = fixer_auto_out_a_bits_param;
  assign out_xbar_auto_in_a_bits_size = fixer_auto_out_a_bits_size;
  assign out_xbar_auto_in_a_bits_source = fixer_auto_out_a_bits_source;
  assign out_xbar_auto_in_a_bits_address = fixer_auto_out_a_bits_address;
  assign out_xbar_auto_in_a_bits_mask = fixer_auto_out_a_bits_mask;
  assign out_xbar_auto_in_a_bits_data = fixer_auto_out_a_bits_data;
  assign out_xbar_auto_in_a_bits_corrupt = fixer_auto_out_a_bits_corrupt;
  assign out_xbar_auto_in_d_ready = fixer_auto_out_d_ready;
  assign out_xbar_auto_out_4_a_ready = coupler_to_bootrom_auto_tl_in_a_ready;
  assign out_xbar_auto_out_4_d_valid = coupler_to_bootrom_auto_tl_in_d_valid;
  assign out_xbar_auto_out_4_d_bits_size = coupler_to_bootrom_auto_tl_in_d_bits_size;
  assign out_xbar_auto_out_4_d_bits_source = coupler_to_bootrom_auto_tl_in_d_bits_source;
  assign out_xbar_auto_out_4_d_bits_data = coupler_to_bootrom_auto_tl_in_d_bits_data;
  assign out_xbar_auto_out_3_a_ready = coupler_to_debug_auto_tl_in_a_ready;
  assign out_xbar_auto_out_3_d_valid = coupler_to_debug_auto_tl_in_d_valid;
  assign out_xbar_auto_out_3_d_bits_opcode = coupler_to_debug_auto_tl_in_d_bits_opcode;
  assign out_xbar_auto_out_3_d_bits_size = coupler_to_debug_auto_tl_in_d_bits_size;
  assign out_xbar_auto_out_3_d_bits_source = coupler_to_debug_auto_tl_in_d_bits_source;
  assign out_xbar_auto_out_3_d_bits_data = coupler_to_debug_auto_tl_in_d_bits_data;
  assign out_xbar_auto_out_2_a_ready = coupler_to_clint_auto_tl_in_a_ready;
  assign out_xbar_auto_out_2_d_valid = coupler_to_clint_auto_tl_in_d_valid;
  assign out_xbar_auto_out_2_d_bits_opcode = coupler_to_clint_auto_tl_in_d_bits_opcode;
  assign out_xbar_auto_out_2_d_bits_size = coupler_to_clint_auto_tl_in_d_bits_size;
  assign out_xbar_auto_out_2_d_bits_source = coupler_to_clint_auto_tl_in_d_bits_source;
  assign out_xbar_auto_out_2_d_bits_data = coupler_to_clint_auto_tl_in_d_bits_data;
  assign out_xbar_auto_out_1_a_ready = coupler_to_plic_auto_tl_in_a_ready;
  assign out_xbar_auto_out_1_d_valid = coupler_to_plic_auto_tl_in_d_valid;
  assign out_xbar_auto_out_1_d_bits_opcode = coupler_to_plic_auto_tl_in_d_bits_opcode;
  assign out_xbar_auto_out_1_d_bits_size = coupler_to_plic_auto_tl_in_d_bits_size;
  assign out_xbar_auto_out_1_d_bits_source = coupler_to_plic_auto_tl_in_d_bits_source;
  assign out_xbar_auto_out_1_d_bits_data = coupler_to_plic_auto_tl_in_d_bits_data;
  assign out_xbar_auto_out_0_a_ready = wrapped_error_device_auto_buffer_in_a_ready;
  assign out_xbar_auto_out_0_d_valid = wrapped_error_device_auto_buffer_in_d_valid;
  assign out_xbar_auto_out_0_d_bits_opcode = wrapped_error_device_auto_buffer_in_d_bits_opcode;
  assign out_xbar_auto_out_0_d_bits_param = wrapped_error_device_auto_buffer_in_d_bits_param;
  assign out_xbar_auto_out_0_d_bits_size = wrapped_error_device_auto_buffer_in_d_bits_size;
  assign out_xbar_auto_out_0_d_bits_source = wrapped_error_device_auto_buffer_in_d_bits_source;
  assign out_xbar_auto_out_0_d_bits_sink = wrapped_error_device_auto_buffer_in_d_bits_sink;
  assign out_xbar_auto_out_0_d_bits_denied = wrapped_error_device_auto_buffer_in_d_bits_denied;
  assign out_xbar_auto_out_0_d_bits_data = wrapped_error_device_auto_buffer_in_d_bits_data;
  assign out_xbar_auto_out_0_d_bits_corrupt = wrapped_error_device_auto_buffer_in_d_bits_corrupt;
  assign buffer_clock = fixedClockNode_auto_out_0_clock;
  assign buffer_reset = fixedClockNode_auto_out_0_reset;
  assign buffer_auto_in_a_valid = atomics_auto_out_a_valid;
  assign buffer_auto_in_a_bits_opcode = atomics_auto_out_a_bits_opcode;
  assign buffer_auto_in_a_bits_param = atomics_auto_out_a_bits_param;
  assign buffer_auto_in_a_bits_size = atomics_auto_out_a_bits_size;
  assign buffer_auto_in_a_bits_source = atomics_auto_out_a_bits_source;
  assign buffer_auto_in_a_bits_address = atomics_auto_out_a_bits_address;
  assign buffer_auto_in_a_bits_mask = atomics_auto_out_a_bits_mask;
  assign buffer_auto_in_a_bits_data = atomics_auto_out_a_bits_data;
  assign buffer_auto_in_a_bits_corrupt = atomics_auto_out_a_bits_corrupt;
  assign buffer_auto_in_d_ready = atomics_auto_out_d_ready;
  assign buffer_auto_out_a_ready = fixer_auto_in_a_ready;
  assign buffer_auto_out_d_valid = fixer_auto_in_d_valid;
  assign buffer_auto_out_d_bits_opcode = fixer_auto_in_d_bits_opcode;
  assign buffer_auto_out_d_bits_param = fixer_auto_in_d_bits_param;
  assign buffer_auto_out_d_bits_size = fixer_auto_in_d_bits_size;
  assign buffer_auto_out_d_bits_source = fixer_auto_in_d_bits_source;
  assign buffer_auto_out_d_bits_sink = fixer_auto_in_d_bits_sink;
  assign buffer_auto_out_d_bits_denied = fixer_auto_in_d_bits_denied;
  assign buffer_auto_out_d_bits_data = fixer_auto_in_d_bits_data;
  assign buffer_auto_out_d_bits_corrupt = fixer_auto_in_d_bits_corrupt;
  assign atomics_clock = fixedClockNode_auto_out_0_clock;
  assign atomics_reset = fixedClockNode_auto_out_0_reset;
  assign atomics_auto_in_a_valid = in_xbar_auto_out_a_valid;
  assign atomics_auto_in_a_bits_opcode = in_xbar_auto_out_a_bits_opcode;
  assign atomics_auto_in_a_bits_param = in_xbar_auto_out_a_bits_param;
  assign atomics_auto_in_a_bits_size = in_xbar_auto_out_a_bits_size;
  assign atomics_auto_in_a_bits_source = in_xbar_auto_out_a_bits_source;
  assign atomics_auto_in_a_bits_address = in_xbar_auto_out_a_bits_address;
  assign atomics_auto_in_a_bits_mask = in_xbar_auto_out_a_bits_mask;
  assign atomics_auto_in_a_bits_data = in_xbar_auto_out_a_bits_data;
  assign atomics_auto_in_a_bits_corrupt = in_xbar_auto_out_a_bits_corrupt;
  assign atomics_auto_in_d_ready = in_xbar_auto_out_d_ready;
  assign atomics_auto_out_a_ready = buffer_auto_in_a_ready;
  assign atomics_auto_out_d_valid = buffer_auto_in_d_valid;
  assign atomics_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode;
  assign atomics_auto_out_d_bits_param = buffer_auto_in_d_bits_param;
  assign atomics_auto_out_d_bits_size = buffer_auto_in_d_bits_size;
  assign atomics_auto_out_d_bits_source = buffer_auto_in_d_bits_source;
  assign atomics_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink;
  assign atomics_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied;
  assign atomics_auto_out_d_bits_data = buffer_auto_in_d_bits_data;
  assign atomics_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt;
  assign wrapped_error_device_clock = fixedClockNode_auto_out_0_clock;
  assign wrapped_error_device_reset = fixedClockNode_auto_out_0_reset;
  assign wrapped_error_device_auto_buffer_in_a_valid = out_xbar_auto_out_0_a_valid;
  assign wrapped_error_device_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_0_a_bits_opcode;
  assign wrapped_error_device_auto_buffer_in_a_bits_param = out_xbar_auto_out_0_a_bits_param;
  assign wrapped_error_device_auto_buffer_in_a_bits_size = out_xbar_auto_out_0_a_bits_size;
  assign wrapped_error_device_auto_buffer_in_a_bits_source = out_xbar_auto_out_0_a_bits_source;
  assign wrapped_error_device_auto_buffer_in_a_bits_address = out_xbar_auto_out_0_a_bits_address;
  assign wrapped_error_device_auto_buffer_in_a_bits_mask = out_xbar_auto_out_0_a_bits_mask;
  assign wrapped_error_device_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_0_a_bits_corrupt;
  assign wrapped_error_device_auto_buffer_in_d_ready = out_xbar_auto_out_0_d_ready;
  assign buffer_1_auto_in_a_valid = auto_bus_xing_in_a_valid;
  assign buffer_1_auto_in_a_bits_opcode = auto_bus_xing_in_a_bits_opcode;
  assign buffer_1_auto_in_a_bits_param = auto_bus_xing_in_a_bits_param;
  assign buffer_1_auto_in_a_bits_size = auto_bus_xing_in_a_bits_size;
  assign buffer_1_auto_in_a_bits_source = auto_bus_xing_in_a_bits_source;
  assign buffer_1_auto_in_a_bits_address = auto_bus_xing_in_a_bits_address;
  assign buffer_1_auto_in_a_bits_mask = auto_bus_xing_in_a_bits_mask;
  assign buffer_1_auto_in_a_bits_data = auto_bus_xing_in_a_bits_data;
  assign buffer_1_auto_in_a_bits_corrupt = auto_bus_xing_in_a_bits_corrupt;
  assign buffer_1_auto_in_d_ready = auto_bus_xing_in_d_ready;
  assign buffer_1_auto_out_a_ready = in_xbar_auto_in_a_ready;
  assign buffer_1_auto_out_d_valid = in_xbar_auto_in_d_valid;
  assign buffer_1_auto_out_d_bits_opcode = in_xbar_auto_in_d_bits_opcode;
  assign buffer_1_auto_out_d_bits_param = in_xbar_auto_in_d_bits_param;
  assign buffer_1_auto_out_d_bits_size = in_xbar_auto_in_d_bits_size;
  assign buffer_1_auto_out_d_bits_source = in_xbar_auto_in_d_bits_source;
  assign buffer_1_auto_out_d_bits_sink = in_xbar_auto_in_d_bits_sink;
  assign buffer_1_auto_out_d_bits_denied = in_xbar_auto_in_d_bits_denied;
  assign buffer_1_auto_out_d_bits_data = in_xbar_auto_in_d_bits_data;
  assign buffer_1_auto_out_d_bits_corrupt = in_xbar_auto_in_d_bits_corrupt;
  assign coupler_to_plic_clock = fixedClockNode_auto_out_0_clock;
  assign coupler_to_plic_reset = fixedClockNode_auto_out_0_reset;
  assign coupler_to_plic_auto_fragmenter_out_a_ready = auto_coupler_to_plic_fragmenter_out_a_ready;
  assign coupler_to_plic_auto_fragmenter_out_d_valid = auto_coupler_to_plic_fragmenter_out_d_valid;
  assign coupler_to_plic_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_plic_fragmenter_out_d_bits_opcode;
  assign coupler_to_plic_auto_fragmenter_out_d_bits_size = auto_coupler_to_plic_fragmenter_out_d_bits_size;
  assign coupler_to_plic_auto_fragmenter_out_d_bits_source = auto_coupler_to_plic_fragmenter_out_d_bits_source;
  assign coupler_to_plic_auto_fragmenter_out_d_bits_data = auto_coupler_to_plic_fragmenter_out_d_bits_data;
  assign coupler_to_plic_auto_tl_in_a_valid = out_xbar_auto_out_1_a_valid;
  assign coupler_to_plic_auto_tl_in_a_bits_opcode = out_xbar_auto_out_1_a_bits_opcode;
  assign coupler_to_plic_auto_tl_in_a_bits_param = out_xbar_auto_out_1_a_bits_param;
  assign coupler_to_plic_auto_tl_in_a_bits_size = out_xbar_auto_out_1_a_bits_size;
  assign coupler_to_plic_auto_tl_in_a_bits_source = out_xbar_auto_out_1_a_bits_source;
  assign coupler_to_plic_auto_tl_in_a_bits_address = out_xbar_auto_out_1_a_bits_address;
  assign coupler_to_plic_auto_tl_in_a_bits_mask = out_xbar_auto_out_1_a_bits_mask;
  assign coupler_to_plic_auto_tl_in_a_bits_data = out_xbar_auto_out_1_a_bits_data;
  assign coupler_to_plic_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_1_a_bits_corrupt;
  assign coupler_to_plic_auto_tl_in_d_ready = out_xbar_auto_out_1_d_ready;
  assign coupler_to_clint_clock = fixedClockNode_auto_out_0_clock;
  assign coupler_to_clint_reset = fixedClockNode_auto_out_0_reset;
  assign coupler_to_clint_auto_fragmenter_out_a_ready = auto_coupler_to_clint_fragmenter_out_a_ready;
  assign coupler_to_clint_auto_fragmenter_out_d_valid = auto_coupler_to_clint_fragmenter_out_d_valid;
  assign coupler_to_clint_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_clint_fragmenter_out_d_bits_opcode;
  assign coupler_to_clint_auto_fragmenter_out_d_bits_size = auto_coupler_to_clint_fragmenter_out_d_bits_size;
  assign coupler_to_clint_auto_fragmenter_out_d_bits_source = auto_coupler_to_clint_fragmenter_out_d_bits_source;
  assign coupler_to_clint_auto_fragmenter_out_d_bits_data = auto_coupler_to_clint_fragmenter_out_d_bits_data;
  assign coupler_to_clint_auto_tl_in_a_valid = out_xbar_auto_out_2_a_valid;
  assign coupler_to_clint_auto_tl_in_a_bits_opcode = out_xbar_auto_out_2_a_bits_opcode;
  assign coupler_to_clint_auto_tl_in_a_bits_param = out_xbar_auto_out_2_a_bits_param;
  assign coupler_to_clint_auto_tl_in_a_bits_size = out_xbar_auto_out_2_a_bits_size;
  assign coupler_to_clint_auto_tl_in_a_bits_source = out_xbar_auto_out_2_a_bits_source;
  assign coupler_to_clint_auto_tl_in_a_bits_address = out_xbar_auto_out_2_a_bits_address;
  assign coupler_to_clint_auto_tl_in_a_bits_mask = out_xbar_auto_out_2_a_bits_mask;
  assign coupler_to_clint_auto_tl_in_a_bits_data = out_xbar_auto_out_2_a_bits_data;
  assign coupler_to_clint_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_2_a_bits_corrupt;
  assign coupler_to_clint_auto_tl_in_d_ready = out_xbar_auto_out_2_d_ready;
  assign coupler_to_debug_clock = fixedClockNode_auto_out_0_clock;
  assign coupler_to_debug_reset = fixedClockNode_auto_out_0_reset;
  assign coupler_to_debug_auto_fragmenter_out_a_ready = auto_coupler_to_debug_fragmenter_out_a_ready;
  assign coupler_to_debug_auto_fragmenter_out_d_valid = auto_coupler_to_debug_fragmenter_out_d_valid;
  assign coupler_to_debug_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_debug_fragmenter_out_d_bits_opcode;
  assign coupler_to_debug_auto_fragmenter_out_d_bits_size = auto_coupler_to_debug_fragmenter_out_d_bits_size;
  assign coupler_to_debug_auto_fragmenter_out_d_bits_source = auto_coupler_to_debug_fragmenter_out_d_bits_source;
  assign coupler_to_debug_auto_fragmenter_out_d_bits_data = auto_coupler_to_debug_fragmenter_out_d_bits_data;
  assign coupler_to_debug_auto_tl_in_a_valid = out_xbar_auto_out_3_a_valid;
  assign coupler_to_debug_auto_tl_in_a_bits_opcode = out_xbar_auto_out_3_a_bits_opcode;
  assign coupler_to_debug_auto_tl_in_a_bits_param = out_xbar_auto_out_3_a_bits_param;
  assign coupler_to_debug_auto_tl_in_a_bits_size = out_xbar_auto_out_3_a_bits_size;
  assign coupler_to_debug_auto_tl_in_a_bits_source = out_xbar_auto_out_3_a_bits_source;
  assign coupler_to_debug_auto_tl_in_a_bits_address = out_xbar_auto_out_3_a_bits_address;
  assign coupler_to_debug_auto_tl_in_a_bits_mask = out_xbar_auto_out_3_a_bits_mask;
  assign coupler_to_debug_auto_tl_in_a_bits_data = out_xbar_auto_out_3_a_bits_data;
  assign coupler_to_debug_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_3_a_bits_corrupt;
  assign coupler_to_debug_auto_tl_in_d_ready = out_xbar_auto_out_3_d_ready;
  assign coupler_to_bootrom_clock = fixedClockNode_auto_out_0_clock;
  assign coupler_to_bootrom_reset = fixedClockNode_auto_out_0_reset;
  assign coupler_to_bootrom_auto_fragmenter_out_a_ready = auto_coupler_to_bootrom_fragmenter_out_a_ready;
  assign coupler_to_bootrom_auto_fragmenter_out_d_valid = auto_coupler_to_bootrom_fragmenter_out_d_valid;
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_size = auto_coupler_to_bootrom_fragmenter_out_d_bits_size;
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_source = auto_coupler_to_bootrom_fragmenter_out_d_bits_source;
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_data = auto_coupler_to_bootrom_fragmenter_out_d_bits_data;
  assign coupler_to_bootrom_auto_tl_in_a_valid = out_xbar_auto_out_4_a_valid;
  assign coupler_to_bootrom_auto_tl_in_a_bits_opcode = out_xbar_auto_out_4_a_bits_opcode;
  assign coupler_to_bootrom_auto_tl_in_a_bits_param = out_xbar_auto_out_4_a_bits_param;
  assign coupler_to_bootrom_auto_tl_in_a_bits_size = out_xbar_auto_out_4_a_bits_size;
  assign coupler_to_bootrom_auto_tl_in_a_bits_source = out_xbar_auto_out_4_a_bits_source;
  assign coupler_to_bootrom_auto_tl_in_a_bits_address = out_xbar_auto_out_4_a_bits_address;
  assign coupler_to_bootrom_auto_tl_in_a_bits_mask = out_xbar_auto_out_4_a_bits_mask;
  assign coupler_to_bootrom_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_4_a_bits_corrupt;
  assign coupler_to_bootrom_auto_tl_in_d_ready = out_xbar_auto_out_4_d_ready;
endmodule