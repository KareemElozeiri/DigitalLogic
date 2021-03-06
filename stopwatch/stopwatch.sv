module stopwatch(clk,dip_enable,dip_up,push_reset,push_add5,an,sseg);


input logic dip_enable;
input logic dip_up;
input logic push_reset;
input logic push_add5; 
input logic clk;

output logic [3:0] an; 
output logic [7:0]sseg;

logic clk_divided;
clkdiv cc(1'b0, clk, clk_divided);


//logic restedged;
//logic addedged;
//edge_detect_gate rr (clk_divided, 1'b0 , push_reset , resetedged);
//edge_detect_gate aa (clk_divided, 1'b0 , push_add5 , addedged);


//common inputs for counters
logic up;
logic enable;
logic reset;
//output 
//0-9 seconds counter inputs
logic load0 = 0;
logic [3:0] load0_signal = 4'b0000;
//output
logic out_signal0;
logic [3:0] q0;
//0-5 seconds counter inputs
logic load1 = 0;
logic [3:0] load1_signal= 4'b0000;
//output
logic out_signal1;
logic [3:0] q1;
//0-9 minutes counter inputs
logic load2 = 0;
logic [3:0] load2_signal = 4'b0000;
//output
logic out_signal2;
logic [3:0] q2;
//0-5 minutes counter inputs
logic load3 = 0;
logic [3:0] load3_signal = 4'b0000;
//output
logic out_signal3;
logic [3:0] q3;

fsm ff( clk_divided, dip_enable, dip_up, push_reset, push_add5, q2, q3, reset, enable, up, load2, load2_signal, load3, load3_signal);

not n0(not_clk,clk_divided);


//counters connected 
counter9 c0(clk_divided,reset,enable,up,load0,load0_signal,q0,out_signal0);
counter5 c1(out_signal0,reset,enable,up,load1,load1_sIgnal,q1,out_signal1);




adder4 myAdder(4'b0101,q2,1'0,t,load2_signal);

counter9 c2(out_signal1,reset,enable,up,load2_out,load2_signal,q2,out_signal2);
counter5 c3(out_signal2,reset,enable,up,load3,load3_signal,q3,out_signal3);

disp_hex_mux D0(clk,reset,q3,q2,q1,q0,4'b0000,an,sseg);

endmodule 