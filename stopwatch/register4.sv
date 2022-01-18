module register4(load_signal,clk,reset,q);
input logic clk;
input logic reset;
input logic[3:0] load_signal;
output logic[3:0] q;

d_flipflop f0(load_signal[0],reset,clk,q[0],qb0);
d_flipflop f1(load_signal[1],reset,clk,q[1],qb1);
d_flipflop f2(load_signal[2],reset,clk,q[2],qb2);
d_flipflop f3(load_signal[3],reset,clk,q[3],qb3);

endmodule