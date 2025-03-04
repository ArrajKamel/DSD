library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb_two_bit_adder is
end entity;

architecture tb of tb_two_bit_adder is
    component two_bit_adder is
        port(
            a    : in std_logic_vector(1 downto 0);
            b    : in std_logic_vector(1 downto 0);
            cin  : in std_logic;
            cout : out std_logic;
            sum  : out std_logic_vector(1 downto 0)
        );
    end component;
    
    signal a, b   : std_logic_vector(1 downto 0);
    signal cin    : std_logic;
    signal cout   : std_logic;
    signal sum    : std_logic_vector(1 downto 0);

begin
    uut: two_bit_adder port map(a => a, b => b, cin => cin, sum => sum, cout => cout);
    
    process
    begin
        -- Test case 1: 00 + 00 + 0
        a <= "00"; b <= "00"; cin <= '0';
        wait for 10 ns;
        
        -- Test case 2: 01 + 01 + 0
        a <= "01"; b <= "01"; cin <= '0';
        wait for 10 ns;
        
        -- Test case 3: 10 + 10 + 0
        a <= "10"; b <= "10"; cin <= '0';
        wait for 10 ns;
        
        -- Test case 4: 11 + 11 + 0
        a <= "11"; b <= "11"; cin <= '0';
        wait for 10 ns;
        
        -- Test case 5: 11 + 11 + 1
        a <= "11"; b <= "11"; cin <= '1';
        wait for 10 ns;
        
        wait;
    end process;
end architecture;
