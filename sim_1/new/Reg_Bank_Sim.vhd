----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 03:23:11 PM
-- Design Name: 
-- Module Name: Reg_Bank_Sim - Behavioral
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

entity Reg_Bank_Sim is
--  Port ( );
end Reg_Bank_Sim;

architecture Behavioral of Reg_Bank_Sim is

component Reg_Bank 
    Port (D:in STD_LOGIC_VECTOR(3 DOWNTO 0);
          Sel: in STD_LOGIC_VECTOR(2 DOWNTO 0);
          A0:out STD_LOGIC_VECTOR(3 DOWNTO 0);
          A1:out STD_LOGIC_VECTOR(3 DOWNTO 0);
          A2:out STD_LOGIC_VECTOR(3 DOWNTO 0);
          A3:out STD_LOGIC_VECTOR(3 DOWNTO 0);
          A4:out STD_LOGIC_VECTOR(3 DOWNTO 0);
          A5:out STD_LOGIC_VECTOR(3 DOWNTO 0);
          A6:out STD_LOGIC_VECTOR(3 DOWNTO 0);
          A7:out STD_LOGIC_VECTOR(3 DOWNTO 0);
          Res: in STD_LOGIC;
          Clk: in STD_LOGIC);
end component;


signal D, A0,A1,A2,A3,A4,A5,A6,A7 : STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000";
signal Sel: STD_LOGIC_VECTOR(2 DOWNTO 0):= "000";
signal Res, Clk: STD_LOGIC := '0';

begin      

    UUT:Reg_bank
        port map(
        D => D,
        Sel=> Sel,
        A0 => A0,
        A1 => A1,
        A2 => A2,
        A3 => A3,
        A4 => A4,
        A5 => A5,
        A6 => A6,
        A7 => A7,
        Res => Res,
        Clk => Clk);
        

     process 
     begin
        Clk <= '0';
        wait for 100ns;
        Clk <= '1';
        wait for 100ns;
     end process;
     
     process
     begin
    
     Sel <= "010";
     D <= "0101";
     wait for 100ns;
     Sel <= "100";
     D <= "1010";
     wait for 500ns;
     Res <= '1';
     
     wait;
     end process;
        

end Behavioral;
