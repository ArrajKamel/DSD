library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity MEMORIE_RAM is
    port(
        A_RAM: in STD_LOGIC_VECTOR (3 downto 0); -- Address input
        CS_RAM: in STD_LOGIC; -- Chip Select signal
        WE: in STD_LOGIC; -- Write Enable signal
        D_RAM: inout STD_LOGIC_VECTOR(7 downto 0) -- Bidirectional Data bus
    );
end MEMORIE_RAM;

architecture Behavioral of MEMORIE_RAM is
    type RAM_ARRAY is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    signal RAM: RAM_ARRAY := (others => (others => '0'));

begin
    process(A_RAM, CS_RAM, WE)
    begin
        if CS_RAM = '1' then
            if WE = '1' then
                -- Write 
                RAM(to_integer(UNSIGNED(A_RAM))) <= D_RAM;
            else
                -- Read 
                D_RAM <= RAM(to_integer(UNSIGNED(A_RAM)));
            end if;
        else
            D_RAM <= (others => 'Z');
        end if;
    end process;

end Behavioral;
