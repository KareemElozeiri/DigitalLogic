module dffTest;

logic D,reset,clk,q,qb;

dff flip(D,reset,clk,q,qb);
always #50 clk = ~clk;
initial begin
D = 0;
reset = 1;
clk = 0;
#500;
D = 1;
reset = 0;
#500;
D = 0;
reset = 0;
#500;
D = 1;
reset = 0;
#500;
D = 0;
reset = 0;
#500;
D = 1;
reset = 1;
#500 $stop;

end 

endmodule