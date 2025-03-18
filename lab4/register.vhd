library ieee;
use ieee.std_logic.1164.all;
use ieee.std_logic_vector.all;

entity register is
    generic (
        WIDTH : integer := 4
    );
    port (
        clk      : in  std_logic;                      
        rst      : in  std_logic;                     
        load     : in  std_logic; 
        ser_in   : in  std_logic; -- serial input for shiftting 
        shift    : in  std_logic;                     
        dir      : in  std_logic; -- Direction: '0' = Shift Right, '1' = Shift Left
        data_in  : in  std_logic_vector(WIDTH-1 downto 0);  -- the parallel
        data_out : out std_logic_vector(WIDTH-1 downto 0)   
    );
end entity register;

architecture beh of register is

    signal reg : std_logic_vector(WIDTH-1 downto 0);

begin

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then -- synchronouse reset (no needed to put it in the process barantices 
                reg <= (others => '0');
            end if; 
            if load = '1' then
                reg <= data_in;  
            elsif shift = '1' then
                if dir = '1' then -- shift left
                    reg <= reg(WIDTH-2 downto 0) & serial_in;  
                else -- shift right 
                    reg <= serial_in & reg(WIDTH-1 downto 1);  
                end if;
            end if;
        end if; 
    end process;
    
    data_out <= reg;  
end architecture beh;