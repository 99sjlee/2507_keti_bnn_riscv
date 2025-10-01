`default_nettype wire
module PlusArgTimeout(
  input         clock,
  input         reset,
  input  [31:0] io_count
);
  wire [31:0] plusarg_reader_out;
  wire  _T = plusarg_reader_out > 32'h0;
  
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(io_count < plusarg_reader_out) & (_T & ~reset)) begin
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
        if (_T & ~reset & ~(io_count < plusarg_reader_out)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Timeout exceeded: Kill the emulation after INT rdtime cycles. Off if 0.\n    at PlusArg.scala:64 assert (io.count < max, s\"Timeout exceeded: $docstring\")\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule