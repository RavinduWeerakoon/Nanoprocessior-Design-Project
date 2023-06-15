----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:49:38 PM
-- Design Name: 
-- Module Name: Mux_8_way_4_Sim - Behavioral
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

entity Mux_8_way_4_Sim is
--  Port ( );
end Mux_8_way_4_Sim;

architecture Behavioral of Mux_8_way_4_Sim is

component Mux_8_way_4 
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal  A0,A1,A2,A3,A4,A5,A6,A7,Y : STD_LOGIC_VECTOR(3 downto 0);
signal S: STD_LOGIC_VECTOR(2 DOWNTO 0);



begin

UUT: Mux_8_way_4 PORT MAP(
    A0 => A0,
    A1 => A1,
    A2 => A2,
    A3 => A3, 
    A4 => A4,
    A5 => A5,
    A6 => A6,
    A7 => A7,
    S => S,
    Y => Y);

process 
begin
    A0 <= "0000";
    A1 <= "0000";
    A2 <= "1111";
    A3 <= "0000";
    A4 <= "0000";
    A5 <= "1111";
    A6 <= "1010";
    A7 <= "0000";
    S <= "110";
    wait;
    
end process;


end Behavioral;
