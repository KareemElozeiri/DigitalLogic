module comparator(input logic [3:0] num1,num2,output logic more);

// logic [3:0] inverted;
// logic [3:0] complement;
// logic cout0;
// logic cout1;
// not n0(inverted[0],num2[0]);
// not n1(inverted[1],num2[1]);
// not n2(inverted[2],num2[2]);
// not n3(inverted[3],num2[3]);
// adder4 adder0(inverted,4'b0000,1,cout0,complement);

// logic [3:0] sum;
// adder4 adder1(complement,num2,0,cout1,sum);
// and a0(more,sum[3],1);

always_comb
begin

if(num1>num2)
begin
more = 1; 
end 
else
begin 
more = 0;
end
end  


endmodule