library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity MUX_TB is
end MUX_TB;

architecture behavior of MUX_TB is

	component muxV1ChiGaRoV1ChiGaRo 
	Port(
		d0, d1, d2, d3 : in  STD_LOGIC_VECTOR(31 downto 0);
		s:		 in  STD_LOGIC_VECTOR(1 downto 0);
		y:	 	 OUT STD_LOGIC_VECTOR(31 downto 0));	
	end component;
	
	signal d0 : std_logic_vector(31 downto 0) := "00000000000000000000000001111100";
	signal d1 : std_logic_vector(31 downto 0) := "00000000000000000000001111100000";
	signal d2 : std_logic_vector(31 downto 0) := "00000000000000000001111110000000";
	signal d3 : std_logic_vector(31 downto 0) := "00000000000000000111110000000000";
	signal y : std_logic_vector(31 downto  0) := "00000000000000000000000000000000";
   signal s : std_logic_vector(1 downto 0) := "00";
	constant CLK_PERIOD : time := 10 ns;
	
begin
	dut: muxV1ChiGaRoV1ChiGaRo port map (d0, d1, d2, d3, s, y);

	

process begin        
        wait for CLK_PERIOD; --wait for 10 clock cycles.
        s <= "10";   
        assert y = d2 report "10 failed.";
        wait for CLK_PERIOD;
        s <= "11";   
			assert y = d3 report "11 failed.";
        wait for CLK_PERIOD;
        s <= "00";
		  assert y = d0 report "00 failed.";
        wait for CLK_PERIOD;
        s <= "01";
		  assert y = d1 report "01 failed.";
        wait;
  end process;

	 -- after 50 ns, "00" after 150 ns, "10" after 150 ns, "01" after 150 ns; 
	
end;