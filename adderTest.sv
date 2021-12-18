module adderTest;
logic A;
logic B;
logic C_in;
logic sum;
logic C_out;

fullAdder adder(A,B,C_in,C_out,sum);

initial begin
A = 1;
B = 0;
C_in = 0;
#100;
A = 1;
B = 1;
C_in = 0;
#100;
A = 1;
B = 1;
C_in = 1;
#100;
A = 1;
B = 0;
C_in = 1;
#100 $stop;

end  

endmodule 