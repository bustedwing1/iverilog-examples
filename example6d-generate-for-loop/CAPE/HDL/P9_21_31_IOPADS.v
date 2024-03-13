//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Dec  2 16:38:15 2023
// Version: 2022.3 2022.3.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// P9_21_31_IOPADS
module P9_21_31_IOPADS(
    // Inputs
    GPIO_OE,
    GPIO_OUT,
    // Outputs
    GPIO_IN,
    // Inouts
    P9_21,
    P9_22,
    P9_23,
    P9_24,
    P9_25,
    P9_26,
    P9_27,
    P9_28,
    P9_29,
    P9_30,
    P9_31
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [31:21] GPIO_OE;
input  [31:21] GPIO_OUT;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:21] GPIO_IN;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout          P9_21;
inout          P9_22;
inout          P9_23;
inout          P9_24;
inout          P9_25;
inout          P9_26;
inout          P9_27;
inout          P9_28;
inout          P9_29;
inout          P9_30;
inout          P9_31;
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
wire           GPIO_IN_7;
wire           GPIO_IN_8;
wire           GPIO_IN_9;
wire   [21:21] GPIO_OE_slice_0;
wire   [22:22] GPIO_OE_slice_1;
wire   [23:23] GPIO_OE_slice_2;
wire   [24:24] GPIO_OE_slice_3;
wire   [25:25] GPIO_OE_slice_4;
wire   [26:26] GPIO_OE_slice_5;
wire   [27:27] GPIO_OE_slice_6;
wire   [28:28] GPIO_OE_slice_7;
wire   [29:29] GPIO_OE_slice_8;
wire   [30:30] GPIO_OE_slice_9;
wire   [31:31] GPIO_OE_slice_10;
wire   [21:21] GPIO_OUT_slice_0;
wire   [22:22] GPIO_OUT_slice_1;
wire   [23:23] GPIO_OUT_slice_2;
wire   [24:24] GPIO_OUT_slice_3;
wire   [25:25] GPIO_OUT_slice_4;
wire   [26:26] GPIO_OUT_slice_5;
wire   [27:27] GPIO_OUT_slice_6;
wire   [28:28] GPIO_OUT_slice_7;
wire   [29:29] GPIO_OUT_slice_8;
wire   [30:30] GPIO_OUT_slice_9;
wire   [31:31] GPIO_OUT_slice_10;
wire           P9_21;
wire           P9_22;
wire           P9_23;
wire           P9_24;
wire           P9_25;
wire           P9_26;
wire           P9_27;
wire           P9_28;
wire           P9_29;
wire           P9_30;
wire           P9_31;
wire   [21:21] GPIO_IN_net_1;
wire   [22:22] GPIO_IN_0_net_0;
wire   [23:23] GPIO_IN_1_net_0;
wire   [24:24] GPIO_IN_2_net_0;
wire   [25:25] GPIO_IN_3_net_0;
wire   [26:26] GPIO_IN_4_net_0;
wire   [27:27] GPIO_IN_5_net_0;
wire   [28:28] GPIO_IN_6_net_0;
wire   [29:29] GPIO_IN_7_net_0;
wire   [30:30] GPIO_IN_8_net_0;
wire   [31:31] GPIO_IN_9_net_0;
wire   [31:21] GPIO_OUT;
wire   [31:21] GPIO_OE;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign GPIO_IN_net_1[21]   = GPIO_IN_net_0;
assign GPIO_IN[21:21]      = GPIO_IN_net_1[21];
assign GPIO_IN_0_net_0[22] = GPIO_IN_0;
assign GPIO_IN[22:22]      = GPIO_IN_0_net_0[22];
assign GPIO_IN_1_net_0[23] = GPIO_IN_1;
assign GPIO_IN[23:23]      = GPIO_IN_1_net_0[23];
assign GPIO_IN_2_net_0[24] = GPIO_IN_2;
assign GPIO_IN[24:24]      = GPIO_IN_2_net_0[24];
assign GPIO_IN_3_net_0[25] = GPIO_IN_3;
assign GPIO_IN[25:25]      = GPIO_IN_3_net_0[25];
assign GPIO_IN_4_net_0[26] = GPIO_IN_4;
assign GPIO_IN[26:26]      = GPIO_IN_4_net_0[26];
assign GPIO_IN_5_net_0[27] = GPIO_IN_5;
assign GPIO_IN[27:27]      = GPIO_IN_5_net_0[27];
assign GPIO_IN_6_net_0[28] = GPIO_IN_6;
assign GPIO_IN[28:28]      = GPIO_IN_6_net_0[28];
assign GPIO_IN_7_net_0[29] = GPIO_IN_7;
assign GPIO_IN[29:29]      = GPIO_IN_7_net_0[29];
assign GPIO_IN_8_net_0[30] = GPIO_IN_8;
assign GPIO_IN[30:30]      = GPIO_IN_8_net_0[30];
assign GPIO_IN_9_net_0[31] = GPIO_IN_9;
assign GPIO_IN[31:31]      = GPIO_IN_9_net_0[31];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign GPIO_OE_slice_0[21]   = GPIO_OE[21:21];
assign GPIO_OE_slice_1[22]   = GPIO_OE[22:22];
assign GPIO_OE_slice_2[23]   = GPIO_OE[23:23];
assign GPIO_OE_slice_3[24]   = GPIO_OE[24:24];
assign GPIO_OE_slice_4[25]   = GPIO_OE[25:25];
assign GPIO_OE_slice_5[26]   = GPIO_OE[26:26];
assign GPIO_OE_slice_6[27]   = GPIO_OE[27:27];
assign GPIO_OE_slice_7[28]   = GPIO_OE[28:28];
assign GPIO_OE_slice_8[29]   = GPIO_OE[29:29];
assign GPIO_OE_slice_9[30]   = GPIO_OE[30:30];
assign GPIO_OE_slice_10[31]  = GPIO_OE[31:31];
assign GPIO_OUT_slice_0[21]  = GPIO_OUT[21:21];
assign GPIO_OUT_slice_1[22]  = GPIO_OUT[22:22];
assign GPIO_OUT_slice_2[23]  = GPIO_OUT[23:23];
assign GPIO_OUT_slice_3[24]  = GPIO_OUT[24:24];
assign GPIO_OUT_slice_4[25]  = GPIO_OUT[25:25];
assign GPIO_OUT_slice_5[26]  = GPIO_OUT[26:26];
assign GPIO_OUT_slice_6[27]  = GPIO_OUT[27:27];
assign GPIO_OUT_slice_7[28]  = GPIO_OUT[28:28];
assign GPIO_OUT_slice_8[29]  = GPIO_OUT[29:29];
assign GPIO_OUT_slice_9[30]  = GPIO_OUT[30:30];
assign GPIO_OUT_slice_10[31] = GPIO_OUT[31:31];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BIBUF
BIBUF P9_21_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_0 ),
        .E   ( GPIO_OE_slice_0 ),
        // Outputs
        .Y   ( GPIO_IN_net_0 ),
        // Inouts
        .PAD ( P9_21 ) 
        );

//--------BIBUF
BIBUF P9_22_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_1 ),
        .E   ( GPIO_OE_slice_1 ),
        // Outputs
        .Y   ( GPIO_IN_0 ),
        // Inouts
        .PAD ( P9_22 ) 
        );

//--------BIBUF
BIBUF P9_23_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_2 ),
        .E   ( GPIO_OE_slice_2 ),
        // Outputs
        .Y   ( GPIO_IN_1 ),
        // Inouts
        .PAD ( P9_23 ) 
        );

//--------BIBUF
BIBUF P9_24_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_3 ),
        .E   ( GPIO_OE_slice_3 ),
        // Outputs
        .Y   ( GPIO_IN_2 ),
        // Inouts
        .PAD ( P9_24 ) 
        );

//--------BIBUF
BIBUF P9_25_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_4 ),
        .E   ( GPIO_OE_slice_4 ),
        // Outputs
        .Y   ( GPIO_IN_3 ),
        // Inouts
        .PAD ( P9_25 ) 
        );

//--------BIBUF
BIBUF P9_26_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_5 ),
        .E   ( GPIO_OE_slice_5 ),
        // Outputs
        .Y   ( GPIO_IN_4 ),
        // Inouts
        .PAD ( P9_26 ) 
        );

//--------BIBUF
BIBUF P9_27_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_6 ),
        .E   ( GPIO_OE_slice_6 ),
        // Outputs
        .Y   ( GPIO_IN_5 ),
        // Inouts
        .PAD ( P9_27 ) 
        );

//--------BIBUF
BIBUF P9_28_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_7 ),
        .E   ( GPIO_OE_slice_7 ),
        // Outputs
        .Y   ( GPIO_IN_6 ),
        // Inouts
        .PAD ( P9_28 ) 
        );

//--------BIBUF
BIBUF P9_29_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_8 ),
        .E   ( GPIO_OE_slice_8 ),
        // Outputs
        .Y   ( GPIO_IN_7 ),
        // Inouts
        .PAD ( P9_29 ) 
        );

//--------BIBUF
BIBUF P9_30_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_9 ),
        .E   ( GPIO_OE_slice_9 ),
        // Outputs
        .Y   ( GPIO_IN_8 ),
        // Inouts
        .PAD ( P9_30 ) 
        );

//--------BIBUF
BIBUF P9_31_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_10 ),
        .E   ( GPIO_OE_slice_10 ),
        // Outputs
        .Y   ( GPIO_IN_9 ),
        // Inouts
        .PAD ( P9_31 ) 
        );


endmodule
