simSetSimulator "-vcssv" -exec "./simv" -args "-do dump.tcl -l verid.log" \
           -uvmDebug on -simDelim
debImport "-i" "-simflow" "-dbdir" "./simv.daidir"
verdiShowWindow -win $_Verdi_1 -switchFS
srcTBInvokeSim
fsdbAutoSwitchDumpfile 25 "./wave.fsdb" 100
fsdbDumpvars +all
run
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiShowWindow -win $_Verdi_1 -switchFS
verdiShowWindow -win $_Verdi_1 -switchFS
wvCreateWindow
verdiSetActWin -win $_nWave3
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/fifo_tb"
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/fifo_tb/clk} \
{/fifo_tb/empty} \
{/fifo_tb/full} \
{/fifo_tb/rd_data\[15:0\]} \
{/fifo_tb/rd_en} \
{/fifo_tb/rst_n} \
{/fifo_tb/wr_data\[15:0\]} \
{/fifo_tb/wr_en} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/fifo_tb/clk} \
{/fifo_tb/empty} \
{/fifo_tb/full} \
{/fifo_tb/rd_data\[15:0\]} \
{/fifo_tb/rd_en} \
{/fifo_tb/rst_n} \
{/fifo_tb/wr_data\[15:0\]} \
{/fifo_tb/wr_en} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave3 {("G1" 8)}
wvGetSignalClose -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 96284.228820 -snap {("G1" 5)}
wvSetCursor -win $_nWave3 147449.761043 -snap {("G2" 0)}
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/fifo_tb"
wvGetSignalSetScope -win $_nWave3 "/fifo_tb"
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/fifo_tb/clk} \
{/fifo_tb/empty} \
{/fifo_tb/full} \
{/fifo_tb/rd_data\[15:0\]} \
{/fifo_tb/rd_en} \
{/fifo_tb/rst_n} \
{/fifo_tb/wr_data\[15:0\]} \
{/fifo_tb/wr_en} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/fifo_tb/clk} \
{/fifo_tb/empty} \
{/fifo_tb/full} \
{/fifo_tb/rd_data\[15:0\]} \
{/fifo_tb/rd_en} \
{/fifo_tb/rst_n} \
{/fifo_tb/wr_data\[15:0\]} \
{/fifo_tb/wr_en} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave3 {("G1" 8)}
wvGetSignalClose -win $_nWave3
srcCreateSourceTab -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_2
srcHBSelect "fifo_tb" -win $_nTrace1
srcCloseSourceTab -win $_nTrace1 -tab 2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Member>
verdiDockWidgetSetCurTab -dock widgetDock_<Local>
verdiSetActWin -dock widgetDock_<Local>
verdiDockWidgetSetCurTab -dock widgetDock_<Member>
verdiDockWidgetSetCurTab -dock widgetDock_<Local>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 155728.688002 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 165035.183301 -snap {("G1" 5)}
debExit
