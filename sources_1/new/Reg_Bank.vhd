----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 03:06:47 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity Reg_Bank is
    Port (D:in STD_LOGIC_VECTOR(3 DOWNTO 0);
          Sel: in STD_LOGIC_VECTOR(2 DOWNTO 0);
          A0:out STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
          A1:out STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
          A2:out STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
          A3:out STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
          A4:out STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
          A5:out STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
          A6:out STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
          A7:out STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
          Res: in STD_LOGIC;
          Clk: in STD_LOGIC);
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Reg 
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Res: in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8 
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;


signal Reg_En : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin

Decoder_3_to_8_0: Decoder_3_to_8
    port map(
    I => Sel,
    EN => '1',
    Y => Reg_En);

Reg_0: Reg
    port map(
    D => D,
    EN =>'0',
    Res =>Res,
    Clk => Clk,
    Q => A0);
    
Reg_1: Reg
    port map(
    D => D,
    EN => Reg_En(1),
    Res =>Res,
    Clk => Clk,
    Q => A1);
Reg_2: Reg
    port map(
    D => D,
    EN => Reg_En(2),
    Res =>Res,
    Clk => Clk,
    Q => A2);
 Reg_3: Reg
    port map(
    D => D,
    EN => Reg_En(3),
    Res =>Res,
    Clk => Clk,
    Q => A3);
Reg_4: Reg
    port map(
    D => D,
    EN => Reg_En(4),
    Res =>Res,
    Clk => Clk,
    Q => A4);
 Reg_5: Reg
    port map(
    D => D,
    EN => Reg_En(5),
    Res =>Res,
    Clk => Clk,
    Q => A5);
Reg_6: Reg
    port map(
    D => D,
    EN => Reg_En(6),
    Res =>Res,
    Clk => Clk,
    Q => A6);
Reg_7: Reg
    port map(
    D => D,
    EN => Reg_En(7),
    Res =>Res,
    Clk => Clk,
    Q => A7);

end Behavioral;