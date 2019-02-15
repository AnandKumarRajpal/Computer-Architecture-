vlog tb.v ALU_1_bit.v
vsim -novopt work.tb
view wave
add wave \
{sim:/tb/a } \
{sim:/tb/b } \
{sim:/tb/CarryIn } \
{sim:/tb/ALUop } \
{sim:/tb/Result } \
{sim:/tb/CarryOut } 
run 500ns