library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity desplazamiento_izq_V1ChiGaRo is
Port (i_A : in  STD_LOGIC_VECTOR (31 downto 0);  --Dato entrada de 16b
		i_desp : in  INTEGER; --Cantidad e desplazamiento
		o_result : out  STD_LOGIC_VECTOR (31 downto 0)); --Dato alineado de 18b
end desplazamiento_izq_V1ChiGaRo ;

architecture Behavioral of desplazamiento_izq_V1ChiGaRo is
	
	signal tmp: unsigned(31 downto 0);
	
	begin
		tmp(31 downto 0) <= unsigned(i_A(31 downto 0)); --Copiar del bit 0 al 15
		o_result <= STD_LOGIC_VECTOR(tmp sll i_desp);
		
	
end Behavioral;