LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity E1 is
    port (
        A: in NATURAL := 1;
        B : inout NATURAL := 1
    );
end entity E1;
architecture ARH1 of E1 is
    begin

    P1: process (A)
        begin
            B <= A + 2;
            B <= B + 3;
            B <= B * 2;
            B <= B + 1; -- Only this last assignment takes place
        end process P1;

end architecture ARH1;

architecture ARH2 of E1 is
    begin

    P2: process (A)
        variable B_VAR: NATURAL;
        begin
            B_VAR := A + 2;
            B_VAR := B_VAR + 3;
            B_VAR := B_VAR * 2;
            B <= B_VAR + 1;
        end process P2;

end architecture ARH2;