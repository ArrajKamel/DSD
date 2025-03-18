library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity dff is
    port(
        clk, d : in std_logic; 
        q : out std_logic
    );
end dff; 

architecture beh of dff is 
    begin

        _PROC : process(clk)
        begin
            if (rising_edge(clk)) then 
                    q <= d; -- we do not check
            end if ; 
        end process; 

end beh; 
