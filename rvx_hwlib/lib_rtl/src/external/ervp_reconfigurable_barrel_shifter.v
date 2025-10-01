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



module ERVP_RECONFIGURABLE_BARREL_SHIFTER
(
	input0,
	amount,
  is_amount_signed,
  does_plus_means_left,
  is_arithmetic,
  msb_fill_value,
  lsb_fill_value,
	output0
);



parameter BW_DATA = 32;
parameter BW_SHIFT_AMOUNT = 4;
parameter CIRCULAR_SHIFT = 0;

localparam  RVX_LPARA_0 = BW_SHIFT_AMOUNT;

input wire [BW_DATA-1:0] input0;
input wire [BW_SHIFT_AMOUNT-1:0] amount;
input wire is_amount_signed;
input wire does_plus_means_left;
input wire is_arithmetic;
input wire msb_fill_value;
input wire lsb_fill_value;
output wire [BW_DATA-1:0] output0;

genvar i;

reg rvx_signal_05;
wire rvx_signal_07;
wire [BW_SHIFT_AMOUNT-1:0] rvx_signal_01;
wire rvx_signal_03;

wire rvx_signal_06, rvx_signal_08;
wire [BW_DATA-1:0] rvx_signal_02 [RVX_LPARA_0-1:0];
wire [BW_DATA-1:0] rvx_signal_09 [RVX_LPARA_0-1:0];

wire [BW_DATA-1:0] rvx_signal_04, rvx_signal_00;

always@(*)
begin
	rvx_signal_05 = 1;
  if(is_amount_signed)
  begin
    if(does_plus_means_left)
    begin
      if(amount[BW_SHIFT_AMOUNT-1])
        rvx_signal_05 = 0;
      else
        rvx_signal_05 = 1;
    end
    else
    begin
      if(amount[BW_SHIFT_AMOUNT-1])
        rvx_signal_05 = 1;
      else
        rvx_signal_05 = 0;
    end
  end
  else
  begin
    if(does_plus_means_left)
      rvx_signal_05 = 1;
    else
      rvx_signal_05 = 0;
  end
end

assign rvx_signal_07 = is_amount_signed & amount[BW_SHIFT_AMOUNT-1];
assign rvx_signal_01 = rvx_signal_07? ~amount : amount;
assign rvx_signal_03 = rvx_signal_07;

assign rvx_signal_06 = is_arithmetic? input0[BW_DATA-1] : msb_fill_value;
assign rvx_signal_08 = is_arithmetic? 0 : lsb_fill_value;

assign rvx_signal_02[0] = input0;
generate
	for(i=1; i<RVX_LPARA_0; i=i+1)
	begin : i_step_input
		assign rvx_signal_02[i] = rvx_signal_09[i-1];
	end
endgenerate

generate
	for(i=0; i<(RVX_LPARA_0-1); i=i+1)
	begin : i_step
		RVX_MODULE_010
		#(
			.RVX_GPARA_2(BW_DATA),
			.RVX_GPARA_0((2**i)),
			.RVX_GPARA_1(CIRCULAR_SHIFT)
		)
		i_rvx_instance_0
		(
			.rvx_port_0(rvx_signal_02[i]),
			.rvx_port_1(rvx_signal_01[i]),
			.rvx_port_4(~rvx_signal_05),
			.rvx_port_5(rvx_signal_06),
			.rvx_port_2(rvx_signal_08),
			.rvx_port_3(rvx_signal_09[i])
		);
	end
endgenerate

RVX_MODULE_010
#(
	.RVX_GPARA_2(BW_DATA),
	.RVX_GPARA_0(1),
	.RVX_GPARA_1(CIRCULAR_SHIFT)
)
i_rvx_instance_2
(
	.rvx_port_0(rvx_signal_02[RVX_LPARA_0-1]),
	.rvx_port_1(rvx_signal_03),
	.rvx_port_4(~rvx_signal_05),
	.rvx_port_5(rvx_signal_06),
	.rvx_port_2(rvx_signal_08),
	.rvx_port_3(rvx_signal_04)
);

RVX_MODULE_010
#(
	.RVX_GPARA_2(BW_DATA),
	.RVX_GPARA_0((2**(RVX_LPARA_0-1))),
	.RVX_GPARA_1(CIRCULAR_SHIFT)
)
i_rvx_instance_1
(
	.rvx_port_0(rvx_signal_02[RVX_LPARA_0-1]),
	.rvx_port_1(amount[BW_SHIFT_AMOUNT-1]),
	.rvx_port_4(~rvx_signal_05),
	.rvx_port_5(rvx_signal_06),
	.rvx_port_2(rvx_signal_08),
	.rvx_port_3(rvx_signal_00)
);

assign output0 = is_amount_signed? rvx_signal_04 : rvx_signal_00;

endmodule
