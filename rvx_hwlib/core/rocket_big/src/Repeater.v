`default_nettype wire
module Repeater(
  input         clock,
  input         reset,
  input         io_repeat,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
  input  [3:0]  io_enq_bits_size,
  input  [3:0]  io_enq_bits_source,
  input  [31:0] io_enq_bits_address,
  input         io_enq_bits_user_amba_prot_bufferable,
  input         io_enq_bits_user_amba_prot_modifiable,
  input         io_enq_bits_user_amba_prot_readalloc,
  input         io_enq_bits_user_amba_prot_writealloc,
  input         io_enq_bits_user_amba_prot_privileged,
  input         io_enq_bits_user_amba_prot_secure,
  input         io_enq_bits_user_amba_prot_fetch,
  input  [7:0]  io_enq_bits_mask,
  input  [63:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [3:0]  io_deq_bits_size,
  output [3:0]  io_deq_bits_source,
  output [31:0] io_deq_bits_address,
  output        io_deq_bits_user_amba_prot_bufferable,
  output        io_deq_bits_user_amba_prot_modifiable,
  output        io_deq_bits_user_amba_prot_readalloc,
  output        io_deq_bits_user_amba_prot_writealloc,
  output        io_deq_bits_user_amba_prot_privileged,
  output        io_deq_bits_user_amba_prot_secure,
  output        io_deq_bits_user_amba_prot_fetch,
  output [7:0]  io_deq_bits_mask,
  output [63:0] io_deq_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg  full;
  reg [2:0] saved_opcode;
  reg [3:0] saved_size;
  reg [3:0] saved_source;
  reg [31:0] saved_address;
  reg  saved_user_amba_prot_bufferable;
  reg  saved_user_amba_prot_modifiable;
  reg  saved_user_amba_prot_readalloc;
  reg  saved_user_amba_prot_writealloc;
  reg  saved_user_amba_prot_privileged;
  reg  saved_user_amba_prot_secure;
  reg  saved_user_amba_prot_fetch;
  reg [7:0] saved_mask;
  reg [63:0] saved_data;
  wire  _T = io_enq_ready & io_enq_valid;
  wire  _GEN_0 = _T & io_repeat | full;
  wire  _T_2 = io_deq_ready & io_deq_valid;
  assign io_enq_ready = io_deq_ready & ~full;
  assign io_deq_valid = io_enq_valid | full;
  assign io_deq_bits_opcode = full ? saved_opcode : io_enq_bits_opcode;
  assign io_deq_bits_size = full ? saved_size : io_enq_bits_size;
  assign io_deq_bits_source = full ? saved_source : io_enq_bits_source;
  assign io_deq_bits_address = full ? saved_address : io_enq_bits_address;
  assign io_deq_bits_user_amba_prot_bufferable = full ? saved_user_amba_prot_bufferable :
    io_enq_bits_user_amba_prot_bufferable;
  assign io_deq_bits_user_amba_prot_modifiable = full ? saved_user_amba_prot_modifiable :
    io_enq_bits_user_amba_prot_modifiable;
  assign io_deq_bits_user_amba_prot_readalloc = full ? saved_user_amba_prot_readalloc :
    io_enq_bits_user_amba_prot_readalloc;
  assign io_deq_bits_user_amba_prot_writealloc = full ? saved_user_amba_prot_writealloc :
    io_enq_bits_user_amba_prot_writealloc;
  assign io_deq_bits_user_amba_prot_privileged = full ? saved_user_amba_prot_privileged :
    io_enq_bits_user_amba_prot_privileged;
  assign io_deq_bits_user_amba_prot_secure = full ? saved_user_amba_prot_secure : io_enq_bits_user_amba_prot_secure;
  assign io_deq_bits_user_amba_prot_fetch = full ? saved_user_amba_prot_fetch : io_enq_bits_user_amba_prot_fetch;
  assign io_deq_bits_mask = full ? saved_mask : io_enq_bits_mask;
  assign io_deq_bits_data = full ? saved_data : io_enq_bits_data;
  always @(posedge clock) begin
    if (reset) begin
      full <= 1'h0;
    end else if (_T_2 & ~io_repeat) begin
      full <= 1'h0;
    end else begin
      full <= _GEN_0;
    end
    if (_T & io_repeat) begin
      saved_opcode <= io_enq_bits_opcode;
    end
    if (_T & io_repeat) begin
      saved_size <= io_enq_bits_size;
    end
    if (_T & io_repeat) begin
      saved_source <= io_enq_bits_source;
    end
    if (_T & io_repeat) begin
      saved_address <= io_enq_bits_address;
    end
    if (_T & io_repeat) begin
      saved_user_amba_prot_bufferable <= io_enq_bits_user_amba_prot_bufferable;
    end
    if (_T & io_repeat) begin
      saved_user_amba_prot_modifiable <= io_enq_bits_user_amba_prot_modifiable;
    end
    if (_T & io_repeat) begin
      saved_user_amba_prot_readalloc <= io_enq_bits_user_amba_prot_readalloc;
    end
    if (_T & io_repeat) begin
      saved_user_amba_prot_writealloc <= io_enq_bits_user_amba_prot_writealloc;
    end
    if (_T & io_repeat) begin
      saved_user_amba_prot_privileged <= io_enq_bits_user_amba_prot_privileged;
    end
    if (_T & io_repeat) begin
      saved_user_amba_prot_secure <= io_enq_bits_user_amba_prot_secure;
    end
    if (_T & io_repeat) begin
      saved_user_amba_prot_fetch <= io_enq_bits_user_amba_prot_fetch;
    end
    if (_T & io_repeat) begin
      saved_mask <= io_enq_bits_mask;
    end
    if (_T & io_repeat) begin
      saved_data <= io_enq_bits_data;
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
  full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  saved_opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  saved_size = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  saved_source = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  saved_address = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  saved_user_amba_prot_bufferable = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  saved_user_amba_prot_modifiable = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  saved_user_amba_prot_readalloc = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  saved_user_amba_prot_writealloc = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  saved_user_amba_prot_privileged = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  saved_user_amba_prot_secure = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  saved_user_amba_prot_fetch = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  saved_mask = _RAND_12[7:0];
  _RAND_13 = {2{`RANDOM}};
  saved_data = _RAND_13[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule