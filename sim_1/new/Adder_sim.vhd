----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:58:49 PM
-- Design Name: 
-- Module Name: Adder_sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_sim is
--  Port ( );
end Adder_sim;

architecture Behavioral of Adder_sim is

component Adder_3_bit 
    Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           S : out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal A,S : std_logic_vector(2 downto 0);
begin

UUT: Adder_3_bit
    port map(
        A=>A,
        S=>S);
        
process
begin
    A <= "000";
    wait for 100ns;
    A <= "001";
    wait for 100ns;
    A <= "010";
    wait for 100ns;
    A <= "011";
    wait for 100ns;
    A <= "100";
    wait for 100ns;
    A <= "101";
    wait;

end process;


end Behavioral;
