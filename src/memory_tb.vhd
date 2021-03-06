library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.matrix.all;

entity memory_tb is
end memory_tb;

architecture behavior of memory_tb is

	constant clk_time: time := 10 ps;
	signal tb_clk, tb_MemRead, tb_MemWrite: std_logic;
	signal tb_address: signed(31 downto 0);
	signal tb_write_data, tb_read_data: signed(31 downto 0);

	component memory is
		port(
			MemRead, MemWrite: in std_logic;
			address: in signed(31 downto 0);
			write_data: in signed(31 downto 0);
			read_data: out signed(31 downto 0)
		);
	end component;

begin

	MEM: memory port map(tb_MemRead, tb_MemWrite, tb_address, tb_write_data, tb_read_data);

	CLK: process is
	begin
		tb_clk <= '1';
		wait for (clk_time / 2);
		tb_clk <= '0';
		wait for (clk_time / 2);
	end process CLK;

	TB: process is
		variable i: natural;
	begin

		tb_MemRead <= '0';
		tb_MemWrite <= '0';
		tb_address <= x"00000000";
		tb_write_data <= x"00000000";
		wait for clk_time;

		tb_MemWrite <= '1';
		for i in 0 to 63 loop
			tb_address <= tb_address + 4;
			wait for clk_time;
			tb_write_data <= tb_write_data + 1;
		end loop;
		tb_MemWrite <= '0';

		----------------------------------------------------------------

		tb_address <= x"00000000";

		tb_MemRead <= '1';
		for i in 0 to 63 loop
			wait for clk_time;
			tb_address <= tb_address + 4;
		end loop;
		tb_MemRead <= '0';

	end process TB;

end behavior;
