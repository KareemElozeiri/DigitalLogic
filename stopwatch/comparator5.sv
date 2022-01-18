module comparator5(input logic[3:0] num,output logic more);

and a0(t1,num[2],num[1]);
or o0(more,t1,num[3]);

endmodule