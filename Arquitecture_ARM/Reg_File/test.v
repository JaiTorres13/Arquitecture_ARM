/* 
 * Do not change Module name 
*/
module test_RES;
  reg [1:0] i;
  wire [31:0] Y;
  reg[31:0] x;
  res res1 (Y,x,i[0],i[1]);
  initial begin
  i = 2'b11;
  x = 32'b11110000111100001111000011110000;
  end
  initial 
    begin
      $display("output");
      $monitor("%b", Y) ;
    end
endmodule

/* 
 * Do not change Module name 
*/
module test_decoder;
  reg i;
  wire [15:0] Y;
  reg[3:0] x;
  B_Decoder res1 (Y,x,i);
  initial begin
  i = 1'b1;
  x = 4'b0001;
  end
  initial 
    begin
      $display("output");
      $monitor("%b", Y) ;
    end
endmodule

/* 
 * Do not change Module name 
*/
module test_mux;
  reg [3:0]i;
  wire [31:0] Y;
  reg[31:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
  Mux res1 (Y,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,i);
  initial begin
  i = 4'b0001;
  x0 = 32'b11110000111100001111000011110000;
  x1 = 32'b11110000111100001111000011110001;
  end
  initial 
    begin
      $display("output");
      $monitor("%b", Y) ;
    end
endmodule