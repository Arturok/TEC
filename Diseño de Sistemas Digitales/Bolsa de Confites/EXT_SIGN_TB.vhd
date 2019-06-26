library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity EXT_SIGN_TB is
end EXT_SIGN_TB;

architecture behavior of EXT_SIGN_TB is

	component ext_signV1ChiGaRo 
	Port(
		i_A : in  STD_LOGIC_VECTOR (15 downto 0); --Dato entrada de 16b
		i_Result : out STD_LOGIC_VECTOR (31 downto 0)); --Dato salida de 32b

	end component;
	
	signal dato : std_logic_vector(15 downto 0) := "0010000100001001";
	signal resultado : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	constant CLK_PERIOD : time := 10 ns;
	
begin
	dut: ext_signV1ChiGaRo port map (dato, resultado);

process begin        
        dato <= "1110000100001000";   
        assert resultado = "11111111111111111110000100001000"; report "test 1 failed.";
        wait for CLK_PERIOD;
        dato <= "0010000100001011";   
			assert resultado = "00000000000000000010000100001011" report "test 2 failed.";
        wait for CLK_PERIOD;
        dato <= "1110000100001000";
		  assert resultado = "11111111111111111110000100001000" report "test 3 failed.";
        wait for CLK_PERIOD;
        dato <= "0011111110000100";
		  assert resultado = "00000000000000000011111100001000" report "01 failed.";
        wait;
  end process;
end;