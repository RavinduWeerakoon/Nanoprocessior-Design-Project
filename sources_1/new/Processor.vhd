---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 09:18:02 AM
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is

Port (Clk_in : in STD_LOGIC;
      Res: in STD_LOGIC;
      Output_7seg: out STD_LOGIC_VECTOR(6 DOWNTO 0);
      Output : out STD_LOGIC_VECTOR(3 DOWNTO 0);
      Overflow : out STD_LOGIC;
      Zero:out STD_LOGIC;
      Display:out STD_LOGIC_VECTOR(3 DOWNTO 0));
end Processor;

architecture Behavioral of Processor is

component Counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0) := "000";
           Clk: in STD_LOGIC;
           Res : in STD_LOGIC);
end component;

component Adder_3_bit is
    Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           S : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component Slow_Clk 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;


component Program_Rom 
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           Ins : out STD_LOGIC_VECTOR (11 downto 0));
end component;


component Mux_2_way_3 
    Port ( A0 : in STD_LOGIC_VECTOR (2 downto 0);
           A1 : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;




component InstructionDecoder 
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
end component;


component Mux_2_way_4
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Reg_Bank
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
end component;


component Mux_8_way_4 
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component RCA_4
    Port ( A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           Sub: in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           Overflow:out STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;


component LUT_16_7 
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;


SIGNAL D,Q, Q_inter, count_mux_out: STD_LOGIC_VECTOR(2 downto 0) := "000";
SIGNAL I : STD_LOGIC_VECTOR(11 downto 0);
type t_bus is array (0 to 7) of std_logic_vector(3 downto 0);
signal r_Mem : t_bus;
--registers
SIGNAL R1, R2, R_Enable, J_Address : STD_LOGIC_VECTOR(2 downto 0):="000";
SIGNAL R, ImmediateValue, RegUpdate, M1_out, M2_out : STD_LOGIC_VECTOR(3 downto 0):="0000";
SIGNAL Adder_out : STD_LOGIC_VECTOR(3 downto 0):= "0000";
Signal Clk_out, Load_Select, Add_Sub_select: STD_LOGIC := '0';
signal J_flag : STD_LOGIC := '0';
signal SegOut : STD_LOGIC_VECTOR(6 downto 0);

begin




Clk_0: Slow_Clk
    port map(
    Clk_in => Clk_in,
    Clk_out => Clk_out);
P_rom : Program_Rom
    port map(
    address => D,
    Ins => I);    

InstructionDecoder_0 : InstructionDecoder 
    Port map ( Ins => I,
           RCheckJump=> M1_out,
           R_Enable=> R_Enable,
           J_Flag => J_Flag,
           J_Address => J_Address,
           
           ImmediateValue => ImmediateValue,
           Reg_Sel_1 => R1,
           Reg_Sel_2 => R2,
           Load_Select => Load_Select,
           
           Add_Sub_select=>  Add_Sub_select);
Reg_selector_mux : Mux_2_way_4
    port map(
    A0 => Adder_out,
    A1 =>ImmediateValue,
    D=>Load_Select,
    S=>RegUpdate);
    

rg:Reg_Bank
    Port map (D => RegUpdate,
              Sel => R_Enable,
              A0 => r_Mem(0),
              A1 => r_Mem(1),
              A2 => r_Mem(2),
              A3 => r_Mem(3),
              A4 => r_Mem(4),
              A5 => r_Mem(5),
              A6 => r_Mem(6),
              A7 => r_Mem(7),
              Res => Res,
              Clk =>Clk_out);
mx1 : Mux_8_way_4
    port map(A0 => r_Mem(0),
            A1 => r_Mem(1),
            A2 => r_Mem(2),
            A3 => r_Mem(3),
            A4 => r_Mem(4),
            A5 => r_Mem(5),
            A6 => r_Mem(6),
            A7 => r_Mem(7),
            S => R1,
            Y => M1_out);
            
mx2 : Mux_8_way_4
    port map(A0 => r_Mem(0),
            A1 => r_Mem(1),
            A2 => r_Mem(2),
            A3 => r_Mem(3),
            A4 => r_Mem(4),
            A5 => r_Mem(5),
            A6 => r_Mem(6),
            A7 => r_Mem(7),
            S => R2,
            Y => M2_out);

rc4 : RCA_4
    port map(A =>M1_out,
       B => M2_out,
       Sub => Add_Sub_Select,
       C_in => Add_Sub_Select,
       --C_out : out STD_LOGIC;
       --Overflow:out STD_LOGIC;
       S => Adder_out);


    
Adder_3_bit_0 : Adder_3_bit
    port map(
    A => D,
    S => Q_inter);

Mux_2_way_3_counter: Mux_2_way_3
    port map(
    A0 => Q_inter,
    A1 => J_address,
    D => J_Flag,
    S => count_mux_out);
    
Counter_0 : Counter
    port map(
    D => count_mux_out,
    Q => D,
    Res => Res,
    Clk=>Clk_out);    


LUT : LUT_16_7 
    Port map( address  => r_Mem(7),
              data => SegOut);

Output_7seg <= SegOut;
Output <= r_Mem(7);
Display <= "0111";

end behavioral;