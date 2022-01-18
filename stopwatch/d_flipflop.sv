module d_flipflop(D,reset,clk,q,qb);

input logic D;
input logic reset;
input logic clk;

output logic q;
output logic qb;


//structural code for dff
//not  n1(not_reset,reset);
//and  a1(D_reset,D,not_reset);
//not  n2(Db,D_reset);
//and  a2(R,clk,Db);
//and  a3(S,clk,D_reset);
//nor  no1(q,R,qb);
//nor  no2(qb,S,q);


//behavioral code for dff for individual test of counter(to make the system respond only to the raising edge of clock)
always_ff@(posedge clk,posedge reset)
begin
if(reset == 1'b1)
begin
	q <= 0;
	qb <= 1;
end 
else
begin
	q = D;
	qb = ~D;
end 

end 

endmodule

