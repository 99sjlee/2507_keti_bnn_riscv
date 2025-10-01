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



module prvp_dc_token_ring_fifo_dout(clk, rstn, data_async, write_token, read_pointer, data, valid, ready);



    parameter                   DATA_WIDTH = 10;
    parameter                   BUFFER_DEPTH = 8;

    input [DATA_WIDTH - 1 : 0]  data_async;

    input                       clk;
    input                       rstn;
    output [DATA_WIDTH - 1 : 0] data;
    output                      valid;
    input                       ready;

    input  [BUFFER_DEPTH - 1 : 0] write_token;
    output [BUFFER_DEPTH - 1 : 0] read_pointer;

    wire                        rvx_signal_3;
    wire                        rvx_signal_1;
    
    wire [BUFFER_DEPTH - 1 : 0] rvx_signal_2;

    wire [BUFFER_DEPTH - 1 : 0]  rvx_signal_0;
    wire [BUFFER_DEPTH - 1 : 0]  rvx_signal_4;

    assign data = data_async;

    assign rvx_signal_1 = ~ready;

    
    assign rvx_signal_3 = (valid & ~rvx_signal_1);

    
    prvp_dc_token_ring
    #(
      .BUFFER_DEPTH ( BUFFER_DEPTH ),
      .RESET_VALUE  ( 'h3          )
    )
    i_rvx_instance_1
    (
      .clk    ( clk         ),
      .rstn   ( rstn        ),
      .enable ( rvx_signal_3 ),
      .state  ( rvx_signal_2  )
    );

    
    assign read_pointer  = {rvx_signal_2[BUFFER_DEPTH - 3 : 0], rvx_signal_2[BUFFER_DEPTH - 1 : BUFFER_DEPTH - 2]} &
                           {rvx_signal_2[BUFFER_DEPTH - 4 : 0], rvx_signal_2[BUFFER_DEPTH - 1 : BUFFER_DEPTH - 3]};

    
    prvp_dc_synchronizer
    #(
      .WIDTH       ( BUFFER_DEPTH ),
      .RESET_VALUE ( 'hc          )
    )
    i_rvx_instance_0
    (
      .clk   ( clk            ),
      .rstn  ( rstn           ),
      .d_in  ( write_token    ),
      .d_out ( rvx_signal_0 )
    );

    assign rvx_signal_4 = ~rvx_signal_0 & {rvx_signal_0[0], rvx_signal_0[BUFFER_DEPTH - 1 : 1]} & {read_pointer[1 : 0], read_pointer[BUFFER_DEPTH - 1 : 2]};
    assign valid = ~(|rvx_signal_4);

endmodule
