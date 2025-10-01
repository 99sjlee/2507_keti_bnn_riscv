`default_nettype wire
module Queue_43(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [3:0]  io_enq_bits_id,
  input  [28:0] io_enq_bits_addr,
  input  [7:0]  io_enq_bits_len,
  input  [2:0]  io_enq_bits_size,
  input  [1:0]  io_enq_bits_burst,
  input         io_deq_ready,
  output        io_deq_valid,
  output [3:0]  io_deq_bits_id,
  output [28:0] io_deq_bits_addr,
  output [7:0]  io_deq_bits_len,
  output [2:0]  io_deq_bits_size,
  output [1:0]  io_deq_bits_burst
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_id [0:0];
  wire  ram_id_io_deq_bits_MPORT_en;
  wire  ram_id_io_deq_bits_MPORT_addr;
  wire [3:0] ram_id_io_deq_bits_MPORT_data;
  wire [3:0] ram_id_MPORT_data;
  wire  ram_id_MPORT_addr;
  wire  ram_id_MPORT_mask;
  wire  ram_id_MPORT_en;
  reg [28:0] ram_addr [0:0];
  wire  ram_addr_io_deq_bits_MPORT_en;
  wire  ram_addr_io_deq_bits_MPORT_addr;
  wire [28:0] ram_addr_io_deq_bits_MPORT_data;
  wire [28:0] ram_addr_MPORT_data;
  wire  ram_addr_MPORT_addr;
  wire  ram_addr_MPORT_mask;
  wire  ram_addr_MPORT_en;
  reg [7:0] ram_len [0:0];
  wire  ram_len_io_deq_bits_MPORT_en;
  wire  ram_len_io_deq_bits_MPORT_addr;
  wire [7:0] ram_len_io_deq_bits_MPORT_data;
  wire [7:0] ram_len_MPORT_data;
  wire  ram_len_MPORT_addr;
  wire  ram_len_MPORT_mask;
  wire  ram_len_MPORT_en;
  reg [2:0] ram_size [0:0];
  wire  ram_size_io_deq_bits_MPORT_en;
  wire  ram_size_io_deq_bits_MPORT_addr;
  wire [2:0] ram_size_io_deq_bits_MPORT_data;
  wire [2:0] ram_size_MPORT_data;
  wire  ram_size_MPORT_addr;
  wire  ram_size_MPORT_mask;
  wire  ram_size_MPORT_en;
  reg [1:0] ram_burst [0:0];
  wire  ram_burst_io_deq_bits_MPORT_en;
  wire  ram_burst_io_deq_bits_MPORT_addr;
  wire [1:0] ram_burst_io_deq_bits_MPORT_data;
  wire [1:0] ram_burst_MPORT_data;
  wire  ram_burst_MPORT_addr;
  wire  ram_burst_MPORT_mask;
  wire  ram_burst_MPORT_en;
  reg  maybe_full;
  wire  empty = ~maybe_full;
  wire  _do_enq_T = io_enq_ready & io_enq_valid;
  wire  _do_deq_T = io_deq_ready & io_deq_valid;
  wire  _GEN_17 = io_deq_ready ? 1'h0 : _do_enq_T;
  wire  do_enq = empty ? _GEN_17 : _do_enq_T;
  wire  do_deq = empty ? 1'h0 : _do_deq_T;
  assign ram_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_id_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr];
  assign ram_id_MPORT_data = io_enq_bits_id;
  assign ram_id_MPORT_addr = 1'h0;
  assign ram_id_MPORT_mask = 1'h1;
  assign ram_id_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign ram_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_addr_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr];
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = 1'h0;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign ram_len_io_deq_bits_MPORT_en = 1'h1;
  assign ram_len_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_len_io_deq_bits_MPORT_data = ram_len[ram_len_io_deq_bits_MPORT_addr];
  assign ram_len_MPORT_data = io_enq_bits_len;
  assign ram_len_MPORT_addr = 1'h0;
  assign ram_len_MPORT_mask = 1'h1;
  assign ram_len_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr];
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = 1'h0;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign ram_burst_io_deq_bits_MPORT_en = 1'h1;
  assign ram_burst_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_burst_io_deq_bits_MPORT_data = ram_burst[ram_burst_io_deq_bits_MPORT_addr];
  assign ram_burst_MPORT_data = io_enq_bits_burst;
  assign ram_burst_MPORT_addr = 1'h0;
  assign ram_burst_MPORT_mask = 1'h1;
  assign ram_burst_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign io_enq_ready = ~maybe_full;
  assign io_deq_valid = io_enq_valid | ~empty;
  assign io_deq_bits_id = empty ? io_enq_bits_id : ram_id_io_deq_bits_MPORT_data;
  assign io_deq_bits_addr = empty ? io_enq_bits_addr : ram_addr_io_deq_bits_MPORT_data;
  assign io_deq_bits_len = empty ? io_enq_bits_len : ram_len_io_deq_bits_MPORT_data;
  assign io_deq_bits_size = empty ? io_enq_bits_size : ram_size_io_deq_bits_MPORT_data;
  assign io_deq_bits_burst = empty ? io_enq_bits_burst : ram_burst_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data;
    end
    if (ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data;
    end
    if (ram_len_MPORT_en & ram_len_MPORT_mask) begin
      ram_len[ram_len_MPORT_addr] <= ram_len_MPORT_data;
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data;
    end
    if (ram_burst_MPORT_en & ram_burst_MPORT_mask) begin
      ram_burst[ram_burst_MPORT_addr] <= ram_burst_MPORT_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (do_enq != do_deq) begin
      if (empty) begin
        if (io_deq_ready) begin
          maybe_full <= 1'h0;
        end else begin
          maybe_full <= _do_enq_T;
        end
      end else begin
        maybe_full <= _do_enq_T;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_addr[initvar] = _RAND_1[28:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_len[initvar] = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_size[initvar] = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_burst[initvar] = _RAND_4[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  maybe_full = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule