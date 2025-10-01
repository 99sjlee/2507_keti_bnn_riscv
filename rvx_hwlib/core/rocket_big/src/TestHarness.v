`default_nettype wire
module TestHarness(
  input   clock,
  input   reset,
  output  io_success
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  ldut_clock;
  wire  ldut_reset;
  wire  ldut_mem_axi4_0_aw_ready;
  wire  ldut_mem_axi4_0_aw_valid;
  wire [3:0] ldut_mem_axi4_0_aw_bits_id;
  wire [31:0] ldut_mem_axi4_0_aw_bits_addr;
  wire [7:0] ldut_mem_axi4_0_aw_bits_len;
  wire [2:0] ldut_mem_axi4_0_aw_bits_size;
  wire [1:0] ldut_mem_axi4_0_aw_bits_burst;
  wire  ldut_mem_axi4_0_aw_bits_lock;
  wire [3:0] ldut_mem_axi4_0_aw_bits_cache;
  wire [2:0] ldut_mem_axi4_0_aw_bits_prot;
  wire [3:0] ldut_mem_axi4_0_aw_bits_qos;
  wire  ldut_mem_axi4_0_w_ready;
  wire  ldut_mem_axi4_0_w_valid;
  wire [31:0] ldut_mem_axi4_0_w_bits_data;
  wire [3:0] ldut_mem_axi4_0_w_bits_strb;
  wire  ldut_mem_axi4_0_w_bits_last;
  wire  ldut_mem_axi4_0_b_ready;
  wire  ldut_mem_axi4_0_b_valid;
  wire [3:0] ldut_mem_axi4_0_b_bits_id;
  wire [1:0] ldut_mem_axi4_0_b_bits_resp;
  wire  ldut_mem_axi4_0_ar_ready;
  wire  ldut_mem_axi4_0_ar_valid;
  wire [3:0] ldut_mem_axi4_0_ar_bits_id;
  wire [31:0] ldut_mem_axi4_0_ar_bits_addr;
  wire [7:0] ldut_mem_axi4_0_ar_bits_len;
  wire [2:0] ldut_mem_axi4_0_ar_bits_size;
  wire [1:0] ldut_mem_axi4_0_ar_bits_burst;
  wire  ldut_mem_axi4_0_ar_bits_lock;
  wire [3:0] ldut_mem_axi4_0_ar_bits_cache;
  wire [2:0] ldut_mem_axi4_0_ar_bits_prot;
  wire [3:0] ldut_mem_axi4_0_ar_bits_qos;
  wire  ldut_mem_axi4_0_r_ready;
  wire  ldut_mem_axi4_0_r_valid;
  wire [3:0] ldut_mem_axi4_0_r_bits_id;
  wire [31:0] ldut_mem_axi4_0_r_bits_data;
  wire [1:0] ldut_mem_axi4_0_r_bits_resp;
  wire  ldut_mem_axi4_0_r_bits_last;
  wire  ldut_mmio_axi4_0_aw_ready;
  wire  ldut_mmio_axi4_0_aw_valid;
  wire [3:0] ldut_mmio_axi4_0_aw_bits_id;
  wire [31:0] ldut_mmio_axi4_0_aw_bits_addr;
  wire [7:0] ldut_mmio_axi4_0_aw_bits_len;
  wire [2:0] ldut_mmio_axi4_0_aw_bits_size;
  wire [1:0] ldut_mmio_axi4_0_aw_bits_burst;
  wire  ldut_mmio_axi4_0_aw_bits_lock;
  wire [3:0] ldut_mmio_axi4_0_aw_bits_cache;
  wire [2:0] ldut_mmio_axi4_0_aw_bits_prot;
  wire [3:0] ldut_mmio_axi4_0_aw_bits_qos;
  wire  ldut_mmio_axi4_0_w_ready;
  wire  ldut_mmio_axi4_0_w_valid;
  wire [31:0] ldut_mmio_axi4_0_w_bits_data;
  wire [3:0] ldut_mmio_axi4_0_w_bits_strb;
  wire  ldut_mmio_axi4_0_w_bits_last;
  wire  ldut_mmio_axi4_0_b_ready;
  wire  ldut_mmio_axi4_0_b_valid;
  wire [3:0] ldut_mmio_axi4_0_b_bits_id;
  wire [1:0] ldut_mmio_axi4_0_b_bits_resp;
  wire  ldut_mmio_axi4_0_ar_ready;
  wire  ldut_mmio_axi4_0_ar_valid;
  wire [3:0] ldut_mmio_axi4_0_ar_bits_id;
  wire [31:0] ldut_mmio_axi4_0_ar_bits_addr;
  wire [7:0] ldut_mmio_axi4_0_ar_bits_len;
  wire [2:0] ldut_mmio_axi4_0_ar_bits_size;
  wire [1:0] ldut_mmio_axi4_0_ar_bits_burst;
  wire  ldut_mmio_axi4_0_ar_bits_lock;
  wire [3:0] ldut_mmio_axi4_0_ar_bits_cache;
  wire [2:0] ldut_mmio_axi4_0_ar_bits_prot;
  wire [3:0] ldut_mmio_axi4_0_ar_bits_qos;
  wire  ldut_mmio_axi4_0_r_ready;
  wire  ldut_mmio_axi4_0_r_valid;
  wire [3:0] ldut_mmio_axi4_0_r_bits_id;
  wire [31:0] ldut_mmio_axi4_0_r_bits_data;
  wire [1:0] ldut_mmio_axi4_0_r_bits_resp;
  wire  ldut_mmio_axi4_0_r_bits_last;
  wire  ldut_l2_frontend_bus_axi4_0_aw_ready;
  wire  ldut_l2_frontend_bus_axi4_0_aw_valid;
  wire [7:0] ldut_l2_frontend_bus_axi4_0_aw_bits_id;
  wire [31:0] ldut_l2_frontend_bus_axi4_0_aw_bits_addr;
  wire [7:0] ldut_l2_frontend_bus_axi4_0_aw_bits_len;
  wire [2:0] ldut_l2_frontend_bus_axi4_0_aw_bits_size;
  wire [1:0] ldut_l2_frontend_bus_axi4_0_aw_bits_burst;
  wire  ldut_l2_frontend_bus_axi4_0_aw_bits_lock;
  wire [3:0] ldut_l2_frontend_bus_axi4_0_aw_bits_cache;
  wire [2:0] ldut_l2_frontend_bus_axi4_0_aw_bits_prot;
  wire [3:0] ldut_l2_frontend_bus_axi4_0_aw_bits_qos;
  wire  ldut_l2_frontend_bus_axi4_0_w_ready;
  wire  ldut_l2_frontend_bus_axi4_0_w_valid;
  wire [63:0] ldut_l2_frontend_bus_axi4_0_w_bits_data;
  wire [7:0] ldut_l2_frontend_bus_axi4_0_w_bits_strb;
  wire  ldut_l2_frontend_bus_axi4_0_w_bits_last;
  wire  ldut_l2_frontend_bus_axi4_0_b_ready;
  wire  ldut_l2_frontend_bus_axi4_0_b_valid;
  wire [7:0] ldut_l2_frontend_bus_axi4_0_b_bits_id;
  wire [1:0] ldut_l2_frontend_bus_axi4_0_b_bits_resp;
  wire  ldut_l2_frontend_bus_axi4_0_ar_ready;
  wire  ldut_l2_frontend_bus_axi4_0_ar_valid;
  wire [7:0] ldut_l2_frontend_bus_axi4_0_ar_bits_id;
  wire [31:0] ldut_l2_frontend_bus_axi4_0_ar_bits_addr;
  wire [7:0] ldut_l2_frontend_bus_axi4_0_ar_bits_len;
  wire [2:0] ldut_l2_frontend_bus_axi4_0_ar_bits_size;
  wire [1:0] ldut_l2_frontend_bus_axi4_0_ar_bits_burst;
  wire  ldut_l2_frontend_bus_axi4_0_ar_bits_lock;
  wire [3:0] ldut_l2_frontend_bus_axi4_0_ar_bits_cache;
  wire [2:0] ldut_l2_frontend_bus_axi4_0_ar_bits_prot;
  wire [3:0] ldut_l2_frontend_bus_axi4_0_ar_bits_qos;
  wire  ldut_l2_frontend_bus_axi4_0_r_ready;
  wire  ldut_l2_frontend_bus_axi4_0_r_valid;
  wire [7:0] ldut_l2_frontend_bus_axi4_0_r_bits_id;
  wire [63:0] ldut_l2_frontend_bus_axi4_0_r_bits_data;
  wire [1:0] ldut_l2_frontend_bus_axi4_0_r_bits_resp;
  wire  ldut_l2_frontend_bus_axi4_0_r_bits_last;
  wire  ldut_resetctrl_hartIsInReset_0;
  wire  ldut_debug_clock;
  wire  ldut_debug_reset;
  wire  ldut_debug_clockeddmi_dmi_req_ready;
  wire  ldut_debug_clockeddmi_dmi_req_valid;
  wire [6:0] ldut_debug_clockeddmi_dmi_req_bits_addr;
  wire [31:0] ldut_debug_clockeddmi_dmi_req_bits_data;
  wire [1:0] ldut_debug_clockeddmi_dmi_req_bits_op;
  wire  ldut_debug_clockeddmi_dmi_resp_ready;
  wire  ldut_debug_clockeddmi_dmi_resp_valid;
  wire [31:0] ldut_debug_clockeddmi_dmi_resp_bits_data;
  wire [1:0] ldut_debug_clockeddmi_dmi_resp_bits_resp;
  wire  ldut_debug_clockeddmi_dmiClock;
  wire  ldut_debug_clockeddmi_dmiReset;
  wire  ldut_debug_ndreset;
  wire  ldut_debug_dmactive;
  wire  ldut_debug_dmactiveAck;
  wire [1:0] ldut_interrupts;
  wire  ldut_reset_reg_clock;
  wire  ldut_reset_reg_reset;
  wire  ldut_reset_reg_io_d;
  wire  ldut_reset_reg_io_q;
  wire  mem_clock;
  wire  mem_reset;
  wire  mem_io_axi4_0_aw_ready;
  wire  mem_io_axi4_0_aw_valid;
  wire [3:0] mem_io_axi4_0_aw_bits_id;
  wire [31:0] mem_io_axi4_0_aw_bits_addr;
  wire [7:0] mem_io_axi4_0_aw_bits_len;
  wire [2:0] mem_io_axi4_0_aw_bits_size;
  wire [1:0] mem_io_axi4_0_aw_bits_burst;
  wire  mem_io_axi4_0_w_ready;
  wire  mem_io_axi4_0_w_valid;
  wire [31:0] mem_io_axi4_0_w_bits_data;
  wire [3:0] mem_io_axi4_0_w_bits_strb;
  wire  mem_io_axi4_0_w_bits_last;
  wire  mem_io_axi4_0_b_ready;
  wire  mem_io_axi4_0_b_valid;
  wire [3:0] mem_io_axi4_0_b_bits_id;
  wire [1:0] mem_io_axi4_0_b_bits_resp;
  wire  mem_io_axi4_0_ar_ready;
  wire  mem_io_axi4_0_ar_valid;
  wire [3:0] mem_io_axi4_0_ar_bits_id;
  wire [31:0] mem_io_axi4_0_ar_bits_addr;
  wire [7:0] mem_io_axi4_0_ar_bits_len;
  wire [2:0] mem_io_axi4_0_ar_bits_size;
  wire [1:0] mem_io_axi4_0_ar_bits_burst;
  wire  mem_io_axi4_0_r_ready;
  wire  mem_io_axi4_0_r_valid;
  wire [3:0] mem_io_axi4_0_r_bits_id;
  wire [31:0] mem_io_axi4_0_r_bits_data;
  wire [1:0] mem_io_axi4_0_r_bits_resp;
  wire  mem_io_axi4_0_r_bits_last;
  wire  mmio_mem_clock;
  wire  mmio_mem_reset;
  wire  mmio_mem_io_axi4_0_aw_ready;
  wire  mmio_mem_io_axi4_0_aw_valid;
  wire [3:0] mmio_mem_io_axi4_0_aw_bits_id;
  wire [31:0] mmio_mem_io_axi4_0_aw_bits_addr;
  wire [7:0] mmio_mem_io_axi4_0_aw_bits_len;
  wire [2:0] mmio_mem_io_axi4_0_aw_bits_size;
  wire [1:0] mmio_mem_io_axi4_0_aw_bits_burst;
  wire  mmio_mem_io_axi4_0_w_ready;
  wire  mmio_mem_io_axi4_0_w_valid;
  wire [31:0] mmio_mem_io_axi4_0_w_bits_data;
  wire [3:0] mmio_mem_io_axi4_0_w_bits_strb;
  wire  mmio_mem_io_axi4_0_w_bits_last;
  wire  mmio_mem_io_axi4_0_b_ready;
  wire  mmio_mem_io_axi4_0_b_valid;
  wire [3:0] mmio_mem_io_axi4_0_b_bits_id;
  wire [1:0] mmio_mem_io_axi4_0_b_bits_resp;
  wire  mmio_mem_io_axi4_0_ar_ready;
  wire  mmio_mem_io_axi4_0_ar_valid;
  wire [3:0] mmio_mem_io_axi4_0_ar_bits_id;
  wire [31:0] mmio_mem_io_axi4_0_ar_bits_addr;
  wire [7:0] mmio_mem_io_axi4_0_ar_bits_len;
  wire [2:0] mmio_mem_io_axi4_0_ar_bits_size;
  wire [1:0] mmio_mem_io_axi4_0_ar_bits_burst;
  wire  mmio_mem_io_axi4_0_r_ready;
  wire  mmio_mem_io_axi4_0_r_valid;
  wire [3:0] mmio_mem_io_axi4_0_r_bits_id;
  wire [31:0] mmio_mem_io_axi4_0_r_bits_data;
  wire [1:0] mmio_mem_io_axi4_0_r_bits_resp;
  wire  mmio_mem_io_axi4_0_r_bits_last;
  wire  debug_reset_syncd_debug_reset_sync_clock;
  wire  debug_reset_syncd_debug_reset_sync_reset;
  wire  debug_reset_syncd_debug_reset_sync_io_d;
  wire  debug_reset_syncd_debug_reset_sync_io_q;
  wire  dmactiveAck_dmactiveAck_clock;
  wire  dmactiveAck_dmactiveAck_reset;
  wire  dmactiveAck_dmactiveAck_io_d;
  wire  dmactiveAck_dmactiveAck_io_q;
  wire  gated_clock_debug_clock_gate_in;
  wire  gated_clock_debug_clock_gate_test_en;
  wire  gated_clock_debug_clock_gate_en;
  wire  gated_clock_debug_clock_gate_out;
  wire  SimDTM_clk;
  wire  SimDTM_reset;
  wire  SimDTM_debug_req_ready;
  wire  SimDTM_debug_req_valid;
  wire [6:0] SimDTM_debug_req_bits_addr;
  wire [31:0] SimDTM_debug_req_bits_data;
  wire [1:0] SimDTM_debug_req_bits_op;
  wire  SimDTM_debug_resp_ready;
  wire  SimDTM_debug_resp_valid;
  wire [31:0] SimDTM_debug_resp_bits_data;
  wire [1:0] SimDTM_debug_resp_bits_resp;
  wire [31:0] SimDTM_exit;
  wire  _debug_reset_syncd_WIRE = debug_reset_syncd_debug_reset_sync_io_q;
  wire  _T_1 = ~_debug_reset_syncd_WIRE;
  reg  clock_en;
  wire  _T_2 = SimDTM_exit >= 32'h2;
  wire  _T_5 = ~reset;
  ExampleRocketSystem ldut (
    .clock(ldut_clock),
    .reset(ldut_reset),
    .mem_axi4_0_aw_ready(ldut_mem_axi4_0_aw_ready),
    .mem_axi4_0_aw_valid(ldut_mem_axi4_0_aw_valid),
    .mem_axi4_0_aw_bits_id(ldut_mem_axi4_0_aw_bits_id),
    .mem_axi4_0_aw_bits_addr(ldut_mem_axi4_0_aw_bits_addr),
    .mem_axi4_0_aw_bits_len(ldut_mem_axi4_0_aw_bits_len),
    .mem_axi4_0_aw_bits_size(ldut_mem_axi4_0_aw_bits_size),
    .mem_axi4_0_aw_bits_burst(ldut_mem_axi4_0_aw_bits_burst),
    .mem_axi4_0_aw_bits_lock(ldut_mem_axi4_0_aw_bits_lock),
    .mem_axi4_0_aw_bits_cache(ldut_mem_axi4_0_aw_bits_cache),
    .mem_axi4_0_aw_bits_prot(ldut_mem_axi4_0_aw_bits_prot),
    .mem_axi4_0_aw_bits_qos(ldut_mem_axi4_0_aw_bits_qos),
    .mem_axi4_0_w_ready(ldut_mem_axi4_0_w_ready),
    .mem_axi4_0_w_valid(ldut_mem_axi4_0_w_valid),
    .mem_axi4_0_w_bits_data(ldut_mem_axi4_0_w_bits_data),
    .mem_axi4_0_w_bits_strb(ldut_mem_axi4_0_w_bits_strb),
    .mem_axi4_0_w_bits_last(ldut_mem_axi4_0_w_bits_last),
    .mem_axi4_0_b_ready(ldut_mem_axi4_0_b_ready),
    .mem_axi4_0_b_valid(ldut_mem_axi4_0_b_valid),
    .mem_axi4_0_b_bits_id(ldut_mem_axi4_0_b_bits_id),
    .mem_axi4_0_b_bits_resp(ldut_mem_axi4_0_b_bits_resp),
    .mem_axi4_0_ar_ready(ldut_mem_axi4_0_ar_ready),
    .mem_axi4_0_ar_valid(ldut_mem_axi4_0_ar_valid),
    .mem_axi4_0_ar_bits_id(ldut_mem_axi4_0_ar_bits_id),
    .mem_axi4_0_ar_bits_addr(ldut_mem_axi4_0_ar_bits_addr),
    .mem_axi4_0_ar_bits_len(ldut_mem_axi4_0_ar_bits_len),
    .mem_axi4_0_ar_bits_size(ldut_mem_axi4_0_ar_bits_size),
    .mem_axi4_0_ar_bits_burst(ldut_mem_axi4_0_ar_bits_burst),
    .mem_axi4_0_ar_bits_lock(ldut_mem_axi4_0_ar_bits_lock),
    .mem_axi4_0_ar_bits_cache(ldut_mem_axi4_0_ar_bits_cache),
    .mem_axi4_0_ar_bits_prot(ldut_mem_axi4_0_ar_bits_prot),
    .mem_axi4_0_ar_bits_qos(ldut_mem_axi4_0_ar_bits_qos),
    .mem_axi4_0_r_ready(ldut_mem_axi4_0_r_ready),
    .mem_axi4_0_r_valid(ldut_mem_axi4_0_r_valid),
    .mem_axi4_0_r_bits_id(ldut_mem_axi4_0_r_bits_id),
    .mem_axi4_0_r_bits_data(ldut_mem_axi4_0_r_bits_data),
    .mem_axi4_0_r_bits_resp(ldut_mem_axi4_0_r_bits_resp),
    .mem_axi4_0_r_bits_last(ldut_mem_axi4_0_r_bits_last),
    .mmio_axi4_0_aw_ready(ldut_mmio_axi4_0_aw_ready),
    .mmio_axi4_0_aw_valid(ldut_mmio_axi4_0_aw_valid),
    .mmio_axi4_0_aw_bits_id(ldut_mmio_axi4_0_aw_bits_id),
    .mmio_axi4_0_aw_bits_addr(ldut_mmio_axi4_0_aw_bits_addr),
    .mmio_axi4_0_aw_bits_len(ldut_mmio_axi4_0_aw_bits_len),
    .mmio_axi4_0_aw_bits_size(ldut_mmio_axi4_0_aw_bits_size),
    .mmio_axi4_0_aw_bits_burst(ldut_mmio_axi4_0_aw_bits_burst),
    .mmio_axi4_0_aw_bits_lock(ldut_mmio_axi4_0_aw_bits_lock),
    .mmio_axi4_0_aw_bits_cache(ldut_mmio_axi4_0_aw_bits_cache),
    .mmio_axi4_0_aw_bits_prot(ldut_mmio_axi4_0_aw_bits_prot),
    .mmio_axi4_0_aw_bits_qos(ldut_mmio_axi4_0_aw_bits_qos),
    .mmio_axi4_0_w_ready(ldut_mmio_axi4_0_w_ready),
    .mmio_axi4_0_w_valid(ldut_mmio_axi4_0_w_valid),
    .mmio_axi4_0_w_bits_data(ldut_mmio_axi4_0_w_bits_data),
    .mmio_axi4_0_w_bits_strb(ldut_mmio_axi4_0_w_bits_strb),
    .mmio_axi4_0_w_bits_last(ldut_mmio_axi4_0_w_bits_last),
    .mmio_axi4_0_b_ready(ldut_mmio_axi4_0_b_ready),
    .mmio_axi4_0_b_valid(ldut_mmio_axi4_0_b_valid),
    .mmio_axi4_0_b_bits_id(ldut_mmio_axi4_0_b_bits_id),
    .mmio_axi4_0_b_bits_resp(ldut_mmio_axi4_0_b_bits_resp),
    .mmio_axi4_0_ar_ready(ldut_mmio_axi4_0_ar_ready),
    .mmio_axi4_0_ar_valid(ldut_mmio_axi4_0_ar_valid),
    .mmio_axi4_0_ar_bits_id(ldut_mmio_axi4_0_ar_bits_id),
    .mmio_axi4_0_ar_bits_addr(ldut_mmio_axi4_0_ar_bits_addr),
    .mmio_axi4_0_ar_bits_len(ldut_mmio_axi4_0_ar_bits_len),
    .mmio_axi4_0_ar_bits_size(ldut_mmio_axi4_0_ar_bits_size),
    .mmio_axi4_0_ar_bits_burst(ldut_mmio_axi4_0_ar_bits_burst),
    .mmio_axi4_0_ar_bits_lock(ldut_mmio_axi4_0_ar_bits_lock),
    .mmio_axi4_0_ar_bits_cache(ldut_mmio_axi4_0_ar_bits_cache),
    .mmio_axi4_0_ar_bits_prot(ldut_mmio_axi4_0_ar_bits_prot),
    .mmio_axi4_0_ar_bits_qos(ldut_mmio_axi4_0_ar_bits_qos),
    .mmio_axi4_0_r_ready(ldut_mmio_axi4_0_r_ready),
    .mmio_axi4_0_r_valid(ldut_mmio_axi4_0_r_valid),
    .mmio_axi4_0_r_bits_id(ldut_mmio_axi4_0_r_bits_id),
    .mmio_axi4_0_r_bits_data(ldut_mmio_axi4_0_r_bits_data),
    .mmio_axi4_0_r_bits_resp(ldut_mmio_axi4_0_r_bits_resp),
    .mmio_axi4_0_r_bits_last(ldut_mmio_axi4_0_r_bits_last),
    .l2_frontend_bus_axi4_0_aw_ready(ldut_l2_frontend_bus_axi4_0_aw_ready),
    .l2_frontend_bus_axi4_0_aw_valid(ldut_l2_frontend_bus_axi4_0_aw_valid),
    .l2_frontend_bus_axi4_0_aw_bits_id(ldut_l2_frontend_bus_axi4_0_aw_bits_id),
    .l2_frontend_bus_axi4_0_aw_bits_addr(ldut_l2_frontend_bus_axi4_0_aw_bits_addr),
    .l2_frontend_bus_axi4_0_aw_bits_len(ldut_l2_frontend_bus_axi4_0_aw_bits_len),
    .l2_frontend_bus_axi4_0_aw_bits_size(ldut_l2_frontend_bus_axi4_0_aw_bits_size),
    .l2_frontend_bus_axi4_0_aw_bits_burst(ldut_l2_frontend_bus_axi4_0_aw_bits_burst),
    .l2_frontend_bus_axi4_0_aw_bits_lock(ldut_l2_frontend_bus_axi4_0_aw_bits_lock),
    .l2_frontend_bus_axi4_0_aw_bits_cache(ldut_l2_frontend_bus_axi4_0_aw_bits_cache),
    .l2_frontend_bus_axi4_0_aw_bits_prot(ldut_l2_frontend_bus_axi4_0_aw_bits_prot),
    .l2_frontend_bus_axi4_0_aw_bits_qos(ldut_l2_frontend_bus_axi4_0_aw_bits_qos),
    .l2_frontend_bus_axi4_0_w_ready(ldut_l2_frontend_bus_axi4_0_w_ready),
    .l2_frontend_bus_axi4_0_w_valid(ldut_l2_frontend_bus_axi4_0_w_valid),
    .l2_frontend_bus_axi4_0_w_bits_data(ldut_l2_frontend_bus_axi4_0_w_bits_data),
    .l2_frontend_bus_axi4_0_w_bits_strb(ldut_l2_frontend_bus_axi4_0_w_bits_strb),
    .l2_frontend_bus_axi4_0_w_bits_last(ldut_l2_frontend_bus_axi4_0_w_bits_last),
    .l2_frontend_bus_axi4_0_b_ready(ldut_l2_frontend_bus_axi4_0_b_ready),
    .l2_frontend_bus_axi4_0_b_valid(ldut_l2_frontend_bus_axi4_0_b_valid),
    .l2_frontend_bus_axi4_0_b_bits_id(ldut_l2_frontend_bus_axi4_0_b_bits_id),
    .l2_frontend_bus_axi4_0_b_bits_resp(ldut_l2_frontend_bus_axi4_0_b_bits_resp),
    .l2_frontend_bus_axi4_0_ar_ready(ldut_l2_frontend_bus_axi4_0_ar_ready),
    .l2_frontend_bus_axi4_0_ar_valid(ldut_l2_frontend_bus_axi4_0_ar_valid),
    .l2_frontend_bus_axi4_0_ar_bits_id(ldut_l2_frontend_bus_axi4_0_ar_bits_id),
    .l2_frontend_bus_axi4_0_ar_bits_addr(ldut_l2_frontend_bus_axi4_0_ar_bits_addr),
    .l2_frontend_bus_axi4_0_ar_bits_len(ldut_l2_frontend_bus_axi4_0_ar_bits_len),
    .l2_frontend_bus_axi4_0_ar_bits_size(ldut_l2_frontend_bus_axi4_0_ar_bits_size),
    .l2_frontend_bus_axi4_0_ar_bits_burst(ldut_l2_frontend_bus_axi4_0_ar_bits_burst),
    .l2_frontend_bus_axi4_0_ar_bits_lock(ldut_l2_frontend_bus_axi4_0_ar_bits_lock),
    .l2_frontend_bus_axi4_0_ar_bits_cache(ldut_l2_frontend_bus_axi4_0_ar_bits_cache),
    .l2_frontend_bus_axi4_0_ar_bits_prot(ldut_l2_frontend_bus_axi4_0_ar_bits_prot),
    .l2_frontend_bus_axi4_0_ar_bits_qos(ldut_l2_frontend_bus_axi4_0_ar_bits_qos),
    .l2_frontend_bus_axi4_0_r_ready(ldut_l2_frontend_bus_axi4_0_r_ready),
    .l2_frontend_bus_axi4_0_r_valid(ldut_l2_frontend_bus_axi4_0_r_valid),
    .l2_frontend_bus_axi4_0_r_bits_id(ldut_l2_frontend_bus_axi4_0_r_bits_id),
    .l2_frontend_bus_axi4_0_r_bits_data(ldut_l2_frontend_bus_axi4_0_r_bits_data),
    .l2_frontend_bus_axi4_0_r_bits_resp(ldut_l2_frontend_bus_axi4_0_r_bits_resp),
    .l2_frontend_bus_axi4_0_r_bits_last(ldut_l2_frontend_bus_axi4_0_r_bits_last),
    .resetctrl_hartIsInReset_0(ldut_resetctrl_hartIsInReset_0),
    .debug_clock(ldut_debug_clock),
    .debug_reset(ldut_debug_reset),
    .debug_clockeddmi_dmi_req_ready(ldut_debug_clockeddmi_dmi_req_ready),
    .debug_clockeddmi_dmi_req_valid(ldut_debug_clockeddmi_dmi_req_valid),
    .debug_clockeddmi_dmi_req_bits_addr(ldut_debug_clockeddmi_dmi_req_bits_addr),
    .debug_clockeddmi_dmi_req_bits_data(ldut_debug_clockeddmi_dmi_req_bits_data),
    .debug_clockeddmi_dmi_req_bits_op(ldut_debug_clockeddmi_dmi_req_bits_op),
    .debug_clockeddmi_dmi_resp_ready(ldut_debug_clockeddmi_dmi_resp_ready),
    .debug_clockeddmi_dmi_resp_valid(ldut_debug_clockeddmi_dmi_resp_valid),
    .debug_clockeddmi_dmi_resp_bits_data(ldut_debug_clockeddmi_dmi_resp_bits_data),
    .debug_clockeddmi_dmi_resp_bits_resp(ldut_debug_clockeddmi_dmi_resp_bits_resp),
    .debug_clockeddmi_dmiClock(ldut_debug_clockeddmi_dmiClock),
    .debug_clockeddmi_dmiReset(ldut_debug_clockeddmi_dmiReset),
    .debug_ndreset(ldut_debug_ndreset),
    .debug_dmactive(ldut_debug_dmactive),
    .debug_dmactiveAck(ldut_debug_dmactiveAck),
    .interrupts(ldut_interrupts)
  );
  AsyncResetRegVec_w1_i0 ldut_reset_reg (
    .clock(ldut_reset_reg_clock),
    .reset(ldut_reset_reg_reset),
    .io_d(ldut_reset_reg_io_d),
    .io_q(ldut_reset_reg_io_q)
  );
  SimAXIMem mem (
    .clock(mem_clock),
    .reset(mem_reset),
    .io_axi4_0_aw_ready(mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_bits_id(mem_io_axi4_0_aw_bits_id),
    .io_axi4_0_aw_bits_addr(mem_io_axi4_0_aw_bits_addr),
    .io_axi4_0_aw_bits_len(mem_io_axi4_0_aw_bits_len),
    .io_axi4_0_aw_bits_size(mem_io_axi4_0_aw_bits_size),
    .io_axi4_0_aw_bits_burst(mem_io_axi4_0_aw_bits_burst),
    .io_axi4_0_w_ready(mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mem_io_axi4_0_w_valid),
    .io_axi4_0_w_bits_data(mem_io_axi4_0_w_bits_data),
    .io_axi4_0_w_bits_strb(mem_io_axi4_0_w_bits_strb),
    .io_axi4_0_w_bits_last(mem_io_axi4_0_w_bits_last),
    .io_axi4_0_b_ready(mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mem_io_axi4_0_b_valid),
    .io_axi4_0_b_bits_id(mem_io_axi4_0_b_bits_id),
    .io_axi4_0_b_bits_resp(mem_io_axi4_0_b_bits_resp),
    .io_axi4_0_ar_ready(mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_bits_id(mem_io_axi4_0_ar_bits_id),
    .io_axi4_0_ar_bits_addr(mem_io_axi4_0_ar_bits_addr),
    .io_axi4_0_ar_bits_len(mem_io_axi4_0_ar_bits_len),
    .io_axi4_0_ar_bits_size(mem_io_axi4_0_ar_bits_size),
    .io_axi4_0_ar_bits_burst(mem_io_axi4_0_ar_bits_burst),
    .io_axi4_0_r_ready(mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mem_io_axi4_0_r_valid),
    .io_axi4_0_r_bits_id(mem_io_axi4_0_r_bits_id),
    .io_axi4_0_r_bits_data(mem_io_axi4_0_r_bits_data),
    .io_axi4_0_r_bits_resp(mem_io_axi4_0_r_bits_resp),
    .io_axi4_0_r_bits_last(mem_io_axi4_0_r_bits_last)
  );
  SimAXIMem_1 mmio_mem (
    .clock(mmio_mem_clock),
    .reset(mmio_mem_reset),
    .io_axi4_0_aw_ready(mmio_mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mmio_mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_bits_id(mmio_mem_io_axi4_0_aw_bits_id),
    .io_axi4_0_aw_bits_addr(mmio_mem_io_axi4_0_aw_bits_addr),
    .io_axi4_0_aw_bits_len(mmio_mem_io_axi4_0_aw_bits_len),
    .io_axi4_0_aw_bits_size(mmio_mem_io_axi4_0_aw_bits_size),
    .io_axi4_0_aw_bits_burst(mmio_mem_io_axi4_0_aw_bits_burst),
    .io_axi4_0_w_ready(mmio_mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mmio_mem_io_axi4_0_w_valid),
    .io_axi4_0_w_bits_data(mmio_mem_io_axi4_0_w_bits_data),
    .io_axi4_0_w_bits_strb(mmio_mem_io_axi4_0_w_bits_strb),
    .io_axi4_0_w_bits_last(mmio_mem_io_axi4_0_w_bits_last),
    .io_axi4_0_b_ready(mmio_mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mmio_mem_io_axi4_0_b_valid),
    .io_axi4_0_b_bits_id(mmio_mem_io_axi4_0_b_bits_id),
    .io_axi4_0_b_bits_resp(mmio_mem_io_axi4_0_b_bits_resp),
    .io_axi4_0_ar_ready(mmio_mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mmio_mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_bits_id(mmio_mem_io_axi4_0_ar_bits_id),
    .io_axi4_0_ar_bits_addr(mmio_mem_io_axi4_0_ar_bits_addr),
    .io_axi4_0_ar_bits_len(mmio_mem_io_axi4_0_ar_bits_len),
    .io_axi4_0_ar_bits_size(mmio_mem_io_axi4_0_ar_bits_size),
    .io_axi4_0_ar_bits_burst(mmio_mem_io_axi4_0_ar_bits_burst),
    .io_axi4_0_r_ready(mmio_mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mmio_mem_io_axi4_0_r_valid),
    .io_axi4_0_r_bits_id(mmio_mem_io_axi4_0_r_bits_id),
    .io_axi4_0_r_bits_data(mmio_mem_io_axi4_0_r_bits_data),
    .io_axi4_0_r_bits_resp(mmio_mem_io_axi4_0_r_bits_resp),
    .io_axi4_0_r_bits_last(mmio_mem_io_axi4_0_r_bits_last)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 debug_reset_syncd_debug_reset_sync (
    .clock(debug_reset_syncd_debug_reset_sync_clock),
    .reset(debug_reset_syncd_debug_reset_sync_reset),
    .io_d(debug_reset_syncd_debug_reset_sync_io_d),
    .io_q(debug_reset_syncd_debug_reset_sync_io_q)
  );
  ResetSynchronizerShiftReg_w1_d3_i0 dmactiveAck_dmactiveAck (
    .clock(dmactiveAck_dmactiveAck_clock),
    .reset(dmactiveAck_dmactiveAck_reset),
    .io_d(dmactiveAck_dmactiveAck_io_d),
    .io_q(dmactiveAck_dmactiveAck_io_q)
  );
  EICG_wrapper gated_clock_debug_clock_gate (
    .in(gated_clock_debug_clock_gate_in),
    .test_en(gated_clock_debug_clock_gate_test_en),
    .en(gated_clock_debug_clock_gate_en),
    .out(gated_clock_debug_clock_gate_out)
  );
  SimDTM SimDTM (
    .clk(SimDTM_clk),
    .reset(SimDTM_reset),
    .debug_req_ready(SimDTM_debug_req_ready),
    .debug_req_valid(SimDTM_debug_req_valid),
    .debug_req_bits_addr(SimDTM_debug_req_bits_addr),
    .debug_req_bits_data(SimDTM_debug_req_bits_data),
    .debug_req_bits_op(SimDTM_debug_req_bits_op),
    .debug_resp_ready(SimDTM_debug_resp_ready),
    .debug_resp_valid(SimDTM_debug_resp_valid),
    .debug_resp_bits_data(SimDTM_debug_resp_bits_data),
    .debug_resp_bits_resp(SimDTM_debug_resp_bits_resp),
    .exit(SimDTM_exit)
  );
  assign io_success = SimDTM_exit == 32'h1;
  assign ldut_clock = clock;
  assign ldut_reset = reset | ldut_reset_reg_io_q;
  assign ldut_mem_axi4_0_aw_ready = mem_io_axi4_0_aw_ready;
  assign ldut_mem_axi4_0_w_ready = mem_io_axi4_0_w_ready;
  assign ldut_mem_axi4_0_b_valid = mem_io_axi4_0_b_valid;
  assign ldut_mem_axi4_0_b_bits_id = mem_io_axi4_0_b_bits_id;
  assign ldut_mem_axi4_0_b_bits_resp = mem_io_axi4_0_b_bits_resp;
  assign ldut_mem_axi4_0_ar_ready = mem_io_axi4_0_ar_ready;
  assign ldut_mem_axi4_0_r_valid = mem_io_axi4_0_r_valid;
  assign ldut_mem_axi4_0_r_bits_id = mem_io_axi4_0_r_bits_id;
  assign ldut_mem_axi4_0_r_bits_data = mem_io_axi4_0_r_bits_data;
  assign ldut_mem_axi4_0_r_bits_resp = mem_io_axi4_0_r_bits_resp;
  assign ldut_mem_axi4_0_r_bits_last = mem_io_axi4_0_r_bits_last;
  assign ldut_mmio_axi4_0_aw_ready = mmio_mem_io_axi4_0_aw_ready;
  assign ldut_mmio_axi4_0_w_ready = mmio_mem_io_axi4_0_w_ready;
  assign ldut_mmio_axi4_0_b_valid = mmio_mem_io_axi4_0_b_valid;
  assign ldut_mmio_axi4_0_b_bits_id = mmio_mem_io_axi4_0_b_bits_id;
  assign ldut_mmio_axi4_0_b_bits_resp = mmio_mem_io_axi4_0_b_bits_resp;
  assign ldut_mmio_axi4_0_ar_ready = mmio_mem_io_axi4_0_ar_ready;
  assign ldut_mmio_axi4_0_r_valid = mmio_mem_io_axi4_0_r_valid;
  assign ldut_mmio_axi4_0_r_bits_id = mmio_mem_io_axi4_0_r_bits_id;
  assign ldut_mmio_axi4_0_r_bits_data = mmio_mem_io_axi4_0_r_bits_data;
  assign ldut_mmio_axi4_0_r_bits_resp = mmio_mem_io_axi4_0_r_bits_resp;
  assign ldut_mmio_axi4_0_r_bits_last = mmio_mem_io_axi4_0_r_bits_last;
  assign ldut_l2_frontend_bus_axi4_0_aw_valid = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_id = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_addr = 32'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_len = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_size = 3'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_burst = 2'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_lock = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_cache = 4'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_prot = 3'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_qos = 4'h0;
  assign ldut_l2_frontend_bus_axi4_0_w_valid = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_w_bits_data = 64'h0;
  assign ldut_l2_frontend_bus_axi4_0_w_bits_strb = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_w_bits_last = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_b_ready = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_valid = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_id = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_addr = 32'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_len = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_size = 3'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_burst = 2'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_lock = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_cache = 4'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_prot = 3'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_qos = 4'h0;
  assign ldut_l2_frontend_bus_axi4_0_r_ready = 1'h0;
  assign ldut_resetctrl_hartIsInReset_0 = reset;
  assign ldut_debug_clock = gated_clock_debug_clock_gate_out;
  assign ldut_debug_reset = ~_debug_reset_syncd_WIRE;
  assign ldut_debug_clockeddmi_dmi_req_valid = SimDTM_debug_req_valid;
  assign ldut_debug_clockeddmi_dmi_req_bits_addr = SimDTM_debug_req_bits_addr;
  assign ldut_debug_clockeddmi_dmi_req_bits_data = SimDTM_debug_req_bits_data;
  assign ldut_debug_clockeddmi_dmi_req_bits_op = SimDTM_debug_req_bits_op;
  assign ldut_debug_clockeddmi_dmi_resp_ready = SimDTM_debug_resp_ready;
  assign ldut_debug_clockeddmi_dmiClock = clock;
  assign ldut_debug_clockeddmi_dmiReset = reset;
  assign ldut_debug_dmactiveAck = dmactiveAck_dmactiveAck_io_q;
  assign ldut_interrupts = 2'h0;
  assign ldut_reset_reg_clock = clock;
  assign ldut_reset_reg_reset = reset;
  assign ldut_reset_reg_io_d = ldut_debug_ndreset;
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_axi4_0_aw_valid = ldut_mem_axi4_0_aw_valid;
  assign mem_io_axi4_0_aw_bits_id = ldut_mem_axi4_0_aw_bits_id;
  assign mem_io_axi4_0_aw_bits_addr = ldut_mem_axi4_0_aw_bits_addr;
  assign mem_io_axi4_0_aw_bits_len = ldut_mem_axi4_0_aw_bits_len;
  assign mem_io_axi4_0_aw_bits_size = ldut_mem_axi4_0_aw_bits_size;
  assign mem_io_axi4_0_aw_bits_burst = ldut_mem_axi4_0_aw_bits_burst;
  assign mem_io_axi4_0_w_valid = ldut_mem_axi4_0_w_valid;
  assign mem_io_axi4_0_w_bits_data = ldut_mem_axi4_0_w_bits_data;
  assign mem_io_axi4_0_w_bits_strb = ldut_mem_axi4_0_w_bits_strb;
  assign mem_io_axi4_0_w_bits_last = ldut_mem_axi4_0_w_bits_last;
  assign mem_io_axi4_0_b_ready = ldut_mem_axi4_0_b_ready;
  assign mem_io_axi4_0_ar_valid = ldut_mem_axi4_0_ar_valid;
  assign mem_io_axi4_0_ar_bits_id = ldut_mem_axi4_0_ar_bits_id;
  assign mem_io_axi4_0_ar_bits_addr = ldut_mem_axi4_0_ar_bits_addr;
  assign mem_io_axi4_0_ar_bits_len = ldut_mem_axi4_0_ar_bits_len;
  assign mem_io_axi4_0_ar_bits_size = ldut_mem_axi4_0_ar_bits_size;
  assign mem_io_axi4_0_ar_bits_burst = ldut_mem_axi4_0_ar_bits_burst;
  assign mem_io_axi4_0_r_ready = ldut_mem_axi4_0_r_ready;
  assign mmio_mem_clock = clock;
  assign mmio_mem_reset = reset;
  assign mmio_mem_io_axi4_0_aw_valid = ldut_mmio_axi4_0_aw_valid;
  assign mmio_mem_io_axi4_0_aw_bits_id = ldut_mmio_axi4_0_aw_bits_id;
  assign mmio_mem_io_axi4_0_aw_bits_addr = ldut_mmio_axi4_0_aw_bits_addr;
  assign mmio_mem_io_axi4_0_aw_bits_len = ldut_mmio_axi4_0_aw_bits_len;
  assign mmio_mem_io_axi4_0_aw_bits_size = ldut_mmio_axi4_0_aw_bits_size;
  assign mmio_mem_io_axi4_0_aw_bits_burst = ldut_mmio_axi4_0_aw_bits_burst;
  assign mmio_mem_io_axi4_0_w_valid = ldut_mmio_axi4_0_w_valid;
  assign mmio_mem_io_axi4_0_w_bits_data = ldut_mmio_axi4_0_w_bits_data;
  assign mmio_mem_io_axi4_0_w_bits_strb = ldut_mmio_axi4_0_w_bits_strb;
  assign mmio_mem_io_axi4_0_w_bits_last = ldut_mmio_axi4_0_w_bits_last;
  assign mmio_mem_io_axi4_0_b_ready = ldut_mmio_axi4_0_b_ready;
  assign mmio_mem_io_axi4_0_ar_valid = ldut_mmio_axi4_0_ar_valid;
  assign mmio_mem_io_axi4_0_ar_bits_id = ldut_mmio_axi4_0_ar_bits_id;
  assign mmio_mem_io_axi4_0_ar_bits_addr = ldut_mmio_axi4_0_ar_bits_addr;
  assign mmio_mem_io_axi4_0_ar_bits_len = ldut_mmio_axi4_0_ar_bits_len;
  assign mmio_mem_io_axi4_0_ar_bits_size = ldut_mmio_axi4_0_ar_bits_size;
  assign mmio_mem_io_axi4_0_ar_bits_burst = ldut_mmio_axi4_0_ar_bits_burst;
  assign mmio_mem_io_axi4_0_r_ready = ldut_mmio_axi4_0_r_ready;
  assign debug_reset_syncd_debug_reset_sync_clock = clock;
  assign debug_reset_syncd_debug_reset_sync_reset = ldut_debug_clockeddmi_dmiReset;
  assign debug_reset_syncd_debug_reset_sync_io_d = 1'h1;
  assign dmactiveAck_dmactiveAck_clock = clock;
  assign dmactiveAck_dmactiveAck_reset = ~_debug_reset_syncd_WIRE;
  assign dmactiveAck_dmactiveAck_io_d = ldut_debug_dmactive;
  assign gated_clock_debug_clock_gate_in = clock;
  assign gated_clock_debug_clock_gate_test_en = 1'h0;
  assign gated_clock_debug_clock_gate_en = clock_en;
  assign SimDTM_clk = clock;
  assign SimDTM_reset = reset;
  assign SimDTM_debug_req_ready = ldut_debug_clockeddmi_dmi_req_ready;
  assign SimDTM_debug_resp_valid = ldut_debug_clockeddmi_dmi_resp_valid;
  assign SimDTM_debug_resp_bits_data = ldut_debug_clockeddmi_dmi_resp_bits_data;
  assign SimDTM_debug_resp_bits_resp = ldut_debug_clockeddmi_dmi_resp_bits_resp;
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2 & ~reset) begin
          $fwrite(32'h80000002,"*** FAILED *** (exit code = %d)\n",{{1'd0}, SimDTM_exit[31:1]});
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2 & _T_5) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock or posedge _T_1) begin
    if (_T_1) begin
      clock_en <= 1'h1;
    end else begin
      clock_en <= dmactiveAck_dmactiveAck_io_q;
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
  clock_en = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_1) begin
    clock_en = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule