module counterTest;
logic clk,reset;
logic[3:0] q;

counter c(clk,reset,q);

always #50 clk = ~clk;

initial begin
clk = 0;
reset = 1;
#50;
reset = 0;
#50;
reset = 0;
#50;
reset = 0;
#50;
reset = 0;
#50;
reset = 0;
#50;
reset = 0;
#50;
reset = 0;
#50;
reset = 1;
#50 $stop;
end 

endmodule