library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity two_bit_adder is
    port(
        a    : in std_logic_vector(1 downto 0);
        b    : in std_logic_vector(1 downto 0);
        cin  : in std_logic;
        cout : out std_logic;
        sum  : out std_logic_vector(1 downto 0)
    );
end entity;

architecture struct of two_bit_adder is
    component bit_adder is
        port(
            a    : in std_logic;
            b    : in std_logic;
            cin  : in std_logic;
            cout : out std_logic;
            sum  : out std_logic
        );
    end component;
    
    signal c1: std_logic;

begin
    bit0: bit_adder port map(a => a(0), b => b(0), cin => cin, sum => sum(0), cout => c1);
    bit1: bit_adder port map(a => a(1), b => b(1), cin => c1, sum => sum(1), cout => cout);

end architecture;

