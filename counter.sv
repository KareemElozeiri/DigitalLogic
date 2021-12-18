module counter(input logic clk,reset,output logic[3:0] q);

logic[3:0] load_signal;

adder4 adder(q,4'b1111,0,c_out,load_signal);
register4 register(load_signal,clk,reset,q);

endmodule