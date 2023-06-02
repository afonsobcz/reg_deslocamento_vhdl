-- GRUPO: Afonso, Hugo e Dedeha
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
entity contador_generico is
  generic (
    N : integer := 19
  );
  port (
    SCLR    : in  std_logic;
    CLK     : in  std_logic;
    ENA     : in std_logic;
    OUTPUT_FLAG  : out std_logic
  );
end contador_generico;

architecture rtl of contador_generico is
  signal count : unsigned(N-1 downto 0);
begin
  process (CLK, SCLR)
  begin
    if (SCLR = '1') then
      count <= (others => '0'); -- Reiniciar contador quando SCLR é alto
    elsif (rising_edge(CLK)) then
      if (ENA = '0') then -- Habilitar contador quando ENA é baixo
        count <= count + 1; -- Incrementar contador no sinal de clock de subida
		  	  

      end if;
    end if;
  end process;
  
  OUTPUT_FLAG <= count(n-1);
end rtl;