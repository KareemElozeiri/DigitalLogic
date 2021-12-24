module comparator9(input logic [3:0]num,output logic more);

and a0(t1,num[3],num[2]);
and a1(t2,num[3],num[1]);
or o0(more,t1,t2);

endmodule