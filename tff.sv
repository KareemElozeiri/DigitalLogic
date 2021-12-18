module tff(input logic t,clk,reset,output logic q,qb);

xor x1(D,t,q);
dff ff(D,reset,clk,q,qb);

endmodule