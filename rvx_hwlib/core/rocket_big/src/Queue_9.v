`default_nettype wire
module Queue_9(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [3:0]  io_enq_bits_id,
  input  [31:0] io_enq_bits_data,
  input  [1:0]  io_enq_bits_resp,
  input  [3:0]  io_enq_bits_echo_tl_state_size,
  input  [4:0]  io_enq_bits_echo_tl_state_source,
  input         io_enq_bits_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [3:0]  io_deq_bits_id,
  output [31:0] io_deq_bits_data,
  output [1:0]  io_deq_bits_resp,
  output [3:0]  io_deq_bits_echo_tl_state_size,
  output [4:0]  io_deq_bits_echo_tl_state_source,
  output        io_deq_bits_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_id [0:15];
  wire  ram_id_io_deq_bits_MPORT_en;
  wire [3:0] ram_id_io_deq_bits_MPORT_addr;
  wire [3:0] ram_id_io_deq_bits_MPORT_data;
  wire [3:0] ram_id_MPORT_data;
  wire [3:0] ram_id_MPORT_addr;
  wire  ram_id_MPORT_mask;
  wire  ram_id_MPORT_en;
  reg [31:0] ram_data [0:15];
  wire  ram_data_io_deq_bits_MPORT_en;
  wire [3:0] ram_data_io_deq_bits_MPORT_addr;
  wire [31:0] ram_data_io_deq_bits_MPORT_data;
  wire [31:0] ram_data_MPORT_data;
  wire [3:0] ram_data_MPORT_addr;
  wire  ram_data_MPORT_mask;
  wire  ram_data_MPORT_en;
  reg [1:0] ram_resp [0:15];
  wire  ram_resp_io_deq_bits_MPORT_en;
  wire [3:0] ram_resp_io_deq_bits_MPORT_addr;
  wire [1:0] ram_resp_io_deq_bits_MPORT_data;
  wire [1:0] ram_resp_MPORT_data;
  wire [3:0] ram_resp_MPORT_addr;
  wire  ram_resp_MPORT_mask;
  wire  ram_resp_MPORT_en;
  reg [3:0] ram_echo_tl_state_size [0:15];
  wire  ram_echo_tl_state_size_io_deq_bits_MPORT_en;
  wire [3:0] ram_echo_tl_state_size_io_deq_bits_MPORT_addr;
  wire [3:0] ram_echo_tl_state_size_io_deq_bits_MPORT_data;
  wire [3:0] ram_echo_tl_state_size_MPORT_data;
  wire [3:0] ram_echo_tl_state_size_MPORT_addr;
  wire  ram_echo_tl_state_size_MPORT_mask;
  wire  ram_echo_tl_state_size_MPORT_en;
  reg [4:0] ram_echo_tl_state_source [0:15];
  wire  ram_echo_tl_state_source_io_deq_bits_MPORT_en;
  wire [3:0] ram_echo_tl_state_source_io_deq_bits_MPORT_addr;
  wire [4:0] ram_echo_tl_state_source_io_deq_bits_MPORT_data;
  wire [4:0] ram_echo_tl_state_source_MPORT_data;
  wire [3:0] ram_echo_tl_state_source_MPORT_addr;
  wire  ram_echo_tl_state_source_MPORT_mask;
  wire  ram_echo_tl_state_source_MPORT_en;
  reg  ram_last [0:15];
  wire  ram_last_io_deq_bits_MPORT_en;
  wire [3:0] ram_last_io_deq_bits_MPORT_addr;
  wire  ram_last_io_deq_bits_MPORT_data;
  wire  ram_last_MPORT_data;
  wire [3:0] ram_last_MPORT_addr;
  wire  ram_last_MPORT_mask;
  wire  ram_last_MPORT_en;
  reg [3:0] enq_ptr_value;
  reg [3:0] deq_ptr_value;
  reg  maybe_full;
  wire  ptr_match = enq_ptr_value == deq_ptr_value;
  wire  empty = ptr_match & ~maybe_full;
  wire  full = ptr_match & maybe_full;
  wire  do_enq = io_enq_ready & io_enq_valid;
  wire  do_deq = io_deq_ready & io_deq_valid;
  wire [3:0] _value_T_1 = enq_ptr_value + 4'h1;
  wire [3:0] _value_T_3 = deq_ptr_value + 4'h1;
  assign ram_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_id_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr];
  assign ram_id_MPORT_data = io_enq_bits_id;
  assign ram_id_MPORT_addr = enq_ptr_value;
  assign ram_id_MPORT_mask = 1'h1;
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr];
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = enq_ptr_value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_resp_io_deq_bits_MPORT_en = 1'h1;
  assign ram_resp_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_resp_io_deq_bits_MPORT_data = ram_resp[ram_resp_io_deq_bits_MPORT_addr];
  assign ram_resp_MPORT_data = io_enq_bits_resp;
  assign ram_resp_MPORT_addr = enq_ptr_value;
  assign ram_resp_MPORT_mask = 1'h1;
  assign ram_resp_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_echo_tl_state_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_echo_tl_state_size_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_echo_tl_state_size_io_deq_bits_MPORT_data =
    ram_echo_tl_state_size[ram_echo_tl_state_size_io_deq_bits_MPORT_addr];
  assign ram_echo_tl_state_size_MPORT_data = io_enq_bits_echo_tl_state_size;
  assign ram_echo_tl_state_size_MPORT_addr = enq_ptr_value;
  assign ram_echo_tl_state_size_MPORT_mask = 1'h1;
  assign ram_echo_tl_state_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_echo_tl_state_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_echo_tl_state_source_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_echo_tl_state_source_io_deq_bits_MPORT_data =
    ram_echo_tl_state_source[ram_echo_tl_state_source_io_deq_bits_MPORT_addr];
  assign ram_echo_tl_state_source_MPORT_data = io_enq_bits_echo_tl_state_source;
  assign ram_echo_tl_state_source_MPORT_addr = enq_ptr_value;
  assign ram_echo_tl_state_source_MPORT_mask = 1'h1;
  assign ram_echo_tl_state_source_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr];
  assign ram_last_MPORT_data = io_enq_bits_last;
  assign ram_last_MPORT_addr = enq_ptr_value;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data;
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data;
  assign io_deq_bits_resp = ram_resp_io_deq_bits_MPORT_data;
  assign io_deq_bits_echo_tl_state_size = ram_echo_tl_state_size_io_deq_bits_MPORT_data;
  assign io_deq_bits_echo_tl_state_source = ram_echo_tl_state_source_io_deq_bits_MPORT_data;
  assign io_deq_bits_last = ram_last_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data;
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data;
    end
    if (ram_resp_MPORT_en & ram_resp_MPORT_mask) begin
      ram_resp[ram_resp_MPORT_addr] <= ram_resp_MPORT_data;
    end
    if (ram_echo_tl_state_size_MPORT_en & ram_echo_tl_state_size_MPORT_mask) begin
      ram_echo_tl_state_size[ram_echo_tl_state_size_MPORT_addr] <= ram_echo_tl_state_size_MPORT_data;
    end
    if (ram_echo_tl_state_source_MPORT_en & ram_echo_tl_state_source_MPORT_mask) begin
      ram_echo_tl_state_source[ram_echo_tl_state_source_MPORT_addr] <= ram_echo_tl_state_source_MPORT_data;
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data;
    end
    if (reset) begin
      enq_ptr_value <= 4'h0;
    end else if (do_enq) begin
      enq_ptr_value <= _value_T_1;
    end
    if (reset) begin
      deq_ptr_value <= 4'h0;
    end else if (do_deq) begin
      deq_ptr_value <= _value_T_3;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (do_enq != do_deq) begin
      maybe_full <= do_enq;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_data[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_resp[initvar] = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_echo_tl_state_size[initvar] = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_echo_tl_state_source[initvar] = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_last[initvar] = _RAND_5[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  enq_ptr_value = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  deq_ptr_value = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  maybe_full = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule