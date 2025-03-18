library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity register_tb is
end entity;

architecture tb of register_tb is
    constant WIDTH : integer := 4;
    signal clk      : std_logic := '0';
    signal rst      : std_logic := '0';
    signal load     : std_logic := '0';
    signal ser_in   : std_logic := '0';
    signal shift    : std_logic := '0';
    signal dir      : std_logic := '0';
    signal data_in  : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal data_out : std_logic_vector(WIDTH-1 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;

begin
    uut: entity work.register
        generic map(WIDTH => WIDTH)
        port map(
            clk      => clk,
            rst      => rst,
            load     => load,
            ser_in   => ser_in,
            shift    => shift,
            dir      => dir,
            data_in  => data_in,
            data_out => data_out
        );
    
    clk_process : process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    stim_proc: process
    begin
        rst <= '1';
        wait for CLK_PERIOD;
        rst <= '0';
        
        data_in <= "1010";
        load <= '1';
        wait for CLK_PERIOD;
        load <= '0';
        
        shift <= '1';
        dir <= '0';
        ser_in <= '1';
        wait for CLK_PERIOD;
        ser_in <= '0';
        wait for CLK_PERIOD;
        shift <= '0';
        
        shift <= '1';
        dir <= '1';
        ser_in <= '1';
        wait for CLK_PERIOD;
        ser_in <= '0';
        wait for CLK_PERIOD;
        shift <= '0';
        
        wait for 20 ns;
        assert false report "End of test" severity failure;
    end process;
    
end architecture tb;
