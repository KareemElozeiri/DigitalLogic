module mux0(input logic enable,up ,output logic carry_in, logic [3:0] added_signal);

and a0(carry_in,enable,up);

not n0(notUp,up);

and a1(added_signal[0],enable,notUp);
and a2(added_signal[1],enable,notUp);
and a3(added_signal[2],enable,notUp);
and a4(added_signal[3],enable,notUp);

endmodule
