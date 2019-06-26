library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Banco_RegV1ChiGaRo is
Port ( i_clk : in  STD_LOGIC; -- Señal de reloj
       i_reg_RD : in  STD_LOGIC; -- Control Lectura
       i_D : in  STD_LOGIC_VECTOR (31 downto 0); -- Dato de escritura D
       o_X : out  STD_LOGIC_VECTOR (31 downto 0); -- Dato de salida X
       o_Y : out  STD_LOGIC_VECTOR (31 downto 0); -- Dato de salida Y
       i_A : in  STD_LOGIC_VECTOR (4 downto 0); -- Direccion A
       i_B : in  STD_LOGIC_VECTOR (4 downto 0); -- Direccion B
       i_C : in  STD_LOGIC_VECTOR (4 downto 0); -- Direccion C
       i_reg_WR : in  STD_LOGIC); -- Control escritura
end Banco_RegV1ChiGaRo;
 
architecture Behavioral of Banco_RegV1ChiGaRo is

	type store_t is array (0 to 31) of std_logic_vector(31 downto 0);
	signal regs: store_t := (others => X"00000000");

	begin
	process(i_clk)
	
		begin
		if rising_edge(i_clk) and i_reg_RD='0' then
			o_X <= regs(to_integer(unsigned(i_A)));
			o_Y <= regs(to_integer(unsigned(i_B)));
		end if;
		if falling_edge(i_clk) and i_reg_WR='0' then
			regs(to_integer(unsigned(i_C))) <= i_D;
		end if;
		
	end process;
 
end Behavioral;