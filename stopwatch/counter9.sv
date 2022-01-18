//counter 0-9 code 
module counter9( clk,reset,enable,up,load,load_signal, q, next_counter_signal);

input logic clk;
input logic reset;
input logic enable;
input logic up;
input logic load;
input logic [3:0] load_signal;
output logic [3:0] q;
output logic next_counter_signal;
logic[3:0] adder_load_signal;
logic[3:0] load_value;
logic[3:0] out_signal;
logic [3:0] added_signal;
logic carry_in;
logic more;

not n1(notLoad,load);


mux0 m0(enable,up,carry_in,added_signal);
adder4 adder(q,added_signal,carry_in,c_out,adder_load_signal);


subLoad s0(load,notLoad,adder_load_signal[0],load_signal[0],load_value[0]);
subLoad s1(load,notLoad,adder_load_signal[1],load_signal[1],load_value[1]);
subLoad s2(load,notLoad,adder_load_signal[2],load_signal[2],load_value[2]);
subLoad s3(load,notLoad,adder_load_signal[3],load_signal[3],load_value[3]);

comparator9 c0(load_value,more);

mux1 m1(up,more,load_value,out_signal);

register4 register(out_signal,clk,reset,q);
outSignalMux outSignalMux0(up,q,4'b1001,next_counter_signal);

endmodule 