library ieee;
use ieee.std_logic_1164.all;

entity top is
    port (
        clk       : in  std_logic;
        rst       : in  std_logic;
        load      : in  std_logic;
        shift     : in  std_logic;
        ser_in    : in  std_logic;
        dir       : in  std_logic;
        data_in   : in  std_logic_vector(3 downto 0);
        ssd_anode : out std_logic_vector(3 downto 0);
        ssd_seg   : out std_logic_vector(6 downto 0)
    );
end entity top;

architecture rtl of top is
    signal reg_out : std_logic_vector(3 downto 0);

    component reg is
        generic (WIDTH : integer := 4);
        port (
            clk      : in  std_logic;
            rst      : in  std_logic;
            load     : in  std_logic;
            ser_in   : in  std_logic;
            shift    : in  std_logic;
            dir      : in  std_logic;
            data_in  : in  std_logic_vector(3 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    component ssd is
        port (
            clk       : in  std_logic;
            rst       : in  std_logic;
            data      : in  std_logic_vector(3 downto 0);
            ssd_anode : out std_logic_vector(3 downto 0);
            ssd_seg   : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    U1: reg
        generic map (WIDTH => 4)
        port map (
            clk      => clk,
            rst      => rst,
            load     => load,
            ser_in   => ser_in,
            shift    => shift,
            dir      => dir,
            data_in  => data_in,
            data_out => reg_out
        );

    U2: ssd
        port map (
            clk       => clk,
            rst       => rst,
            data      => reg_out,
            ssd_anode => ssd_anode,
            ssd_seg   => ssd_seg
        );

end architecture rtl;
