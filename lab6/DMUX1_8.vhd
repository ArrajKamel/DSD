LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity DMUX1_8 is 
    port(
        a: in std_logic;
        sel: in std_logic_vector(2 downto 0);
        y: out std_logic_vector(7 downto 0)
    );
entity end; 

architecture Behavioral of DMUX1_8 is

begin
    process(a, sel)
    begin
        y <= (others => '0'); -- initialize the output to 0
        case sel is
            when "000" => y(0) <= a;
            when "001" => y(1) <= a;
            when "010" => y(2) <= a;
            when "011" => y(3) <= a;
            when "100" => y(4) <= a;
            when "101" => y(5) <= a;
            when "110" => y(6) <= a;
            when "111" => y(7) <= a;
            when others => null; 
        end case;
    end process;

    -- -- Alternative implementation using a LUT
    -- y <= (others => '0');
    -- y(to_integer(unsigned(sel))) <= a;

    -- -- Alternative implementation using a conditional assignment
    -- y <= a when sel = "000" else
    --       '0' when sel = "001" else
    --       '0' when sel = "010" else
    --       '0' when sel = "011" else
    --       '0' when sel = "100" else
    --       '0' when sel = "101" else
    --       '0' when sel = "110" else
    --       '0' when sel = "111" else
    --       '0';

end architecture;