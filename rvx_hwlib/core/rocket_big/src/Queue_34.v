`default_nettype wire
module Queue_34(
  input         clock,
  input         reset,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [1:0]  io_deq_bits_param,
  output [3:0]  io_deq_bits_size,
  output [1:0]  io_deq_bits_source,
  output [31:0] io_deq_bits_address,
  output [3:0]  io_deq_bits_mask,
  output        io_deq_bits_corrupt
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram_opcode [0:1];
  wire  ram_opcode_io_deq_bits_MPORT_en;
  wire  ram_opcode_io_deq_bits_MPORT_addr;
  wire [2:0] ram_opcode_io_deq_bits_MPORT_data;
  wire [2:0] ram_opcode_MPORT_data;
  wire  ram_opcode_MPORT_addr;
  wire  ram_opcode_MPORT_mask;
  wire  ram_opcode_MPORT_en;
  reg [1:0] ram_param [0:1];
  wire  ram_param_io_deq_bits_MPORT_en;
  wire  ram_param_io_deq_bits_MPORT_addr;
  wire [1:0] ram_param_io_deq_bits_MPORT_data;
  wire [1:0] ram_param_MPORT_data;
  wire  ram_param_MPORT_addr;
  wire  ram_param_MPORT_mask;
  wire  ram_param_MPORT_en;
  reg [3:0] ram_size [0:1];
  wire  ram_size_io_deq_bits_MPORT_en;
  wire  ram_size_io_deq_bits_MPORT_addr;
  wire [3:0] ram_size_io_deq_bits_MPORT_data;
  wire [3:0] ram_size_MPORT_data;
  wire  ram_size_MPORT_addr;
  wire  ram_size_MPORT_mask;
  wire  ram_size_MPORT_en;
  reg [1:0] ram_source [0:1];
  wire  ram_source_io_deq_bits_MPORT_en;
  wire  ram_source_io_deq_bits_MPORT_addr;
  wire [1:0] ram_source_io_deq_bits_MPORT_data;
  wire [1:0] ram_source_MPORT_data;
  wire  ram_source_MPORT_addr;
  wire  ram_source_MPORT_mask;
  wire  ram_source_MPORT_en;
  reg [31:0] ram_address [0:1];
  wire  ram_address_io_deq_bits_MPORT_en;
  wire  ram_address_io_deq_bits_MPORT_addr;
  wire [31:0] ram_address_io_deq_bits_MPORT_data;
  wire [31:0] ram_address_MPORT_data;
  wire  ram_address_MPORT_addr;
  wire  ram_address_MPORT_mask;
  wire  ram_address_MPORT_en;
  reg [3:0] ram_mask [0:1];
  wire  ram_mask_io_deq_bits_MPORT_en;
  wire  ram_mask_io_deq_bits_MPORT_addr;
  wire [3:0] ram_mask_io_deq_bits_MPORT_data;
  wire [3:0] ram_mask_MPORT_data;
  wire  ram_mask_MPORT_addr;
  wire  ram_mask_MPORT_mask;
  wire  ram_mask_MPORT_en;
  reg  ram_corrupt [0:1];
  wire  ram_corrupt_io_deq_bits_MPORT_en;
  wire  ram_corrupt_io_deq_bits_MPORT_addr;
  wire  ram_corrupt_io_deq_bits_MPORT_data;
  wire  ram_corrupt_MPORT_data;
  wire  ram_corrupt_MPORT_addr;
  wire  ram_corrupt_MPORT_mask;
  wire  ram_corrupt_MPORT_en;
  reg  value_1;
  wire  ptr_match = ~value_1;
  assign ram_opcode_io_deq_bits_MPORT_en = 1'h1;
  assign ram_opcode_io_deq_bits_MPORT_addr = value_1;
  assign ram_opcode_io_deq_bits_MPORT_data = ram_opcode[ram_opcode_io_deq_bits_MPORT_addr];
  assign ram_opcode_MPORT_data = 3'h0;
  assign ram_opcode_MPORT_addr = 1'h0;
  assign ram_opcode_MPORT_mask = 1'h1;
  assign ram_opcode_MPORT_en = 1'h0;
  assign ram_param_io_deq_bits_MPORT_en = 1'h1;
  assign ram_param_io_deq_bits_MPORT_addr = value_1;
  assign ram_param_io_deq_bits_MPORT_data = ram_param[ram_param_io_deq_bits_MPORT_addr];
  assign ram_param_MPORT_data = 2'h0;
  assign ram_param_MPORT_addr = 1'h0;
  assign ram_param_MPORT_mask = 1'h1;
  assign ram_param_MPORT_en = 1'h0;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = value_1;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr];
  assign ram_size_MPORT_data = 4'h0;
  assign ram_size_MPORT_addr = 1'h0;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = 1'h0;
  assign ram_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_source_io_deq_bits_MPORT_addr = value_1;
  assign ram_source_io_deq_bits_MPORT_data = ram_source[ram_source_io_deq_bits_MPORT_addr];
  assign ram_source_MPORT_data = 2'h0;
  assign ram_source_MPORT_addr = 1'h0;
  assign ram_source_MPORT_mask = 1'h1;
  assign ram_source_MPORT_en = 1'h0;
  assign ram_address_io_deq_bits_MPORT_en = 1'h1;
  assign ram_address_io_deq_bits_MPORT_addr = value_1;
  assign ram_address_io_deq_bits_MPORT_data = ram_address[ram_address_io_deq_bits_MPORT_addr];
  assign ram_address_MPORT_data = 32'h0;
  assign ram_address_MPORT_addr = 1'h0;
  assign ram_address_MPORT_mask = 1'h1;
  assign ram_address_MPORT_en = 1'h0;
  assign ram_mask_io_deq_bits_MPORT_en = 1'h1;
  assign ram_mask_io_deq_bits_MPORT_addr = value_1;
  assign ram_mask_io_deq_bits_MPORT_data = ram_mask[ram_mask_io_deq_bits_MPORT_addr];
  assign ram_mask_MPORT_data = 4'h0;
  assign ram_mask_MPORT_addr = 1'h0;
  assign ram_mask_MPORT_mask = 1'h1;
  assign ram_mask_MPORT_en = 1'h0;
  assign ram_corrupt_io_deq_bits_MPORT_en = 1'h1;
  assign ram_corrupt_io_deq_bits_MPORT_addr = value_1;
  assign ram_corrupt_io_deq_bits_MPORT_data = ram_corrupt[ram_corrupt_io_deq_bits_MPORT_addr];
  assign ram_corrupt_MPORT_data = 1'h0;
  assign ram_corrupt_MPORT_addr = 1'h0;
  assign ram_corrupt_MPORT_mask = 1'h1;
  assign ram_corrupt_MPORT_en = 1'h0;
  assign io_deq_valid = ~ptr_match;
  assign io_deq_bits_opcode = ram_opcode_io_deq_bits_MPORT_data;
  assign io_deq_bits_param = ram_param_io_deq_bits_MPORT_data;
  assign io_deq_bits_size = ram_size_io_deq_bits_MPORT_data;
  assign io_deq_bits_source = ram_source_io_deq_bits_MPORT_data;
  assign io_deq_bits_address = ram_address_io_deq_bits_MPORT_data;
  assign io_deq_bits_mask = ram_mask_io_deq_bits_MPORT_data;
  assign io_deq_bits_corrupt = ram_corrupt_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_opcode_MPORT_en & ram_opcode_MPORT_mask) begin
      ram_opcode[ram_opcode_MPORT_addr] <= ram_opcode_MPORT_data;
    end
    if (ram_param_MPORT_en & ram_param_MPORT_mask) begin
      ram_param[ram_param_MPORT_addr] <= ram_param_MPORT_data;
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data;
    end
    if (ram_source_MPORT_en & ram_source_MPORT_mask) begin
      ram_source[ram_source_MPORT_addr] <= ram_source_MPORT_data;
    end
    if (ram_address_MPORT_en & ram_address_MPORT_mask) begin
      ram_address[ram_address_MPORT_addr] <= ram_address_MPORT_data;
    end
    if (ram_mask_MPORT_en & ram_mask_MPORT_mask) begin
      ram_mask[ram_mask_MPORT_addr] <= ram_mask_MPORT_data;
    end
    if (ram_corrupt_MPORT_en & ram_corrupt_MPORT_mask) begin
      ram_corrupt[ram_corrupt_MPORT_addr] <= ram_corrupt_MPORT_data;
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else if (io_deq_valid) begin
      value_1 <= value_1 + 1'h1;
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
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_opcode[initvar] = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_param[initvar] = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_source[initvar] = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_address[initvar] = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_mask[initvar] = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_corrupt[initvar] = _RAND_6[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  value_1 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule