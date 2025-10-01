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


module prvp_dc_synchronizer (clk, rstn, d_in, d_out);


    parameter WIDTH       = 1;
    parameter RESET_VALUE = 'h0;

    input                  clk;
    input                  rstn;
    input  [WIDTH - 1 : 0] d_in;
    output [WIDTH - 1 : 0] d_out;

    reg [WIDTH - 1 : 0]    rvx_signal_0;
    reg [WIDTH - 1 : 0]    d_out;

    always @(posedge clk  or negedge rstn)
    begin: update_state
        if (rstn == 1'b0)
        begin
            rvx_signal_0 <= RESET_VALUE;
            d_out <= RESET_VALUE;
        end
        else
        begin
            rvx_signal_0 <= d_in;
            d_out <= rvx_signal_0;
        end
    end

endmodule
