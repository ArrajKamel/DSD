LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
-- SSD for NEXYS A7 100T
-- 7-segment display on board
-- This module implements a 4-bit binary adder with a 7-segment display output
-- The adder takes two 4-bit inputs (a and b), a carry-in (c_in), and produces a 4-bit sum output and a carry-out (c_out).
-- The sum output is then passed to a 7-segment display through a multiplexer.
-- The multiplexer selects one of the 8 possible outputs based on the sel input, which is a 3-bit selection signal.
-- The 7-segment display is controlled by the y output, which is a single bit that indicates which segment to light up.
-- The module uses a generic full adder component to perform the addition, and a multiplexer component to select the output for the display.
-- The design is intended for use on the NEXYS A7 100T FPGA board, and the specific mapping of the outputs to the 7-segment display
-- may vary depending on the hardware configuration.
entity SSD_on_board is 
    port(
        a: in std_logic_vector(3 downto 0);
        b: in std_logic_vector(3 downto 0);
        c_in: in std_logic;
        sum: out std_logic_vector(3 downto 0);
        c_out: out std_logic;
        sel: in std_logic_vector(2 downto 0);
        y: out std_logic
    );
end entity SSD_on_board; 

architecture Behavioral of SSD_on_board is
    signal s_intermediate_carry: std_logic_vector(1 downto 0);
    signal s_sum: std_logic_vector(3 downto 0);
    signal s_c_out: std_logic;
    signal s_y: std_logic;

    component generic_full_adder is 
        generic(
            N: integer := 4
        );
        port(
            a: in std_logic_vector(N-1 downto 0);
            b: in std_logic_vector(N-1 downto 0);
            c_in: in std_logic;
            sum: out std_logic_vector(N-1 downto 0);
            c_out: out std_logic
        );
    end component;

begin
    FA: generic_full_adder
        port map(
            a => a,
            b => b,
            c_in => c_in,
            sum => s_sum,
            c_out => s_c_out
        );

    -- Assign the sum and carry-out outputs
    sum <= s_sum;
    c_out <= s_c_out;

    -- Instantiate the multiplexer
    MUX: MUX8_1
        port map(
            a => s_sum,
            sel => sel,
            y => s_y
        );

    -- Assign the output for the 7-segment display
    y <= s_y;

end architecture;