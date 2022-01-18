vsim work.counter5
add wave -position insertpoint sim:/counter5/*
force -freeze sim:/counter5/clk 1 0
force -freeze sim:/counter5/reset 1 0
force -freeze sim:/counter5/enable 1 0
force -freeze sim:/counter5/up 0 0
force -freeze sim:/counter5/load 0 0
force -freeze sim:/counter5/load_signal 0011 0
run
force -freeze sim:/counter5/reset 0 0
run
force -freeze sim:/counter5/reset 1 0
run
force -freeze sim:/counter5/reset 0 0
force -freeze sim:/counter5/up St1 0
run
force -freeze sim:/counter5/load 1 0
run
force -freeze sim:/counter5/load_signal 1000 0
run
force -freeze sim:/counter5/up 0 0
run
force -freeze sim:/counter5/load 0 0
force -freeze sim:/counter5/enable 0 0
run