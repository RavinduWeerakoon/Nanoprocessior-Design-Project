----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 09:33:11 AM
-- Design Name: 
-- Module Name: Processor_sim - Behavioral
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

entity Processor_sim is
--  Port ( );
end Processor_sim;

architecture Behavioral of Processor_sim is


component Processor 

Port (Clk_in : in STD_LOGIC;
      Res: in STD_LOGIC;
      Output_7seg : out STD_LOGIC_VECTOR(6 downto 0);
      Output: out STD_LOGIC_VECTOR(3 DOWNTO 0);
      Overflow : out STD_LOGIC;
      Zero:out STD_LOGIC;
      Display:out STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;


component Slow_Clk 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal Clk_in, Res : std_logic;
signal Output : std_logic_vector(3 downto 0); 
signal Outputseg : std_logic_vector(6 downto 0);

begin
UUT: Processor
    port map(
    Clk_in => Clk_in,
    Res => Res,
    Output_7seg => OutputSeg,
    Output => Output);

process
begin
    Clk_in <= '1';
    wait for 50ns;
    Clk_in <= '0';
    wait for 50ns;

end process;
    
process
begin
    Res <= '0';

    
    wait;
end process;
   

end Behavioral;
