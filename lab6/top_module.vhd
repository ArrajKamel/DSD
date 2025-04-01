library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity top_module is
    port (
        clk   : in std_logic;
        a     : in std_logic_vector(3 downto 0);
        b     : in std_logic_vector(3 downto 0);
        c_in  : in std_logic;
        an    : out std_logic_vector(7 downto 0);
        cat   : out std_logic_vector(6 downto 0);
        c_out : out std_logic
    );
end entity top_module;

architecture Behavioral of top_module is
    signal sum_internal : std_logic_vector(3 downto 0);
    signal digits       : std_logic_vector(31 downto 0);
    signal carry_out    : std_logic;

    component SSD_on_board is
        port (
            a     : in std_logic_vector(3 downto 0);
            b     : in std_logic_vector(3 downto 0);
            c_in  : in std_logic;
            sum   : out std_logic_vector(3 downto 0);
            c_out : out std_logic;
            sel   : in std_logic_vector(2 downto 0);
            y     : out std_logic
        );
    end component;

    component seven_seg_disp is
        port (
            clk    : in std_logic;
            digits : in std_logic_vector(31 downto 0);
            an     : out std_logic_vector(7 downto 0);
            cat    : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    adder_inst: SSD_on_board
        port map (
            a     => a,
            b     => b,
            c_in  => c_in,
            sum   => sum_internal,
            c_out => carry_out,
            sel   => "000", -- Always displaying sum for now
            y     => open -- Unused output
        );
    
    c_out <= carry_out;
    
    -- Assigning sum and carry to display
    digits(3 downto 0)   <= sum_internal;
    digits(7 downto 4)   <= "0000"; -- Unused
    digits(11 downto 8)  <= "0000"; -- Unused
    digits(15 downto 12) <= "0000"; -- Unused
    digits(19 downto 16) <= "0000"; -- Unused
    digits(23 downto 20) <= "0000"; -- Unused
    digits(27 downto 24) <= "0000"; -- Unused
    digits(31 downto 28) <= "000" & carry_out; -- Displaying carry

    ssd_inst: seven_seg_disp
        port map (
            clk    => clk,
            digits => digits,
            an     => an,
            cat    => cat
        );

end architecture;
