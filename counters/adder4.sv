module adder4(a,b,c_in,c_out,sum);
input logic [3:0] a,b;
input logic c_in;
output logic c_out;
output logic [3:0]sum;

fullAdder add0(a[0],b[0],c_in,t0,sum[0]);
fullAdder add1(a[1],b[1],t0,t1,sum[1]);
fullAdder add2(a[2],b[2],t1,t2,sum[2]);
fullAdder add3(a[3],b[3],t2,c_out,sum[3]);



endmodule