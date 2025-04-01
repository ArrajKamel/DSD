library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;

entity crossing_tb is
end crossing_tb;

architecture testbench of crossing_tb is
    signal CLOCK, RESET, SENSOR1, SENSOR2: std_logic := '0';
    signal RED1, YELLOW1, GREEN1, RED2, YELLOW2, GREEN2: std_logic;
    
    constant CLOCK_PERIOD: time := 10 ns;

begin
    UUT: entity work.CROSSING
        port map (
            CLOCK => CLOCK, 
            RESET => RESET,

            SENSOR1 => SENSOR1, 
            SENSOR2 => SENSOR2,

            RED1 => RED1, 
            YELLOW1 => YELLOW1, 
            GREEN1 => GREEN1,

            RED2 => RED2, 
            ELLOW2 => YELLOW2, 
            REEN2 => GREEN2
        );

    CLK_PROCESS: process
    begin
        while now < 500 ns loop 
            CLOCK <= '0';
            wait for CLOCK_PERIOD / 2;
            CLOCK <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    STIMULUS_PROCESS: process
    begin
        RESET <= '1';
        wait for 20 ns;
        RESET <= '0';
        
        SENSOR1 <= '0'; 
        SENSOR2 <= '0';
        wait for 50 ns;
        
        SENSOR1 <= '1'; 
        SENSOR2 <= '0';
        wait for 50 ns;
        
        SENSOR1 <= '0'; 
        SENSOR2 <= '1';
        wait for 50 ns;
        
        SENSOR1 <= '1'; 
        SENSOR2 <= '1';
        wait for 50 ns;

        wait;
    end process;
end testbench;