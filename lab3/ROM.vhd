library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity MEMORIE_ROM is
    port(
        A_ROM: in STD_LOGIC_VECTOR (3 downto 0); -- Address input
        CS_ROM: in STD_LOGIC; -- Chip Select signal
        D_ROM: out STD_LOGIC_VECTOR(7 downto 0) -- Data output
    );
end MEMORIE_ROM;

architecture Behavioral of MEMORIE_ROM is
    type ROM_ARRAY is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    
    constant ROM: ROM_ARRAY := (
        "00000001", -- Address 0
        "00000010", -- Address 1
        "00000100", -- Address 2
        "00001000", -- Address 3
        "00010000", -- Address 4
        "00100000", -- Address 5
        "01000000", -- Address 6
        "10000000", -- Address 7
        "11111111", -- Address 8
        "11111110", -- Address 9
        "11111100", -- Address 10
        "11111000", -- Address 11
        "11110000", -- Address 12
        "11100000", -- Address 13
        "11000000", -- Address 14
        "10000000"  -- Address 15
    );

begin
    process(A_ROM, CS_ROM)
    begin
        if CS_ROM = '1' then
            D_ROM <= ROM(to_integer(UNSIGNED(A_ROM)));
        else
            D_ROM <= (others => '0'); -- high impedence 
        end if;
    end process;
end Behavioral;
