----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:08 01/29/2016 
-- Design Name: 
-- Module Name:    rom_a0a1a2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_a0a1a2 is
	 generic ( width : positive := 8;
				  array_length : positive := 4);
    Port ( addr : in  STD_LOGIC_VECTOR ((width -1) downto 0);
           a0 : out  STD_LOGIC_VECTOR ((width -1) downto 0);
           a1 : out  STD_LOGIC_VECTOR ((width -1) downto 0);
           a2 : out  STD_LOGIC_VECTOR ((width -1) downto 0);
           oe : in  STD_LOGIC;
           cs : in  STD_LOGIC;
           clock : in  STD_LOGIC);
end rom_a0a1a2;

architecture Behavioral of rom_a0a1a2 is

type memory is array ( (array_length -1) downto 0 ) 
          of std_logic_vector ( (width -1) downto 0 );
			 
signal mem_a0 : memory;
signal mem_a1 : memory;
signal mem_a2 : memory;

begin
-- filling up the memory by hand
-- A0
mem_a0(0) <= "00000000";
mem_a0(1) <= "00000001";
mem_a0(2) <= "00000010";
mem_a0(3) <= "00000011";
-- A1
mem_a1(0) <= "00000000";
mem_a1(1) <= "00000001";
mem_a1(2) <= "00000010";
mem_a1(3) <= "00000011";
-- A2
mem_a2(0) <= "00000000";
mem_a2(1) <= "00000001";
mem_a2(2) <= "00000010";
mem_a2(3) <= "00000011";

process(clock)
	subtype address is integer range 0 to (array_length - 1);
	variable index: address;
begin
	if rising_edge(clock) then
		if oe = '1' and cs = '1' then
			index := conv_integer(addr);
			a0 <= mem_a0(index);
			a1 <= mem_a1(index);
			a2 <= mem_a2(index);
		else
		   a0 <= (others => 'Z');
			a1 <= (others => 'Z');
			a2 <= (others => 'Z');
		end if;
	end if;
end process;



end Behavioral;

