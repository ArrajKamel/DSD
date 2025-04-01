library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

entity counter is
    Generic (
        N    : integer := 8;
        STEP : integer := 1  
    );
    Port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        enable: in  std_logic;
        count : out std_logic_vector(N-1 downto 0)
    );
end counter;

architecture Structural of counter is
    
    signal reg_out  : std_logic_vector(N-1 downto 0);
    signal adder_out: std_logic_vector(N-1 downto 0);
    
    component reg
        Generic (
            N : integer := 8
        );
        Port (
            clk    : in  std_logic;
            rst    : in  std_logic;
            enable : in  std_logic;
            d_in   : in  std_logic_vector(N-1 downto 0);
            d_out  : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
    component adder
        Generic (
            N    : integer := 8;
            STEP : integer := 1  
        );
        Port (
            d_in : in std_logic_vector(N-1 downto 0);
            sum  : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
begin
    
    ADDER_INST: adder
        Generic Map (
            N => N,
            STEP => STEP
        )
        Port Map (
            d_in => reg_out,
            sum  => adder_out
        );
    
    REG_INST: reg
        Generic Map (
            N => N
        )
        Port Map (
            clk    => clk,
            rst    => rst,
            enable => enable,
            d_in   => adder_out,
            d_out  => reg_out
        );
    
    count <= reg_out;
    
end Structural;
