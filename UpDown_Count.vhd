library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity UpDown_Count is
port(
        CLK, RST  : in std_logic;
        Up_Down   : in std_logic;
        Count     : out std_logic_vector(3 downto 0)
);
end UpDown_Count;

architecture ARC of UpDown_Count is

signal cnt : std_logic_vector (3 downto 0):="0000";

begin 
    process(CLK)
    begin
    
        if(rising_edge(CLK)) then
        
            if(RST = '1') then                 
                cnt <= x"1";
                
            elsif ( Up_Down = '1') then
                cnt <= cnt - x"1";
                
            else 
                cnt <= cnt + x"1";
                
            end if ;
        end if;
        
    end process;
    
    count <= cnt;
end ARC;