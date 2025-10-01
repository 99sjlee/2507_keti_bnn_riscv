`default_nettype wire
module TLWidthWidget_4(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [3:0]  auto_in_a_bits_size,
  input  [3:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input         auto_in_a_bits_user_amba_prot_bufferable,
  input         auto_in_a_bits_user_amba_prot_modifiable,
  input         auto_in_a_bits_user_amba_prot_readalloc,
  input         auto_in_a_bits_user_amba_prot_writealloc,
  input         auto_in_a_bits_user_amba_prot_privileged,
  input         auto_in_a_bits_user_amba_prot_secure,
  input         auto_in_a_bits_user_amba_prot_fetch,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [3:0]  auto_in_d_bits_size,
  output [3:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
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
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [3:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [31:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [3:0] monitor_io_in_a_bits_size;
  wire [3:0] monitor_io_in_a_bits_source;
  wire [31:0] monitor_io_in_a_bits_address;
  wire [7:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [3:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  repeated_repeater_clock;
  wire  repeated_repeater_reset;
  wire  repeated_repeater_io_repeat;
  wire  repeated_repeater_io_enq_ready;
  wire  repeated_repeater_io_enq_valid;
  wire [2:0] repeated_repeater_io_enq_bits_opcode;
  wire [3:0] repeated_repeater_io_enq_bits_size;
  wire [3:0] repeated_repeater_io_enq_bits_source;
  wire [31:0] repeated_repeater_io_enq_bits_address;
  wire  repeated_repeater_io_enq_bits_user_amba_prot_bufferable;
  wire  repeated_repeater_io_enq_bits_user_amba_prot_modifiable;
  wire  repeated_repeater_io_enq_bits_user_amba_prot_readalloc;
  wire  repeated_repeater_io_enq_bits_user_amba_prot_writealloc;
  wire  repeated_repeater_io_enq_bits_user_amba_prot_privileged;
  wire  repeated_repeater_io_enq_bits_user_amba_prot_secure;
  wire  repeated_repeater_io_enq_bits_user_amba_prot_fetch;
  wire [7:0] repeated_repeater_io_enq_bits_mask;
  wire [63:0] repeated_repeater_io_enq_bits_data;
  wire  repeated_repeater_io_deq_ready;
  wire  repeated_repeater_io_deq_valid;
  wire [2:0] repeated_repeater_io_deq_bits_opcode;
  wire [3:0] repeated_repeater_io_deq_bits_size;
  wire [3:0] repeated_repeater_io_deq_bits_source;
  wire [31:0] repeated_repeater_io_deq_bits_address;
  wire  repeated_repeater_io_deq_bits_user_amba_prot_bufferable;
  wire  repeated_repeater_io_deq_bits_user_amba_prot_modifiable;
  wire  repeated_repeater_io_deq_bits_user_amba_prot_readalloc;
  wire  repeated_repeater_io_deq_bits_user_amba_prot_writealloc;
  wire  repeated_repeater_io_deq_bits_user_amba_prot_privileged;
  wire  repeated_repeater_io_deq_bits_user_amba_prot_secure;
  wire  repeated_repeater_io_deq_bits_user_amba_prot_fetch;
  wire [7:0] repeated_repeater_io_deq_bits_mask;
  wire [63:0] repeated_repeater_io_deq_bits_data;
  wire [63:0] cated_bits_data = {repeated_repeater_io_deq_bits_data[63:32],auto_in_a_bits_data[31:0]};
  wire [2:0] cated_bits_opcode = repeated_repeater_io_deq_bits_opcode;
  wire  repeat_hasData = ~cated_bits_opcode[2];
  wire [3:0] cated_bits_size = repeated_repeater_io_deq_bits_size;
  wire [17:0] _repeat_limit_T_1 = 18'h7 << cated_bits_size;
  wire [2:0] _repeat_limit_T_3 = ~_repeat_limit_T_1[2:0];
  wire  repeat_limit = _repeat_limit_T_3[2];
  reg  repeat_count;
  wire  repeat_last = repeat_count == repeat_limit | ~repeat_hasData;
  wire  cated_valid = repeated_repeater_io_deq_valid;
  wire  _repeat_T = auto_out_a_ready & cated_valid;
  wire [31:0] cated_bits_address = repeated_repeater_io_deq_bits_address;
  wire  repeat_sel = cated_bits_address[2];
  wire  repeat_index = repeat_sel | repeat_count;
  wire [31:0] repeat_bundleOut_0_a_bits_data_mux_0 = cated_bits_data[31:0];
  wire [31:0] repeat_bundleOut_0_a_bits_data_mux_1 = cated_bits_data[63:32];
  wire [7:0] cated_bits_mask = repeated_repeater_io_deq_bits_mask;
  wire [3:0] repeat_bundleOut_0_a_bits_mask_mux_0 = cated_bits_mask[3:0];
  wire [3:0] repeat_bundleOut_0_a_bits_mask_mux_1 = cated_bits_mask[7:4];
  wire  hasData = auto_out_d_bits_opcode[0];
  wire [17:0] _limit_T_1 = 18'h7 << auto_out_d_bits_size;
  wire [2:0] _limit_T_3 = ~_limit_T_1[2:0];
  wire  limit = _limit_T_3[2];
  reg  count;
  wire  last = count == limit | ~hasData;
  wire  enable_0 = ~(|(count & limit));
  reg  corrupt_reg;
  wire  corrupt_out = auto_out_d_bits_corrupt | corrupt_reg;
  wire  _bundleOut_0_d_ready_T = ~last;
  wire  bundleOut_0_d_ready = auto_in_d_ready | ~last;
  wire  _T = bundleOut_0_d_ready & auto_out_d_valid;
  reg  bundleIn_0_d_bits_data_rdata_written_once;
  wire  bundleIn_0_d_bits_data_masked_enable_0 = enable_0 | ~bundleIn_0_d_bits_data_rdata_written_once;
  reg [31:0] bundleIn_0_d_bits_data_rdata_0;
  wire [31:0] bundleIn_0_d_bits_data_mdata_0 = bundleIn_0_d_bits_data_masked_enable_0 ? auto_out_d_bits_data :
    bundleIn_0_d_bits_data_rdata_0;
  wire  _GEN_10 = _T & _bundleOut_0_d_ready_T | bundleIn_0_d_bits_data_rdata_written_once;
  
  Repeater repeated_repeater (
    .clock(repeated_repeater_clock),
    .reset(repeated_repeater_reset),
    .io_repeat(repeated_repeater_io_repeat),
    .io_enq_ready(repeated_repeater_io_enq_ready),
    .io_enq_valid(repeated_repeater_io_enq_valid),
    .io_enq_bits_opcode(repeated_repeater_io_enq_bits_opcode),
    .io_enq_bits_size(repeated_repeater_io_enq_bits_size),
    .io_enq_bits_source(repeated_repeater_io_enq_bits_source),
    .io_enq_bits_address(repeated_repeater_io_enq_bits_address),
    .io_enq_bits_user_amba_prot_bufferable(repeated_repeater_io_enq_bits_user_amba_prot_bufferable),
    .io_enq_bits_user_amba_prot_modifiable(repeated_repeater_io_enq_bits_user_amba_prot_modifiable),
    .io_enq_bits_user_amba_prot_readalloc(repeated_repeater_io_enq_bits_user_amba_prot_readalloc),
    .io_enq_bits_user_amba_prot_writealloc(repeated_repeater_io_enq_bits_user_amba_prot_writealloc),
    .io_enq_bits_user_amba_prot_privileged(repeated_repeater_io_enq_bits_user_amba_prot_privileged),
    .io_enq_bits_user_amba_prot_secure(repeated_repeater_io_enq_bits_user_amba_prot_secure),
    .io_enq_bits_user_amba_prot_fetch(repeated_repeater_io_enq_bits_user_amba_prot_fetch),
    .io_enq_bits_mask(repeated_repeater_io_enq_bits_mask),
    .io_enq_bits_data(repeated_repeater_io_enq_bits_data),
    .io_deq_ready(repeated_repeater_io_deq_ready),
    .io_deq_valid(repeated_repeater_io_deq_valid),
    .io_deq_bits_opcode(repeated_repeater_io_deq_bits_opcode),
    .io_deq_bits_size(repeated_repeater_io_deq_bits_size),
    .io_deq_bits_source(repeated_repeater_io_deq_bits_source),
    .io_deq_bits_address(repeated_repeater_io_deq_bits_address),
    .io_deq_bits_user_amba_prot_bufferable(repeated_repeater_io_deq_bits_user_amba_prot_bufferable),
    .io_deq_bits_user_amba_prot_modifiable(repeated_repeater_io_deq_bits_user_amba_prot_modifiable),
    .io_deq_bits_user_amba_prot_readalloc(repeated_repeater_io_deq_bits_user_amba_prot_readalloc),
    .io_deq_bits_user_amba_prot_writealloc(repeated_repeater_io_deq_bits_user_amba_prot_writealloc),
    .io_deq_bits_user_amba_prot_privileged(repeated_repeater_io_deq_bits_user_amba_prot_privileged),
    .io_deq_bits_user_amba_prot_secure(repeated_repeater_io_deq_bits_user_amba_prot_secure),
    .io_deq_bits_user_amba_prot_fetch(repeated_repeater_io_deq_bits_user_amba_prot_fetch),
    .io_deq_bits_mask(repeated_repeater_io_deq_bits_mask),
    .io_deq_bits_data(repeated_repeater_io_deq_bits_data)
  );
  assign auto_in_a_ready = repeated_repeater_io_enq_ready;
  assign auto_in_d_valid = auto_out_d_valid & last;
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_source = auto_out_d_bits_source;
  assign auto_in_d_bits_denied = auto_out_d_bits_denied;
  assign auto_in_d_bits_data = {auto_out_d_bits_data,bundleIn_0_d_bits_data_mdata_0};
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt | corrupt_reg;
  assign auto_out_a_valid = repeated_repeater_io_deq_valid;
  assign auto_out_a_bits_opcode = repeated_repeater_io_deq_bits_opcode;
  assign auto_out_a_bits_size = repeated_repeater_io_deq_bits_size;
  assign auto_out_a_bits_source = repeated_repeater_io_deq_bits_source;
  assign auto_out_a_bits_address = repeated_repeater_io_deq_bits_address;
  assign auto_out_a_bits_user_amba_prot_bufferable = repeated_repeater_io_deq_bits_user_amba_prot_bufferable;
  assign auto_out_a_bits_user_amba_prot_modifiable = repeated_repeater_io_deq_bits_user_amba_prot_modifiable;
  assign auto_out_a_bits_user_amba_prot_readalloc = repeated_repeater_io_deq_bits_user_amba_prot_readalloc;
  assign auto_out_a_bits_user_amba_prot_writealloc = repeated_repeater_io_deq_bits_user_amba_prot_writealloc;
  assign auto_out_a_bits_user_amba_prot_privileged = repeated_repeater_io_deq_bits_user_amba_prot_privileged;
  assign auto_out_a_bits_user_amba_prot_secure = repeated_repeater_io_deq_bits_user_amba_prot_secure;
  assign auto_out_a_bits_user_amba_prot_fetch = repeated_repeater_io_deq_bits_user_amba_prot_fetch;
  assign auto_out_a_bits_mask = repeat_index ? repeat_bundleOut_0_a_bits_mask_mux_1 :
    repeat_bundleOut_0_a_bits_mask_mux_0;
  assign auto_out_a_bits_data = repeat_index ? repeat_bundleOut_0_a_bits_data_mux_1 :
    repeat_bundleOut_0_a_bits_data_mux_0;
  assign auto_out_d_ready = auto_in_d_ready | ~last;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = repeated_repeater_io_enq_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = auto_out_d_valid & last;
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param;
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size;
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source;
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink;
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt | corrupt_reg;
  assign repeated_repeater_clock = clock;
  assign repeated_repeater_reset = reset;
  assign repeated_repeater_io_repeat = ~repeat_last;
  assign repeated_repeater_io_enq_valid = auto_in_a_valid;
  assign repeated_repeater_io_enq_bits_opcode = auto_in_a_bits_opcode;
  assign repeated_repeater_io_enq_bits_size = auto_in_a_bits_size;
  assign repeated_repeater_io_enq_bits_source = auto_in_a_bits_source;
  assign repeated_repeater_io_enq_bits_address = auto_in_a_bits_address;
  assign repeated_repeater_io_enq_bits_user_amba_prot_bufferable = auto_in_a_bits_user_amba_prot_bufferable;
  assign repeated_repeater_io_enq_bits_user_amba_prot_modifiable = auto_in_a_bits_user_amba_prot_modifiable;
  assign repeated_repeater_io_enq_bits_user_amba_prot_readalloc = auto_in_a_bits_user_amba_prot_readalloc;
  assign repeated_repeater_io_enq_bits_user_amba_prot_writealloc = auto_in_a_bits_user_amba_prot_writealloc;
  assign repeated_repeater_io_enq_bits_user_amba_prot_privileged = auto_in_a_bits_user_amba_prot_privileged;
  assign repeated_repeater_io_enq_bits_user_amba_prot_secure = auto_in_a_bits_user_amba_prot_secure;
  assign repeated_repeater_io_enq_bits_user_amba_prot_fetch = auto_in_a_bits_user_amba_prot_fetch;
  assign repeated_repeater_io_enq_bits_mask = auto_in_a_bits_mask;
  assign repeated_repeater_io_enq_bits_data = auto_in_a_bits_data;
  assign repeated_repeater_io_deq_ready = auto_out_a_ready;
  always @(posedge clock) begin
    if (reset) begin
      repeat_count <= 1'h0;
    end else if (_repeat_T) begin
      if (repeat_last) begin
        repeat_count <= 1'h0;
      end else begin
        repeat_count <= repeat_count + 1'h1;
      end
    end
    if (reset) begin
      count <= 1'h0;
    end else if (_T) begin
      if (last) begin
        count <= 1'h0;
      end else begin
        count <= count + 1'h1;
      end
    end
    if (reset) begin
      corrupt_reg <= 1'h0;
    end else if (_T) begin
      if (last) begin
        corrupt_reg <= 1'h0;
      end else begin
        corrupt_reg <= corrupt_out;
      end
    end
    if (reset) begin
      bundleIn_0_d_bits_data_rdata_written_once <= 1'h0;
    end else begin
      bundleIn_0_d_bits_data_rdata_written_once <= _GEN_10;
    end
    if (_T & _bundleOut_0_d_ready_T) begin
      if (bundleIn_0_d_bits_data_masked_enable_0) begin
        bundleIn_0_d_bits_data_rdata_0 <= auto_out_d_bits_data;
      end
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
  repeat_count = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  count = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  corrupt_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  bundleIn_0_d_bits_data_rdata_written_once = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bundleIn_0_d_bits_data_rdata_0 = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule