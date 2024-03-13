//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Dec  2 16:38:15 2023
// Version: 2022.3 2022.3.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// P8_IOPADS
module P8_IOPADS(
    // Inputs
    GPIO_OE,
    GPIO_OUT,
    // Outputs
    GPIO_IN,
    // Inouts
    P8_3,
    P8_4,
    P8_5,
    P8_6,
    P8_7,
    P8_8,
    P8_9,
    P8_10,
    P8_11,
    P8_12,
    P8_13,
    P8_14,
    P8_15,
    P8_16,
    P8_17,
    P8_18,
    P8_19,
    P8_20,
    P8_21,
    P8_22,
    P8_23,
    P8_24,
    P8_25,
    P8_26,
    P8_27,
    P8_28,
    P8_29,
    P8_30,
    P8_31,
    P8_32,
    P8_33,
    P8_34,
    P8_35,
    P8_36,
    P8_37,
    P8_38,
    P8_39,
    P8_40,
    P8_41,
    P8_42,
    P8_43,
    P8_44,
    P8_45,
    P8_46
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [46:3] GPIO_OE;
input  [46:3] GPIO_OUT;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [46:3] GPIO_IN;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         P8_3;
inout         P8_4;
inout         P8_5;
inout         P8_6;
inout         P8_7;
inout         P8_8;
inout         P8_9;
inout         P8_10;
inout         P8_11;
inout         P8_12;
inout         P8_13;
inout         P8_14;
inout         P8_15;
inout         P8_16;
inout         P8_17;
inout         P8_18;
inout         P8_19;
inout         P8_20;
inout         P8_21;
inout         P8_22;
inout         P8_23;
inout         P8_24;
inout         P8_25;
inout         P8_26;
inout         P8_27;
inout         P8_28;
inout         P8_29;
inout         P8_30;
inout         P8_31;
inout         P8_32;
inout         P8_33;
inout         P8_34;
inout         P8_35;
inout         P8_36;
inout         P8_37;
inout         P8_38;
inout         P8_39;
inout         P8_40;
inout         P8_41;
inout         P8_42;
inout         P8_43;
inout         P8_44;
inout         P8_45;
inout         P8_46;
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
wire           GPIO_IN_10;
wire           GPIO_IN_11;
wire           GPIO_IN_12;
wire           GPIO_IN_13;
wire           GPIO_IN_14;
wire           GPIO_IN_15;
wire           GPIO_IN_16;
wire           GPIO_IN_17;
wire           GPIO_IN_18;
wire           GPIO_IN_19;
wire           GPIO_IN_20;
wire           GPIO_IN_21;
wire           GPIO_IN_22;
wire           GPIO_IN_23;
wire           GPIO_IN_24;
wire           GPIO_IN_25;
wire           GPIO_IN_26;
wire           GPIO_IN_27;
wire           GPIO_IN_28;
wire           GPIO_IN_29;
wire           GPIO_IN_30;
wire           GPIO_IN_31;
wire           GPIO_IN_32;
wire           GPIO_IN_33;
wire           GPIO_IN_34;
wire           GPIO_IN_35;
wire           GPIO_IN_36;
wire           GPIO_IN_37;
wire           GPIO_IN_38;
wire           GPIO_IN_39;
wire           GPIO_IN_40;
wire           GPIO_IN_41;
wire           GPIO_IN_42;
wire   [3:3]   GPIO_OE_slice_0;
wire   [4:4]   GPIO_OE_slice_1;
wire   [5:5]   GPIO_OE_slice_2;
wire   [6:6]   GPIO_OE_slice_3;
wire   [7:7]   GPIO_OE_slice_4;
wire   [8:8]   GPIO_OE_slice_5;
wire   [9:9]   GPIO_OE_slice_6;
wire   [10:10] GPIO_OE_slice_7;
wire   [11:11] GPIO_OE_slice_8;
wire   [12:12] GPIO_OE_slice_9;
wire   [13:13] GPIO_OE_slice_10;
wire   [14:14] GPIO_OE_slice_11;
wire   [15:15] GPIO_OE_slice_12;
wire   [16:16] GPIO_OE_slice_13;
wire   [17:17] GPIO_OE_slice_14;
wire   [18:18] GPIO_OE_slice_15;
wire   [19:19] GPIO_OE_slice_16;
wire   [20:20] GPIO_OE_slice_17;
wire   [21:21] GPIO_OE_slice_18;
wire   [22:22] GPIO_OE_slice_19;
wire   [23:23] GPIO_OE_slice_20;
wire   [24:24] GPIO_OE_slice_21;
wire   [25:25] GPIO_OE_slice_22;
wire   [26:26] GPIO_OE_slice_23;
wire   [27:27] GPIO_OE_slice_24;
wire   [28:28] GPIO_OE_slice_25;
wire   [29:29] GPIO_OE_slice_26;
wire   [30:30] GPIO_OE_slice_27;
wire   [31:31] GPIO_OE_slice_28;
wire   [32:32] GPIO_OE_slice_29;
wire   [33:33] GPIO_OE_slice_30;
wire   [34:34] GPIO_OE_slice_31;
wire   [35:35] GPIO_OE_slice_32;
wire   [36:36] GPIO_OE_slice_33;
wire   [37:37] GPIO_OE_slice_34;
wire   [38:38] GPIO_OE_slice_35;
wire   [39:39] GPIO_OE_slice_36;
wire   [40:40] GPIO_OE_slice_37;
wire   [41:41] GPIO_OE_slice_38;
wire   [42:42] GPIO_OE_slice_39;
wire   [43:43] GPIO_OE_slice_40;
wire   [44:44] GPIO_OE_slice_41;
wire   [45:45] GPIO_OE_slice_42;
wire   [46:46] GPIO_OE_slice_43;
wire   [3:3]   GPIO_OUT_slice_0;
wire   [4:4]   GPIO_OUT_slice_1;
wire   [5:5]   GPIO_OUT_slice_2;
wire   [6:6]   GPIO_OUT_slice_3;
wire   [7:7]   GPIO_OUT_slice_4;
wire   [8:8]   GPIO_OUT_slice_5;
wire   [9:9]   GPIO_OUT_slice_6;
wire   [10:10] GPIO_OUT_slice_7;
wire   [11:11] GPIO_OUT_slice_8;
wire   [12:12] GPIO_OUT_slice_9;
wire   [13:13] GPIO_OUT_slice_10;
wire   [14:14] GPIO_OUT_slice_11;
wire   [15:15] GPIO_OUT_slice_12;
wire   [16:16] GPIO_OUT_slice_13;
wire   [17:17] GPIO_OUT_slice_14;
wire   [18:18] GPIO_OUT_slice_15;
wire   [19:19] GPIO_OUT_slice_16;
wire   [20:20] GPIO_OUT_slice_17;
wire   [21:21] GPIO_OUT_slice_18;
wire   [22:22] GPIO_OUT_slice_19;
wire   [23:23] GPIO_OUT_slice_20;
wire   [24:24] GPIO_OUT_slice_21;
wire   [25:25] GPIO_OUT_slice_22;
wire   [26:26] GPIO_OUT_slice_23;
wire   [27:27] GPIO_OUT_slice_24;
wire   [28:28] GPIO_OUT_slice_25;
wire   [29:29] GPIO_OUT_slice_26;
wire   [30:30] GPIO_OUT_slice_27;
wire   [31:31] GPIO_OUT_slice_28;
wire   [32:32] GPIO_OUT_slice_29;
wire   [33:33] GPIO_OUT_slice_30;
wire   [34:34] GPIO_OUT_slice_31;
wire   [35:35] GPIO_OUT_slice_32;
wire   [36:36] GPIO_OUT_slice_33;
wire   [37:37] GPIO_OUT_slice_34;
wire   [38:38] GPIO_OUT_slice_35;
wire   [39:39] GPIO_OUT_slice_36;
wire   [40:40] GPIO_OUT_slice_37;
wire   [41:41] GPIO_OUT_slice_38;
wire   [42:42] GPIO_OUT_slice_39;
wire   [43:43] GPIO_OUT_slice_40;
wire   [44:44] GPIO_OUT_slice_41;
wire   [45:45] GPIO_OUT_slice_42;
wire   [46:46] GPIO_OUT_slice_43;
wire           P8_3;
wire           P8_4;
wire           P8_5;
wire           P8_6;
wire           P8_7;
wire           P8_8;
wire           P8_9;
wire           P8_10;
wire           P8_11;
wire           P8_12;
wire           P8_13;
wire           P8_14;
wire           P8_15;
wire           P8_16;
wire           P8_17;
wire           P8_18;
wire           P8_19;
wire           P8_20;
wire           P8_21;
wire           P8_22;
wire           P8_23;
wire           P8_24;
wire           P8_25;
wire           P8_26;
wire           P8_27;
wire           P8_28;
wire           P8_29;
wire           P8_30;
wire           P8_31;
wire           P8_32;
wire           P8_33;
wire           P8_34;
wire           P8_35;
wire           P8_36;
wire           P8_37;
wire           P8_38;
wire           P8_39;
wire           P8_40;
wire           P8_41;
wire           P8_42;
wire           P8_43;
wire           P8_44;
wire           P8_45;
wire           P8_46;
wire   [10:10] GPIO_IN_6_net_0;
wire   [11:11] GPIO_IN_7_net_0;
wire   [12:12] GPIO_IN_8_net_0;
wire   [13:13] GPIO_IN_9_net_0;
wire   [14:14] GPIO_IN_10_net_0;
wire   [15:15] GPIO_IN_11_net_0;
wire   [16:16] GPIO_IN_12_net_0;
wire   [17:17] GPIO_IN_13_net_0;
wire   [18:18] GPIO_IN_14_net_0;
wire   [19:19] GPIO_IN_15_net_0;
wire   [20:20] GPIO_IN_16_net_0;
wire   [21:21] GPIO_IN_17_net_0;
wire   [22:22] GPIO_IN_18_net_0;
wire   [23:23] GPIO_IN_19_net_0;
wire   [24:24] GPIO_IN_20_net_0;
wire   [25:25] GPIO_IN_21_net_0;
wire   [26:26] GPIO_IN_22_net_0;
wire   [27:27] GPIO_IN_23_net_0;
wire   [28:28] GPIO_IN_24_net_0;
wire   [29:29] GPIO_IN_25_net_0;
wire   [30:30] GPIO_IN_26_net_0;
wire   [31:31] GPIO_IN_27_net_0;
wire   [32:32] GPIO_IN_28_net_0;
wire   [33:33] GPIO_IN_29_net_0;
wire   [34:34] GPIO_IN_30_net_0;
wire   [35:35] GPIO_IN_31_net_0;
wire   [36:36] GPIO_IN_32_net_0;
wire   [37:37] GPIO_IN_33_net_0;
wire   [38:38] GPIO_IN_34_net_0;
wire   [39:39] GPIO_IN_35_net_0;
wire   [3:3]   GPIO_IN_net_1;
wire   [40:40] GPIO_IN_36_net_0;
wire   [41:41] GPIO_IN_37_net_0;
wire   [42:42] GPIO_IN_38_net_0;
wire   [43:43] GPIO_IN_39_net_0;
wire   [44:44] GPIO_IN_40_net_0;
wire   [45:45] GPIO_IN_41_net_0;
wire   [46:46] GPIO_IN_42_net_0;
wire   [4:4]   GPIO_IN_0_net_0;
wire   [5:5]   GPIO_IN_1_net_0;
wire   [6:6]   GPIO_IN_2_net_0;
wire   [7:7]   GPIO_IN_3_net_0;
wire   [8:8]   GPIO_IN_4_net_0;
wire   [9:9]   GPIO_IN_5_net_0;
wire   [46:3]  GPIO_OUT;
wire   [46:3]  GPIO_OE;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign GPIO_IN_6_net_0[10]  = GPIO_IN_6;
assign GPIO_IN[10:10]       = GPIO_IN_6_net_0[10];
assign GPIO_IN_7_net_0[11]  = GPIO_IN_7;
assign GPIO_IN[11:11]       = GPIO_IN_7_net_0[11];
assign GPIO_IN_8_net_0[12]  = GPIO_IN_8;
assign GPIO_IN[12:12]       = GPIO_IN_8_net_0[12];
assign GPIO_IN_9_net_0[13]  = GPIO_IN_9;
assign GPIO_IN[13:13]       = GPIO_IN_9_net_0[13];
assign GPIO_IN_10_net_0[14] = GPIO_IN_10;
assign GPIO_IN[14:14]       = GPIO_IN_10_net_0[14];
assign GPIO_IN_11_net_0[15] = GPIO_IN_11;
assign GPIO_IN[15:15]       = GPIO_IN_11_net_0[15];
assign GPIO_IN_12_net_0[16] = GPIO_IN_12;
assign GPIO_IN[16:16]       = GPIO_IN_12_net_0[16];
assign GPIO_IN_13_net_0[17] = GPIO_IN_13;
assign GPIO_IN[17:17]       = GPIO_IN_13_net_0[17];
assign GPIO_IN_14_net_0[18] = GPIO_IN_14;
assign GPIO_IN[18:18]       = GPIO_IN_14_net_0[18];
assign GPIO_IN_15_net_0[19] = GPIO_IN_15;
assign GPIO_IN[19:19]       = GPIO_IN_15_net_0[19];
assign GPIO_IN_16_net_0[20] = GPIO_IN_16;
assign GPIO_IN[20:20]       = GPIO_IN_16_net_0[20];
assign GPIO_IN_17_net_0[21] = GPIO_IN_17;
assign GPIO_IN[21:21]       = GPIO_IN_17_net_0[21];
assign GPIO_IN_18_net_0[22] = GPIO_IN_18;
assign GPIO_IN[22:22]       = GPIO_IN_18_net_0[22];
assign GPIO_IN_19_net_0[23] = GPIO_IN_19;
assign GPIO_IN[23:23]       = GPIO_IN_19_net_0[23];
assign GPIO_IN_20_net_0[24] = GPIO_IN_20;
assign GPIO_IN[24:24]       = GPIO_IN_20_net_0[24];
assign GPIO_IN_21_net_0[25] = GPIO_IN_21;
assign GPIO_IN[25:25]       = GPIO_IN_21_net_0[25];
assign GPIO_IN_22_net_0[26] = GPIO_IN_22;
assign GPIO_IN[26:26]       = GPIO_IN_22_net_0[26];
assign GPIO_IN_23_net_0[27] = GPIO_IN_23;
assign GPIO_IN[27:27]       = GPIO_IN_23_net_0[27];
assign GPIO_IN_24_net_0[28] = GPIO_IN_24;
assign GPIO_IN[28:28]       = GPIO_IN_24_net_0[28];
assign GPIO_IN_25_net_0[29] = GPIO_IN_25;
assign GPIO_IN[29:29]       = GPIO_IN_25_net_0[29];
assign GPIO_IN_26_net_0[30] = GPIO_IN_26;
assign GPIO_IN[30:30]       = GPIO_IN_26_net_0[30];
assign GPIO_IN_27_net_0[31] = GPIO_IN_27;
assign GPIO_IN[31:31]       = GPIO_IN_27_net_0[31];
assign GPIO_IN_28_net_0[32] = GPIO_IN_28;
assign GPIO_IN[32:32]       = GPIO_IN_28_net_0[32];
assign GPIO_IN_29_net_0[33] = GPIO_IN_29;
assign GPIO_IN[33:33]       = GPIO_IN_29_net_0[33];
assign GPIO_IN_30_net_0[34] = GPIO_IN_30;
assign GPIO_IN[34:34]       = GPIO_IN_30_net_0[34];
assign GPIO_IN_31_net_0[35] = GPIO_IN_31;
assign GPIO_IN[35:35]       = GPIO_IN_31_net_0[35];
assign GPIO_IN_32_net_0[36] = GPIO_IN_32;
assign GPIO_IN[36:36]       = GPIO_IN_32_net_0[36];
assign GPIO_IN_33_net_0[37] = GPIO_IN_33;
assign GPIO_IN[37:37]       = GPIO_IN_33_net_0[37];
assign GPIO_IN_34_net_0[38] = GPIO_IN_34;
assign GPIO_IN[38:38]       = GPIO_IN_34_net_0[38];
assign GPIO_IN_35_net_0[39] = GPIO_IN_35;
assign GPIO_IN[39:39]       = GPIO_IN_35_net_0[39];
assign GPIO_IN_net_1[3]     = GPIO_IN_net_0;
assign GPIO_IN[3:3]         = GPIO_IN_net_1[3];
assign GPIO_IN_36_net_0[40] = GPIO_IN_36;
assign GPIO_IN[40:40]       = GPIO_IN_36_net_0[40];
assign GPIO_IN_37_net_0[41] = GPIO_IN_37;
assign GPIO_IN[41:41]       = GPIO_IN_37_net_0[41];
assign GPIO_IN_38_net_0[42] = GPIO_IN_38;
assign GPIO_IN[42:42]       = GPIO_IN_38_net_0[42];
assign GPIO_IN_39_net_0[43] = GPIO_IN_39;
assign GPIO_IN[43:43]       = GPIO_IN_39_net_0[43];
assign GPIO_IN_40_net_0[44] = GPIO_IN_40;
assign GPIO_IN[44:44]       = GPIO_IN_40_net_0[44];
assign GPIO_IN_41_net_0[45] = GPIO_IN_41;
assign GPIO_IN[45:45]       = GPIO_IN_41_net_0[45];
assign GPIO_IN_42_net_0[46] = GPIO_IN_42;
assign GPIO_IN[46:46]       = GPIO_IN_42_net_0[46];
assign GPIO_IN_0_net_0[4]   = GPIO_IN_0;
assign GPIO_IN[4:4]         = GPIO_IN_0_net_0[4];
assign GPIO_IN_1_net_0[5]   = GPIO_IN_1;
assign GPIO_IN[5:5]         = GPIO_IN_1_net_0[5];
assign GPIO_IN_2_net_0[6]   = GPIO_IN_2;
assign GPIO_IN[6:6]         = GPIO_IN_2_net_0[6];
assign GPIO_IN_3_net_0[7]   = GPIO_IN_3;
assign GPIO_IN[7:7]         = GPIO_IN_3_net_0[7];
assign GPIO_IN_4_net_0[8]   = GPIO_IN_4;
assign GPIO_IN[8:8]         = GPIO_IN_4_net_0[8];
assign GPIO_IN_5_net_0[9]   = GPIO_IN_5;
assign GPIO_IN[9:9]         = GPIO_IN_5_net_0[9];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign GPIO_OE_slice_0[3]    = GPIO_OE[3:3];
assign GPIO_OE_slice_1[4]    = GPIO_OE[4:4];
assign GPIO_OE_slice_2[5]    = GPIO_OE[5:5];
assign GPIO_OE_slice_3[6]    = GPIO_OE[6:6];
assign GPIO_OE_slice_4[7]    = GPIO_OE[7:7];
assign GPIO_OE_slice_5[8]    = GPIO_OE[8:8];
assign GPIO_OE_slice_6[9]    = GPIO_OE[9:9];
assign GPIO_OE_slice_7[10]   = GPIO_OE[10:10];
assign GPIO_OE_slice_8[11]   = GPIO_OE[11:11];
assign GPIO_OE_slice_9[12]   = GPIO_OE[12:12];
assign GPIO_OE_slice_10[13]  = GPIO_OE[13:13];
assign GPIO_OE_slice_11[14]  = GPIO_OE[14:14];
assign GPIO_OE_slice_12[15]  = GPIO_OE[15:15];
assign GPIO_OE_slice_13[16]  = GPIO_OE[16:16];
assign GPIO_OE_slice_14[17]  = GPIO_OE[17:17];
assign GPIO_OE_slice_15[18]  = GPIO_OE[18:18];
assign GPIO_OE_slice_16[19]  = GPIO_OE[19:19];
assign GPIO_OE_slice_17[20]  = GPIO_OE[20:20];
assign GPIO_OE_slice_18[21]  = GPIO_OE[21:21];
assign GPIO_OE_slice_19[22]  = GPIO_OE[22:22];
assign GPIO_OE_slice_20[23]  = GPIO_OE[23:23];
assign GPIO_OE_slice_21[24]  = GPIO_OE[24:24];
assign GPIO_OE_slice_22[25]  = GPIO_OE[25:25];
assign GPIO_OE_slice_23[26]  = GPIO_OE[26:26];
assign GPIO_OE_slice_24[27]  = GPIO_OE[27:27];
assign GPIO_OE_slice_25[28]  = GPIO_OE[28:28];
assign GPIO_OE_slice_26[29]  = GPIO_OE[29:29];
assign GPIO_OE_slice_27[30]  = GPIO_OE[30:30];
assign GPIO_OE_slice_28[31]  = GPIO_OE[31:31];
assign GPIO_OE_slice_29[32]  = GPIO_OE[32:32];
assign GPIO_OE_slice_30[33]  = GPIO_OE[33:33];
assign GPIO_OE_slice_31[34]  = GPIO_OE[34:34];
assign GPIO_OE_slice_32[35]  = GPIO_OE[35:35];
assign GPIO_OE_slice_33[36]  = GPIO_OE[36:36];
assign GPIO_OE_slice_34[37]  = GPIO_OE[37:37];
assign GPIO_OE_slice_35[38]  = GPIO_OE[38:38];
assign GPIO_OE_slice_36[39]  = GPIO_OE[39:39];
assign GPIO_OE_slice_37[40]  = GPIO_OE[40:40];
assign GPIO_OE_slice_38[41]  = GPIO_OE[41:41];
assign GPIO_OE_slice_39[42]  = GPIO_OE[42:42];
assign GPIO_OE_slice_40[43]  = GPIO_OE[43:43];
assign GPIO_OE_slice_41[44]  = GPIO_OE[44:44];
assign GPIO_OE_slice_42[45]  = GPIO_OE[45:45];
assign GPIO_OE_slice_43[46]  = GPIO_OE[46:46];
assign GPIO_OUT_slice_0[3]   = GPIO_OUT[3:3];
assign GPIO_OUT_slice_1[4]   = GPIO_OUT[4:4];
assign GPIO_OUT_slice_2[5]   = GPIO_OUT[5:5];
assign GPIO_OUT_slice_3[6]   = GPIO_OUT[6:6];
assign GPIO_OUT_slice_4[7]   = GPIO_OUT[7:7];
assign GPIO_OUT_slice_5[8]   = GPIO_OUT[8:8];
assign GPIO_OUT_slice_6[9]   = GPIO_OUT[9:9];
assign GPIO_OUT_slice_7[10]  = GPIO_OUT[10:10];
assign GPIO_OUT_slice_8[11]  = GPIO_OUT[11:11];
assign GPIO_OUT_slice_9[12]  = GPIO_OUT[12:12];
assign GPIO_OUT_slice_10[13] = GPIO_OUT[13:13];
assign GPIO_OUT_slice_11[14] = GPIO_OUT[14:14];
assign GPIO_OUT_slice_12[15] = GPIO_OUT[15:15];
assign GPIO_OUT_slice_13[16] = GPIO_OUT[16:16];
assign GPIO_OUT_slice_14[17] = GPIO_OUT[17:17];
assign GPIO_OUT_slice_15[18] = GPIO_OUT[18:18];
assign GPIO_OUT_slice_16[19] = GPIO_OUT[19:19];
assign GPIO_OUT_slice_17[20] = GPIO_OUT[20:20];
assign GPIO_OUT_slice_18[21] = GPIO_OUT[21:21];
assign GPIO_OUT_slice_19[22] = GPIO_OUT[22:22];
assign GPIO_OUT_slice_20[23] = GPIO_OUT[23:23];
assign GPIO_OUT_slice_21[24] = GPIO_OUT[24:24];
assign GPIO_OUT_slice_22[25] = GPIO_OUT[25:25];
assign GPIO_OUT_slice_23[26] = GPIO_OUT[26:26];
assign GPIO_OUT_slice_24[27] = GPIO_OUT[27:27];
assign GPIO_OUT_slice_25[28] = GPIO_OUT[28:28];
assign GPIO_OUT_slice_26[29] = GPIO_OUT[29:29];
assign GPIO_OUT_slice_27[30] = GPIO_OUT[30:30];
assign GPIO_OUT_slice_28[31] = GPIO_OUT[31:31];
assign GPIO_OUT_slice_29[32] = GPIO_OUT[32:32];
assign GPIO_OUT_slice_30[33] = GPIO_OUT[33:33];
assign GPIO_OUT_slice_31[34] = GPIO_OUT[34:34];
assign GPIO_OUT_slice_32[35] = GPIO_OUT[35:35];
assign GPIO_OUT_slice_33[36] = GPIO_OUT[36:36];
assign GPIO_OUT_slice_34[37] = GPIO_OUT[37:37];
assign GPIO_OUT_slice_35[38] = GPIO_OUT[38:38];
assign GPIO_OUT_slice_36[39] = GPIO_OUT[39:39];
assign GPIO_OUT_slice_37[40] = GPIO_OUT[40:40];
assign GPIO_OUT_slice_38[41] = GPIO_OUT[41:41];
assign GPIO_OUT_slice_39[42] = GPIO_OUT[42:42];
assign GPIO_OUT_slice_40[43] = GPIO_OUT[43:43];
assign GPIO_OUT_slice_41[44] = GPIO_OUT[44:44];
assign GPIO_OUT_slice_42[45] = GPIO_OUT[45:45];
assign GPIO_OUT_slice_43[46] = GPIO_OUT[46:46];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BIBUF
BIBUF P8_3_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_0 ),
        .E   ( GPIO_OE_slice_0 ),
        // Outputs
        .Y   ( GPIO_IN_net_0 ),
        // Inouts
        .PAD ( P8_3 ) 
        );

//--------BIBUF
BIBUF P8_4_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_1 ),
        .E   ( GPIO_OE_slice_1 ),
        // Outputs
        .Y   ( GPIO_IN_0 ),
        // Inouts
        .PAD ( P8_4 ) 
        );

//--------BIBUF
BIBUF P8_5_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_2 ),
        .E   ( GPIO_OE_slice_2 ),
        // Outputs
        .Y   ( GPIO_IN_1 ),
        // Inouts
        .PAD ( P8_5 ) 
        );

//--------BIBUF
BIBUF P8_6_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_3 ),
        .E   ( GPIO_OE_slice_3 ),
        // Outputs
        .Y   ( GPIO_IN_2 ),
        // Inouts
        .PAD ( P8_6 ) 
        );

//--------BIBUF
BIBUF P8_7_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_4 ),
        .E   ( GPIO_OE_slice_4 ),
        // Outputs
        .Y   ( GPIO_IN_3 ),
        // Inouts
        .PAD ( P8_7 ) 
        );

//--------BIBUF
BIBUF P8_8_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_5 ),
        .E   ( GPIO_OE_slice_5 ),
        // Outputs
        .Y   ( GPIO_IN_4 ),
        // Inouts
        .PAD ( P8_8 ) 
        );

//--------BIBUF
BIBUF P8_9_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_6 ),
        .E   ( GPIO_OE_slice_6 ),
        // Outputs
        .Y   ( GPIO_IN_5 ),
        // Inouts
        .PAD ( P8_9 ) 
        );

//--------BIBUF
BIBUF P8_10_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_7 ),
        .E   ( GPIO_OE_slice_7 ),
        // Outputs
        .Y   ( GPIO_IN_6 ),
        // Inouts
        .PAD ( P8_10 ) 
        );

//--------BIBUF
BIBUF P8_11_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_8 ),
        .E   ( GPIO_OE_slice_8 ),
        // Outputs
        .Y   ( GPIO_IN_7 ),
        // Inouts
        .PAD ( P8_11 ) 
        );

//--------BIBUF
BIBUF P8_12_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_9 ),
        .E   ( GPIO_OE_slice_9 ),
        // Outputs
        .Y   ( GPIO_IN_8 ),
        // Inouts
        .PAD ( P8_12 ) 
        );

//--------BIBUF
BIBUF P8_13_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_10 ),
        .E   ( GPIO_OE_slice_10 ),
        // Outputs
        .Y   ( GPIO_IN_9 ),
        // Inouts
        .PAD ( P8_13 ) 
        );

//--------BIBUF
BIBUF P8_14_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_11 ),
        .E   ( GPIO_OE_slice_11 ),
        // Outputs
        .Y   ( GPIO_IN_10 ),
        // Inouts
        .PAD ( P8_14 ) 
        );

//--------BIBUF
BIBUF P8_15_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_12 ),
        .E   ( GPIO_OE_slice_12 ),
        // Outputs
        .Y   ( GPIO_IN_11 ),
        // Inouts
        .PAD ( P8_15 ) 
        );

//--------BIBUF
BIBUF P8_16_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_13 ),
        .E   ( GPIO_OE_slice_13 ),
        // Outputs
        .Y   ( GPIO_IN_12 ),
        // Inouts
        .PAD ( P8_16 ) 
        );

//--------BIBUF
BIBUF P8_17_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_14 ),
        .E   ( GPIO_OE_slice_14 ),
        // Outputs
        .Y   ( GPIO_IN_13 ),
        // Inouts
        .PAD ( P8_17 ) 
        );

//--------BIBUF
BIBUF P8_18_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_15 ),
        .E   ( GPIO_OE_slice_15 ),
        // Outputs
        .Y   ( GPIO_IN_14 ),
        // Inouts
        .PAD ( P8_18 ) 
        );

//--------BIBUF
BIBUF P8_19_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_16 ),
        .E   ( GPIO_OE_slice_16 ),
        // Outputs
        .Y   ( GPIO_IN_15 ),
        // Inouts
        .PAD ( P8_19 ) 
        );

//--------BIBUF
BIBUF P8_20_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_17 ),
        .E   ( GPIO_OE_slice_17 ),
        // Outputs
        .Y   ( GPIO_IN_16 ),
        // Inouts
        .PAD ( P8_20 ) 
        );

//--------BIBUF
BIBUF P8_21_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_18 ),
        .E   ( GPIO_OE_slice_18 ),
        // Outputs
        .Y   ( GPIO_IN_17 ),
        // Inouts
        .PAD ( P8_21 ) 
        );

//--------BIBUF
BIBUF P8_22_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_19 ),
        .E   ( GPIO_OE_slice_19 ),
        // Outputs
        .Y   ( GPIO_IN_18 ),
        // Inouts
        .PAD ( P8_22 ) 
        );

//--------BIBUF
BIBUF P8_23_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_20 ),
        .E   ( GPIO_OE_slice_20 ),
        // Outputs
        .Y   ( GPIO_IN_19 ),
        // Inouts
        .PAD ( P8_23 ) 
        );

//--------BIBUF
BIBUF P8_24_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_21 ),
        .E   ( GPIO_OE_slice_21 ),
        // Outputs
        .Y   ( GPIO_IN_20 ),
        // Inouts
        .PAD ( P8_24 ) 
        );

//--------BIBUF
BIBUF P8_25_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_22 ),
        .E   ( GPIO_OE_slice_22 ),
        // Outputs
        .Y   ( GPIO_IN_21 ),
        // Inouts
        .PAD ( P8_25 ) 
        );

//--------BIBUF
BIBUF P8_26_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_23 ),
        .E   ( GPIO_OE_slice_23 ),
        // Outputs
        .Y   ( GPIO_IN_22 ),
        // Inouts
        .PAD ( P8_26 ) 
        );

//--------BIBUF
BIBUF P8_27_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_24 ),
        .E   ( GPIO_OE_slice_24 ),
        // Outputs
        .Y   ( GPIO_IN_23 ),
        // Inouts
        .PAD ( P8_27 ) 
        );

//--------BIBUF
BIBUF P8_28_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_25 ),
        .E   ( GPIO_OE_slice_25 ),
        // Outputs
        .Y   ( GPIO_IN_24 ),
        // Inouts
        .PAD ( P8_28 ) 
        );

//--------BIBUF
BIBUF P8_29_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_26 ),
        .E   ( GPIO_OE_slice_26 ),
        // Outputs
        .Y   ( GPIO_IN_25 ),
        // Inouts
        .PAD ( P8_29 ) 
        );

//--------BIBUF
BIBUF P8_30_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_27 ),
        .E   ( GPIO_OE_slice_27 ),
        // Outputs
        .Y   ( GPIO_IN_26 ),
        // Inouts
        .PAD ( P8_30 ) 
        );

//--------BIBUF
BIBUF P8_31_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_28 ),
        .E   ( GPIO_OE_slice_28 ),
        // Outputs
        .Y   ( GPIO_IN_27 ),
        // Inouts
        .PAD ( P8_31 ) 
        );

//--------BIBUF
BIBUF P8_32_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_29 ),
        .E   ( GPIO_OE_slice_29 ),
        // Outputs
        .Y   ( GPIO_IN_28 ),
        // Inouts
        .PAD ( P8_32 ) 
        );

//--------BIBUF
BIBUF P8_33_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_30 ),
        .E   ( GPIO_OE_slice_30 ),
        // Outputs
        .Y   ( GPIO_IN_29 ),
        // Inouts
        .PAD ( P8_33 ) 
        );

//--------BIBUF
BIBUF P8_34_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_31 ),
        .E   ( GPIO_OE_slice_31 ),
        // Outputs
        .Y   ( GPIO_IN_30 ),
        // Inouts
        .PAD ( P8_34 ) 
        );

//--------BIBUF
BIBUF P8_35_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_32 ),
        .E   ( GPIO_OE_slice_32 ),
        // Outputs
        .Y   ( GPIO_IN_31 ),
        // Inouts
        .PAD ( P8_35 ) 
        );

//--------BIBUF
BIBUF P8_36_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_33 ),
        .E   ( GPIO_OE_slice_33 ),
        // Outputs
        .Y   ( GPIO_IN_32 ),
        // Inouts
        .PAD ( P8_36 ) 
        );

//--------BIBUF
BIBUF P8_37_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_34 ),
        .E   ( GPIO_OE_slice_34 ),
        // Outputs
        .Y   ( GPIO_IN_33 ),
        // Inouts
        .PAD ( P8_37 ) 
        );

//--------BIBUF
BIBUF P8_38_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_35 ),
        .E   ( GPIO_OE_slice_35 ),
        // Outputs
        .Y   ( GPIO_IN_34 ),
        // Inouts
        .PAD ( P8_38 ) 
        );

//--------BIBUF
BIBUF P8_39_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_36 ),
        .E   ( GPIO_OE_slice_36 ),
        // Outputs
        .Y   ( GPIO_IN_35 ),
        // Inouts
        .PAD ( P8_39 ) 
        );

//--------BIBUF
BIBUF P8_40_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_37 ),
        .E   ( GPIO_OE_slice_37 ),
        // Outputs
        .Y   ( GPIO_IN_36 ),
        // Inouts
        .PAD ( P8_40 ) 
        );

//--------BIBUF
BIBUF P8_41_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_38 ),
        .E   ( GPIO_OE_slice_38 ),
        // Outputs
        .Y   ( GPIO_IN_37 ),
        // Inouts
        .PAD ( P8_41 ) 
        );

//--------BIBUF
BIBUF P8_42_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_39 ),
        .E   ( GPIO_OE_slice_39 ),
        // Outputs
        .Y   ( GPIO_IN_38 ),
        // Inouts
        .PAD ( P8_42 ) 
        );

//--------BIBUF
BIBUF P8_43_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_40 ),
        .E   ( GPIO_OE_slice_40 ),
        // Outputs
        .Y   ( GPIO_IN_39 ),
        // Inouts
        .PAD ( P8_43 ) 
        );

//--------BIBUF
BIBUF P8_44_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_41 ),
        .E   ( GPIO_OE_slice_41 ),
        // Outputs
        .Y   ( GPIO_IN_40 ),
        // Inouts
        .PAD ( P8_44 ) 
        );

//--------BIBUF
BIBUF P8_45_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_42 ),
        .E   ( GPIO_OE_slice_42 ),
        // Outputs
        .Y   ( GPIO_IN_41 ),
        // Inouts
        .PAD ( P8_45 ) 
        );

//--------BIBUF
BIBUF P8_46_BIBUF(
        // Inputs
        .D   ( GPIO_OUT_slice_43 ),
        .E   ( GPIO_OE_slice_43 ),
        // Outputs
        .Y   ( GPIO_IN_42 ),
        // Inouts
        .PAD ( P8_46 ) 
        );


endmodule
