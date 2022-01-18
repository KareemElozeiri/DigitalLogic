module test_fsm();
logic clk, dip_enable,dip_up,push_reset,push_add5,reset,enable,up,load0,load1;
logic [3:0] q0,q1,load0_value,load1_value;

fsm fsm0(clk, dip_enable,dip_up,push_reset,push_add5,q0,q1,reset,enable,up,load0,load0_value,load1,load1_value);
always #50 clk = ~clk;
initial begin
clk = 0;
dip_enable = 1;
dip_up = 1;
push_reset = 1;
push_add5 = 1;
q0 = 4'b0111;
q1 = 4'b0011;
#100; 
dip_enable = 1;
dip_up = 1;
push_reset = 0;
push_add5 = 1;
#100; 
dip_enable = 1;
dip_up = 1;
push_reset = 0;
push_add5 = 1;
#100; 
dip_enable = 0;
dip_up = 1;
push_reset = 0;
push_add5 = 1;
#100; 
dip_enable = 0;
dip_up = 1;
push_reset = 0;
push_add5 = 1;
#100;
dip_enable = 0;
dip_up = 1;
push_reset = 0;
push_add5 = 1;
#100;
dip_enable = 1;
dip_up = 1;
push_reset = 0;
push_add5 = 0;
#100;
dip_enable = 1;
dip_up = 1;
push_reset = 0;
push_add5 = 0;
#100;
dip_enable = 1;
dip_up = 0;
push_reset = 0;
push_add5 = 0;
#100;
$stop; 
end 

endmodule