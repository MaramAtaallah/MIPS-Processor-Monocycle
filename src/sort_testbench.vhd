-- Authors: Gabriel Galli and Vladimir Belinski
-- Description: entity and architecture of the testbench for array sorting.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.matrix.all;

entity sort_testbench is
end sort_testbench;

architecture behavior of sort_testbench is

    constant clk_time: time := 10 ps;
    signal tb_clk, Is_the_first_tb, Read_IM_tb, Write_IM_tb, Is_Out_tb, MemWrite_Out_tb, MemRead_Out_tb: std_logic;
    signal Initial_address_tb, Instruction_tb, Address_Out_tb, Data_Out_tb: signed(31 downto 0);

    component monocycle is
        port(
            Is_the_first, clock, Read_IM, Write_IM, Is_Out, MemWrite_Out, MemRead_Out: in std_logic;
            Initial_address, Instruction, Address_Out, Data_Out: in signed(31 downto 0)
        );
    end component;

begin

    MIPS: monocycle port map (Is_the_first_tb, tb_clk, Read_IM_tb, Write_IM_tb, Is_Out_tb, MemWrite_Out_tb, MemRead_Out_tb, Initial_address_tb, Instruction_tb, Address_Out_tb, Data_Out_tb);

    CLK: process is
    begin
        tb_clk <= '1';
        wait for (clk_time / 2);
        tb_clk <= '0';
        wait for (clk_time / 2);
    end process CLK;

    TB: process is
        variable i: integer;
    begin
        Initial_address_tb <= x"00000000";
        Instruction_tb <= "00000000000000001000000000100000";
        Read_IM_tb <= '0';
        -- Is_the_first_tb <= '0';
        Write_IM_tb <= '0';
        Is_Out_tb <= '0';
        Address_Out_tb <= x"00000000";
        MemRead_Out_tb <= '0';
        MemWrite_Out_tb <= '0';
        Data_Out_tb <= x"00000000";
        Is_the_first_tb <= '1';
        wait for clk_time;

        Write_IM_tb <= '1';

        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000100010000000000001010";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000000001";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000000000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000000011";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000000100";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000000010";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000001000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000000101";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000001100";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000000100";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000010000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000000111";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000010100";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000000110";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000011000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000001001";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000011100";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000001000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000100000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000010000000000000001010";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101110000010000000000000100100";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        -- Instruction_tb <= "00000000000000000010000000100000"; -- add $a0, $0, $0
        -- Initial_address_tb <= Initial_address_tb + 4; -- não precisa pq já tá tudo 0
        -- wait for clk_time;

        Instruction_tb <= "00000010001000000010100000100000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00001100000000000000000000011001";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00001000000000000000000000111000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000000100000000100000000100000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000011111000000111000000100000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000101010101111111111111111";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000011110000000000000001";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00010000000011110000000000010011";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000000000000000111100000100000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000000000000000100100000100000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000001000000001100000000100000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000001001010100110000000101010";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00010000000011000000000000001101";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100011000110010000000000000100";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10001111000001000000000000000000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10001111001001010000000000000000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00001100000000000000000000110011";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00010100000000100000000000000101";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10001111000010110000000000000000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10001111001011010000000000000000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101111000011010000000000000000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "10101111001010110000000000000000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000000011110000000000000001";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100001001010010000000000000001";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100011000110000000000000000100";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00001000000000000000000000100001";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00001000000000000000000000011101";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000001110000001111100000100000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000011111000000000000000001000";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000000100001010001000000101010";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00010100000000000000000000000010";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00100000101001010000000000000001";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000000100001010001000000101010";
        Initial_address_tb <= Initial_address_tb + 4;
        wait for clk_time;

        Instruction_tb <= "00000011111000000000000000001000";
        Initial_address_tb <= x"00000000";
        wait for clk_time;

        Write_IM_tb <= '0';
        Is_the_first_tb <= '0';
        Read_IM_tb <= '1';

        for i in 0 to 300 loop
            wait for clk_time;
        end loop;

        wait;
    end process TB;

end behavior;
