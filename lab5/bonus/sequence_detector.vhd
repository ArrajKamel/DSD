library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity sequence_detector is
    generic (
        N : integer := 8  
    );
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        d_in   : in  std_logic;
        count  : out std_logic_vector(N-1 downto 0)
    );
end sequence_detector;

architecture Behavioral of sequence_detector is
    
    type state_type is (S0, S1, S2, S3, S4);
    signal state, next_state : state_type;
    signal seq_count : std_logic_vector(N-1 downto 0);
    
begin
    
    process (clk, rst)
    begin
        if rst = '1' then
            state <= S0;
            seq_count <= (others => '0');
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;
    

    process (state, d_in)
    begin
        next_state <= state;
        case state is
            when S0 =>  -- waiting for '0'
                if d_in = '0' then
                    next_state <= S1;
                end if;
            when S1 =>  -- waiting for '1'
                if d_in = '1' then
                    next_state <= S2;
                end if;
            when S2 =>  -- waiting for second '1'
                if d_in = '1' then
                    next_state <= S3;
                elsif d_in = '0' then
                    next_state <= S1;
                end if;
            when S3 =>  -- waiting for '0'
                if d_in = '0' then
                    next_state <= S4;
                end if;
            when S4 =>  -- '0110' detected 
                if d_in = '1' then
                    next_state <= S2;  -- overlapping case
                else
                    next_state <= S1;
                end if;
        end case;
    end process;
    
    -- the occurrences
    process (clk, rst)
    begin
        if rst = '1' then
            seq_count <= (others => '0');
        elsif rising_edge(clk) then
            if state = S4 then 
                seq_count <= seq_count + 1;
            end if;
        end if;
    end process;
    
    count <= seq_count;
    
end Behavioral;