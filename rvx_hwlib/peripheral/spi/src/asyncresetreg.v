// See LICENSE.SiFive for license details.

/** This black-boxes an Async Reset
  * Reg.
  *  
  * Because Chisel doesn't support
  * parameterized black boxes, 
  * we unfortunately have to 
  * instantiate a number of these.
  *  
  * We also have to hard-code the set/reset.
  *  
  *  Do not confuse an asynchronous
  *  reset signal with an asynchronously
  *  reset reg. You should still 
  *  properly synchronize your reset 
  *  deassertion.
  *  
  *  @param d Data input
  *  @param q Data Output
  *  @param clk Clock Input
  *  @param rst Reset Input
  *  @param en Write Enable Input
  *  
  */

`default_nettype wire

module frvp_spi_AsyncResetReg (d, q, en, clk, rst);
parameter RESET_VALUE = 0;

input  wire d;
output reg  q;
input  wire en;
input  wire clk;
input  wire rst;

   always @(posedge clk or posedge rst) begin

      if (rst) begin
         q <= RESET_VALUE;
      end else if (en) begin
         q <= d;
      end
   end
 
endmodule // frvp_spi_AsyncResetReg

