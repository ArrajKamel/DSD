library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dff_tb is
end dff_tb;

architecture tb of dff_tb is
    signal clk : std_logic := '0';
    signal d   : std_logic := '0';
    signal q   : std_logic;
    constant clk_period : time := 10 ns;

    component dff
        port(
            clk : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;

begin
    uut: dff
        port map (
            clk => clk,
            d   => d,
            q   => q
        );

    clk_process : process
    begin
        while now < 200 ns loop 
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    stim_proc: process
    begin
        d <= '0';
        wait for 20 ns;
        
        d <= '1';
        wait for 10 ns;
        
        wait for 20 ns;
        
        d <= '0';
        wait for 20 ns;
        
        -- Toggle d multiple times
        d <= '1';
        wait for 10 ns;
        d <= '0';
        wait for 10 ns;
        d <= '1';
        wait for 10 ns;
        d <= '0';
        wait for 20 ns;
        
        -- End simulation
        wait;
    end process;

end tb;
