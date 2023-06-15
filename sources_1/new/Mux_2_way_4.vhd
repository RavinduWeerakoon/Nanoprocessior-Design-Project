----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:23:35 PM
-- Design Name: 
-- Module Name: Mux_2_way_4 - Behavioral
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

entity Mux_2_way_4 is
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_way_4;

architecture Behavioral of Mux_2_way_4 is

begin

S(0) <= (A0(0) and not(D)) or (A1(0) and D);
S(1) <= (A0(1) and not(D)) or (A1(1) and D);
S(2) <= (A0(2) and not(D)) or (A1(2) and D);
S(3) <= (A0(3) and not(D)) or (A1(3) and D);



end Behavioral;
