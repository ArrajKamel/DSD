library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TESTBENCH is
end TESTBENCH;

architecture TB of TESTBENCH is

    -- rom signals 
    signal A_ROM: STD_LOGIC_VECTOR(3 downto 0);
    signal CS_ROM: STD_LOGIC;
    signal D_ROM: STD_LOGIC_VECTOR(7 downto 0);
    
    -- ram signals 
    signal A_RAM: STD_LOGIC_VECTOR(3 downto 0);
    signal CS_RAM: STD_LOGIC;
    signal WE: STD_LOGIC;
    signal D_RAM: STD_LOGIC_VECTOR(7 downto 0);
    
    component MEMORIE_ROM
        port(
            A_ROM: in STD_LOGIC_VECTOR(3 downto 0);
            CS_ROM: in STD_LOGIC;
            D_ROM: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    component MEMORIE_RAM
        port(
            A_RAM: in STD_LOGIC_VECTOR(3 downto 0);
            CS_RAM: in STD_LOGIC;
            WE: in STD_LOGIC;
            D_RAM: inout STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
begin
    UUT_ROM: MEMORIE_ROM
        port map (
            A_ROM => A_ROM,
            CS_ROM => CS_ROM,
            D_ROM => D_ROM
        );
    
    UUT_RAM: MEMORIE_RAM
        port map (
            A_RAM => A_RAM,
            CS_RAM => CS_RAM,
            WE => WE,
            D_RAM => D_RAM
        );
    
    process
    begin
        -- ROM Test
        CS_ROM <= '1';
        for i in 0 to 15 loop
            A_ROM <= CONV_STD_LOGIC_VECTOR(i, 4);
            wait for 10 ns;
        end loop;
        CS_ROM <= '0';
        
        -- RAM Test
        CS_RAM <= '1';
        
        -- Write to RAM
        for i in 0 to 15 loop
            A_RAM <= CONV_STD_LOGIC_VECTOR(i, 4);
            D_RAM <= CONV_STD_LOGIC_VECTOR(i * 10, 8);
            WE <= '1';
            wait for 10 ns;
            WE <= '0';
            wait for 10 ns;
        end loop;
        
        -- Read from RAM
        for i in 0 to 15 loop
            A_RAM <= CONV_STD_LOGIC_VECTOR(i, 4);
            WE <= '0';
            wait for 10 ns;
        end loop;
        
        CS_RAM <= '0';
        wait;
    end process;
    
end TB;
