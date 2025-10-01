// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reserved.    
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
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "ervp_cache_memorymap_offset.vh"

module ERVP_CACHE_MMIO
(
	clk,
	rstnn,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr,

	tick_gpio,
	cache_policy,
	cache_busy_re,
	cache_busy_input,
	cache_control_cmd_we,
	cache_control_cmd_output,
	cache_control_region_start,
	cache_control_region_last,
	cache_cacheable_region_start_list,
	cache_cacheable_region_last_list
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire clk, rstnn;
input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output reg rpready;
output reg rpslverr;


input wire tick_gpio;

output wire [2-1:0] cache_policy;

output wire cache_busy_re;
input wire [1-1:0] cache_busy_input;

output wire cache_control_cmd_we;
output wire [3-1:0] cache_control_cmd_output;

output wire [32-1:0] cache_control_region_start;

output wire [32-1:0] cache_control_region_last;

output wire [(32)*(4)-1:0] cache_cacheable_region_start_list;

output wire [(32)*(4)-1:0] cache_cacheable_region_last_list;

/////////////
/* signals */
/////////////

genvar i;

wire [BW_DATA-1:0] man_rpwdata;
reg [BW_DATA-1:0] man_rprdata;
wire read_request_from_bus;
wire write_request_from_bus;
wire is_aligned_access;

wire [`BW_MMAP_OFFSET_ERVP_CACHE-1:0] paddr_offset = rpaddr;
wire [`BW_MMAP_OFFSET_ERVP_CACHE-1:0] addr_offset;
wire [BW_ADDR-1:0] addr_aligned;
wire [`BW_UNUSED_ERVP_CACHE-1:0] addr_unaligned;
wire [`BW_UNUSED_ERVP_CACHE-1:0] addr_unused = 0;
reg signal_cache_cacheable_region_start00_re;
wire [32-1:0] signal_cache_cacheable_region_start00_input;
reg signal_cache_cacheable_region_start00_we;
wire [32-1:0] signal_cache_cacheable_region_start00_output;
wire signal_cache_cacheable_region_start00_readyin;
reg [32-1:0] reg_cache_cacheable_region_start00;
reg signal_cache_cacheable_region_start01_re;
wire [32-1:0] signal_cache_cacheable_region_start01_input;
reg signal_cache_cacheable_region_start01_we;
wire [32-1:0] signal_cache_cacheable_region_start01_output;
wire signal_cache_cacheable_region_start01_readyin;
reg [32-1:0] reg_cache_cacheable_region_start01;
reg signal_cache_cacheable_region_start02_re;
wire [32-1:0] signal_cache_cacheable_region_start02_input;
reg signal_cache_cacheable_region_start02_we;
wire [32-1:0] signal_cache_cacheable_region_start02_output;
wire signal_cache_cacheable_region_start02_readyin;
reg [32-1:0] reg_cache_cacheable_region_start02;
reg signal_cache_cacheable_region_start03_re;
wire [32-1:0] signal_cache_cacheable_region_start03_input;
reg signal_cache_cacheable_region_start03_we;
wire [32-1:0] signal_cache_cacheable_region_start03_output;
wire signal_cache_cacheable_region_start03_readyin;
reg [32-1:0] reg_cache_cacheable_region_start03;
reg signal_cache_cacheable_region_last00_re;
wire [32-1:0] signal_cache_cacheable_region_last00_input;
reg signal_cache_cacheable_region_last00_we;
wire [32-1:0] signal_cache_cacheable_region_last00_output;
wire signal_cache_cacheable_region_last00_readyin;
reg [32-1:0] reg_cache_cacheable_region_last00;
reg signal_cache_cacheable_region_last01_re;
wire [32-1:0] signal_cache_cacheable_region_last01_input;
reg signal_cache_cacheable_region_last01_we;
wire [32-1:0] signal_cache_cacheable_region_last01_output;
wire signal_cache_cacheable_region_last01_readyin;
reg [32-1:0] reg_cache_cacheable_region_last01;
reg signal_cache_cacheable_region_last02_re;
wire [32-1:0] signal_cache_cacheable_region_last02_input;
reg signal_cache_cacheable_region_last02_we;
wire [32-1:0] signal_cache_cacheable_region_last02_output;
wire signal_cache_cacheable_region_last02_readyin;
reg [32-1:0] reg_cache_cacheable_region_last02;
reg signal_cache_cacheable_region_last03_re;
wire [32-1:0] signal_cache_cacheable_region_last03_input;
reg signal_cache_cacheable_region_last03_we;
wire [32-1:0] signal_cache_cacheable_region_last03_output;
wire signal_cache_cacheable_region_last03_readyin;
reg [32-1:0] reg_cache_cacheable_region_last03;
reg signal_cache_policy_re;
wire [2-1:0] signal_cache_policy_input;
reg signal_cache_policy_we;
wire [2-1:0] signal_cache_policy_output;
wire signal_cache_policy_readyin;
reg [2-1:0] reg_cache_policy;
reg signal_cache_busy_re;
wire [1-1:0] signal_cache_busy_input;
reg signal_cache_busy_we;
wire [1-1:0] signal_cache_busy_output;
wire signal_cache_busy_readyin;
reg signal_cache_control_cmd_re;
wire [3-1:0] signal_cache_control_cmd_input;
reg signal_cache_control_cmd_we;
wire [3-1:0] signal_cache_control_cmd_output;
wire signal_cache_control_cmd_readyin;
reg signal_cache_control_region_start_re;
wire [32-1:0] signal_cache_control_region_start_input;
reg signal_cache_control_region_start_we;
wire [32-1:0] signal_cache_control_region_start_output;
wire signal_cache_control_region_start_readyin;
reg [32-1:0] reg_cache_control_region_start;
reg signal_cache_control_region_last_re;
wire [32-1:0] signal_cache_control_region_last_input;
reg signal_cache_control_region_last_we;
wire [32-1:0] signal_cache_control_region_last_output;
wire signal_cache_control_region_last_readyin;
reg [32-1:0] reg_cache_control_region_last;

////////////
/* logics */
////////////

assign man_rpwdata = CHANGE_ENDIAN_BUS2MAN(BW_DATA,ENDIAN_TYPE,rpwdata);
assign rprdata = CHANGE_ENDIAN_MAN2BUS(BW_DATA,ENDIAN_TYPE,man_rprdata);
assign {addr_aligned,addr_unaligned} = paddr_offset;
assign addr_offset = {addr_aligned,addr_unused};
assign is_aligned_access = (addr_unaligned==0);
assign read_request_from_bus = rpsel & rpenable & is_aligned_access & (~rpwrite);
assign write_request_from_bus = rpsel & rpenable & is_aligned_access & rpwrite;

assign signal_cache_cacheable_region_start00_output = $unsigned(rpwdata);
assign signal_cache_cacheable_region_start01_output = $unsigned(rpwdata);
assign signal_cache_cacheable_region_start02_output = $unsigned(rpwdata);
assign signal_cache_cacheable_region_start03_output = $unsigned(rpwdata);
assign signal_cache_cacheable_region_last00_output = $unsigned(rpwdata);
assign signal_cache_cacheable_region_last01_output = $unsigned(rpwdata);
assign signal_cache_cacheable_region_last02_output = $unsigned(rpwdata);
assign signal_cache_cacheable_region_last03_output = $unsigned(rpwdata);
assign signal_cache_policy_output = $unsigned(rpwdata);
assign signal_cache_busy_output = $unsigned(rpwdata);
assign signal_cache_control_cmd_output = $unsigned(rpwdata);
assign signal_cache_control_region_start_output = $unsigned(rpwdata);
assign signal_cache_control_region_last_output = $unsigned(rpwdata);

always@(*)
begin
	rpslverr = 0;
	man_rprdata = 0;
	rpready = 1;

	signal_cache_cacheable_region_start00_re = 0;
	signal_cache_cacheable_region_start00_we = 0;

	signal_cache_cacheable_region_start01_re = 0;
	signal_cache_cacheable_region_start01_we = 0;

	signal_cache_cacheable_region_start02_re = 0;
	signal_cache_cacheable_region_start02_we = 0;

	signal_cache_cacheable_region_start03_re = 0;
	signal_cache_cacheable_region_start03_we = 0;

	signal_cache_cacheable_region_last00_re = 0;
	signal_cache_cacheable_region_last00_we = 0;

	signal_cache_cacheable_region_last01_re = 0;
	signal_cache_cacheable_region_last01_we = 0;

	signal_cache_cacheable_region_last02_re = 0;
	signal_cache_cacheable_region_last02_we = 0;

	signal_cache_cacheable_region_last03_re = 0;
	signal_cache_cacheable_region_last03_we = 0;

	signal_cache_policy_re = 0;
	signal_cache_policy_we = 0;

	signal_cache_busy_re = 0;
	signal_cache_busy_we = 0;

	signal_cache_control_cmd_re = 0;
	signal_cache_control_cmd_we = 0;

	signal_cache_control_region_start_re = 0;
	signal_cache_control_region_start_we = 0;

	signal_cache_control_region_last_re = 0;
	signal_cache_control_region_last_we = 0;

	if(rpsel==1'b 1)
	begin
		case(addr_offset)
			`MMAP_OFFSET_CACHE_CACHEABLE_REGION_START00:
			begin
				signal_cache_cacheable_region_start00_re = read_request_from_bus;
				signal_cache_cacheable_region_start00_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_cacheable_region_start00_input);
				rpready = signal_cache_cacheable_region_start00_readyin;
			end
			`MMAP_OFFSET_CACHE_CACHEABLE_REGION_START01:
			begin
				signal_cache_cacheable_region_start01_re = read_request_from_bus;
				signal_cache_cacheable_region_start01_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_cacheable_region_start01_input);
				rpready = signal_cache_cacheable_region_start01_readyin;
			end
			`MMAP_OFFSET_CACHE_CACHEABLE_REGION_START02:
			begin
				signal_cache_cacheable_region_start02_re = read_request_from_bus;
				signal_cache_cacheable_region_start02_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_cacheable_region_start02_input);
				rpready = signal_cache_cacheable_region_start02_readyin;
			end
			`MMAP_OFFSET_CACHE_CACHEABLE_REGION_START03:
			begin
				signal_cache_cacheable_region_start03_re = read_request_from_bus;
				signal_cache_cacheable_region_start03_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_cacheable_region_start03_input);
				rpready = signal_cache_cacheable_region_start03_readyin;
			end
			`MMAP_OFFSET_CACHE_CACHEABLE_REGION_LAST00:
			begin
				signal_cache_cacheable_region_last00_re = read_request_from_bus;
				signal_cache_cacheable_region_last00_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_cacheable_region_last00_input);
				rpready = signal_cache_cacheable_region_last00_readyin;
			end
			`MMAP_OFFSET_CACHE_CACHEABLE_REGION_LAST01:
			begin
				signal_cache_cacheable_region_last01_re = read_request_from_bus;
				signal_cache_cacheable_region_last01_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_cacheable_region_last01_input);
				rpready = signal_cache_cacheable_region_last01_readyin;
			end
			`MMAP_OFFSET_CACHE_CACHEABLE_REGION_LAST02:
			begin
				signal_cache_cacheable_region_last02_re = read_request_from_bus;
				signal_cache_cacheable_region_last02_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_cacheable_region_last02_input);
				rpready = signal_cache_cacheable_region_last02_readyin;
			end
			`MMAP_OFFSET_CACHE_CACHEABLE_REGION_LAST03:
			begin
				signal_cache_cacheable_region_last03_re = read_request_from_bus;
				signal_cache_cacheable_region_last03_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_cacheable_region_last03_input);
				rpready = signal_cache_cacheable_region_last03_readyin;
			end
			`MMAP_OFFSET_CACHE_POLICY:
			begin
				signal_cache_policy_re = read_request_from_bus;
				signal_cache_policy_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_policy_input);
				rpready = signal_cache_policy_readyin;
			end
			`MMAP_OFFSET_CACHE_BUSY:
			begin
				signal_cache_busy_re = read_request_from_bus;
				signal_cache_busy_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_busy_input);
				rpready = signal_cache_busy_readyin;
			end
			`MMAP_OFFSET_CACHE_CONTROL_CMD:
			begin
				signal_cache_control_cmd_re = read_request_from_bus;
				signal_cache_control_cmd_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_control_cmd_input);
				rpready = signal_cache_control_cmd_readyin;
			end
			`MMAP_OFFSET_CACHE_CONTROL_REGION_START:
			begin
				signal_cache_control_region_start_re = read_request_from_bus;
				signal_cache_control_region_start_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_control_region_start_input);
				rpready = signal_cache_control_region_start_readyin;
			end
			`MMAP_OFFSET_CACHE_CONTROL_REGION_LAST:
			begin
				signal_cache_control_region_last_re = read_request_from_bus;
				signal_cache_control_region_last_we = write_request_from_bus;
				man_rprdata = $unsigned(signal_cache_control_region_last_input);
				rpready = signal_cache_control_region_last_readyin;
			end
			default:
				rpslverr = 1;
		endcase
	end
end

// cache_cacheable_region_start00
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_cacheable_region_start00 <= `CACHE_CACHEABLE_REGION_START_DEFAULT_VALUE;
	else if (signal_cache_cacheable_region_start00_we==1'b 1)
		reg_cache_cacheable_region_start00 <= signal_cache_cacheable_region_start00_output;
end
assign signal_cache_cacheable_region_start00_input = reg_cache_cacheable_region_start00;
// cache_cacheable_region_start01
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_cacheable_region_start01 <= `CACHE_CACHEABLE_REGION_START_DEFAULT_VALUE;
	else if (signal_cache_cacheable_region_start01_we==1'b 1)
		reg_cache_cacheable_region_start01 <= signal_cache_cacheable_region_start01_output;
end
assign signal_cache_cacheable_region_start01_input = reg_cache_cacheable_region_start01;
// cache_cacheable_region_start02
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_cacheable_region_start02 <= `CACHE_CACHEABLE_REGION_START_DEFAULT_VALUE;
	else if (signal_cache_cacheable_region_start02_we==1'b 1)
		reg_cache_cacheable_region_start02 <= signal_cache_cacheable_region_start02_output;
end
assign signal_cache_cacheable_region_start02_input = reg_cache_cacheable_region_start02;
// cache_cacheable_region_start03
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_cacheable_region_start03 <= `CACHE_CACHEABLE_REGION_START_DEFAULT_VALUE;
	else if (signal_cache_cacheable_region_start03_we==1'b 1)
		reg_cache_cacheable_region_start03 <= signal_cache_cacheable_region_start03_output;
end
assign signal_cache_cacheable_region_start03_input = reg_cache_cacheable_region_start03;
// cache_cacheable_region_last00
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_cacheable_region_last00 <= `CACHE_CACHEABLE_REGION_LAST_DEFAULT_VALUE;
	else if (signal_cache_cacheable_region_last00_we==1'b 1)
		reg_cache_cacheable_region_last00 <= signal_cache_cacheable_region_last00_output;
end
assign signal_cache_cacheable_region_last00_input = reg_cache_cacheable_region_last00;
// cache_cacheable_region_last01
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_cacheable_region_last01 <= `CACHE_CACHEABLE_REGION_LAST_DEFAULT_VALUE;
	else if (signal_cache_cacheable_region_last01_we==1'b 1)
		reg_cache_cacheable_region_last01 <= signal_cache_cacheable_region_last01_output;
end
assign signal_cache_cacheable_region_last01_input = reg_cache_cacheable_region_last01;
// cache_cacheable_region_last02
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_cacheable_region_last02 <= `CACHE_CACHEABLE_REGION_LAST_DEFAULT_VALUE;
	else if (signal_cache_cacheable_region_last02_we==1'b 1)
		reg_cache_cacheable_region_last02 <= signal_cache_cacheable_region_last02_output;
end
assign signal_cache_cacheable_region_last02_input = reg_cache_cacheable_region_last02;
// cache_cacheable_region_last03
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_cacheable_region_last03 <= `CACHE_CACHEABLE_REGION_LAST_DEFAULT_VALUE;
	else if (signal_cache_cacheable_region_last03_we==1'b 1)
		reg_cache_cacheable_region_last03 <= signal_cache_cacheable_region_last03_output;
end
assign signal_cache_cacheable_region_last03_input = reg_cache_cacheable_region_last03;
// cache_policy
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_policy <= `CACHE_POLICY_DEFAULT_VALUE;
	else if (signal_cache_policy_we==1'b 1)
		reg_cache_policy <= signal_cache_policy_output;
end
assign signal_cache_policy_input = reg_cache_policy;
// cache_control_region_start
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_control_region_start <= `CACHE_CONTROL_REGION_START_DEFAULT_VALUE;
	else if (signal_cache_control_region_start_we==1'b 1)
		reg_cache_control_region_start <= signal_cache_control_region_start_output;
end
assign signal_cache_control_region_start_input = reg_cache_control_region_start;
// cache_control_region_last
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		reg_cache_control_region_last <= `CACHE_CONTROL_REGION_LAST_DEFAULT_VALUE;
	else if (signal_cache_control_region_last_we==1'b 1)
		reg_cache_control_region_last <= signal_cache_control_region_last_output;
end
assign signal_cache_control_region_last_input = reg_cache_control_region_last;
// cache_policy
assign cache_policy = reg_cache_policy;
assign signal_cache_policy_readyin = 1;
// cache_busy
assign cache_busy_re = signal_cache_busy_re;
assign signal_cache_busy_input = cache_busy_input;
assign signal_cache_busy_readyin = 1;
// cache_control_cmd
assign signal_cache_control_cmd_input = 0;
assign cache_control_cmd_we = signal_cache_control_cmd_we;
assign cache_control_cmd_output = signal_cache_control_cmd_output;
assign signal_cache_control_cmd_readyin = 1;
// cache_control_region_start
assign cache_control_region_start = reg_cache_control_region_start;
assign signal_cache_control_region_start_readyin = 1;
// cache_control_region_last
assign cache_control_region_last = reg_cache_control_region_last;
assign signal_cache_control_region_last_readyin = 1;

assign cache_cacheable_region_start_list[(32)*((00)+1)-1-:32] = reg_cache_cacheable_region_start00;

assign cache_cacheable_region_start_list[(32)*((01)+1)-1-:32] = reg_cache_cacheable_region_start01;

assign cache_cacheable_region_start_list[(32)*((02)+1)-1-:32] = reg_cache_cacheable_region_start02;

assign cache_cacheable_region_start_list[(32)*((03)+1)-1-:32] = reg_cache_cacheable_region_start03;

assign signal_cache_cacheable_region_start00_readyin = 1;

assign signal_cache_cacheable_region_start01_readyin = 1;

assign signal_cache_cacheable_region_start02_readyin = 1;

assign signal_cache_cacheable_region_start03_readyin = 1;

assign cache_cacheable_region_last_list[(32)*((00)+1)-1-:32] = reg_cache_cacheable_region_last00;

assign cache_cacheable_region_last_list[(32)*((01)+1)-1-:32] = reg_cache_cacheable_region_last01;

assign cache_cacheable_region_last_list[(32)*((02)+1)-1-:32] = reg_cache_cacheable_region_last02;

assign cache_cacheable_region_last_list[(32)*((03)+1)-1-:32] = reg_cache_cacheable_region_last03;

assign signal_cache_cacheable_region_last00_readyin = 1;

assign signal_cache_cacheable_region_last01_readyin = 1;

assign signal_cache_cacheable_region_last02_readyin = 1;

assign signal_cache_cacheable_region_last03_readyin = 1;

endmodule
