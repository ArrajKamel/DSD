LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity bit_full_adder is 
    port(
        a: in std_logic;
        b: in std_logic;
        c_in: in std_logic;
        sum: out std_logic;
        c_out: out std_logic
    );
end  entity bit_full_adder; 

architecture Behavioral of bit_full_adder is

begin

    sum <= a xor b xor c_in;
    c_out <= (a and b) or (c_in and (a xor b));

end Behavioral;