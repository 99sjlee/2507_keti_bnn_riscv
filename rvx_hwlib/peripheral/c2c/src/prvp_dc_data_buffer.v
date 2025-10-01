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

`define RVX_LDEF_1


module prvp_dc_data_buffer(clk, rstn, write_pointer, write_data, read_pointer, read_data);


    parameter DATA_WIDTH   = 32;
    parameter BUFFER_DEPTH = 8;

    `ifndef RVX_LDEF_1
        function integer log2(input integer value);
        begin
            value = value - 1;
            for (log2 = 0; value > 0; log2 = log2 + 1)
                value = value >> 1;
        end
        endfunction
        `define RVX_LDEF_0(N) log2(N)
    `else
        `define RVX_LDEF_0(N) ((N)<=(1) ? 0 : (N)<=(2) ? 1 : (N)<=(4) ? 2 : (N)<=(8) ? 3 : (N)<=(16) ? 4 : (N)<=(32) ? 5 : (N)<=(64) ? 6 : (N)<=(128) ? 7 : (N)<=(256) ? 8 : (N)<=(512) ? 9 : (N)<=(1024) ? 10 : -1)
    `endif

    input                          clk;
    input                          rstn;

    input  [BUFFER_DEPTH - 1 : 0]  write_pointer;
    input  [DATA_WIDTH - 1 : 0]    write_data;
    input  [BUFFER_DEPTH - 1 : 0]  read_pointer;
    output [DATA_WIDTH - 1 : 0]    read_data;

    reg [DATA_WIDTH - 1 : 0]       rvx_signal_0[BUFFER_DEPTH - 1 : 0];

    integer loop;

    always @(posedge clk  or negedge rstn)
    begin: read_write_data
        if (rstn == 1'b0)
            for (loop = 0; loop < BUFFER_DEPTH; loop = loop + 1)
                rvx_signal_0[loop] <= 'h0;
        else
            rvx_signal_0[`RVX_LDEF_0(write_pointer)] <= write_data;
    end

    assign read_data = rvx_signal_0[`RVX_LDEF_0(read_pointer)];

endmodule
