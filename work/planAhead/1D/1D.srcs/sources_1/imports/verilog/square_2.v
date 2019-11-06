module square_2 #(
  parameter H_SIZE = 10'd80,
  parameter IX = 10'd320,
  parameter IY = 10'd240,
  parameter X_DIR = 1'd1,
  parameter Y_DIR = 1'd1,
  parameter D_WIDTH = 10'd640,
  parameter D_HEIGHT = 10'd480
  ) (
    input clk,
    input rst,
    input pixclk,
    input animate,
    output wire [9:0] o_xl,
    output wire [9:0] o_xr,
    output wire [9:0] o_yt,
    output wire [9:0] o_yb
  );
  
  reg [9:0] x = IX;
  reg [9:0] y = IY;
  reg dx = X_DIR;
  reg dy = Y_DIR;
  
  assign o_xl = x - H_SIZE;
  assign o_xr = x + H_SIZE;
  assign o_yt = y - H_SIZE;
  assign o_yb = y + H_SIZE;
    
  /* Sequential Logic */
  always @(posedge clk) begin
    if (rst) begin
      x <= IX;
      y <= IY;
      dx <= X_DIR;
      dy <= Y_DIR;
    end
    if (pixclk && animate) begin
      x <= dx ? x + 1'b1 : x - 1'b1;
      y <= dy ? y + 1'b1 : y - 1'b1;
      
      if (x <= H_SIZE + 1) begin
        dx <= 1;
      end
      if (y <= H_SIZE + 1) begin
        dy <= 1;
      end
      if (x >= (D_WIDTH - H_SIZE - 1)) begin
        dx <= 0;
      end
      if (y >= (D_HEIGHT - H_SIZE - 1)) begin
        dy <= 0;
      end
    end
  end
  
endmodule
