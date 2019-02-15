vlog ALU_1_bit.v tb.v top.v
vsim -novopt work.tb
view wave
add wave -r /*
run 400ns