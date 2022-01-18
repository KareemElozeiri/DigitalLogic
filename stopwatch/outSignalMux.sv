//this module is for creating output signal that will work as a clk for the next counter
module outSignalMux(up,q,max,outSignal);

input logic up;
input logic[3:0] max;
input logic[3:0] q;

output logic outSignal;


logic t0,t1,equalMax,equalZero;

not n1(notUp,up);

equalizer e0(q,max,equalMax);
and and0(t0,equalMax,up);

equalizer e1(q,4'b0000,equalZero);
and and1(t1,equalZero,notUp);

or(outSignal,t0,t1);

endmodule 