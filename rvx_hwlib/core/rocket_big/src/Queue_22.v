`default_nettype wire
module Queue_22(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_id,
  input  [63:0] io_enq_bits_data,
  input  [1:0]  io_enq_bits_resp,
  input         io_enq_bits_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_id,
  output [63:0] io_deq_bits_data,
  output [1:0]  io_deq_bits_resp,
  output        io_deq_bits_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  ram_id [0:0];
  wire  ram_id_io_deq_bits_MPORT_en;
  wire  ram_id_io_deq_bits_MPORT_addr;
  wire  ram_id_io_deq_bits_MPORT_data;
  wire  ram_id_MPORT_data;
  wire  ram_id_MPORT_addr;
  wire  ram_id_MPORT_mask;
  wire  ram_id_MPORT_en;
  reg [63:0] ram_data [0:0];
  wire  ram_data_io_deq_bits_MPORT_en;
  wire  ram_data_io_deq_bits_MPORT_addr;
  wire [63:0] ram_data_io_deq_bits_MPORT_data;
  wire [63:0] ram_data_MPORT_data;
  wire  ram_data_MPORT_addr;
  wire  ram_data_MPORT_mask;
  wire  ram_data_MPORT_en;
  reg [1:0] ram_resp [0:0];
  wire  ram_resp_io_deq_bits_MPORT_en;
  wire  ram_resp_io_deq_bits_MPORT_addr;
  wire [1:0] ram_resp_io_deq_bits_MPORT_data;
  wire [1:0] ram_resp_MPORT_data;
  wire  ram_resp_MPORT_addr;
  wire  ram_resp_MPORT_mask;
  wire  ram_resp_MPORT_en;
  reg  ram_last [0:0];
  wire  ram_last_io_deq_bits_MPORT_en;
  wire  ram_last_io_deq_bits_MPORT_addr;
  wire  ram_last_io_deq_bits_MPORT_data;
  wire  ram_last_MPORT_data;
  wire  ram_last_MPORT_addr;
  wire  ram_last_MPORT_mask;
  wire  ram_last_MPORT_en;
  reg  maybe_full;
  wire  empty = ~maybe_full;
  wire  _do_enq_T = io_enq_ready & io_enq_valid;
  wire  _do_deq_T = io_deq_ready & io_deq_valid;
  wire  _GEN_12 = io_deq_ready ? 1'h0 : _do_enq_T;
  wire  do_enq = empty ? _GEN_12 : _do_enq_T;
  wire  do_deq = empty ? 1'h0 : _do_deq_T;
  assign ram_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_id_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr];
  assign ram_id_MPORT_data = io_enq_bits_id;
  assign ram_id_MPORT_addr = 1'h0;
  assign ram_id_MPORT_mask = 1'h1;
  assign ram_id_MPORT_en = empty ? _GEN_12 : _do_enq_T;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr];
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = 1'h0;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = empty ? _GEN_12 : _do_enq_T;
  assign ram_resp_io_deq_bits_MPORT_en = 1'h1;
  assign ram_resp_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_resp_io_deq_bits_MPORT_data = ram_resp[ram_resp_io_deq_bits_MPORT_addr];
  assign ram_resp_MPORT_data = io_enq_bits_resp;
  assign ram_resp_MPORT_addr = 1'h0;
  assign ram_resp_MPORT_mask = 1'h1;
  assign ram_resp_MPORT_en = empty ? _GEN_12 : _do_enq_T;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr];
  assign ram_last_MPORT_data = io_enq_bits_last;
  assign ram_last_MPORT_addr = 1'h0;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = empty ? _GEN_12 : _do_enq_T;
  assign io_enq_ready = ~maybe_full;
  assign io_deq_valid = io_enq_valid | ~empty;
  assign io_deq_bits_id = empty ? io_enq_bits_id : ram_id_io_deq_bits_MPORT_data;
  assign io_deq_bits_data = empty ? io_enq_bits_data : ram_data_io_deq_bits_MPORT_data;
  assign io_deq_bits_resp = empty ? io_enq_bits_resp : ram_resp_io_deq_bits_MPORT_data;
  assign io_deq_bits_last = empty ? io_enq_bits_last : ram_last_io_deq_bits_MPORT_data;
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
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data;
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
    ram_id[initvar] = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_resp[initvar] = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_last[initvar] = _RAND_3[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule