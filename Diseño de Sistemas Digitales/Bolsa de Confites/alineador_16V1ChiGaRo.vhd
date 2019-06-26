library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alineador_16V1ChiGaRo is
Port (i_A : in  STD_LOGIC_VECTOR (15 downto 0);  --Dato entrada de 16b
		i_result : out  STD_LOGIC_VECTOR (17 downto 0)); --Dato alineado de 18b
end alineador_16V1ChiGaRo;

architecture Behavioral of alineador_16V1ChiGaRo is

	signal tmp: unsigned(17 downto 0);
	
	
	begin
		tmp(15 downto 0) <= unsigned(i_A(15 downto 0)); --Copiar del bit 0 al 15
		i_result <= STD_LOGIC_VECTOR(tmp sll 2);
		
	
end Behavioral;