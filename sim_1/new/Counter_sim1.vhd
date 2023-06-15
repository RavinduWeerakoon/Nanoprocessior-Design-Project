----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 09:59:07 AM
-- Design Name: 
-- Module Name: Counter_sim1 - Behavioral
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

entity Counter_sim1 is
--  Port ( );
end Counter_sim1;

architecture Behavioral of Counter_sim1 is

component Counter 
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           Clk: in STD_LOGIC;
           Res : in STD_LOGIC);
end component;

    signal D,Q : std_logic_vector(2 downto 0);
    signal Clk, Res: std_logic;

begin

UUT:Counter 
    port map(
    D => D,
    Q => Q,
    Clk => Clk,
    Res => Res
    );
    
 D <= "010";
 
 process 
 begin
    Clk <= '0';
    wait for 100ns;
    Clk <= '1';
    wait for 100ns;
 end process; 

process 
begin
    wait for 1000ns;
    Res <= '1';
    wait;
end process;

end Behavioral;
