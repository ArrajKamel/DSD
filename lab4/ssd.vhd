library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ssd is
    port (
        clk       : in  std_logic;  
        rst       : in  std_logic;  
        data      : in  std_logic_vector(3 downto 0);  
        ssd_anode : out std_logic_vector(3 downto 0);  -- anode control (only one active at a time)
        ssd_seg   : out std_logic_vector(6 downto 0)   
    );
end entity ssd;

architecture beh of ssd is
begin
    process (data)
    begin
        case data is
            when "0000" => ssd_seg <= "0000001"; -- 0
            when "0001" => ssd_seg <= "1001111"; -- 1
            when "0010" => ssd_seg <= "0010010"; -- 2
            when "0011" => ssd_seg <= "0000110"; -- 3
            when "0100" => ssd_seg <= "1001100"; -- 4
            when "0101" => ssd_seg <= "0100100"; -- 5
            when "0110" => ssd_seg <= "0100000"; -- 6
            when "0111" => ssd_seg <= "0001111"; -- 7
            when "1000" => ssd_seg <= "0000000"; -- 8
            when "1001" => ssd_seg <= "0000100"; -- 9
            when "1010" => ssd_seg <= "0001000"; -- A
            when "1011" => ssd_seg <= "1100000"; -- B
            when "1100" => ssd_seg <= "0110001"; -- C
            when "1101" => ssd_seg <= "1000010"; -- D
            when "1110" => ssd_seg <= "0110000"; -- E
            when "1111" => ssd_seg <= "0111000"; -- F
            when others => ssd_seg <= "1111111"; -- Blank
        end case;
    end process;

    process (clk, rst)
    begin
        if rst = '1' then
            ssd_anode <= "1110";  -- Activate only SSD[0]
        elsif rising_edge(clk) then
            ssd_anode <= "1110";  -- Keep SSD[0] active
        end if;
    end process;
    
end architecture beh;
