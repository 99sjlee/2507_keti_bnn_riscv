`default_nettype wire
module TLBusBypassBar(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [8:0]   auto_in_a_bits_address,
  input  [31:0]  auto_in_a_bits_data,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
  output [1:0]   auto_in_d_bits_size,
  output         auto_in_d_bits_sink,
  output         auto_in_d_bits_denied,
  output [31:0]  auto_in_d_bits_data,
  output         auto_in_d_bits_corrupt,
  input          auto_out_1_a_ready,
  output         auto_out_1_a_valid,
  output [2:0]   auto_out_1_a_bits_opcode,
  output [8:0]   auto_out_1_a_bits_address,
  output [31:0]  auto_out_1_a_bits_data,
  output         auto_out_1_d_ready,
  input          auto_out_1_d_valid,
  input  [2:0]   auto_out_1_d_bits_opcode,
  input  [1:0]   auto_out_1_d_bits_param,
  input  [1:0]   auto_out_1_d_bits_size,
  input          auto_out_1_d_bits_source,
  input          auto_out_1_d_bits_sink,
  input          auto_out_1_d_bits_denied,
  input  [31:0]  auto_out_1_d_bits_data,
  input          auto_out_1_d_bits_corrupt,
  input          auto_out_0_a_ready,
  output         auto_out_0_a_valid,
  output [2:0]   auto_out_0_a_bits_opcode,
  output [127:0] auto_out_0_a_bits_address,
  output         auto_out_0_d_ready,
  input          auto_out_0_d_valid,
  input  [2:0]   auto_out_0_d_bits_opcode,
  input  [1:0]   auto_out_0_d_bits_size,
  input          auto_out_0_d_bits_denied,
  input          auto_out_0_d_bits_corrupt,
  input          io_bypass
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [8:0] monitor_io_in_a_bits_address;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [1:0] monitor_io_in_d_bits_size;
  wire  monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  reg  in_reset;
  reg  bypass_reg;
  wire  bypass = in_reset ? io_bypass : bypass_reg;
  reg [1:0] flight;
  reg  stall_counter;
  wire  stall_first = ~stall_counter;
  wire  stall = bypass != io_bypass & stall_first;
  wire  _bundleIn_0_a_ready_T = ~stall;
  wire  _bundleIn_0_a_ready_T_1 = bypass ? auto_out_0_a_ready : auto_out_1_a_ready;
  wire  in_a_ready = ~stall & _bundleIn_0_a_ready_T_1;
  wire  done = in_a_ready & auto_in_a_valid;
  reg  counter;
  wire  counter1 = counter - 1'h1;
  wire  a_first = ~counter;
  wire  in_d_valid = bypass ? auto_out_0_d_valid : auto_out_1_d_valid;
  wire  done_3 = auto_in_d_ready & in_d_valid;
  wire [2:0] in_d_bits_opcode = bypass ? auto_out_0_d_bits_opcode : auto_out_1_d_bits_opcode;
  reg  counter_3;
  wire  counter1_3 = counter_3 - 1'h1;
  wire  d_first = ~counter_3;
  wire  d_request = in_d_bits_opcode[2] & ~in_d_bits_opcode[1];
  wire  a_inc = done & a_first;
  wire  d_inc = done_3 & d_first & d_request;
  wire [1:0] inc = {a_inc,d_inc};
  wire [1:0] dec = {1'h0,done_3};
  wire [1:0] _next_flight_T_2 = inc[0] + inc[1];
  wire [1:0] _next_flight_T_5 = flight + _next_flight_T_2;
  wire [1:0] _next_flight_T_8 = dec[0] + dec[1];
  wire [1:0] next_flight = _next_flight_T_5 - _next_flight_T_8;
  wire  stall_counter1 = stall_counter - 1'h1;
  wire  _bundleOut_0_a_valid_T_1 = _bundleIn_0_a_ready_T & auto_in_a_valid;
  wire  _bundleOut_1_a_valid_T_2 = ~bypass;
  
  assign auto_in_a_ready = ~stall & _bundleIn_0_a_ready_T_1;
  assign auto_in_d_valid = bypass ? auto_out_0_d_valid : auto_out_1_d_valid;
  assign auto_in_d_bits_opcode = bypass ? auto_out_0_d_bits_opcode : auto_out_1_d_bits_opcode;
  assign auto_in_d_bits_param = bypass ? 2'h0 : auto_out_1_d_bits_param;
  assign auto_in_d_bits_size = bypass ? auto_out_0_d_bits_size : auto_out_1_d_bits_size;
  assign auto_in_d_bits_sink = bypass ? 1'h0 : auto_out_1_d_bits_sink;
  assign auto_in_d_bits_denied = bypass ? auto_out_0_d_bits_denied : auto_out_1_d_bits_denied;
  assign auto_in_d_bits_data = bypass ? 32'h0 : auto_out_1_d_bits_data;
  assign auto_in_d_bits_corrupt = bypass ? auto_out_0_d_bits_corrupt : auto_out_1_d_bits_corrupt;
  assign auto_out_1_a_valid = _bundleOut_0_a_valid_T_1 & ~bypass;
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_d_ready = auto_in_d_ready & _bundleOut_1_a_valid_T_2;
  assign auto_out_0_a_valid = _bundleIn_0_a_ready_T & auto_in_a_valid & bypass;
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_address = {{119'd0}, auto_in_a_bits_address};
  assign auto_out_0_d_ready = auto_in_d_ready & bypass;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = ~stall & _bundleIn_0_a_ready_T_1;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = bypass ? auto_out_0_d_valid : auto_out_1_d_valid;
  assign monitor_io_in_d_bits_opcode = bypass ? auto_out_0_d_bits_opcode : auto_out_1_d_bits_opcode;
  assign monitor_io_in_d_bits_param = bypass ? 2'h0 : auto_out_1_d_bits_param;
  assign monitor_io_in_d_bits_size = bypass ? auto_out_0_d_bits_size : auto_out_1_d_bits_size;
  assign monitor_io_in_d_bits_source = bypass ? 1'h0 : auto_out_1_d_bits_source;
  assign monitor_io_in_d_bits_sink = bypass ? 1'h0 : auto_out_1_d_bits_sink;
  assign monitor_io_in_d_bits_denied = bypass ? auto_out_0_d_bits_denied : auto_out_1_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = bypass ? auto_out_0_d_bits_corrupt : auto_out_1_d_bits_corrupt;
  always @(posedge clock) begin
    in_reset <= reset;
    if (in_reset | next_flight == 2'h0) begin
      bypass_reg <= io_bypass;
    end
    if (reset) begin
      flight <= 2'h0;
    end else begin
      flight <= next_flight;
    end
    if (reset) begin
      stall_counter <= 1'h0;
    end else if (done) begin
      if (stall_first) begin
        stall_counter <= 1'h0;
      end else begin
        stall_counter <= stall_counter1;
      end
    end
    if (reset) begin
      counter <= 1'h0;
    end else if (done) begin
      if (a_first) begin
        counter <= 1'h0;
      end else begin
        counter <= counter1;
      end
    end
    if (reset) begin
      counter_3 <= 1'h0;
    end else if (done_3) begin
      if (d_first) begin
        counter_3 <= 1'h0;
      end else begin
        counter_3 <= counter1_3;
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
  in_reset = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  bypass_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  flight = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  stall_counter = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  counter = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  counter_3 = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule