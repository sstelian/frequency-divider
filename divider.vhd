library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity divider is
	port (  input  : in std_logic;
		output : out std_logic);
end divider;

architecture divider_arch of divider is
	--divisor constant
	constant divide_by : natural := 212;
	begin
		process(input)
			variable counter : natural range 0 to divide_by;
		begin
		if rising_edge(input) then
		--the counter is incremented on every clock cycle
		--the output signal is 0 for the fist half of the output period
		if counter < (divide_by / 2) - 1 then
			output <= '0';
			counter := counter + 1;
		--the output signal is 1 for the second half of the output period
		elsif counter < divide_by - 1 then
			output <= '1';
			counter := counter + 1;
		--after a full output period, the output signal becomes 0 and the counter is reset
		else
			output <= '0';
			counter := 0;
		end if;
		end if;
		end process;
end divider_arch;
