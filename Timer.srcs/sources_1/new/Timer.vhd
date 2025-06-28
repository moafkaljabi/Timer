----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/25/2025 11:39:54 PM
-- Design Name: 
-- Module Name: Timer - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Timer is

    generic(
        TIME_LIMIT : integer := 99
    );
    
    Port( 
        clk     : in std_logic;
        nRst    : in std_logic;
        enable  : in std_logic;

        done    : out std_logic
);
end Timer;


architecture Behavioral of Timer is
    -- Define Signals
    signal counter      : integer range 0 to TIME_LIMIT := 0;
    signal done_int     : std_logic := '0';
begin

    increment_proc  : process(clk, nRst)
    begin
        if nRst = '0' then
            counter     <= 0;
            done_int    <= '0';
        elsif rising_edge(clk) then 
            if enable = '1' then
                if counter < TIME_LIMIT then
                    counter <= counter + 1;
                    done_int <= '0';
                else 
                    done_int <= '1';
                end if;
            else
                counter <= 0;
                done_int <= '0';
            end if;
        end if;
    end process;
       
    done <= done_int;

end Behavioral;