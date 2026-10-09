project_new DE10_Lite -overwrite
set_global_assignment -name FAMILY "MAX 10 FPGA"
set_global_assignment -name DEVICE 10M50DAF484I6G
set_global_assignment -name TOP_LEVEL_ENTITY DE10_Lite
set_parameter -name clk_freq_hz 50000000
set_global_assignment -name VERILOG_FILE G:/._Library/FPGA/learning/DE10_Lite.v
set_global_assignment -name SDC_FILE G:/._Library/FPGA/learning/MAX10_CLK1_50.sdc
source G:/._Library/FPGA/learning/DE10_Lite_pins.qsf
