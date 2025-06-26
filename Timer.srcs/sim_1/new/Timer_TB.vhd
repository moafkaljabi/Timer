----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/26/2025 09:54:32 PM
-- Design Name: 
-- Module Name: Timer_TB - Behavioral
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


library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


Entity Timer_TB is 
end Timer_TB;


Architecture Simulation of Timer_TB is

    -- CUT
    component Timer is
        generic(
            TIME_LIMIT  : integer := 10
        );

        port(
            clk     : in std_logic;
            nRst    : in std_logic;
            enable  : in std_logic;

            done    : out std_logic
        );
    end component;

    -- Signals to connect to the UUT
    signal clk_tb       : std_logic := '0';
    signal nRst_tb      : std_logic := '0';
    signal enable_tb    : std_logic := '0';    
    signal done_tb      : std_logic;

    constant clk_period : time := 10 ns;

begin
    -- Instantiate Timer
    uut: Timer

end Simulation;