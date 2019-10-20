/* 
 * tester for register
*/
module res_test;
  reg ld_r, clk_r;
  wire [31:0] output_r;
  reg[31:0] data;
  parameter sim_time = 100;
  res res1 (output_r,data,ld_r,clk_r);
  initial #sim_time $finish;
  initial begin
  ld_r = 1'b1;
  clk_r = 1'b0;
  data = 32'b11110000111100001111000011110000;
  repeat (10) #10 clk_r = ~clk_r;
  end
  initial fork
  #30 data = 32'b11110000111100001111000011111111; #60 data = 32'b11110000111100001111000000000000;
  join
  initial 
    begin
      $display("output  ld_r  clk_r  Time");
      $monitor("%b  %b  %b", output_r, ld_r, clk_r, $time) ;
    end
endmodule

/* 
 * Res - method for storing the data in the register
 *It is successful when the load is 1 and clk changes from 0 to 1
*/
module res (output reg [31:0] Qs, input [31:0] Ds, input Ld, clk);
  always @(posedge clk)
    if(Ld) Qs = Ds;
endmodule
