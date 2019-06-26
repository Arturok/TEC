library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity MemoriaRam_TB is
end MemoriaRam_TB;

architecture behavior of MemoriaRam_TB is


	component MemoriaRam 
	Port(
		clk,
			writeE : in STD_LOGIC;
			busDir : in STD_LOGIC_VECTOR(31 downto 0);
			busIn : in STD_LOGIC_VECTOR(31 downto 0);
			busOut : out STD_LOGIC_VECTOR(31 downto 0));	
	
	end component;
	
	signal clk : std_logic := '0';
	signal writeE : std_logic := '0';
	signal busDir : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
   signal busIn : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal busOut : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";	
	
	begin
	dut: MemoriaRam port map (
		clk => clk,
		writeE => writeE,
		busDir => busDir,
		busIn => busIn,
		busOut => busOut 
	);
	
	stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		writeE <= '1';
		busDir <= "00000000000000000000000000000111";
		busIn <= "00000000000000000000000000001111";
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		
		
		busDir <= "00000000000000000000000000000000";
		busIn <= "00000000000000000000000000001001";
		wait for 5 ns;	
		clk <= '1';
		
		
		clk <= '0';
		writeE <= '0';
		busDir <= "00000000000000000000000000000111";
		wait for 5 ns;
		clk<= '1';
		wait for 5 ns;
		
		clk <= '0';
		busDir <= "00000000000000000000000000000000";
		wait for 5 ns;
		clk<= '1';	
		
		
		
   end process;
	
	
	--busDir <= "00000000000000000000000000000000";
	--	datosEntrada <= "11111111111111111111111111111111";
--	clock <= '1' after 50 ns, '0' after 150; 
--	writeE <= '1' after 40 ns, '0' after 140 ns;
--	busDir <= "00000000000000000000000000000000" after 100 ns;
--	datosEntrada <= "11111111111111111111111111111111" after 100 ns, "00000111111111000001111111100000" after 100 ns;
	
end;
	