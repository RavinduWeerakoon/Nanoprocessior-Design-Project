----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 04:45:08 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

component Decoder_3_to_8 port(
     I : in STD_LOGIC_VECTOR (2 downto 0);
     EN : in STD_LOGIC;
     Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal O, interOut: STD_LOGIC_VECTOR (7 downto 0);

begin
Decoder: Decoder_3_to_8 PORT MAP(
     I => S,
     EN => EN,
     Y => interOut);
    
 O <= interOut and D;

 Y <= (O(0) or O(1) or O(2) or O(3) or O(4) or O(5) or O(6) or O(7)) and EN;

end Behavioral;