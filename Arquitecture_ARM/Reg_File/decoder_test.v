/* 
 * tester for decoder
*/
module decoder_test;
  reg ld_r;
  wire x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
  reg[3:0] bin_input;
  parameter sim_time = 100;
  B_Decoder dec1 (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,bin_input,ld_r);
  initial #sim_time $finish;
  initial begin
  ld_r = 1'b1;
  bin_input = 4'b0001;
  end
  initial fork
  #10 bin_input = 4'b1111; #20 ld_r = 1'b0; #20 bin_input = 4'b0001; #30 ld_r = 1'b1; #30 bin_input = 4'b0011;
  #40 bin_input = 4'b1000; #50 bin_input = 4'b0110;#60 ld_r = 1'b0; #60 bin_input = 4'b0011;
  #70 ld_r = 1'b1; #70 bin_input = 4'b1010; #80 bin_input = 4'b1011; #90 bin_input = 4'b0111; #100 bin_input = 4'b0000;
  join
  initial 
    begin
      $display("binary_in x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15        ld_r           Time");
      $monitor("%b        %b %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   %b         %b", bin_input, x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15, ld_r, $time) ;
    end
endmodule





module B_Decoder(output reg E0, E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15, input [3:0] D, input Ld);
    always @ (D)
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