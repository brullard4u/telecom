library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity single_port_rom_tb is

end single_port_rom_tb;
architecture tb of single_port_rom_tb is
	component single_port_rom is
		generic
		(
			DATA_WIDTH : natural := 8;
			ADDR_WIDTH : natural := 8
		);
		port
		(
			clk : in std_logic;
			addr : in natural range 0 to 2**ADDR_WIDTH - 1;
			q : out std_logic_vector((DATA_WIDTH -1) downto 0)
		);
	end  component;
	component single_port_ram is
	generic 
	(
		DATA_WIDTH : natural := 4;
		ADDR_WIDTH : natural := 4
	);
	port 
	(
		clk		: in std_logic;
		addr	: in natural range 0 to 2**ADDR_WIDTH - 1;
		data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
		we		: in std_logic := '1';
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);
	end component;
	signal inclk : std_logic := '0';
	signal inAddr : natural range 0 to 2**4 - 1 := 0 ;
	signal outQ : std_logic_vector((4 -1) downto 0);
begin
	mapping1 : single_port_ram generic map(4,4) port map(inClk, inAddr,(others=>'0'), '0',outQ);
	inClk <= not inClk after 0.5 ms;
	inAddr <= inAddr+1 after 50 ms;
end tb;
