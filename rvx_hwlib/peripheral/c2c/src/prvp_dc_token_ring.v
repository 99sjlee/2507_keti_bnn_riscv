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


module prvp_dc_token_ring(clk, rstn, enable, state);


    parameter                     BUFFER_DEPTH = 8;
    parameter                     RESET_VALUE = 'h3;

    input                         clk;
    input                         rstn;
    input                         enable;
    output [BUFFER_DEPTH - 1 : 0] state;

    reg [BUFFER_DEPTH - 1 : 0]    state;
    reg [BUFFER_DEPTH - 1 : 0]    rvx_signal_0;

    always @(posedge clk or negedge rstn)
    begin: update_state
        if (rstn == 1'b0)
            state <= RESET_VALUE;
        else
            state <= rvx_signal_0;
    end

    always @(enable, state)
    begin
        if (enable)
            rvx_signal_0 = {state[BUFFER_DEPTH - 2 : 0], state[BUFFER_DEPTH - 1]};
        else
            rvx_signal_0 = state;
    end

endmodule
