library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Test_UpDowncounters is
end Test_UpDowncounters;

architecture ARC of Test_UpDowncounters is
component UpDown_Count
port(
        CLK, RST  : in std_logic;
        Up_Down   : in std_logic;
        Count     : out std_logic_vector(3 downto 0)
);
end component;

signal clk, rst, Up_Down   :std_logic:='0';
signal Count          :std_logic_vector(3 downto 0);

begin
    dev_test : UpDown_Count 
    port map 
    ( 
        CLK     => clk, 
        RST     => rst , 
        Up_Down => Up_Down, 
        Count   => Count
    );
    
    stim : process
    begin
    
        clk <= '0';
        wait for 10ns;
        clk <= '1';
        wait for 10ns;
        
    end process;
    
    stim1 : process
    begin 
    
        rst <= '1';
        wait for 20ns;
        rst <= '0';
        Up_Down <= '0';
        wait for 120ns;
        Up_Down <= '1';
        wait for 100ns;
        rst <= '1';
        wait for 20ns;
        rst <= '0';
        Up_Down <= '0';
        
    end process;
end ARC;