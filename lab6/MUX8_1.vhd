LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity MUX8_1 is 
    port(
        a: in std_logic_vector(7 downto 0);
        sel: in std_logic_vector(2 downto 0);
        y: out std_logic
    );
entity end; 

architecture Behavioral of MUX8_1 is

begin
    process(a, sel)
    begin
        case sel is
            when "000" => y <= a(0);
            when "001" => y <= a(1);
            when "010" => y <= a(2);
            when "011" => y <= a(3);
            when "100" => y <= a(4);
            when "101" => y <= a(5);
            when "110" => y <= a(6);
            when "111" => y <= a(7);
            when others => y <= '0';
        end case;
    end process;

    -- Alternative implementation using a LUT
    -- y <= a(to_integer(unsigned(sel)));

end architecture;