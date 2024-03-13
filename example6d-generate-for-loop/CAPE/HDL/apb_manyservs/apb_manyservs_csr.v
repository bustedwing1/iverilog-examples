module apb_manyservs_csr
  #(
    parameter NSERV = 32
   )
   (input  clk,
    input  rst_n,

    input  [31:0] paddr,
    input  psel,
    input  penable,
    input  pwrite,
    input  [31:0] pwdata,
    output reg [31:0] prdata,
    output reg pready,
    output reg perr,

    output reg 	[15:0] serv_apb_psel,
    output      [NSERV-1:0] serv_rst
  );
  
//   wire [13:0] apb_addr  = paddr[15:2];
//   wire        apb_write = psel && paddr && pwrite;
//   wire        apb_read  = psel && paddr && !pwrite;
  
  reg [13:0] apb_addr;
  reg        apb_write;
  reg        apb_read;

  always@(*) begin
    apb_addr  = paddr[15:2];
    apb_write = psel && paddr && pwrite;
    apb_read  = psel && paddr && !pwrite;
  end
  
  localparam NREG = NSERV/32;

  integer i;

  reg [31:0] serv_enable[0:NREG];
  always @(posedge clk)
  begin
    if (!rst_n) begin
      pready <= 1'b0;
      perr   <= 1'b0;
      prdata <= 32'b0;
      serv_apb_psel <= 16'h0;
      for (i = 0; i<= NREG; i = i + 1) begin
        serv_enable[i] <= 32'b0;
      end
    end else begin
      pready <= psel && !penable;
      perr   <= 1'b0;
      prdata <= 32'b0;
      case (apb_addr)
        14'h0:
          if (apb_write)
            serv_apb_psel <= serv_apb_psel[15:0];
          else begin
            prdata <= {16'b0, serv_apb_psel};
          end
        default:
          if (apb_write)
            serv_enable[apb_addr] <= pwdata;
          else if (apb_addr) begin 
            prdata <= serv_enable[apb_addr];
          end
      endcase
    end
  end
  
  genvar gi;
  for (gi=0; gi<NREG; gi=gi+1) assign serv_rst[32*gi+31:32*gi] = ~serv_enable[gi];
  
endmodule
