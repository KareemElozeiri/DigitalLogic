//mux for passing adder signals if counter value is less than 9
//otherwise if it is counting up then it will reset to zero and if it is counting down it will reset to 9 
module mux1(up, more, counter_signal, out_signal);

input logic up;
input logic more;
input logic [3:0]counter_signal;
output logic [3:0] out_signal;

not  n0(notMore,more);

and a0(s0,notMore,counter_signal[0]);
and a1(s1,notMore,counter_signal[1]);
and a2(s2,notMore,counter_signal[2]);
and a3(s3,notMore,counter_signal[3]);

not n1(notUp,up);
and a4(s4,notUp,more,1);
and a5(s5,notUp,more,0);
and a6(s6,notUp,more,0);
and a7(s7,notUp,more,1);


or o0(out_signal[0],s0,s4,0);
or o1(out_signal[1],s1,s5,0);
or o2(out_signal[2],s2,s6,0);
or o3(out_signal[3],s3,s7,0);

endmodule