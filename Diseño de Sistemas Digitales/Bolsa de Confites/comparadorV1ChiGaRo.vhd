library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparadorV1ChiGaRo is
Port (i_A : in  STD_LOGIC_VECTOR (31 downto 0); --Dato entrada de 32b
		i_B : in  STD_LOGIC_VECTOR (31 downto 0); --Dato entrada de 32b
		i_r : out STD_LOGIC_VECTOR (31 downto 0)); --Dato salida de 1b --1:Iguales, 0:Diferentes
end comparadorV1ChiGaRo;

architecture Behavioral of comparadorV1ChiGaRo is
	
	begin
		i_r <= "00000000000000000000000000000001" when (i_A=i_B) else "00000000000000000000000000000000";

end Behavioral;