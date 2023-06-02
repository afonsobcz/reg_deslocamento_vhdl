-- GRUPO: Afonso, Hugo e Dedeha
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity debounce is
  generic (
    N : integer := 8
  );
    port(
        clk     :   in  std_logic;
        button     :   in  std_logic;
        result       :   out std_logic;
		  nRst    :   in  std_logic
    );
end entity;

architecture rtl of debounce is
signal nor_a  :   std_logic := '0';
signal nor_b  :   std_logic := '0';
signal x : std_logic := '0';
signal enable : std_logic := '0';
signal nor_out : std_logic := '0';





component flipflop is -- declaração do componente flipflop para o contador
	    port(
        clk     :   in  std_logic;
        nRst    :   in  std_logic;
        d       :   in  std_logic;
        q       :   out std_logic
    );
	
end component;

component flipflop_en is -- declaração do componente flipflop com opção de enable

    port(
        clk     :   in  std_logic;
        nRst    :   in  std_logic;
        d       :   in  std_logic;
		  en      :   in  std_logic;
        q       :   out std_logic
    );
	
end component;

component contador_generico is -- declaração do componente contador para implementar o debounce

  port (
    SCLR    : in  std_logic;
    CLK     : in  std_logic;
    ENA     : in  std_logic;
    OUTPUT  : out std_logic_vector(N-1 downto 0)

  );
end component;

begin

--instanciação dos componentes criados acima, as ligações são feitas nessa etapa
FF1    :   entity work.flipflop(rtl) port map(clk, nRst, button, x);
FF2    :   entity work.flipflop(rtl) port map(clk, nRst, x, nor_a);
nor_out <= nor_a XOR x;
Counter    :   entity work.contador_generico(rtl) port map(nor_out, clk, enable, enable);
FF3    :   entity work.flipflop_en(rtl) port map(clk, nRst, nor_a, enable, result);




end architecture;