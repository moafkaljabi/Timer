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




library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


Entity Timer_TB is 
end Timer_TB;


Architecture Simulation of Timer_TB is

    -- CUT
    component Timer
        generic(
            TIME_LIMIT  : integer := 9
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
        generic map (
            TIME_LIMIT => 90
        )

        port map (
            clk     => clk_tb,
            nRst    => nRst_tb,
            enable  => enable_tb,
            done    => done_tb
        );

    -- Clock generation
    clk_gen_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_process : process
    begin
        -- Initial Reset  
        nRst_tb     <= '0';
        enable_tb   <= '0';
        wait for clk_period * 2;

        -- Release Reset
        nRst_tb     <= '1';
        wait for clk_period;

        -- Enable Timer
        enable_tb <= '1';
        wait for clk_period * 10;

        -- simulate a pause; disable timer
        enable_tb <= '0';
        wait for clk_period * 5;

        -- re-enable timer 
        enable_tb <= '1';
        wait for clk_period * 10;
        
        -- Wait
        wait;
    end process;

end Simulation;





