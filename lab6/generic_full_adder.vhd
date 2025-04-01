LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity generic_full_adder is 
        generic(
            N: integer := 8
        );
    port(
        a: in std_logic_vector(N-1 downto 0);
        b: in std_logic_vector(N-1 downto 0);
        c_in: in std_logic;
        sum: out std_logic_vector(N-1 downto 0);
        c_out: out std_logic
    );
end entity generic_full_adder; 

architecture Structural of generic_full_adder is


    component bit_full_adder is 
        port(
            a: in std_logic;
            b: in std_logic;
            c_in: in std_logic;
            sum: out std_logic;
            c_out: out std_logic
        );
    end component; 
    
    signal s_intermediate_carry: std_logic_vector(N-2 downto 0);

begin

    First_FA: bit_full_adder
        port map(
            a => a(0),
            b => b(0),
            c_in => c_in,
            sum => sum(0),
            c_out => s_intermediate_carry(0)
        );

    Last_FA: bit_full_adder
        port map(
            a => a(N-1),
            b => b(N-1),
            c_in => s_intermediate_carry(N-2),
            sum => sum(N-1),
            c_out => c_out
        );

    --intermideate full adders
    gen_full_adder: for i in 1 to N-2 generate
        FA: bit_full_adder
            port map(
                a => a(i),
                b => b(i),
                c_in => signals_intermediate_carry(i-1),
                sum => sum(i),
                c_out => s_intermediate_carry(i)
            );
    end generate;


end Structural;


