----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 03:27:39 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

entity TB_4_RCA is
--  Port ( );
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is
COMPONENT RCA_4 
    Port ( A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           Sub: in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end COMPONENT;

 
 SIGNAL A, B, S: std_logic_vector(3 downto 0);
 SIGNAL C_out, C_in, Sub, Overflow: std_logic;
begin
 UUT: RCA_4 PORT MAP(
A => A,
B => B,
S => S,
C_in => C_in,
Sub => Sub,
C_out => C_out,
Overflow => Overflow
);
process 
begin
    Sub <= '0';
    C_in <= '0';
    
    A <= "1111";
    B <= "0011";
    
    wait for 100ns;
    
    Sub <= '1';
    C_in <= '1';


    wait;  
end process;
end Behavioral;
