`timescale 1ns/100ps
module apb_ctrl_status(
   input               pclk,
   input               presetn,
   input               penable,
   input               psel,
   input       [7:0]   paddr,
   input               pwrite,
   input       [31:0]  pwdata,
   output  reg [31:0]  prdata,
   output      [31:0]  control,
   input       [31:0]  status
   );


   localparam [7:0] STATUS      = 8'h20; // READ-ONLY REGISTER
   localparam [7:0] CONTROL_1   = 8'h10; // READ/WRITE Register  0=0 4=1 8=2 c=3 10=4
   localparam [7:0] CONTROL_0   = 8'h00; // READ_ONLY DEADBEEF REGISTER

   reg  [31:0] control0;
   reg  [31:0] control1;
   wire [31:0] control = control1;

   wire rd_enable;
   wire wr_enable;

   assign wr_enable = (penable && pwrite && psel);
   assign rd_enable = (!pwrite && psel);

   always@(posedge pclk or negedge presetn)
   begin
      if(~presetn)
         begin
            prdata <= 'b0;
            control0 <= 32'hdeadbeef;
            control1 <= 32'h00000000;
         end
      else
         begin
            prdata <= 32'b0;
            case(paddr[7:0])
               STATUS:
                  begin
                    if (rd_enable)
                        begin
                           prdata <= status;
                        end
                  end
               CONTROL_0:
                  begin
                    if (rd_enable)
                        begin
                           prdata <= control0; // deadbeef
                        end
                  end
                CONTROL_1:
                    begin
                      if (rd_enable)
                        begin
                            prdata <= control1;
                        end
                      else if (wr_enable)
                        begin
                            control1 <= pwdata;
                        end
                    end
               default:
                  begin
                     prdata <= 32'b0;
                  end
            endcase
         end
   end
endmodule

