# sintesi.tcl
# Script per la sintesi

set VERILOG_FILES {src/iir_section1.sv  src/iir_section2.sv  src/iir.sv}
set TOP_MODULE iir
set LIB_FILE /vlsi/tech/nangate45/lib/NangateOpenCellLibrary_typical.lib
set CONSTRAINTS_FILE ./src/constraints.sdc

read_liberty $LIB_FILE
read_slang   {*}$VERILOG_FILES

# Sintesi generica. Il comando richiede un solo parametro:
# il nome del modulo top-level
syn_generic $TOP_MODULE

# Standard-cell mapping ed ottimizzazione.
# Il comando richiede un solo parametro:
# il nome del file di constraints
syn_map $CONSTRAINTS_FILE

report_area
report_timing
write_netlist results/iir_netlist.v
report_area   results/area_report.txt
report_timing results/timing_report.txt


