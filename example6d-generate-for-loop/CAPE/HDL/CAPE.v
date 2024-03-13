//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Dec  3 10:18:21 2023
// Version: 2022.3 2022.3.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// CAPE
module CAPE(
    // Inputs
    APB_SLAVE_SLAVE_PADDR,
    APB_SLAVE_SLAVE_PENABLE,
    APB_SLAVE_SLAVE_PSEL,
    APB_SLAVE_SLAVE_PWDATA,
    APB_SLAVE_SLAVE_PWRITE,
    GPIO_OE,
    GPIO_OUT,
    PCLK,
    PRESETN,
    // Outputs
    APB_SLAVE_SLAVE_PRDATA,
    GPIO_IN,
    INT_A,
    INT_B,
    INT_C,
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
    P8_46,
    P9_11,
    P9_12,
    P9_13,
    P9_14,
    P9_15,
    P9_16,
    P9_17,
    P9_18,
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
    P9_31,
    P9_41,
    P9_42
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [31:0] APB_SLAVE_SLAVE_PADDR;
input         APB_SLAVE_SLAVE_PENABLE;
input         APB_SLAVE_SLAVE_PSEL;
input  [31:0] APB_SLAVE_SLAVE_PWDATA;
input         APB_SLAVE_SLAVE_PWRITE;
input  [27:0] GPIO_OE;
input  [27:0] GPIO_OUT;
input         PCLK;
input         PRESETN;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] APB_SLAVE_SLAVE_PRDATA;
output [27:0] GPIO_IN;
output [7:0] INT_A;
output [7:0] INT_B;
output [7:0] INT_C;
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
inout         P9_11;
inout         P9_12;
inout         P9_13;
inout         P9_14;
inout         P9_15;
inout         P9_16;
inout         P9_17;
inout         P9_18;
inout         P9_21;
inout         P9_22;
inout         P9_23;
inout         P9_24;
inout         P9_25;
inout         P9_26;
inout         P9_27;
inout         P9_28;
inout         P9_29;
inout         P9_30;
inout         P9_31;
inout         P9_41;
inout         P9_42;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [31:0]  apb_ctrl_status_0_control;
wire           APB_SLAVE_SLAVE_PENABLE;
wire   [31:0]  APB_SLAVE_PRDATA;
wire           APB_SLAVE_SLAVE_PSEL;
wire   [31:0]  APB_SLAVE_SLAVE_PWDATA;
wire           APB_SLAVE_SLAVE_PWRITE;
wire   [30:3]  GPIO_IN_net_0;
wire   [27:0]  GPIO_OE;
wire   [27:0]  GPIO_OUT;
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
wire           P9_11;
wire           P9_12;
wire           P9_13;
wire           P9_14;
wire           P9_15;
wire           P9_16;
wire           P9_17;
wire           P9_18;
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
wire           P9_41;
wire           P9_42;
wire           PCLK;
wire           PRESETN;
wire           BLINK;
wire           BLINK2;
wire   [31:0]  APB_SLAVE_PRDATA_net_0;
wire   [27:0]  GPIO_IN_net_1;
wire   [46:31] GPIO_IN_slice_0;
wire   [46:3]  GPIO_OE_net_0;
wire   [46:3]  GPIO_OUT_net_0;
wire   [46:3]  GPIO_IN_net_2;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [46:31] GPIO_OE_const_net_0;
wire   [46:31] GPIO_OUT_const_net_0;
wire   [18:11] GPIO_OE_const_net_1;
wire   [18:11] GPIO_OUT_const_net_1;
wire   [31:21] GPIO_OE_const_net_2;
wire   [31:21] GPIO_OUT_const_net_2;
wire   [42:41] GPIO_OE_const_net_3;
wire   [42:41] GPIO_OUT_const_net_3;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [31:0]  APB_SLAVE_SLAVE_PADDR;
wire   [7:0]   APB_SLAVE_SLAVE_PADDR_0;
wire   [7:0]   APB_SLAVE_SLAVE_PADDR_0_7to0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GPIO_OE_const_net_0  = 16'h0000;
assign GPIO_OUT_const_net_0 = 16'h0000;
assign GPIO_OE_const_net_1  = 8'h00;
assign GPIO_OUT_const_net_1 = 8'h00;
assign GPIO_OE_const_net_2  = 11'h000;
assign GPIO_OUT_const_net_2 = 11'h000;
assign GPIO_OE_const_net_3  = 2'h0;
assign GPIO_OUT_const_net_3 = 2'h0;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign INT_A[7:0]                    = 8'h00;
assign INT_B[7:0]                    = 8'h00;
assign INT_C[7:0]                    = 8'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign APB_SLAVE_PRDATA_net_0       = APB_SLAVE_PRDATA;
assign APB_SLAVE_SLAVE_PRDATA[31:0] = APB_SLAVE_PRDATA_net_0;
assign GPIO_IN_net_1                = GPIO_IN_net_0;
assign GPIO_IN[27:0]                = GPIO_IN_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign GPIO_IN_net_0   = GPIO_IN_net_2[30:3];
assign GPIO_IN_slice_0 = GPIO_IN_net_2[46:31];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
// assign GPIO_OE_net_0  = { 16'h0000 , GPIO_OE };
// assign GPIO_OUT_net_0 = { 16'h0000 , GPIO_OUT };

assign GPIO_OE_net_0 = { 16'h0000, GPIO_OE[27:7], 2'b11, GPIO_OE[4:0] };     
assign GPIO_OUT_net_0 = { 16'h0000 , GPIO_OUT[27:7], BLINK2, BLINK, GPIO_OUT[4:0] };

// //--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign APB_SLAVE_SLAVE_PADDR_0 = { APB_SLAVE_SLAVE_PADDR_0_7to0 };
assign APB_SLAVE_SLAVE_PADDR_0_7to0 = APB_SLAVE_SLAVE_PADDR[7:0];

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------apb_ctrl_status


// ======================================================================================
// 0x4100_0000
wire        sel_apb_csr = APB_SLAVE_SLAVE_PSEL && (APB_SLAVE_SLAVE_PADDR[19:16] == 4'h0);
wire [31:0] apb_csr_rdata;
apb_ctrl_status apb_ctrl_status_0(
        // Inputs
        .presetn ( PRESETN ),
        .pclk    ( PCLK ),
        .psel    ( sel_apb_csr ),
        .penable ( APB_SLAVE_SLAVE_PENABLE ),
        .pwrite  ( APB_SLAVE_SLAVE_PWRITE ),
        .paddr   ( APB_SLAVE_SLAVE_PADDR[7:0] ),
        .pwdata  ( APB_SLAVE_SLAVE_PWDATA ),
        .prdata  ( apb_csr_rdata ),
        .control ( apb_ctrl_status_0_control ), 
        .status  ( apb_ctrl_status_0_control )
        );
        
wire serv_enable = apb_ctrl_status_0_control[0];
wire serv_rst    = !serv_enable;


// ======================================================================================
// 0x4101_0000
wire        sel_apb_blinky = APB_SLAVE_SLAVE_PSEL && (APB_SLAVE_SLAVE_PADDR[19:16] == 4'h1);
wire [31:0] apb_blinky_rdata;
apb_blinky apb_blinky_0(
        .clk     ( PCLK ),
        .rst_n   ( PRESETN ),
        .psel    ( sel_apb_blinky ),
        .penable ( APB_SLAVE_SLAVE_PENABLE ),
        .pwrite  ( APB_SLAVE_SLAVE_PWRITE ),
        .paddr   ( APB_SLAVE_SLAVE_PADDR  ),
        .pwdata  ( APB_SLAVE_SLAVE_PWDATA ),
        .prdata  ( apb_blinky_rdata ),
        .led     ( BLINK2 ) 
        );


// ======================================================================================
// 0x4102_0000
wire        sel_apb_ram = APB_SLAVE_SLAVE_PSEL && (APB_SLAVE_SLAVE_PADDR[19:16] == 4'h2);
wire [31:0] apb_ram_rdata;
apb_ram apb_ram_0(
        .clk     ( PCLK ),
        .rst_n   ( PRESETN ),
        .psel    ( sel_apb_ram ),
        .penable ( APB_SLAVE_SLAVE_PENABLE ),
        .pwrite  ( APB_SLAVE_SLAVE_PWRITE ),
        .paddr   ( APB_SLAVE_SLAVE_PADDR  ),
        .pwdata  ( APB_SLAVE_SLAVE_PWDATA ),
        .prdata  ( apb_ram_rdata )
        );


// ======================================================================================
// 0x4103_0000
wire        sel_apb_adc_fifo = APB_SLAVE_SLAVE_PSEL && (APB_SLAVE_SLAVE_PADDR[19:16] == 4'h3);
wire [31:0] apb_adc_fifo_rdata;

reg [31:0] adc_data;
reg        adc_data_v;

always @(posedge PCLK)
begin
  if (PRESETN == 1'b0) begin
    adc_data   <= 32'h0;
    adc_data_v <= 1'b0;
  end else begin
    adc_data <= adc_data + 1;
    adc_data_v <= 1'b1;
  end
end

apb_adc_fifo apb_adc_fifo_0(
        .clk      ( PCLK ),
        .rst_n    ( PRESETN ),
        .psel     ( sel_apb_adc_fifo ),
        .penable  ( APB_SLAVE_SLAVE_PENABLE ),
        .pwrite   ( APB_SLAVE_SLAVE_PWRITE ),
        .paddr    ( APB_SLAVE_SLAVE_PADDR  ),
        .pwdata   ( APB_SLAVE_SLAVE_PWDATA ),
        .prdata   ( apb_adc_fifo_rdata ),
        .i_data   ( adc_data ),
        .i_data_v ( adc_data_v )
        );

// ======================================================================================
// 0x4104_0000
wire        sel_apb_serv = APB_SLAVE_SLAVE_PSEL && (APB_SLAVE_SLAVE_PADDR[19:16] == 4'h4);
wire [31:0] apb_serv_rdata;

parameter memfile = "";
parameter memsize = 512;  // 512x32 (16-kbits)
parameter with_csr = 1;
parameter compressed = 0;
parameter align = compressed;

apb_servant
#(.memfile  (memfile),
  .memsize  (memsize),
  .sim      (1),
  .with_csr (with_csr),
  .compress (compressed[0:0]),
  .align    (align[0:0])
)
servant_0
(
 .wb_clk   ( PCLK ),
 .wb_rst   ( serv_rst ),
 .psel     ( sel_apb_serv ),
 .penable  ( APB_SLAVE_SLAVE_PENABLE ),
 .pwrite   ( APB_SLAVE_SLAVE_PWRITE ),
 .paddr    ( APB_SLAVE_SLAVE_PADDR  ),
 .pwdata   ( APB_SLAVE_SLAVE_PWDATA ),
 .prdata   ( apb_serv_rdata ),
 .q        ( BLINK )
);

assign APB_SLAVE_PRDATA = apb_csr_rdata | apb_blinky_rdata | apb_ram_rdata | apb_adc_fifo_rdata | apb_serv_rdata;

//--------blinky
// blinky blinky_0(              
//         .clk     ( PCLK ),    
//         .resetn  ( PRESETN ), 
//         .blink   ( BLINK2 )    
//         );


//--------P8_IOPADS
P8_IOPADS P8_IOPADS_0(
        // Inputs
        .GPIO_OE  ( GPIO_OE_net_0 ),
        .GPIO_OUT ( GPIO_OUT_net_0 ),
        // Outputs
        .GPIO_IN  ( GPIO_IN_net_2 ),
        // Inouts
        .P8_3     ( P8_3 ),
        .P8_4     ( P8_4 ),
        .P8_5     ( P8_5 ),
        .P8_6     ( P8_6 ),
        .P8_7     ( P8_7 ),
        .P8_8     ( P8_8 ),
        .P8_9     ( P8_9 ),
        .P8_10    ( P8_10 ),
        .P8_11    ( P8_11 ),
        .P8_12    ( P8_12 ),
        .P8_13    ( P8_13 ),
        .P8_14    ( P8_14 ),
        .P8_15    ( P8_15 ),
        .P8_16    ( P8_16 ),
        .P8_17    ( P8_17 ),
        .P8_18    ( P8_18 ),
        .P8_19    ( P8_19 ),
        .P8_20    ( P8_20 ),
        .P8_21    ( P8_21 ),
        .P8_22    ( P8_22 ),
        .P8_23    ( P8_23 ),
        .P8_24    ( P8_24 ),
        .P8_25    ( P8_25 ),
        .P8_26    ( P8_26 ),
        .P8_27    ( P8_27 ),
        .P8_28    ( P8_28 ),
        .P8_29    ( P8_29 ),
        .P8_30    ( P8_30 ),
        .P8_31    ( P8_31 ),
        .P8_32    ( P8_32 ),
        .P8_33    ( P8_33 ),
        .P8_34    ( P8_34 ),
        .P8_35    ( P8_35 ),
        .P8_36    ( P8_36 ),
        .P8_37    ( P8_37 ),
        .P8_38    ( P8_38 ),
        .P8_39    ( P8_39 ),
        .P8_40    ( P8_40 ),
        .P8_41    ( P8_41 ),
        .P8_42    ( P8_42 ),
        .P8_43    ( P8_43 ),
        .P8_44    ( P8_44 ),
        .P8_45    ( P8_45 ),
        .P8_46    ( P8_46 )
        );

//--------P9_11_18_IOPADS
P9_11_18_IOPADS P9_11_18_IOPADS_0(
        // Inputs
        .GPIO_OE  ( GPIO_OE_const_net_1 ),
        .GPIO_OUT ( GPIO_OUT_const_net_1 ),
        // Outputs
        .GPIO_IN  (  ),
        // Inouts
        .P9_11    ( P9_11 ),
        .P9_12    ( P9_12 ),
        .P9_13    ( P9_13 ),
        .P9_14    ( P9_14 ),
        .P9_15    ( P9_15 ),
        .P9_16    ( P9_16 ),
        .P9_17    ( P9_17 ),
        .P9_18    ( P9_18 ) 
        );

//--------P9_21_31_IOPADS
P9_21_31_IOPADS P9_21_31_IOPADS_0(
        // Inputs
        .GPIO_OE  ( GPIO_OE_const_net_2 ),
        .GPIO_OUT ( GPIO_OUT_const_net_2 ),
        // Outputs
        .GPIO_IN  (  ),
        // Inouts
        .P9_21    ( P9_21 ),
        .P9_22    ( P9_22 ),
        .P9_23    ( P9_23 ),
        .P9_24    ( P9_24 ),
        .P9_25    ( P9_25 ),
        .P9_26    ( P9_26 ),
        .P9_27    ( P9_27 ),
        .P9_28    ( P9_28 ),
        .P9_29    ( P9_29 ),
        .P9_30    ( P9_30 ),
        .P9_31    ( P9_31 ) 
        );

//--------P9_41_42_IOPADS
P9_41_42_IOPADS P9_41_42_IOPADS_0(
        // Inputs
        .GPIO_OE  ( GPIO_OE_const_net_3 ),
        .GPIO_OUT ( GPIO_OUT_const_net_3 ),
        // Outputs
        .GPIO_IN  (  ),
        // Inouts
        .P9_41    ( P9_41 ),
        .P9_42    ( P9_42 ) 
        );


endmodule
