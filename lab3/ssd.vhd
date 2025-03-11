library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SevenSegmentDisplay is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        digits   : in  STD_LOGIC_VECTOR(15 downto 0);
        seg      : out STD_LOGIC_VECTOR(6 downto 0);
        an       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end SevenSegmentDisplay;

architecture Behavioral of SevenSegmentDisplay is

    signal count       : INTEGER range 0 to 50000 := 0;
    signal refresh_clk : STD_LOGIC := '0';
    signal digit_index : INTEGER range 0 to 3 := 0;
    signal current_digit : STD_LOGIC_VECTOR(3 downto 0);

    function decode_digit(d : STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
    begin
        case d is
            when "0000" => return "1000000"; -- 0
            when "0001" => return "1111001"; -- 1
            when "0010" => return "0100100"; -- 2
            when "0011" => return "0110000"; -- 3
            when "0100" => return "0011001"; -- 4
            when "0101" => return "0010010"; -- 5
            when "0110" => return "0000010"; -- 6
            when "0111" => return "1111000"; -- 7
            when "1000" => return "0000000"; -- 8
            when "1001" => return "0010000"; -- 9
            when others => return "1111111"; -- Blank
        end case;
    end function;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
            refresh_clk <= '0';
        elsif rising_edge(clk) then
            if count = 50000 then 
                count <= 0;
                refresh_clk <= not refresh_clk;
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    process(refresh_clk, reset)
    begin
        if reset = '1' then
            digit_index <= 0;
        elsif rising_edge(refresh_clk) then
            digit_index <= (digit_index + 1) mod 4;
        end if;
    end process;

    current_digit <= digits(4 * digit_index + 3 downto 4 * digit_index);
    seg <= decode_digit(current_digit);

    process(digit_index)
    begin
        case digit_index is
            when 0 => an <= "1110";
            when 1 => an <= "1101";
            when 2 => an <= "1011";
            when 3 => an <= "0111";
            when others => an <= "1111";
        end case;
    end process;

end Behavioral;
