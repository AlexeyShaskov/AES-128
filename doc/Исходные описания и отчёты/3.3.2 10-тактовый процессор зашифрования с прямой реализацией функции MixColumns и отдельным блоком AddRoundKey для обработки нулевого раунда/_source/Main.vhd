library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
	port ( CLK : in std_logic;
		    RESET : in  STD_LOGIC;		 			 
			 DATA_WRITE : in  STD_LOGIC;			 
			 INPUT_TEXT  : in std_logic_vector(0 to 127);	   
			 AVAILABLE : out  STD_LOGIC;
			 OUTPUT_TEXT  : out std_logic_vector(0 to 127)			 
			);
end Main;

architecture Main_architecture of Main is

	type state_type is (i_0, i_1, i_2, s_0, s_0_2, s_1);
	signal state, next_state : state_type; 
	
	signal counter: STD_LOGIC_VECTOR (3 downto 0);
	
	component RoundEncryptDecrypt
		port ( ROUND_KEY : in  STD_LOGIC_VECTOR(0 to 127);
				 ROUND_NUMBER : in STD_LOGIC_VECTOR(3 downto 0);
				 INPUT : in STD_LOGIC_VECTOR(0 to 127);
				 FB_INPUT : in STD_LOGIC_VECTOR(0 to 127);
				 INIT_INPUT : in  STD_LOGIC;					 
				 OUTPUT : out  STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
	
	component AddRoundKey
		Port ( input : in  STD_LOGIC_VECTOR(0 to 127);
				 round_key : in  STD_LOGIC_VECTOR(0 to 127);
				 output : out  STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
	
	component KeyScheduleRAM
		port ( CLK : in std_logic;
				 WE  : in std_logic;
				 ADDRESS   : STD_LOGIC_VECTOR (3 downto 0);
				 INPUT  : in std_logic_vector(0 to 127);
				 OUTPUT  : out std_logic_vector(0 to 127)
				);
	end component;
		
	component Reg_128_EN
		port( CLK : in std_logic;
			 EN : in std_logic;
			 D : in std_logic_vector(0 to 127);
			 Q : out std_logic_vector(0 to 127)
			);
	end component;
	
	component MUX_128_2
		port ( IN_0 : in  STD_LOGIC_VECTOR(0 to 127);
				 IN_1 : in  STD_LOGIC_VECTOR(0 to 127);				 
				 SEL : in  STD_LOGIC;							 
				 OUTPUT : out  STD_LOGIC_VECTOR(0 to 127)
				);
	end component;	
	
	component Counter_to_10
		 port ( CLK : in  STD_LOGIC;
				  CLR : in  STD_LOGIC;
				  CE : in STD_LOGIC;
				  Q : out  STD_LOGIC_VECTOR (3 downto 0)
				 );
	end component;
	
	component KeySchedule
		port ( prev_key : in  STD_LOGIC_VECTOR(0 to 127);
				 round_number : in STD_LOGIC_VECTOR (3 downto 0);
				 round_key : out  STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
			
	
	signal enable_output_reg, RESET_reg, reg_DATA_WRITE, tmp_AVAILABLE: STD_LOGIC := '0';
	signal rk_to_re_d, w2, w3: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
	signal input_reg_output, s1, s2, s3: STD_LOGIC_VECTOR(0 to 127) := (others => '0');	
	signal s_rk0, zero_r, zero_r_2: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
	signal en_zero_key_reg: STD_LOGIC := '0';
	
	signal control_enable_reg: STD_LOGIC := '0';	
	signal control_start_counter: STD_LOGIC := '0';
	signal control_write_zero_key: STD_LOGIC := '0';
	signal control_write_ram: STD_LOGIC := '0';
	signal control_initialized: STD_LOGIC := '0';
	signal control_input: STD_LOGIC := '0';
	signal control_data_available: STD_LOGIC := '0';	

begin

	RES: process(CLK)
	begin		
			if (CLK'event and CLK = '1') then

					RESET_reg <= RESET;
					
			end if;	
		
	end process;

	D_W: process(CLK)
	begin		
			if (CLK'event and CLK = '1') then

					reg_DATA_WRITE <= DATA_WRITE;
					
			end if;	
		
	end process;

	DATA_IN: process(CLK)
	begin		
			if (CLK'event and CLK = '1') then

					input_reg_output <= INPUT_TEXT;
					
			end if;	
		
	end process;
	
	
	tmp_AVAIL: process(CLK)
	begin		
			if (CLK'event and CLK = '1') then

					tmp_AVAILABLE <= control_data_available;

			end if;	
		
	end process;


	AVAIL: process(CLK)
	begin		
			if (CLK'event and CLK = '1') then

					AVAILABLE <= tmp_AVAILABLE;
					
			end if;	
		
	end process;


	enable_output_reg <= tmp_AVAILABLE;

	output_reg: Reg_128_EN port map (
	
					CLK => CLK,
					EN => enable_output_reg,
					D => w3,					
					Q => OUTPUT_TEXT	
				);
	
	main1: KeyScheduleRAM port map (
	
					CLK => CLK,
					WE => control_write_ram,
					ADDRESS => counter, 
					INPUT => s2,
					OUTPUT => rk_to_re_d	
				);

	main_2_0:	AddRoundKey port map (
		input => input_reg_output,
		round_key => s_rk0,
		output => zero_r
	);

	main_2_1: Reg_128_EN port map (
	
					CLK => CLK,
					EN => '1',
					D => zero_r,					
					Q => zero_r_2	
				);

	main_2_2: RoundEncryptDecrypt port map (
	
					ROUND_KEY => rk_to_re_d,
					ROUND_NUMBER => counter,
					INPUT => zero_r_2,
					FB_INPUT => w3,
					INIT_INPUT => control_input,						 
					OUTPUT => w2	
				);
				
	main3: Reg_128_EN port map (
	
					CLK => CLK,
					EN => control_initialized,
					D => w2,					
					Q => w3	
				);
			
	main4: Counter_to_10 port map (

				 CLK => CLK,
				 CLR => RESET_reg,
				 CE => control_start_counter,
				 Q => counter
			);
			
			
	wrk0: KeySchedule port map (
	
				prev_key => s3,
				round_number => counter,
				round_key => s2
			);
		
				
	wrk1: MUX_128_2 port map (

				 IN_0 => s1,
				 IN_1 => input_reg_output,				 
				 SEL => control_write_zero_key,							 
				 OUTPUT => s3
			);
			
			
	wrk2: Reg_128_EN port map (
	
				CLK => CLK,
				EN => control_enable_reg,
				D => s2,
				Q => s1
			);


	wrk3: Reg_128_EN port map (
	
				CLK => CLK,
				EN => en_zero_key_reg,
				D => input_reg_output,
				Q => s_rk0
			);
		
	
	en_zero_key_reg <= control_write_zero_key;	
			
	
	FSM: process (state, reg_DATA_WRITE, counter)
	begin		

			control_enable_reg <= '0';
			control_start_counter <= '0';
			control_write_zero_key <= '0';
			control_write_ram <= '0';
			control_initialized <= '0';
			control_input <= '0';
			control_data_available <= '0';
		
			case (state) is
			
				when i_0 =>
					
						if reg_DATA_WRITE = '1' then
								
								next_state <= i_1;
							
						else						
								next_state <= i_0;
						
						end if;
					

				when i_1 =>
					
						control_enable_reg <= '1';	
						control_write_zero_key <= '1';						
						
						control_write_ram <= '1';
						control_start_counter <= '1';

						next_state <= i_2;
						

				when i_2 =>
					
						control_write_ram <= '1';
						control_start_counter <= '1';
																			
						if counter = "1001" then
							
								control_data_available <= '1';
								
								next_state <= s_0;				
							
						else
								control_enable_reg <= '1';					
								next_state <= i_2;
							
						end if;

					
				when s_0 =>

							if reg_DATA_WRITE = '1' then
									
									next_state <= s_0_2;
								
							else							
									
									next_state <= s_0;
									
							end if;
							

				when s_0_2 =>
									
							control_initialized <= '1';		

							control_input <= '1';
							control_start_counter <= '1';
									
							next_state <= s_1;

				when s_1 =>
							
							control_initialized <= '1';
							control_start_counter <= '1';
								
							if counter = "1001" then		
							
									control_data_available <= '1';
									
									if reg_DATA_WRITE = '1' then
									
											next_state <= s_0_2;
											
									else
											next_state <= s_0;
											
									end if;
									
							else
							
									next_state <= s_1;
									
							end if;
							
			end case;
		
	end process;


	SYNC_FSM: process(CLK)
	begin		
			if rising_edge(CLK) then
			
					if RESET_reg = '1' then	
					
							state <= i_0;				
					
					else						
							state <= next_state;	
							
					end if;
					
			end if;
			
	end process;
	

end Main_architecture;