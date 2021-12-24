//module that does the necessary gate operations to load the load signal if wanted
//otherwise it just passes the counter normal signal 
module subLoad(input logic load,notLoad,adder_load_signal,load_signal,output logic D);

and a1(l1,load,load_signal);
and a2(l2,notLoad,adder_load_signal);
or(D,l1,l2);

endmodule