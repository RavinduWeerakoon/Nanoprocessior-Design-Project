----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 02:18:14 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0):="0000";
           En : in STD_LOGIC;
           Res: in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0):="0000");
end Reg;

architecture Behavioral of Reg is

begin
process (Clk) begin
     if (rising_edge(Clk)) then -- respond when clock rises
         if En = '1' and Res='0' then -- Enable should be set
            Q <= D;
         end if;
         if Res='1' then
            Q <= "0000";
         end if;
     end if;
end process;


end Behavioral;
