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

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_04.vh"
`include "rvx_include_13.vh"
`include "platform_info.vh"



module ERVP_CORE_PERI_GROUP
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

	allows_holds,
	
	tick_1us,
	delay_notice,
	plic_interrupt,
	core_interrupt_vector,

	lock_status_list,
	global_tag_list,

	tcu_spsel,
	tcu_spenable,
	tcu_spaddr,
	tcu_spwrite,
	tcu_spwdata,
	tcu_sprdata,
	tcu_spready,
	tcu_spslverr,

  florian_spsel,
	florian_spenable,
	florian_spaddr,
	florian_spwrite,
	florian_spwdata,
	florian_sprdata,
	florian_spready,
	florian_spslverr
);



parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter PROCESS_ID = -1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter NUM_LOCK = 8;
parameter NUM_GLOBAL_TAG = 8;

localparam  RVX_LPARA_0 = `RVX_GDEF_216;
localparam  RVX_LPARA_2 = `RVX_GDEF_175-1;
localparam  RVX_LPARA_1 = `RVX_GDEF_154;

input wire clk;
input wire rstnn;

input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

input wire allows_holds;

input wire tick_1us;
output wire delay_notice;
input wire plic_interrupt;
output wire [31:0] core_interrupt_vector;

input wire [NUM_LOCK-1:0] lock_status_list;
input wire [NUM_GLOBAL_TAG-1:0] global_tag_list;

output wire tcu_spsel;
output wire tcu_spenable;
output wire [BW_ADDR-1:0] tcu_spaddr;
output wire tcu_spwrite;
output wire [BW_DATA-1:0] tcu_spwdata;
input wire [BW_DATA-1:0] tcu_sprdata;
input wire tcu_spready;
input wire tcu_spslverr;

output wire florian_spsel;
output wire florian_spenable;
output wire [BW_ADDR-1:0] florian_spaddr;
output wire florian_spwrite;
output wire [BW_DATA-1:0] florian_spwdata;
input wire [BW_DATA-1:0] florian_sprdata;
input wire florian_spready;
input wire florian_spslverr;

genvar i;

wire [RVX_LPARA_0*BW_ADDR-1:0] rvx_signal_31;
wire [RVX_LPARA_0-1:0] rvx_signal_04;
wire [RVX_LPARA_0-1:0] rvx_signal_20;
wire [RVX_LPARA_0*BW_DATA-1:0] rvx_signal_32;
wire [RVX_LPARA_0-1:0] rvx_signal_10;
wire [RVX_LPARA_0*BW_DATA-1:0] rvx_signal_00;
wire [RVX_LPARA_0*BW_DATA-1:0] rvx_signal_06;
wire [RVX_LPARA_0-1:0] rvx_signal_18;
wire [RVX_LPARA_0-1:0] rvx_signal_23;

wire [BW_ADDR-1:0] rvx_signal_02 [RVX_LPARA_0-1:0];
wire [RVX_LPARA_0-1:0] rvx_signal_14;
wire [RVX_LPARA_0-1:0] rvx_signal_33;
wire [BW_ADDR-1:0] rvx_signal_19 [RVX_LPARA_0-1:0];
wire [RVX_LPARA_0-1:0] rvx_signal_05;
wire [BW_DATA-1:0] rvx_signal_13 [RVX_LPARA_0-1:0];
wire [BW_DATA-1:0] rvx_signal_22 [RVX_LPARA_0-1:0];
wire [RVX_LPARA_0-1:0] rvx_signal_25;
wire [RVX_LPARA_0-1:0] rvx_signal_03;

wire rvx_signal_21;

wire rvx_signal_01;
wire [8-1:0] rvx_signal_07;

wire rvx_signal_15;
wire [8-1:0] rvx_signal_28;

wire rvx_signal_24;
wire [1-1:0] rvx_signal_29;
wire rvx_signal_27;

reg [31:0] rvx_signal_26; 

wire [NUM_LOCK-1:0] rvx_signal_09;
wire [NUM_LOCK-1:0] rvx_signal_08;

reg [NUM_GLOBAL_TAG-1:0] rvx_signal_17;
wire [NUM_GLOBAL_TAG-1:0] rvx_signal_30;
reg [NUM_GLOBAL_TAG-1:0] rvx_signal_16;
wire rvx_signal_12;

wire rvx_signal_11;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_0),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_2),
	.BW_SEL_INDEX(RVX_LPARA_1)
)
i_rvx_instance_2
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rpsel),
	.rpenable(rpenable),
	.rpaddr(rpaddr),
	.rpwrite(rpwrite),
	.rpwdata(rpwdata),
	.rprdata(rprdata),
	.rpready(rpready),
	.rpslverr(rpslverr),
	.rpbaseaddr_list(rvx_signal_31),

	.spsel_list(rvx_signal_04),
	.spenable_list(rvx_signal_20),
	.spaddr_list(rvx_signal_32),
	.spwrite_list(rvx_signal_10),
	.spwdata_list(rvx_signal_00),
	.sprdata_list(rvx_signal_06),
	.spready_list(rvx_signal_18),
	.spslverr_list(rvx_signal_23)
);

generate
	for(i=0; i<RVX_LPARA_0; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_31[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_02[i];
		assign rvx_signal_14[i] = rvx_signal_04[i];
		assign rvx_signal_33[i] = rvx_signal_20[i];
		assign rvx_signal_19[i] = rvx_signal_32[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_05[i] = rvx_signal_10[i];
		assign rvx_signal_13[i] = rvx_signal_00[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_06[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_22[i];
		assign rvx_signal_18[i] = rvx_signal_25[i];
		assign rvx_signal_23[i] = rvx_signal_03[i];
	end
endgenerate

assign rvx_signal_02[`RVX_GDEF_071] = `RVX_GDEF_057;
assign rvx_signal_02[`RVX_GDEF_096] = `RVX_GDEF_190;
assign rvx_signal_02[`RVX_GDEF_267] = `RVX_GDEF_069;
assign rvx_signal_02[`RVX_GDEF_276] = `RVX_GDEF_325;
assign rvx_signal_02[`RVX_GDEF_306] = `RVX_GDEF_346;

always@(*)
begin
	rvx_signal_26 = 0;
	rvx_signal_26[`RVX_GDEF_275] = plic_interrupt;
	rvx_signal_26[`RVX_GDEF_086] = rvx_signal_21;
end

assign core_interrupt_vector = rvx_signal_26;

`ifdef INCLUDE_TIMER

ERVP_TIMER
#(
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.ENDIAN_TYPE(ENDIAN_TYPE)
)
i_rvx_instance_3
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_14[`RVX_GDEF_071]),
	.rpenable(rvx_signal_33[`RVX_GDEF_071]),
	.rpaddr(rvx_signal_19[`RVX_GDEF_071]),
	.rpwrite(rvx_signal_05[`RVX_GDEF_071]),
	.rpwdata(rvx_signal_13[`RVX_GDEF_071]),
	.rprdata(rvx_signal_22[`RVX_GDEF_071]),
	.rpready(rvx_signal_25[`RVX_GDEF_071]),
	.rpslverr(rvx_signal_03[`RVX_GDEF_071]),

	.tick_1us(tick_1us),
	.delay_notice(delay_notice),
	.timer_interrupt(rvx_signal_21)
);

`else

assign rvx_signal_21 = 0;
assign rvx_signal_25[`RVX_GDEF_071] = 0;
assign rvx_signal_22[`RVX_GDEF_071] = 0;
assign rvx_signal_03[`RVX_GDEF_071] = 1;

`endif

`ifdef INCLUDE_MULTICORE

RVX_MODULE_119
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_2(BW_DATA)
)
i_rvx_instance_0
(
	.rvx_port_11(clk),
	.rvx_port_04(rstnn),

	.rvx_port_07(rvx_signal_14[`RVX_GDEF_096]),
	.rvx_port_06(rvx_signal_33[`RVX_GDEF_096]),
	.rvx_port_16(rvx_signal_19[`RVX_GDEF_096]),
	.rvx_port_02(rvx_signal_05[`RVX_GDEF_096]),
	.rvx_port_00(rvx_signal_13[`RVX_GDEF_096]),
	.rvx_port_17(rvx_signal_22[`RVX_GDEF_096]),
	.rvx_port_12(rvx_signal_25[`RVX_GDEF_096]),
	.rvx_port_13(rvx_signal_03[`RVX_GDEF_096]),

	.rvx_port_15(1'b 0),
	.rvx_port_03(rvx_signal_01),
	.rvx_port_09(rvx_signal_07),
	.rvx_port_05(rvx_signal_15),
	.rvx_port_10(rvx_signal_28),
	.rvx_port_14(rvx_signal_24),
	.rvx_port_01(rvx_signal_29),
	.rvx_port_08(rvx_signal_27)
);

assign rvx_signal_07 = PROCESS_ID;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(NUM_GLOBAL_TAG)
)
i_rvx_instance_4
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(global_tag_list),
	.synch_value(rvx_signal_30)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_17 <= 0;
		rvx_signal_16 <= 0;
	end
	else if(rvx_signal_15)
	begin
		rvx_signal_17 <= rvx_signal_28;
		rvx_signal_16 <= rvx_signal_30;
	end
end

assign rvx_signal_12 = (((rvx_signal_30 ~^ rvx_signal_16) & rvx_signal_17)!=0);

assign rvx_signal_29 = rvx_signal_12;
assign rvx_signal_27 = allows_holds? (~(rvx_signal_24 & rvx_signal_12)) : 1;

`else

assign rvx_signal_25[`RVX_GDEF_096] = 0;
assign rvx_signal_22[`RVX_GDEF_096] = 0;
assign rvx_signal_03[`RVX_GDEF_096] = 1;

`endif

`ifdef INCLUDE_MULTICORE

ERVP_SYNCHRONIZER
#(
	.BW_DATA(NUM_LOCK)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(lock_status_list),
	.synch_value(rvx_signal_09)
);

assign rvx_signal_08 = rvx_signal_19[`RVX_GDEF_267][`RVX_GDEF_161-1:`RVX_GDEF_359];
assign rvx_signal_11 = ((rvx_signal_08 & rvx_signal_09)!=0);
assign rvx_signal_25[`RVX_GDEF_267] = allows_holds? (~rvx_signal_11) : 1;
assign rvx_signal_22[`RVX_GDEF_267] = rvx_signal_11;
assign rvx_signal_03[`RVX_GDEF_267] = 0;

`else

assign rvx_signal_25[`RVX_GDEF_267] = 0;
assign rvx_signal_22[`RVX_GDEF_267] = 0;
assign rvx_signal_03[`RVX_GDEF_267] = 1;

`endif

`ifdef INCLUDE_TCACHING

assign tcu_spsel = rvx_signal_14[`RVX_GDEF_276];
assign tcu_spenable = rvx_signal_33[`RVX_GDEF_276];
assign tcu_spaddr = rvx_signal_19[`RVX_GDEF_276];
assign tcu_spwrite = rvx_signal_05[`RVX_GDEF_276];
assign tcu_spwdata = rvx_signal_13[`RVX_GDEF_276];

`else

assign tcu_spsel = 0;
assign tcu_spenable = 0;
assign tcu_spaddr = 0;
assign tcu_spwrite = 0;
assign tcu_spwdata = 0;

`endif

assign rvx_signal_22[`RVX_GDEF_276] = tcu_sprdata;
assign rvx_signal_25[`RVX_GDEF_276] = tcu_spready;
assign rvx_signal_03[`RVX_GDEF_276] = tcu_spslverr;

`ifdef INCLUDE_FLORIAN

assign florian_spsel = rvx_signal_14[`RVX_GDEF_306];
assign florian_spenable = rvx_signal_33[`RVX_GDEF_306];
assign florian_spaddr = rvx_signal_19[`RVX_GDEF_306];
assign florian_spwrite = rvx_signal_05[`RVX_GDEF_306];
assign florian_spwdata = rvx_signal_13[`RVX_GDEF_306];

`else

assign florian_spsel = 0;
assign florian_spenable = 0;
assign florian_spaddr = 0;
assign florian_spwrite = 0;
assign florian_spwdata = 0;

`endif

assign rvx_signal_22[`RVX_GDEF_306] = florian_sprdata;
assign rvx_signal_25[`RVX_GDEF_306] = florian_spready;
assign rvx_signal_03[`RVX_GDEF_306] = florian_spslverr;

endmodule
