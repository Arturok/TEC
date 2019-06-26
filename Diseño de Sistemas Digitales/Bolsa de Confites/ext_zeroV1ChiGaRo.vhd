library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ext_zeroV1ChiGaRo is
Port (i_A : in  STD_LOGIC_VECTOR (15 downto 0); --Dato entrada de 16b
		i_Result : out STD_LOGIC_VECTOR (31 downto 0)); --Dato salida de 32b
end ext_zeroV1ChiGaRo;

architecture Behavioral of ext_zeroV1ChiGaRo is

	
	signal tmp: STD_LOGIC_VECTOR (31 downto 0);  --Asignar arreglo tamporal para la concatenacion de los datos
	
	begin
	process(i_A)
	
		begin	
		tmp(15 downto 0)<=i_A(15 downto 0); --Copiar del bit 0 al 15
		
		for a in 16 to 31 LOOP
			tmp(a)<='0'; --Realiza la extension de un cero
		end loop;
		
		i_Result<=tmp; --Copia datos a puerto de salida
		
	end process;

end Behavioral;