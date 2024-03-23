module servfarm_csr
  ( input  clk,
    input  rst_n,

    input  [31:0] paddr,
    input  psel,
    input  penable,
    input  pwrite,
    input  [31:0] pwdata,
    output reg [31:0] prdata,
    output reg pready,
    output reg perr,

    output reg  [15:0] selected_farm,
    output reg [127:0] farm_rst,
    output reg [127:0] farm_psel
  );

  wire [15:0] csr_addr   = paddr[15:0];
  wire        csr_pselx  = psel && csr_addr[15];
  wire        farm_pselx = psel && !csr_addr[15];
  wire        csr_write  = csr_pselx && penable && pwrite;
  wire        csr_read   = csr_pselx && !pwrite;

  always @(posedge clk)
  begin
    if (!rst_n) begin
      pready <= 1'b0;
      perr   <= 1'b0;
      prdata <= 32'b0;
      selected_farm <= 16'h0;
      farm_rst = -1;
    end else begin
      pready <= psel && !penable;
      perr   <= 1'b0;
      prdata <= 32'b0;

      if (csr_write) begin
        case (csr_addr)
          16'h8000: selected_farm      <= pwdata[15:0];
          16'h8004: farm_rst[31:0]   <= pwdata;
          16'h8008: farm_rst[63:32]  <= pwdata;
          16'h800C: farm_rst[95:64]  <= pwdata;
          16'h8010: farm_rst[127:96] <= pwdata;
          default: ;
        endcase
      end
      
      if (csr_read) begin
        case (csr_addr)
          16'h8000: prdata <= {16'b0, selected_farm};
          16'h8004: prdata <= farm_rst[31:0];
          16'h8008: prdata <= farm_rst[63:32];
          16'h800C: prdata <= farm_rst[95:64];
          16'h8010: prdata <= farm_rst[127:96];
          default: prdata <= 32'h0;
        endcase
      end

    end
  end

/*
  always @(posedge clk)
  begin
    if (!rst_n) begin
      pready <= 1'b0;
      perr   <= 1'b0;
      prdata <= 32'b0;
      selected_farm <= 16'h0;
      farm_rst = -1;
    end else begin
      pready <= psel && !penable;
      perr   <= 1'b0;
      prdata <= 32'b0;
      case (csr_addr)
        16'h0:
          if (csr_write) begin
            selected_farm <= pwdata[15:0];
          end else if (csr_read)  begin
            prdata <= {16'b0, selected_farm};
          end

        16'h4:
          if (csr_write) begin
            farm_rst[31:0] <= pwdata;
          end else if (csr_read)  begin
            prdata <= farm_rst[31:0];
          end

        16'h8:
          if (csr_write) begin
            farm_rst[63:32] <= pwdata;
          end else if (csr_read)  begin
            prdata <= farm_rst[63:32];
          end

        16'hC:
          if (csr_write) begin
            farm_rst[95:64] <= pwdata;
          end else if (csr_read)  begin
            prdata <= farm_rst[95:64];
          end

        16'h10:
          if (csr_write) begin
            farm_rst[127:96] <= pwdata;
          end else if (csr_read)  begin
            prdata <= farm_rst[127:96];
          end

        default:
            prdata <= 32'h0;
      endcase
    end
  end
*/



  always@(*)
  begin
    farm_psel = 0;
    farm_psel[selected_farm] = farm_pselx;
  end
  
endmodule
