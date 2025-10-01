`default_nettype wire
module IDPool(
  input        clock,
  input        reset,
  input        io_free_valid,
  input  [2:0] io_free_bits,
  input        io_alloc_ready,
  output       io_alloc_valid,
  output [2:0] io_alloc_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] bitmap;
  reg [2:0] select;
  reg  valid;
  wire [7:0] _taken_T = 8'h1 << io_alloc_bits;
  wire [7:0] taken = io_alloc_ready ? _taken_T : 8'h0;
  wire [7:0] _given_T = 8'h1 << io_free_bits;
  wire [7:0] given = io_free_valid ? _given_T : 8'h0;
  wire [7:0] _bitmap1_T = ~taken;
  wire [7:0] _bitmap1_T_1 = bitmap & _bitmap1_T;
  wire [7:0] bitmap1 = _bitmap1_T_1 | given;
  wire [2:0] _select1_T_8 = bitmap1[6] ? 3'h6 : 3'h7;
  wire [2:0] _select1_T_9 = bitmap1[5] ? 3'h5 : _select1_T_8;
  wire [2:0] _select1_T_10 = bitmap1[4] ? 3'h4 : _select1_T_9;
  wire [2:0] _select1_T_11 = bitmap1[3] ? 3'h3 : _select1_T_10;
  wire [2:0] _select1_T_12 = bitmap1[2] ? 3'h2 : _select1_T_11;
  wire  _valid1_T = |bitmap;
  wire [1:0] _valid1_T_9 = bitmap[0] + bitmap[1];
  wire [1:0] _valid1_T_11 = bitmap[2] + bitmap[3];
  wire [2:0] _valid1_T_13 = _valid1_T_9 + _valid1_T_11;
  wire [1:0] _valid1_T_15 = bitmap[4] + bitmap[5];
  wire [1:0] _valid1_T_17 = bitmap[6] + bitmap[7];
  wire [2:0] _valid1_T_19 = _valid1_T_15 + _valid1_T_17;
  wire [3:0] _valid1_T_21 = _valid1_T_13 + _valid1_T_19;
  wire  _valid1_T_26 = |bitmap & ~(_valid1_T_21 == 4'h1 & io_alloc_ready);
  wire  valid1 = _valid1_T_26 | io_free_valid;
  wire  _GEN_1 = io_alloc_ready | io_free_valid ? valid1 : valid;
  wire  _T_2 = ~io_alloc_valid & io_free_valid;
  wire [7:0] _T_7 = _bitmap1_T_1 >> io_free_bits;
  wire  _T_12 = ~reset;
  reg  REG;
  wire  _T_22 = io_alloc_valid & REG;
  wire [2:0] _T_31 = bitmap[6] ? 3'h6 : 3'h7;
  wire [2:0] _T_32 = bitmap[5] ? 3'h5 : _T_31;
  wire [2:0] _T_33 = bitmap[4] ? 3'h4 : _T_32;
  wire [2:0] _T_34 = bitmap[3] ? 3'h3 : _T_33;
  wire [2:0] _T_35 = bitmap[2] ? 3'h2 : _T_34;
  wire [2:0] _T_36 = bitmap[1] ? 3'h1 : _T_35;
  wire [2:0] _T_37 = bitmap[0] ? 3'h0 : _T_36;
  assign io_alloc_valid = valid;
  assign io_alloc_bits = select;
  always @(posedge clock) begin
    if (reset) begin
      bitmap <= 8'hff;
    end else if (io_alloc_ready | io_free_valid) begin
      bitmap <= bitmap1;
    end
    if (reset) begin
      select <= 3'h0;
    end else if (io_alloc_ready | ~io_alloc_valid & io_free_valid) begin
      if (bitmap1[0]) begin
        select <= 3'h0;
      end else if (bitmap1[1]) begin
        select <= 3'h1;
      end else begin
        select <= _select1_T_12;
      end
    end
    valid <= reset | _GEN_1;
    REG <= io_alloc_ready | _T_2;
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~io_free_valid | ~_T_7[0]) & ~reset) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~io_free_valid | ~_T_7[0])) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at IDPool.scala:44 assert (!io.free.valid || !(bitmap & ~taken)(io.free.bits))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(valid == _valid1_T) & _T_12) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_12 & ~(valid == _valid1_T)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at IDPool.scala:48 assert (valid === bitmap.orR)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(select == _T_37) & (_T_22 & _T_12)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_22 & _T_12 & ~(select == _T_37)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at IDPool.scala:52 assert (select === PriorityEncoder(bitmap))\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  bitmap = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  select = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule