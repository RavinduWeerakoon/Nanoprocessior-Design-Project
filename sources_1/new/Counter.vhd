----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 08:52:49 AM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0):="000";
           Clk: in STD_LOGIC;
           Res : in STD_LOGIC);
end Counter;

architecture Behavioral of Counter is

    component D_FF
        port(
        D: in std_logic;
        Res: in std_logic;
        Clk: in std_logic;
        Q: out std_logic;
        Qbar: out std_logic);
    end component;

signal Q_out : std_logic_vector(2 downto 0);
begin

D_FF_0: D_FF 
    port map(
    D => D(0),
    Res=>Res,
    Clk => Clk,
    Q => Q(0));

D_FF_1: D_FF 
    port map(
    D => D(1),
    Res=>Res,
    Clk => Clk,
    Q => Q(1));

D_FF_2: D_FF 
    port map(
    D => D(2),
    Res=>Res,
    Clk => Clk,
    Q => Q(2));




end Behavioral;
