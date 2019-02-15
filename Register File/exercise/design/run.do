vlog tb.v top.v registerFile.v instruction.v
vsim -novopt work.tb
view wave
add wave sim:/tb/*
run 500ns