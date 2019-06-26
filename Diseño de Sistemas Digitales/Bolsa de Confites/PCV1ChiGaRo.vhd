library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity PCV1ChiGaRo is
Port (i_clk : in  STD_LOGIC; --Señal de reloj
		i_sel : in STD_LOGIC; --Señal de seleccion
		i_A : in STD_LOGIC_VECTOR (31 downto 0); --Dato e entrada
		o_B : out STD_LOGIC_VECTOR (31 downto 0)); --Dato de salida
		
end PCV1ChiGaRo;
 
architecture Behavioral of PCV1ChiGaRo is

	Signal Registro : STD_LOGIC_VECTOR (31 downto 0);

	begin
	process(i_clk) --comienza proceso para señal de reloj
	
		begin
		if rising_edge(i_clk) and i_sel='0' then -- si la señal clk esta en el borde positivo y seleccion está en 0
			Registro <= i_A; --Almacenar dato de entrada en PC
		end if;
		if falling_edge(i_clk) and i_sel='0' then -- si la señal clk esta en el borde negativo y seleccion está en 0
			o_B <= Registro; --leer datos de registros
		end if;
		
	end process; --termina proceso para señal de reloj
 
end Behavioral;