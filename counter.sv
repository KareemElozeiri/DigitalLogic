module subLoad(input logic load,notLoad,adder_load_signal,load_signal,output logic D);

and a1(l1,load,load_signal);
and a2(l2,notLoad,adder_load_signal);
or(D,l1,l2);

endmodule

module counter(input logic clk,reset,load,logic[3:0] load_signal,output logic[3:0] q);

logic[3:0] adder_load_signal;
logic[3:0] load_value;

not n1(notLoad,load);

adder4 adder(q,4'b1111,0,c_out,adder_load_signal);

subLoad s0(load,notLoad,adder_load_signal[0],load_signal[0],load_value[0]);
subLoad s1(load,notLoad,adder_load_signal[1],load_signal[1],load_value[1]);
subLoad s2(load,notLoad,adder_load_signal[2],load_signal[2],load_value[2]);
subLoad s3(load,notLoad,adder_load_signal[3],load_signal[3],load_value[3]);

register4 register(load_value,clk,reset,q);

endmodule