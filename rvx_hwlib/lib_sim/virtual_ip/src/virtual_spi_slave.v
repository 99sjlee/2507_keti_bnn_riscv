// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2025-07-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`default_nettype wire
`include "timescale.vh"


module VIRTUAL_SPI_SLAVE (
	 csn,
	 sck,
	 din,
	 dout
);


        input   csn;
        input   sck;
        input   din;
        inout  dout;

	
	
	
	wire debug = 1'b1;

	wire cpol = 1'b0;
	wire cpha  = 1'b0;

	reg [7:0] rvx_signal_06 [7:0]; 
	reg [2:0] rvx_signal_00;   
	reg [7:0] rvx_signal_09;    

	reg [7:0] rvx_signal_10, rvx_signal_04;  

	reg [2:0] rvx_signal_08;
	reg       rvx_signal_02;

	wire rvx_signal_03;

        initial
        begin
         rvx_signal_06[0] = 8'h11;
         rvx_signal_06[1] = 8'h22;
         rvx_signal_06[2] = 8'h33;
         rvx_signal_06[3] = 8'h44;
         rvx_signal_06[4] = 8'h55;
         rvx_signal_06[5] = 8'h66;
         rvx_signal_06[6] = 8'h77;
         rvx_signal_06[7] = 8'h88;
         rvx_signal_10    = 8'h99;
        end
	
	
	

	assign rvx_signal_03 = cpol ^ cpha ^ sck;

	
	always @(posedge rvx_signal_03)
	  rvx_signal_10 <= #1 {rvx_signal_10[6:0],din};

	always @(posedge rvx_signal_03)
	  if (&rvx_signal_08)
	    rvx_signal_04 <= #1 rvx_signal_06[rvx_signal_00];
	  else
	    rvx_signal_04 <= #1 {rvx_signal_04[6:0],1'bx};

	assign dout = (csn==1'b 0)? rvx_signal_04[7] : 1'b z;

	
	always @(posedge rvx_signal_03, posedge csn)
	  if(csn)
	    rvx_signal_08 <= #1 3'b111;
	  else
	    rvx_signal_08 <= #1 rvx_signal_08 - 3'h1;

	
        always @(posedge rvx_signal_03)
	  rvx_signal_02 <= #1 ~(|rvx_signal_08);

	always @(negedge rvx_signal_03)
          if (rvx_signal_02) begin
	    rvx_signal_06[rvx_signal_00] <= #1 rvx_signal_10;
	    rvx_signal_00      <= #1 rvx_signal_00 + 1'b1;
	  end

	initial
	begin
	  rvx_signal_08=3'b111;
	  rvx_signal_00 = 0;
	  rvx_signal_04 = rvx_signal_06[rvx_signal_00];
	end
endmodule

