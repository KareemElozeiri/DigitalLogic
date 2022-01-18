module equalizer(input logic[3:0] a,b,output logic equal);

xnor n0(t0,a[0],b[0]);
xnor n1(t1,a[1],b[1]);
xnor n2(t2,a[2],b[2]);
xnor n3(t3,a[3],b[3]);

and a0(equal,t0,t1,t2,t3);


endmodule