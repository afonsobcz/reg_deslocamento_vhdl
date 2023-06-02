-- GRUPO: Afonso, Hugo e Dedeha
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity registrador_deslocamento is
	 generic(n	:	integer	:= 8);
    Port (
		        
			clk : in STD_LOGIC; -- Input para o clock
			nRst : in STD_LOGIC; -- Input para o reset
         rx : in STD_LOGIC;
			tx : out STD_LOGIC;
         led : out UNSIGNED(n - 1 downto 0); -- Input para o parallel data (utilizando as chaves)
			botao : in STD_LOGIC -- Botao 
         
		  
    );
end registrador_deslocamento;

architecture rtl of registrador_deslocamento is

	
	signal aux    :   UNSIGNED(n downto 0);
	
	signal result : STD_LOGIC;
	
	component flipflop is  -- declaração do componente flipflop do deslocador
		port(
			  clk     :   in  std_logic;
			  nRst    :   in  std_logic;
			  d       :   in  std_logic;
			  q       :   out std_logic
				
			 );
		
	end component;
	
		component debounce is  -- declaração do componente debounce
		generic (
    N : integer := 8
  );
    port(
        clk     :   in  std_logic;
        button     :   in  std_logic;
        result       :   out std_logic;
		  nRst    :   in  std_logic
    );
		
	end component;


begin
   debounce1    :   entity work.debounce(rtl) port map(clk, botao, result, nRst); -- instanciação do compoenent debounce
  -- Demonstrates Use Case #1: Replicating Logic
  -- Stores just the most significant byte in a new signal
 
  g_GENERATE_FOR: for i in 0 to 7 generate -- Instanciação dos flipflop usando generate
   reg : flipflop --
		port map (result, nRst, aux(i), aux(i+1));
	led(i) <= aux(i + 1);
 end generate g_GENERATE_FOR;
 
 aux(0) <= rx;
 tx <= aux(n);
	

                 
 

	 
	  
		
	 

		
--		display_process: process(count_out)
--	begin
--		sinal_hex1 <= std_logic_vector(count_out(3 downto 0)); -- define os 4 bits menos significativos
--		sinal_hex2 <= std_logic_vector(count_out(7 downto 4)); -- define os outros 4 bits (intermediarios)
--		sinal_hex3 <= "00" & std_logic_vector(count_out(9 downto 8)); -- define os dois ultimos bits mais significativo
--	end process;
--			
  
end architecture;
	