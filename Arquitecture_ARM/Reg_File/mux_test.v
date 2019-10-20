/* 
 * tester for multiplexer
*/
module mux_test;
  reg [3:0]bin_in;
  wire [31:0] output_r;
  //data from each res
  reg[31:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
  parameter sim_time = 100;
  Mux mux1 (output_r,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,bin_in);
  initial #sim_time $finish;
  initial begin
  bin_in = 4'b0001;
  x0 = 32'b11110000111100001111000011110000;
  x1 = 32'b11110000111100001111000011110001;
  x2 = 32'b11110110111100001111000011110001;
  x3 = 32'b11110000111100001001000011110001;
  x4 = 32'b00000000111100001111000011110000;
  x5 = 32'b11110000111100001111000011111111;
  x6 = 32'b11110000111100001111111111110000;
  x7 = 32'b11111111111100001111000011110000;
  x8 = 32'b11110000111111111111000011110000;
  x9 = 32'b11110000111100000000000011110000;
  x10 = 32'b11110000000000001111000011110000;
  x11 = 32'b10101010111100001111000011110000;
  x12 = 32'b11110000111100001111000010101010;
  x13 = 32'b11110000111100001010101011110000;
  x14 = 32'b10101010101010101010101010101010;
  x15 = 32'b01010101010101010101010101010101;
  end
  initial fork
  #10 bin_in = 4'b1111; #20 bin_in = 4'b1001; #30 bin_in = 4'b1011; #40 bin_in = 4'b0111; #50 bin_in = 4'b1110;
  #60 bin_in = 4'b1000; #70 bin_in = 4'b1010; #80 bin_in = 4'b0011; #90 bin_in = 4'b0101; #100 bin_in = 4'b1100;
  join
  initial 
    begin
      $display("bin_in    output                                       Time");
      $monitor("%b    %b",bin_in ,output_r, $time) ;
    end
endmodule

/*
* module where takes the data from the requested register
*/
module Mux(output reg [31:0] P, input [31:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15, input [3:0] S);

always @ (S)
        case(S)
           4'b0000: P = Q0;
           4'b0001: P = Q1;
           4'b0010: P = Q2;
           4'b0011: P = Q3;
           4'b0100: P = Q4;
           4'b0101: P = Q5;
           4'b0110: P = Q6;
           4'b0111: P = Q7;
           4'b1000: P = Q8;
           4'b1001: P = Q9;
           4'b1010: P = Q10;
           4'b1011: P = Q11;
           4'b1100: P = Q12;
           4'b1101: P = Q13;
           4'b1110: P = Q14;
           4'b1111: P = Q15;
           endcase
    
endmodule