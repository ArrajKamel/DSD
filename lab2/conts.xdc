-- Constraint File (XDC for FPGA Board)
# Define switch inputs for a, b, and cin
set_property PACKAGE_PIN J15 [get_ports {a[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]
set_property PACKAGE_PIN L16 [get_ports {a[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]
set_property PACKAGE_PIN M13 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN R15 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN R17 [get_ports {cin}]
set_property IOSTANDARD LVCMOS33 [get_ports {cin}]

# Define LED outputs for sum and cout
set_property PACKAGE_PIN K2 [get_ports {sum[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum[0]}]
set_property PACKAGE_PIN K3 [get_ports {sum[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum[1]}]
set_property PACKAGE_PIN H4 [get_ports {cout}]
set_property IOSTANDARD LVCMOS33 [get_ports {cout}]
