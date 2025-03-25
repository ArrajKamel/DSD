LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity E1_tb is
end entity;

architecture testbench of E1_tb is
  component E1
    port (
      A : in natural := 1;
      B : inout natural := 1
    );
  end component;

  signal A_tb : natural := 1;
  signal B_tb : natural := 1;

begin
  UUT: E1 port map (
    A => A_tb,
    B => B_tb
  );

  STIMULUS: process
  begin
    report "Starting testbench for E1";

    A_tb <= 3;  
    wait for 10 ns;
    report "Test case 1: A = 3, B = " & integer'image(B_tb);

    A_tb <= 5;   
    wait for 10 ns;
    report "Test case 2: A = 5, B = " & integer'image(B_tb);

    A_tb <= 10;  
    wait for 10 ns;
    report "Test case 3: A = 10, B = " & integer'image(B_tb);

    report "Testbench complete";
    wait; 
  end process STIMULUS;
  
end architecture testbench;