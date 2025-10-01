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
`include "rvx_include_10.vh"
`include "platform_info.vh"



module ERVP_COMMON_PERI_GROUP
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
	
	lock_status_list,
	real_clock,
	global_tag_list,
	system_tick_config,
	core_tick_config
);



parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter NUM_LOCK = 1;
parameter NUM_AUTO_ID = 1;
parameter NUM_GLOBAL_TAG = 1;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_3 = `RVX_GDEF_026;
localparam  RVX_LPARA_7 = `RVX_GDEF_186-1;
localparam  RVX_LPARA_1 = `RVX_GDEF_011;

localparam  RVX_LPARA_4 = 8;
localparam  RVX_LPARA_5 = 64;

localparam  RVX_LPARA_2 = (`DIVIDERU(`SYSTEM_CLK_HZ, `TICK_HZ)<<1) + 1;
localparam  RVX_LPARA_8 = (`DIVIDERU(`CORE_CLK_HZ, `TICK_HZ)<<1) + 1;

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

output wire [NUM_LOCK-1:0] lock_status_list;
input wire [RVX_LPARA_5-1:0] real_clock;
output wire [NUM_GLOBAL_TAG-1:0] global_tag_list;
output wire [11-1:0] system_tick_config;
output wire [11-1:0] core_tick_config;

genvar i;

wire [RVX_LPARA_3*BW_ADDR-1:0] rvx_signal_28;
wire [RVX_LPARA_3-1:0] rvx_signal_13;
wire [RVX_LPARA_3-1:0] rvx_signal_22;
wire [RVX_LPARA_3*BW_DATA-1:0] rvx_signal_15;
wire [RVX_LPARA_3-1:0] rvx_signal_07;
wire [RVX_LPARA_3*BW_DATA-1:0] rvx_signal_17;
wire [RVX_LPARA_3*BW_DATA-1:0] rvx_signal_21;
wire [RVX_LPARA_3-1:0] rvx_signal_37;
wire [RVX_LPARA_3-1:0] rvx_signal_30;

wire [BW_ADDR-1:0] rvx_signal_04 [RVX_LPARA_3-1:0];
wire [RVX_LPARA_3-1:0] rvx_signal_25;
wire [RVX_LPARA_3-1:0] rvx_signal_10;
wire [BW_ADDR-1:0] rvx_signal_20 [RVX_LPARA_3-1:0];
wire [RVX_LPARA_3-1:0] rvx_signal_24;
wire [BW_DATA-1:0] rvx_signal_32 [RVX_LPARA_3-1:0];
wire [BW_DATA-1:0] rvx_signal_23 [RVX_LPARA_3-1:0];
wire [RVX_LPARA_3-1:0] rvx_signal_27;
wire [RVX_LPARA_3-1:0] rvx_signal_33;

wire [NUM_LOCK-1:0] rvx_signal_00;
reg [NUM_LOCK-1:0] rvx_signal_11;
reg [NUM_LOCK-1:0] rvx_signal_26;
wire [NUM_LOCK-1:0] rvx_signal_09;

reg [NUM_AUTO_ID-1:0] rvx_signal_08;
reg [NUM_AUTO_ID-1:0] rvx_signal_06;
wire [RVX_LPARA_4-1:0] rvx_signal_31 [NUM_AUTO_ID-1:0];
wire [NUM_AUTO_ID-1:0] rvx_signal_05;

wire [RVX_LPARA_4*NUM_AUTO_ID-1:0] rvx_signal_12;
wire [RVX_LPARA_4-1:0] rvx_signal_02;

wire rvx_signal_29;
wire [8-1:0] rvx_signal_14;
wire rvx_signal_36;
wire [8-1:0] rvx_signal_35;
wire [11-1:0] rvx_signal_34;
wire [11-1:0] rvx_signal_19;

reg rvx_signal_03;
wire rvx_signal_16;
reg [RVX_LPARA_5-1:0] rvx_signal_01;
wire [RVX_LPARA_5-1:0] rvx_signal_18;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_3),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_7),
	.BW_SEL_INDEX(RVX_LPARA_1)
)
i_rvx_instance_4
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
	.rpbaseaddr_list(rvx_signal_28),

	.spsel_list(rvx_signal_13),
	.spenable_list(rvx_signal_22),
	.spaddr_list(rvx_signal_15),
	.spwrite_list(rvx_signal_07),
	.spwdata_list(rvx_signal_17),
	.sprdata_list(rvx_signal_21),
	.spready_list(rvx_signal_37),
	.spslverr_list(rvx_signal_30)
);

generate
	for(i=0; i<RVX_LPARA_3; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_28[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_04[i];
		assign rvx_signal_25[i] = rvx_signal_13[i];
		assign rvx_signal_10[i] = rvx_signal_22[i];
		assign rvx_signal_20[i] = rvx_signal_15[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_24[i] = rvx_signal_07[i];
		assign rvx_signal_32[i] = rvx_signal_17[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_21[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_23[i];
		assign rvx_signal_37[i] = rvx_signal_27[i];
		assign rvx_signal_30[i] = rvx_signal_33[i];
	end
endgenerate

assign rvx_signal_04[`RVX_GDEF_388] = `RVX_GDEF_220;
assign rvx_signal_04[`RVX_GDEF_350] = `RVX_GDEF_065;
assign rvx_signal_04[`RVX_GDEF_336] = `RVX_GDEF_279;
assign rvx_signal_04[`RVX_GDEF_365] = `RVX_GDEF_088;
assign rvx_signal_04[`RVX_GDEF_235] = `RVX_GDEF_344;

`ifdef INCLUDE_IROM

ERVP_IROM_APB
#(
	.BW_ADDR(BW_ADDR)
)
i_rvx_instance_5
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_25[`RVX_GDEF_388]),
	.rpenable(rvx_signal_10[`RVX_GDEF_388]),
	.rpaddr(rvx_signal_20[`RVX_GDEF_388]),
	.rpwrite(rvx_signal_24[`RVX_GDEF_388]),
	.rpwdata(rvx_signal_32[`RVX_GDEF_388]),
	.rprdata(rvx_signal_23[`RVX_GDEF_388]),
	.rpready(rvx_signal_27[`RVX_GDEF_388]),
	.rpslverr(rvx_signal_33[`RVX_GDEF_388])
);

`else

assign rvx_signal_27[`RVX_GDEF_388] = 0;
assign rvx_signal_23[`RVX_GDEF_388] = -1;
assign rvx_signal_33[`RVX_GDEF_388] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_LOCK; i=i+1)
	begin : i_generate_lock
		RVX_MODULE_118
		i_rvx_instance_0
		(
			.rvx_port_4(clk),
			.rvx_port_1(rstnn),
			.rvx_port_5(rvx_signal_11[i]),
			.rvx_port_0(rvx_signal_26[i]),
			.rvx_port_2(rvx_signal_09[i]),
			.rvx_port_3(lock_status_list[i])
		);
	end
endgenerate

assign rvx_signal_00 = rvx_signal_20[`RVX_GDEF_350][`RVX_GDEF_194-1:`RVX_GDEF_070];

always@(*)
begin
	rvx_signal_11 = 0;
	rvx_signal_26 = 0;
	if(rvx_signal_25[`RVX_GDEF_350] && rvx_signal_10[`RVX_GDEF_350])
	begin
		if(rvx_signal_24[`RVX_GDEF_350])
			rvx_signal_26 = rvx_signal_00;
		else
			rvx_signal_11 = rvx_signal_00;
	end
end

assign rvx_signal_27[`RVX_GDEF_350] = 1;
assign rvx_signal_23[`RVX_GDEF_350] = rvx_signal_09 & rvx_signal_00;
assign rvx_signal_33[`RVX_GDEF_350] = 0;

`else

assign lock_status_list = 0;
assign rvx_signal_27[`RVX_GDEF_350] = 0;
assign rvx_signal_23[`RVX_GDEF_350] = -1;
assign rvx_signal_33[`RVX_GDEF_350] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_generate_auto_id
		ERVP_COUNTER
		#(
			.BW_COUNTER(RVX_LPARA_4),
			.CIRCULAR(0)
		)
		i_rvx_instance_6
		(
			.clk(clk),
			.rstnn(rstnn),
			.enable(1'b 1),
			.init(rvx_signal_08[i]),
			.count(rvx_signal_06[i]),
			.value(rvx_signal_31[i]),
			.is_first_count(),
			.is_last_count()
		);
	end
endgenerate

assign rvx_signal_05 = rvx_signal_20[`RVX_GDEF_336][`RVX_GDEF_411-1:`RVX_GDEF_392];

always@(*)
begin
	rvx_signal_08 = 0;
	rvx_signal_06 = 0;
	if(rvx_signal_25[`RVX_GDEF_336] && rvx_signal_10[`RVX_GDEF_336])
	begin
		if(rvx_signal_24[`RVX_GDEF_336])
			rvx_signal_08 = rvx_signal_05;
		else
			rvx_signal_06 = rvx_signal_05;
	end
end

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_concat_auto_id
		assign rvx_signal_12[(i+1)*RVX_LPARA_4-1-:RVX_LPARA_4] = rvx_signal_31[i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_LPARA_4),
	.NUM_DATA(NUM_AUTO_ID),
	.ACTIVE_HIGH(1)
)
i_rvx_instance_2
(
	.data_input_list(rvx_signal_12),
	.select(rvx_signal_05),
	.data_output(rvx_signal_02)
);

assign rvx_signal_27[`RVX_GDEF_336] = 1;
assign rvx_signal_23[`RVX_GDEF_336] = rvx_signal_02;
assign rvx_signal_33[`RVX_GDEF_336] = 0;

`else

assign rvx_signal_27[`RVX_GDEF_336] = 0;
assign rvx_signal_23[`RVX_GDEF_336] = -1;
assign rvx_signal_33[`RVX_GDEF_336] = 1;

`endif

RVX_MODULE_006
#(
	.RVX_GPARA_3(BW_ADDR),
	.RVX_GPARA_0(BW_DATA),
	.RVX_GPARA_4(RVX_LPARA_2),
	.RVX_GPARA_2(RVX_LPARA_8)
)
i_rvx_instance_3
(
	.rvx_port_12(clk),
	.rvx_port_15(rstnn),

	.rvx_port_04(rvx_signal_25[`RVX_GDEF_365]),
	.rvx_port_09(rvx_signal_10[`RVX_GDEF_365]),
	.rvx_port_02(rvx_signal_20[`RVX_GDEF_365]),
	.rvx_port_05(rvx_signal_24[`RVX_GDEF_365]),
	.rvx_port_11(rvx_signal_32[`RVX_GDEF_365]),
	.rvx_port_07(rvx_signal_23[`RVX_GDEF_365]),
	.rvx_port_14(rvx_signal_27[`RVX_GDEF_365]),
	.rvx_port_16(rvx_signal_33[`RVX_GDEF_365]),

	.rvx_port_08(1'b 0),
	.rvx_port_13(rvx_signal_29),
	.rvx_port_03(rvx_signal_14),
	.rvx_port_00(rvx_signal_36),
	.rvx_port_01(rvx_signal_35),
	.rvx_port_10(rvx_signal_34),
	.rvx_port_06(rvx_signal_19)
);

`ifdef INCLUDE_MULTICORE

RVX_MODULE_000
#(
	.RVX_GPARA_0(NUM_GLOBAL_TAG)
)
i_rvx_instance_1
(
	.rvx_port_2(clk),
	.rvx_port_4(rstnn),

	.rvx_port_0(global_tag_list),
	.rvx_port_1(rvx_signal_36),
	.rvx_port_3(rvx_signal_35[NUM_GLOBAL_TAG-1:0])
);

assign rvx_signal_14 = global_tag_list;

`else

assign global_tag_list = 0;
assign rvx_signal_14 = -1;

`endif

assign system_tick_config = rvx_signal_34;
assign core_tick_config = rvx_signal_19;

localparam  RVX_LPARA_0 = 0;
localparam  RVX_LPARA_6 = 1;

assign rvx_signal_16 = rvx_signal_25[`RVX_GDEF_235] & rvx_signal_10[`RVX_GDEF_235];
assign rvx_signal_18 = (rvx_signal_03==RVX_LPARA_0)? real_clock : rvx_signal_01; 

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_03 <= RVX_LPARA_0;
	else if(rvx_signal_16)
		rvx_signal_03 <= ~rvx_signal_03;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_01 <= 0;
	else if((rvx_signal_03==RVX_LPARA_0) && rvx_signal_16)
		rvx_signal_01 <= real_clock;
end

assign rvx_signal_27[`RVX_GDEF_235] = 1;
assign rvx_signal_23[`RVX_GDEF_235] = rvx_signal_20[`RVX_GDEF_235][2]? rvx_signal_18[RVX_LPARA_5-1-:BW_DATA] : rvx_signal_18[BW_DATA-1-:BW_DATA];

assign rvx_signal_33[`RVX_GDEF_235] = rvx_signal_24[`RVX_GDEF_235];

endmodule
