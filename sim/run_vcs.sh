#!/bin/bash

# Remove ModelSim-specific commands
#quit -sim
#file delete -force work

# Create a work directory (if it doesn't exist)
if [ ! -d work ]; then
  mkdir work
fi

# Specifies a file that contains a list of source files. You should specify the bottom most
# VHDL entity first, and then move up in order.

# Set the VCS library path
vcs -full64 -Mupdate -V +error+1000 +lint=all,noVCDE,noONGS,noUI -sverilog +systemverilogext+.sv+.svi+.svh+.svt +v2k +verilog2001ext+.v95+.vt+.vp +libext+.v +incdir+../rtl +incdir+../svas/ +define+INCLUDE_SVAS -f files_rtl.f -f files_sim.f -CFLAGS -DVCS -l compile.log -debug_pp

echo "Compilation Successful!!"

# Run VCS simulation
# ./simv -gui  # You can add +acc option if needed

# Uncomment the following lines if you want to generate a waveform
#do wave.do
#onbreak {wave zoom full}
#run -all
#wave zoom full
