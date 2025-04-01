library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

entity adder is
    Generic (
        N    : integer := 8;
        STEP : integer := 1  
    );
    Port (
        d_in : in std_logic_vector(N-1 downto 0);
        sum   : out std_logic_vector(N-1 downto 0)
    );
end adder;

architecture Behavioral of adder is
begin

    count <= d_in + STEP; 
    
end Behavioral;