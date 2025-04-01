library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

entity reg is
    Generic (
        N    : integer := 8;  
    );
    Port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        enable: in  std_logic;
        d_in  : in  std_logic_vector(N-1 downto 0); 
        d_out : out std_logic_vector(N-1 downto 0) 
    );
end reg;

architecture Behavioral of reg is
begin

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                d_out <= (others => '0');  
            elsif enable = '1' then
                d_out <= d_in ;  
            end if;
        end if;
    end process;
    
end Behavioral;