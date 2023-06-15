----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 05:10:23 PM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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
use ieee.numeric_std.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Rom is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           Ins : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

 signal P_Rom : rom_type := (
 "100010000011",--Mov R1 3
 "100100000001",--MOV R2 1
 "010100000000",--NEG R2
 "001110010000",--ADD R7,R1
 "000010100000",--ADD R1, R2
 "110010000111",--JMP R1,7 if value is 0 then end the program 
 "110000000011",--JMP R0,3 if not 0 then then go back to the loop
 "110000000111");--will stays at 6 until you press the reset

begin

Ins <= P_Rom(to_integer(unsigned(address)));
end Behavioral;
