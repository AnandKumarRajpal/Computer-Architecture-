vlog tb.v RISC_V_Processor.v registerfile.v Program_Counter.v mux.v Instruction_Memory.v instruction.v imm_gen.v Data_Memory.v Control_Unit.v ALU_Control.v ALU_64_bit.v Adder.v EXMEM.v Forwarding_Unit.v IDEX.v IFID.v MEMWB.v mux2.v 
vsim -novopt work.tb
view wave
