library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ADDER_TB is
end ADDER_TB;

architecture behavior of ADDER_TB is

	component AdderV1ChiGaRo 
	Port(a, b, cin: in STD_LOGIC; --Dato entrada de 16b
			s, cout: out STD_LOGIC); --Dato salida de 32b

	end component;
	
	signal datoA : std_logic := '0';
	signal datoB : std_logic := '0';
	signal cin : std_logic:= '0';
	signal resultado : std_logic:= '0';
	signal cout : std_logic:= '0';
	constant CLK_PERIOD : time := 10 ns;
	
begin
	dut: AdderV1ChiGaRo port map (datoA, datoB, cin, resultado, cout);

process begin        
        
		  datoA <= '0';
		  datoB <= '0';
		  cin <= '0';
		  assert resultado <= '0'; report "test 1 failed.";
		  assert cout <= '0'; report "test 1 failed.";        
        wait for CLK_PERIOD;
		  
		  datoA <= '1';
		  datoB <= '0';
		  cin <= '0';
		  assert resultado <= '1'; report "test 1 failed.";
		  assert cout <= '0'; report "test 1 failed.";        
        wait for CLK_PERIOD;
		  
		  datoA <= '1';
		  datoB <= '1';
		  cin <= '0';
		  assert resultado <= '0'; report "test 1 failed.";
		  assert cout <= '1'; report "test 1 failed.";        
        wait for CLK_PERIOD;
		  
		  datoA <= '1';
		  datoB <= '1';
		  cin <= '1';
		  assert resultado <= '1'; report "test 1 failed.";
		  assert cout <= '1'; report "test 1 failed.";        
        wait for CLK_PERIOD;
		  
		  datoA <= '0';
		  datoB <= '1';
		  cin <= '1';
		  assert resultado <= '0'; report "test 1 failed.";
		  assert cout <= '0'; report "test 1 failed.";        
        wait;
  end process;
end;