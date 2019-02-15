vlog tb.v ALU_64_bit.v

vsim -novopt work.tb

view wave
add wave \
# {sim:/tb/a } \
# {sim:/tb/b } \
# {sim:/tb/ALUOp } \
# {sim:/tb/Result } \
# {sim:/tb/Zero} \

run 300ns