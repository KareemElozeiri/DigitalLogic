vsim work.counter
add wave -position insertpoint sim:/counter/*
force -freeze sim:/counter/clk 1 0
force -freeze sim:/counter/reset 1 0
force -freeze sim:/counter/enable 1 0
force -freeze sim:/counter/up 1 0
force -freeze sim:/counter/load 0 0
force -freeze sim:/counter/load_signal 0110 0
run
force -freeze sim:/counter/reset 0 0
run
force -freeze sim:/counter/up 0 0
run
force -freeze sim:/counter/enable 0 0
run
force -freeze sim:/counter/load 1 0
run