library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;
-- use IEEE.std_logic_arith.ALL;


entity beh_counter is
    Generic (
        N    : integer := 8; 
        STEP : integer := 1  
    );
    Port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        enable: in  std_logic;
        count : out std_logic_vector(N-1 downto 0)
    );
end beh_counter;

architecture Behavioral of beh_counter is
    signal counter_reg : unsigned(N-1 downto 0) := (others => '0');
begin

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                counter_reg <= (others => '0');  
            elsif enable = '1' then
                counter_reg <= counter_reg + STEP;  
            end if;
        end if;
    end process;

    count <= std_logic_vector(counter_reg);
    
end Behavioral;