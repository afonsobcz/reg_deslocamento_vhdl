-- GRUPO: Afonso, Hugo e Dedeha
library ieee;
use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

entity flipflop is
    port(
        clk     :   in  std_logic;
        nRst    :   in  std_logic;
        d       :   in  std_logic;
        q       :   out std_logic
    );
end entity;

architecture rtl of flipflop is
begin



    process(clk, nRst) is
        begin
            
            if nRst = '0' then
                q <= '0';            
            elsif rising_edge(clk) then    -- falling_edge()
                q <= d;                 
            end if;
    end process;

end architecture;