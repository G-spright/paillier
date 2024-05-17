PWD = $(shell pwd)

SIM = vcs

SIM_ARGS =  -full64 -LDFLAGS -Wl,--no-as-needed \
    -sverilog -timescale=1ns/1ps \
    -CFLAGS -DVCS -kdb \
    -debug_acc+all+dmptf -debug_region+cell+encrypt 

SRC_ARGS = -f $(PWD)/filelist.f


sim:
	$(SIM) $(SIM_ARGS) $(SRC_ARGS) -l vcs.log

dump.tcl:
	@echo "fsdbAutoSwitchDumpfile 25 \"./wave.fsdb\" 100" > $@
	@echo "fsdbDumpvars +all" >> $@
	@echo "run" >> $@

run: dump.tcl
	./simv -ucli -do dump.tcl -l run.log	
	
verdi:
	./simv -gui=verdi \
	-ucli -do dump.tcl -l verid.log

clean::
	rm -rf simv.daidir csrc simv verdiLog dump.tcl
	rm -f *.log *.vpd *.key novas.* *.vf *.fsdb verdi_config_file

