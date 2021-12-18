module dff(input logic D,reset,clk,
output logic q,qb);


not #1 n1(not_reset,reset);
and #1 a1(D_reset,D,not_reset);
not #1 n2(Db,D_reset);
and #1 a2(R,clk,Db);
and #1 a3(S,clk,D_reset);
nor #1 no1(q,R,qb);
nor #1 no2(qb,S,q);

endmodule

