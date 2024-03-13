//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Dec  2 16:38:15 2023
// Version: 2022.3 2022.3.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// P9_11_18_IOPADS
module P9_11_18_IOPADS(
    // Inputs
    GPIO_OE,
    GPIO_OUT,
    // Outputs
    GPIO_IN,
    // Inouts
    P9_11,
    P9_12,
    P9_13,
    P9_14,
    P9_15,
    P9_16,
    P9_17,
    P9_18
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [18:11] GPIO_OE;
input  [18:11] GPIO_OUT;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [18:11] GPIO_IN;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout          P9_11;
inout          P9_12;
inout          P9_13;
inout          P9_14;
inout          P9_15;
inout          P9_16;
inout          P9_17;
inout          P9_18;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           GPIO_IN_net_0;
wire           GPIO_IN_0;
wire           GPIO_IN_1;
wire           GPIO_IN_2;
wire           GPIO_IN_3;
wire           GPIO_IN_4;
wire           GPIO_IN_5;
wire           GPIO_IN_6;
wire   [11:11] GPIO_OE_slice_0;
wire   [12:12] GPIO_OE_slice_1;
wire   [13:13] GPIO_OE_slice_2;
wire   [14:14] GPIO_OE_slice_3;
wire   [15:15] GPIO_OE_slice_4;
wire   [16:16] GPIO_OE_slice_5;
wire   [17:17] GPIO_OE_slice_6;
wire   [18:18] GPIO_OE_slice_7;
wire   [11:11] GPIO_OUT_slice_0;
wire   [12:12] GPIO_OUT_slice_1;
wire   [13:13] GPIO_OUT_slice_2;
wire   [14:14] GPIO_OUT_slice_3;
wire   [15:15] GPIO_OUT_slice_4;
wire   [16:16] GPIO_OUT_slice_5;
wire   [17:17] GPIO_OUT_slice_6;
wire   [18:18] GPIO_OUT_slice_7;
wire           P9_11;
wire           P9_12;
wire           P9_13;
wire           P9_14;
wire           P9_15;
wire           P9_16;
wire           P9_17;
wire           P9_18;
wire   [11:11] GPIO_IN_net_1;
wire   [12:12] GPIO_IN_0_net_0;
wire   [13:13] GPIO_IN_1_net_0;
wire   [14:14] GPIO_IN_2_net_0;
wire   [15:15] GPIO_IN_3_net_0;
wire   [16:16] GPIO_IN_4_net_0;
wire   [17:17] GPIO_IN_5_net_0;
wire   [18:18] GPIO_IN_6_net_0;
wire   [18:11] GPIO_OUT;
wire   [18:11] GPIO_OE;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign GPIO_IN_net_1[11]   = GPIO_IN_net_0;
assign GPIO_IN[11:11]      = GPIO_IN_net_1[11];
assign GPIO_IN_0_net_0[12] = GPIO_IN_0;
assign GPIO_IN[12:12]      = GPIO_IN_0_net_0[12];
assign GPIO_IN_1_net_0[13] = GPIO_IN_1;
assign GPIO_IN[13:13]      = GPIO_IN_1_net_0[13];
assign GPIO_IN_2_net_0[14] = GPIO_IN_2;
assign GPIO_IN[14:14]      = GPIO_IN_2_net_0[14];
assign GPIO_IN_3_net_0[15] = GPIO_IN_3;
assign GPIO_IN[15:15]      = GPIO_IN_3_net_0[15];
assign GPIO_IN_4_net_0[16] = GPIO_IN_4;
assign GPIO_IN[16:16]      = GPIO_IN_4_net_0[16];
assign GPIO_IN_5_net_0[17] = GPIO_IN_5;
assign GPIO_IN[17:17]      = GPIO_IN_5_net_0[17];
assign GPIO_IN_6_net_0[18] = GPIO_IN_6;
assign GPIO_IN[18:18]      = GPIO_IN_6_net_0[18];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign GPIO_OE_slice_0[11]  = GPIO_OE[11:11];
assign GPIO_OE_slice_1[12]  = GPIO_OE[12:12];
assign GPIO_OE_slice_2[13]  = GPIO_OE[13:13];
assign GPIO_OE_slice_3[14]  = GPIO_OE[14:14];
assign GPIO_OE_slice_4[15]  = GPIO_OE[15:15];
assign GPIO_OE_slice_5[16]  = GPIO_OE[16:16];
assign GPIO_OE_slice_6[17]  = GPIO_OE[17:17];
assign GPIO_OE_slice_7[18]  = GPIO_OE[18:18];
assign GPIO_OUT_slice_0[11] = GPIO_OUT[11:11];
assign GPIO_OUT_slice_1[12] = GPIO_OUT[12:12];
assign GPIO_OUT_slice_2[13] = GPIO_OUT[13:13];
assign GPIO_OUT_slice_3[14] = GPIO_OUT[14:14];
assign GPIO_OUT_slice_4[15] = GPIO_OUT[15:15];
assign GPIO_OUT_slice_5[16] = GPIO_OUT[16:16];
assign GPIO_OUT_slice_6[17] = GPIO_OUT[17:17];
assign GPIO_OUT_slice_7[18] = GPIO_OUT[18:18];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BIBUF
BIBUF P9_11_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_0 ),
        .E   ( GPIO_OE_slice_0 ),
        // Outputs
        .Y   ( GPIO_IN_net_0 ),
        // Inouts
        .PAD ( P9_11 ) 
        );

//--------BIBUF
BIBUF P9_12_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_1 ),
        .E   ( GPIO_OE_slice_1 ),
        // Outputs
        .Y   ( GPIO_IN_0 ),
        // Inouts
        .PAD ( P9_12 ) 
        );

//--------BIBUF
BIBUF P9_13_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_2 ),
        .E   ( GPIO_OE_slice_2 ),
        // Outputs
        .Y   ( GPIO_IN_1 ),
        // Inouts
        .PAD ( P9_13 ) 
        );

//--------BIBUF
BIBUF P9_14_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_3 ),
        .E   ( GPIO_OE_slice_3 ),
        // Outputs
        .Y   ( GPIO_IN_2 ),
        // Inouts
        .PAD ( P9_14 ) 
        );

//--------BIBUF
BIBUF P9_15_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_4 ),
        .E   ( GPIO_OE_slice_4 ),
        // Outputs
        .Y   ( GPIO_IN_3 ),
        // Inouts
        .PAD ( P9_15 ) 
        );

//--------BIBUF
BIBUF P9_16_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_5 ),
        .E   ( GPIO_OE_slice_5 ),
        // Outputs
        .Y   ( GPIO_IN_4 ),
        // Inouts
        .PAD ( P9_16 ) 
        );

//--------BIBUF
BIBUF P9_17_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_6 ),
        .E   ( GPIO_OE_slice_6 ),
        // Outputs
        .Y   ( GPIO_IN_5 ),
        // Inouts
        .PAD ( P9_17 ) 
        );

//--------BIBUF
BIBUF P9_18_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_7 ),
        .E   ( GPIO_OE_slice_7 ),
        // Outputs
        .Y   ( GPIO_IN_6 ),
        // Inouts
        .PAD ( P9_18 ) 
        );


endmodule
