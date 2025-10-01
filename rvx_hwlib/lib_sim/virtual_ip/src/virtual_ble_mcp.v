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


module VIRTUAL_BLE_MCP (
	csn,
	sck,
	din,
	dout
);


input wire csn;
input wire sck;
input wire din;
inout wire dout;

wire debug = 1'b1;

wire cpol = 1'b0;
wire cpha  = 1'b0;

reg [7:0] rvx_signal_08 [7:0]; 
reg [2:0] rvx_signal_01;   
reg [7:0] rvx_signal_11;    

reg [7:0] rvx_signal_09, rvx_signal_03;  

reg [2:0] rvx_signal_10;
reg       rvx_signal_05;

wire rvx_signal_06;

localparam  RVX_LPARA_3 = 2;
localparam  RVX_LPARA_0 = 0;
localparam  RVX_LPARA_2 = 1;
localparam  RVX_LPARA_1 = 2;

reg [RVX_LPARA_3-1:0] rvx_signal_02;

initial
begin
	rvx_signal_02 = RVX_LPARA_0;
	wait(csn && sck && din && dout);
	rvx_signal_02 = RVX_LPARA_2;
	wait(csn && (~sck) && (~din) && (~dout));
	rvx_signal_02 = RVX_LPARA_1;
end

assign dout = (rvx_signal_02==RVX_LPARA_1)? rvx_signal_03[7] : 1'b z;

initial
begin
	rvx_signal_08[0] = 8'h11;
	rvx_signal_08[1] = 8'h22;
	rvx_signal_08[2] = 8'h33;
	rvx_signal_08[3] = 8'h44;
	rvx_signal_08[4] = 8'h55;
	rvx_signal_08[5] = 8'h66;
	rvx_signal_08[6] = 8'h77;
	rvx_signal_08[7] = 8'h88;
	rvx_signal_09    = 8'h99;
end

assign rvx_signal_06 = cpol ^ cpha ^ sck;

always @(posedge rvx_signal_06)
	rvx_signal_09 <= #1 {rvx_signal_09[6:0],din};

always @(posedge rvx_signal_06)
begin
	if (&rvx_signal_10)
		rvx_signal_03 <= #1 rvx_signal_08[rvx_signal_01];
	else
		rvx_signal_03 <= #1 {rvx_signal_03[6:0],1'bx};
end

always @(posedge rvx_signal_06, posedge csn)
begin
	if(csn)
		rvx_signal_10 <= #1 3'b111;
	else
		rvx_signal_10 <= #1 rvx_signal_10 - 3'h1;
end

always @(posedge rvx_signal_06)
begin
	rvx_signal_05 <= #1 ~(|rvx_signal_10);
end

always @(negedge rvx_signal_06)
begin
	if (rvx_signal_05) begin
		rvx_signal_08[rvx_signal_01] <= #1 rvx_signal_09;
		rvx_signal_01      <= #1 rvx_signal_01 + 1'b1;
	end
end

initial
begin
	rvx_signal_10=3'b111;
	rvx_signal_01 = 0;
	rvx_signal_03 = rvx_signal_08[rvx_signal_01];
end

endmodule

