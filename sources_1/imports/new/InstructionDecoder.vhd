----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:10:04 AM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           RCheckJump : in STD_LOGIC_VECTOR (3 downto 0);
           R_Enable : out STD_LOGIC_VECTOR (2 downto 0);
           J_Flag:out STD_LOGIC;
           J_Address:out STD_LOGIC_VECTOR(2 downto 0);
           
           ImmediateValue:out STD_LOGIC_VECTOR(3 downto 0);
           Reg_Sel_1:out STD_LOGIC_VECTOR(2 downto 0);
           Reg_Sel_2:out STD_LOGIC_VECTOR(2 downto 0);
           Load_Select:out STD_LOGIC;
           
           Add_Sub_select:out STD_LOGIC);
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
signal R_inter:std_logic_vector(2 downto 0);
signal J_inter: std_logic;
begin

J_inter <= Ins(11) and Ins(10);




J_flag <= '1' when J_inter='1' and RCheckJump = "0000"
            else '0';

R_Enable <= "000" when J_inter = '1'
            else Ins(9 downto 7);
    

J_Address <= Ins(2 downto 0);
ImmediateValue <= Ins(3 downto 0);

--selctors
Reg_Sel_1 <= Ins(9 downto 7);
Reg_Sel_2 <= Ins(6 downto 4);

Load_Select <= Ins(11);

--add sub
Add_Sub_select <= Ins(10);
 
end Behavioral;
