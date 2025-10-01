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



module prvp_dc_full_detector(clk, rstn, read_pointer, write_pointer, valid, full);



    parameter                    BUFFER_DEPTH = 8;

    input                        clk;
    input                        rstn;
    input [BUFFER_DEPTH - 1 : 0] read_pointer;
    input [BUFFER_DEPTH - 1 : 0] write_pointer;
    input                        valid;
    output                       full;

    wire                         rvx_signal_2;
    wire                         rvx_signal_3;
    wire                         rvx_signal_1;
    wire                         rvx_signal_0;
    wire                         rvx_signal_4;
    reg                          rvx_signal_5;

    assign rvx_signal_2 = |(read_pointer & {write_pointer[BUFFER_DEPTH - 2 : 0], write_pointer[BUFFER_DEPTH - 1]});
    assign rvx_signal_3 = |(read_pointer & {write_pointer[BUFFER_DEPTH - 3 : 0], write_pointer[BUFFER_DEPTH - 1 : BUFFER_DEPTH - 2]});
    assign rvx_signal_1 = |(read_pointer & {write_pointer[BUFFER_DEPTH - 4 : 0], write_pointer[BUFFER_DEPTH - 1 : BUFFER_DEPTH - 3]});
    assign rvx_signal_0 = (rvx_signal_2 | rvx_signal_3 | rvx_signal_1);

    prvp_dc_synchronizer
    #(
      .WIDTH(1),
      .RESET_VALUE(1'b0)
    )
    i_rvx_instance_0
    (
      .clk   ( clk     ),
      .rstn  ( rstn    ),
      .d_in  ( rvx_signal_0 ),
      .d_out ( rvx_signal_4 )
    );

    always @(posedge clk  or negedge rstn)
    begin: full_evaluator
        if (rstn == 1'b0)
            rvx_signal_5 <= 1'b0;
        else
            rvx_signal_5 <= rvx_signal_4 | valid;
    end

    assign full = rvx_signal_5 & rvx_signal_4;

endmodule
