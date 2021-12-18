module fullAdder(
input logic A,B,C_in,
output logic C_out,sum
);

xor x1(t1,A,B);
xor x2(sum,t1,C_in);
and a1(t2,C_in,t1);
and a2(t3,A,B);
or a3(C_out,t2,t3);

endmodule