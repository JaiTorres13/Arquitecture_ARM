/* 
 * tester for Register File
*/

module Reg_File_test;
  reg [3:0] a_i,b_i,c_i;
  wire [31:0] pa_o, pb_o;
  reg[31:0] pc_i;
  reg rf_i, clk_rf;
  parameter sim_time = 300;
  Reg_File reg1 (pa_o,pb_o,pc_i,a_i,b_i,c_i, rf_i, clk_rf);
  initial #sim_time $finish;
  initial begin
  pc_i = 32'b11110000111100001111000011110000;
  a_i = 4'b0001;
  b_i = 4'b0010;
  c_i = 4'b0001;
  rf_i = 1'b1;
  clk_rf = 1'b1;
  repeat (30) #10 clk_rf= ~clk_rf; 
  end
  initial fork
 
  #20 c_i = 4'b0010; #20 pc_i = 32'b11110000111100001111000011110001;
  #40 c_i = 4'b0011; #40 pc_i = 32'b11110110111100001111000011110001; #40 a_i = 4'b0011;
  #60 c_i = 4'b0100; #60 pc_i = 32'b11110000111100001001000011110001; #60 b_i = 4'b0100;
  #80 c_i = 4'b0101; #80 pc_i = 32'b00000000111100001111000011110000; #80 a_i = 4'b0101;
  #100 c_i = 4'b0110; #100 pc_i = 32'b11110000111100001111000011111111; #100 b_i = 4'b0110;
  #120 c_i = 4'b0111; #120 pc_i = 32'b11110000111100001111111111110000; #120 a_i = 4'b0111;
  #140 c_i = 4'b1000; #140 pc_i = 32'b11111111111100001111000011110000; #140 b_i = 4'b1000;
  #160 c_i = 4'b1001; #160 pc_i = 32'b11110000111111111111000011110000; #160 a_i = 4'b1001;
  #180 c_i = 4'b1010; #180 pc_i = 32'b11110000111100000000000011110000; #180 b_i = 4'b1010;
  #200 c_i = 4'b1011; #200 pc_i = 32'b11110000000000001111000011110000; #200 a_i = 4'b1011;
  #220 c_i = 4'b1100; #220 pc_i = 32'b10101010111100001111000011110000; #220 b_i = 4'b1100;
  #240 c_i = 4'b1101; #240 pc_i = 32'b11110000111100001111000010101010; #240 a_i = 4'b1101;
  #260 c_i = 4'b1110; #260 pc_i = 32'b10101010101010101010101010101010; #260 b_i = 4'b1110;
  #280 c_i = 4'b1111; #280 pc_i = 32'b01010101010101010101010101010101; #280 a_i = 4'b1111;
  #300 c_i = 4'b1010; #300 pc_i = 32'b11110000111100001010101011110000; #300 a_i = 4'b1010;

  join
  initial 
    begin
      $display("RegistroC Input       RegistroA    outputA    RegistroB          outputB     clock   RF               TIME ");
      $monitor("%d        %d    %d         %d      %d        %d          %b   %b", c_i, pc_i, a_i, pa_o, b_i, pb_o , clk_rf, rf_i, $time) ;
    end
endmodule

/*
* register file module
*/
module Reg_File(output wire [31:0] PA, PB, input [31:0] PC, input [3:0] A,B,C, input RF, clk);

wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
wire [31:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15;

B_Decoder Decoder (w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15, C, RF);
Res res0(Q0, PC, w0, clk);
Res res1(Q1, PC, w1, clk);
Res res2(Q2, PC, w2, clk);
Res res3(Q3, PC, w3, clk);
Res res4(Q4, PC, w4, clk);
Res res5(Q5, PC, w5, clk);
Res res6(Q6, PC, w6, clk);
Res res7(Q7, PC, w7, clk);
Res res8(Q8, PC, w8, clk);
Res res9(Q9, PC, w9, clk);
Res res10(Q10, PC, w10, clk);
Res res11(Q11, PC, w11, clk);
Res res12(Q12, PC, w12, clk);
Res res13(Q13, PC, w13, clk);
Res res14(Q14, PC, w14, clk);
Res res15(Q15, PC, w15, clk);
Mux muxA (PA,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,A);
Mux muxB (PB,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,B);
endmodule

/* 
 * Res - method for storing the data in the register
 *It is successful when the load is 1 and clk changes from 0 to 1
*/
module Res (output reg [31:0] Qs, input [31:0] Ds, input Ld, clk_res);
  always @(posedge clk_res)
    if(Ld) Qs = Ds;
endmodule

/*
* Module where decodes a binary number to know in which register
* the data will be stored
*/
module B_Decoder(output reg E0, E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15, input [3:0] D, input Ld);
    always @ (*)
        if(Ld)
            case(D)
               4'b0000: begin E0=1'B1;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b0001: begin E0=1'B0;E1=1'B1;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b0010: begin E0=1'B0;E1=1'B0;E2=1'B1;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b0011: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B1;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b0100: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B1;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b0101: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B1;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b0110: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B1;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b0111: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B1;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b1000: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B1;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b1001: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B1;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b1010: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B1;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b1011: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B1;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b1100: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B1; E13=1'B0;E14=1'B0;E15=1'B0; end
               4'b1101: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B1;E14=1'B0;E15=1'B0; end
               4'b1110: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B1;E15=1'B0; end
               4'b1111: begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B1; end
            endcase
        else
            begin E0=1'B0;E1=1'B0;E2=1'B0;E3=1'B0;E4=1'B0;E5=1'B0;E6=1'B0;E7=1'B0;E8=1'B0;E9=1'B0;E10=1'B0;E11=1'B0;E12=1'B0; E13=1'B0;E14=1'B0;E15=1'B0; end
            

endmodule

/*
* module where takes the data from the requested register
*/
module Mux(output reg [31:0] P, input [31:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15, input [3:0] S);

always @ (*)
        case(S)
           4'b0000: P = m0;
           4'b0001: P = m1;
           4'b0010: P = m2;
           4'b0011: P = m3;
           4'b0100: P = m4;
           4'b0101: P = m5;
           4'b0110: P = m6;
           4'b0111: P = m7;
           4'b1000: P = m8;
           4'b1001: P = m9;
           4'b1010: P = m10;
           4'b1011: P = m11;
           4'b1100: P = m12;
           4'b1101: P = m13;
           4'b1110: P = m14;
           4'b1111: P = m15;
           endcase
    
endmodule


