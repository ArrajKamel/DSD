set_property PACKAGE_PIN W5 [get_ports clk]  
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## SWITCHES for Register Control
set_property PACKAGE_PIN J15 [get_ports rst]       # SW0 - Reset
set_property PACKAGE_PIN L16 [get_ports load]      # SW1 - Load
set_property PACKAGE_PIN M13 [get_ports shift]     # SW2 - Shift
set_property PACKAGE_PIN R15 [get_ports dir]       # SW3 - Shift Direction
set_property PACKAGE_PIN R17 [get_ports ser_in]    # SW4 - Serial Input

## Parallel Data Input (4-bit)
set_property PACKAGE_PIN T18 [get_ports data_in[0]]  # SW5 - Data Bit 0
set_property PACKAGE_PIN U18 [get_ports data_in[1]]  # SW6 - Data Bit 1
set_property PACKAGE_PIN R13 [get_ports data_in[2]]  # SW7 - Data Bit 2
set_property PACKAGE_PIN T8  [get_ports data_in[3]]  # SW8 - Data Bit 3

## 7-SEGMENT DISPLAY OUTPUT
set_property PACKAGE_PIN W7 [get_ports ssd_seg[0]]  # Segment A
set_property PACKAGE_PIN W6 [get_ports ssd_seg[1]]  # Segment B
set_property PACKAGE_PIN U8 [get_ports ssd_seg[2]]  # Segment C
set_property PACKAGE_PIN V8 [get_ports ssd_seg[3]]  # Segment D
set_property PACKAGE_PIN U5 [get_ports ssd_seg[4]]  # Segment E
set_property PACKAGE_PIN V5 [get_ports ssd_seg[5]]  # Segment F
set_property PACKAGE_PIN U7 [get_ports ssd_seg[6]]  # Segment G

## 7-SEGMENT DISPLAY ANODE CONTROL (only enabling SSD[0])
set_property PACKAGE_PIN U6 [get_ports ssd_anode[0]]  # SSD 0 (active low)
set_property PACKAGE_PIN V6 [get_ports ssd_anode[1]]  # SSD 1
set_property PACKAGE_PIN W5 [get_ports ssd_anode[2]]  # SSD 2
set_property PACKAGE_PIN W4 [get_ports ssd_anode[3]]  # SSD 3

## I/O Standard for All Pins
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports load]
set_property IOSTANDARD LVCMOS33 [get_ports shift]
set_property IOSTANDARD LVCMOS33 [get_ports dir]
set_property IOSTANDARD LVCMOS33 [get_ports ser_in]
set_property IOSTANDARD LVCMOS33 [get_ports data_in[*]]
set_property IOSTANDARD LVCMOS33 [get_ports ssd_seg[*]]
set_property IOSTANDARD LVCMOS33 [get_ports ssd_anode[*]]
