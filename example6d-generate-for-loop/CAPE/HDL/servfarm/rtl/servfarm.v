module servfarm
  ( input  clk,
    input  rst_n,

    input  [31:0] paddr,
    input  psel,
    input  penable,
    input  pwrite,
    input  [31:0] pwdata,
    output [31:0] prdata,
    output pready,
    output perr,

    output [31:0] qbus
  );

parameter memfile = "";
parameter memsize = 512;  // 512Bytes (128 32-bit words, 4Kbits)
parameter with_csr = 1;
parameter compressed = 0;
parameter align = compressed;

wire [31:0]  apb_csr_rdata;
wire [31:0]  apb_farm_rdata[0:3];
wire [31:0]  qbuses[0:3];
wire [127:0] farm_psel;
wire [127:0] farm_rst;
wire [15:0]  selected_farm;

// -------------------------------------------------------------------------------------------

servfarm_csr servfarm_csr_0
(
  .clk      ( clk ),
  .rst_n    ( rst_n ),
  .paddr    ( paddr  ),
  .psel     ( psel ),
  .prdata   ( apb_csr_rdata ),
  .penable  ( penable ),
  .pwrite   ( pwrite ),
  .pwdata   ( pwdata ),
  .pready   ( ),
  .perr     ( ),
  .selected_farm ( selected_farm ),  
  .farm_rst ( farm_rst ),
  .farm_psel( farm_psel )
);

// -------------------------------------------------------------------------------------------


// -------------------------------------------------------------------------------------------
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
 .wb_clk   ( clk ),
 .wb_rst   ( farm_rst[0] ),
 .psel     ( farm_psel[0] ),
 .prdata   ( apb_farm_rdata[0] ),
 .qbus     ( qbuses[0] ),
 .penable  ( penable ),
 .pwrite   ( pwrite ),
 .paddr    ( paddr  ),
 .pwdata   ( pwdata ),
 .q        ( )
);
// -------------------------------------------------------------------------------------------


// -------------------------------------------------------------------------------------------
apb_servant
#(.memfile  (memfile),
  .memsize  (memsize),
  .sim      (1),
  .with_csr (with_csr),
  .compress (compressed[0:0]),
  .align    (align[0:0])
)
servant_1
(
 .wb_clk   ( clk ),
 .wb_rst   ( farm_rst[1] ),
 .psel     ( farm_psel[1] ),
 .prdata   ( apb_farm_rdata[1] ),
 .qbus     ( qbuses[1] ),
 .penable  ( penable ),
 .pwrite   ( pwrite ),
 .paddr    ( paddr  ),
 .pwdata   ( pwdata ),
 .q        ( )
);
// -------------------------------------------------------------------------------------------


// -------------------------------------------------------------------------------------------
apb_servant
#(.memfile  (memfile),
  .memsize  (memsize),
  .sim      (1),
  .with_csr (with_csr),
  .compress (compressed[0:0]),
  .align    (align[0:0])
)
servant_2
(
 .wb_clk   ( clk ),
 .wb_rst   ( farm_rst[2] ),
 .psel     ( farm_psel[2] ),
 .prdata   ( apb_farm_rdata[2] ),
 .qbus     ( qbuses[2] ),
 .penable  ( penable ),
 .pwrite   ( pwrite ),
 .paddr    ( paddr  ),
 .pwdata   ( pwdata ),
 .q        ( )
);
// -------------------------------------------------------------------------------------------


// -------------------------------------------------------------------------------------------
apb_servant
#(.memfile  (memfile),
  .memsize  (memsize),
  .sim      (1),
  .with_csr (with_csr),
  .compress (compressed[0:0]),
  .align    (align[0:0])
)
servant_3
(
 .wb_clk   ( clk ),
 .wb_rst   ( farm_rst[3] ),
 .psel     ( farm_psel[3] ),
 .prdata   ( apb_farm_rdata[3] ),
 .qbus     ( qbuses[3] ),
 .penable  ( penable ),
 .pwrite   ( pwrite ),
 .paddr    ( paddr  ),
 .pwdata   ( pwdata ),
 .q        ( )
);
// -------------------------------------------------------------------------------------------


assign prdata = apb_csr_rdata | apb_farm_rdata[0] | apb_farm_rdata[1] | apb_farm_rdata[2] | apb_farm_rdata[3];
assign qbus = qbuses[selected_farm];

endmodule
