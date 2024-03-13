//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Dec  2 16:38:15 2023
// Version: 2022.3 2022.3.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// P9_41_42_IOPADS
module P9_41_42_IOPADS(
    // Inputs
    GPIO_OE,
    GPIO_OUT,
    // Outputs
    GPIO_IN,
    // Inouts
    P9_41,
    P9_42
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [42:41] GPIO_OE;
input  [42:41] GPIO_OUT;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [42:41] GPIO_IN;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout          P9_41;
inout          P9_42;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           GPIO_IN_net_0;
wire           GPIO_IN_0;
wire   [41:41] GPIO_OE_slice_0;
wire   [42:42] GPIO_OE_slice_1;
wire   [41:41] GPIO_OUT_slice_0;
wire   [42:42] GPIO_OUT_slice_1;
wire           P9_41;
wire           P9_42;
wire   [41:41] GPIO_IN_net_1;
wire   [42:42] GPIO_IN_0_net_0;
wire   [42:41] GPIO_OUT;
wire   [42:41] GPIO_OE;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign GPIO_IN_net_1[41]   = GPIO_IN_net_0;
assign GPIO_IN[41:41]      = GPIO_IN_net_1[41];
assign GPIO_IN_0_net_0[42] = GPIO_IN_0;
assign GPIO_IN[42:42]      = GPIO_IN_0_net_0[42];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign GPIO_OE_slice_0[41]  = GPIO_OE[41:41];
assign GPIO_OE_slice_1[42]  = GPIO_OE[42:42];
assign GPIO_OUT_slice_0[41] = GPIO_OUT[41:41];
assign GPIO_OUT_slice_1[42] = GPIO_OUT[42:42];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BIBUF
BIBUF P9_41_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_0 ),
        .E   ( GPIO_OE_slice_0 ),
        // Outputs
        .Y   ( GPIO_IN_net_0 ),
        // Inouts
        .PAD ( P9_41 ) 
        );

//--------BIBUF
BIBUF P9_42_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_1 ),
        .E   ( GPIO_OE_slice_1 ),
        // Outputs
        .Y   ( GPIO_IN_0 ),
        // Inouts
        .PAD ( P9_42 ) 
        );


endmodule
