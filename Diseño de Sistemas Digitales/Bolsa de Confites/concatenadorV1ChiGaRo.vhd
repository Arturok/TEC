library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity concatenadorV1ChiGaRo is
Port (i_A : in  STD_LOGIC_VECTOR (27 downto 0);  --Dato entrada de 28b
		i_PC : in  STD_LOGIC_VECTOR (31 downto 0); --Dato PC de 32b
		o_result : out STD_LOGIC_VECTOR (31 downto 0)); --Dato salida de 32b
end concatenadorV1ChiGaRo;

architecture Behavioral of concatenadorV1ChiGaRo is

	signal tmp: STD_LOGIC_VECTOR (31 downto 0);  --Asignar arreglo tamporal para la concatenacion de los datos
	
	begin
	process(i_A)
		begin	
		tmp(27 downto 0)<=i_A(27 downto 0); --Copiar del bit 0 al 27 de i_A
		
		for a in 28 to 31 LOOP
			tmp(a)<=i_PC(a); --Realiza la concatenacion de los 4 bits mas significativos de PC
		end loop;
		
		o_result<=tmp; --Copia datos a puerto de salida
		
	end process;
	
end Behavioral;