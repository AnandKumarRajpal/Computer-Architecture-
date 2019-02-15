vlog Adder.v alu_64bit.v ALU_Control.v Control_Unit.v Data_Memory.v EX_MEM.v Forwarding_Unit.v ID_EX.v IF_ID.v immediate_data_extractor.v Instruction_Fetch.v Instruction_Memory.v int_par.v MEM_WB.v mux.v mux_4_in.v Program_Counter.v registerFile.v RISC_V_Processor_Pipeline.v tb.v

vsim -novopt work.tb

view wave

add wave -r sim:/tb/CPU/*

add wave \
{sim:/tb/CPU/Registers/Array } 

run 200ns
