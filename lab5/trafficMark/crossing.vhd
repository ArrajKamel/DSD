library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CROSSING is
    port (
        CLOCK, RESET, SENSOR1, SENSOR2: in STD_LOGIC;
        RED1, YELLOW1, GREEN1, RED2, YELLOW2, GREEN2: out STD_LOGIC
    );
end CROSSING;

architecture CROSSING of CROSSING is
    type STATE_T is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7);
    signal STATE, NXSTATE: STATE_T;
begin

    UPDATE_STATE: process (RESET, CLOCK)
    begin
        if (RESET = '1') then
            STATE <= ST0;
        elsif rising_edge(CLOCK) then
            STATE <= NXSTATE;
        end if;
    end process;

    TRANSITIONS: process (STATE, SENSOR1, SENSOR2)
    begin
        RED1 <= '0';
        YELLOW1 <= '0'; 
        GREEN1 <= '0';

        RED2 <= '0';
        YELLOW2 <= '0'; 
        GREEN2 <= '0';

        case STATE is
            when ST0 => 
                GREEN1 <= '1'; 
                RED2 <= '1';
                if SENSOR2 = SENSOR1 then
                    NXSTATE <= ST1;
                -- elsif SENSOR1 = '1' and SENSOR2 = '1' then
                elsif SENSOR1 = '0' and SENSOR2 = '1' then
                    NXSTATE <= ST2;
                else
                    NXSTATE <= ST0;
                end if;

            when ST1 => 
                GREEN1 <= '1'; 
                RED2 <= '1';
                NXSTATE <= ST2;

            when ST2 => 
                GREEN1 <= '1'; 
                RED2 <= '1';
                NXSTATE <= ST3;

            when ST3 => 
                YELLOW1 <= '1'; 
                RED2 <= '1';
                NXSTATE <= ST4;

            when ST4 => 
                RED1 <= '1'; 
                GREEN2 <= '1';
                if SENSOR1 = '0' and SENSOR2 = '0' then
                    NXSTATE <= ST5;
                elsif SENSOR1 = '1' and SENSOR2 = '0' then
                    NXSTATE <= ST6;
                else
                    NXSTATE <= ST4;
                end if;

            when ST5 => 
                RED1 <= '1'; 
                GREEN2 <= '1';
                NXSTATE <= ST6;

            when ST6 => 
                RED1 <= '1'; 
                GREEN2 <= '1';
                NXSTATE <= ST7;

            when ST7 => 
                RED1 <= '1'; 
                YELLOW2 <= '1';
                NXSTATE <= ST0;
        end case;
    end process;
end CROSSING;
