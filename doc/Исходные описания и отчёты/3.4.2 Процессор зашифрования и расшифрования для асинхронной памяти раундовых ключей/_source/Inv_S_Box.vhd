library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inv_S_Box is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
end Inv_S_Box;

architecture Inv_S_Box_architecture of Inv_S_Box is

begin

	substitute: process(input)	
	begin
	
		case input is

			when X"00" => output <= X"52";
			when X"01" => output <= X"09";
			when X"02" => output <= X"6A";
			when X"03" => output <= X"D5";
			when X"04" => output <= X"30";
			when X"05" => output <= X"36";
			when X"06" => output <= X"A5";
			when X"07" => output <= X"38";
			when X"08" => output <= X"BF";
			when X"09" => output <= X"40";
			when X"0A" => output <= X"A3";
			when X"0B" => output <= X"9E";
			when X"0C" => output <= X"81";
			when X"0D" => output <= X"F3";
			when X"0E" => output <= X"D7";
			when X"0F" => output <= X"FB";
			when X"10" => output <= X"7C";
			when X"11" => output <= X"E3";
			when X"12" => output <= X"39";
			when X"13" => output <= X"82";
			when X"14" => output <= X"9B";
			when X"15" => output <= X"2F";
			when X"16" => output <= X"FF";
			when X"17" => output <= X"87";
			when X"18" => output <= X"34";
			when X"19" => output <= X"8E";
			when X"1A" => output <= X"43";
			when X"1B" => output <= X"44";
			when X"1C" => output <= X"C4";
			when X"1D" => output <= X"DE";
			when X"1E" => output <= X"E9";
			when X"1F" => output <= X"CB";
			when X"20" => output <= X"54";
			when X"21" => output <= X"7B";
			when X"22" => output <= X"94";
			when X"23" => output <= X"32";
			when X"24" => output <= X"A6";
			when X"25" => output <= X"C2";
			when X"26" => output <= X"23";
			when X"27" => output <= X"3D";
			when X"28" => output <= X"EE";
			when X"29" => output <= X"4C";
			when X"2A" => output <= X"95";
			when X"2B" => output <= X"0B";
			when X"2C" => output <= X"42";
			when X"2D" => output <= X"FA";
			when X"2E" => output <= X"C3";
			when X"2F" => output <= X"4E";
			when X"30" => output <= X"08";
			when X"31" => output <= X"2E";
			when X"32" => output <= X"A1";
			when X"33" => output <= X"66";
			when X"34" => output <= X"28";
			when X"35" => output <= X"D9";
			when X"36" => output <= X"24";
			when X"37" => output <= X"B2";
			when X"38" => output <= X"76";
			when X"39" => output <= X"5B";
			when X"3A" => output <= X"A2";
			when X"3B" => output <= X"49";
			when X"3C" => output <= X"6D";
			when X"3D" => output <= X"8B";
			when X"3E" => output <= X"D1";
			when X"3F" => output <= X"25";
			when X"40" => output <= X"72";
			when X"41" => output <= X"F8";
			when X"42" => output <= X"F6";
			when X"43" => output <= X"64";
			when X"44" => output <= X"86";
			when X"45" => output <= X"68";
			when X"46" => output <= X"98";
			when X"47" => output <= X"16";
			when X"48" => output <= X"D4";
			when X"49" => output <= X"A4";
			when X"4A" => output <= X"5C";
			when X"4B" => output <= X"CC";
			when X"4C" => output <= X"5D";
			when X"4D" => output <= X"65";
			when X"4E" => output <= X"B6";
			when X"4F" => output <= X"92";
			when X"50" => output <= X"6C";
			when X"51" => output <= X"70";
			when X"52" => output <= X"48";
			when X"53" => output <= X"50";
			when X"54" => output <= X"FD";
			when X"55" => output <= X"ED";
			when X"56" => output <= X"B9";
			when X"57" => output <= X"DA";
			when X"58" => output <= X"5E";
			when X"59" => output <= X"15";
			when X"5A" => output <= X"46";
			when X"5B" => output <= X"57";
			when X"5C" => output <= X"A7";
			when X"5D" => output <= X"8D";
			when X"5E" => output <= X"9D";
			when X"5F" => output <= X"84";
			when X"60" => output <= X"90";
			when X"61" => output <= X"D8";
			when X"62" => output <= X"AB";
			when X"63" => output <= X"00";
			when X"64" => output <= X"8C";
			when X"65" => output <= X"BC";
			when X"66" => output <= X"D3";
			when X"67" => output <= X"0A";
			when X"68" => output <= X"F7";
			when X"69" => output <= X"E4";
			when X"6A" => output <= X"58";
			when X"6B" => output <= X"05";
			when X"6C" => output <= X"B8";
			when X"6D" => output <= X"B3";
			when X"6E" => output <= X"45";
			when X"6F" => output <= X"06";
			when X"70" => output <= X"D0";
			when X"71" => output <= X"2C";
			when X"72" => output <= X"1E";
			when X"73" => output <= X"8F";
			when X"74" => output <= X"CA";
			when X"75" => output <= X"3F";
			when X"76" => output <= X"0F";
			when X"77" => output <= X"02";
			when X"78" => output <= X"C1";
			when X"79" => output <= X"AF";
			when X"7A" => output <= X"BD";
			when X"7B" => output <= X"03";
			when X"7C" => output <= X"01";
			when X"7D" => output <= X"13";
			when X"7E" => output <= X"8A";
			when X"7F" => output <= X"6B";
			when X"80" => output <= X"3A";
			when X"81" => output <= X"91";
			when X"82" => output <= X"11";
			when X"83" => output <= X"41";
			when X"84" => output <= X"4F";
			when X"85" => output <= X"67";
			when X"86" => output <= X"DC";
			when X"87" => output <= X"EA";
			when X"88" => output <= X"97";
			when X"89" => output <= X"F2";
			when X"8A" => output <= X"CF";
			when X"8B" => output <= X"CE";
			when X"8C" => output <= X"F0";
			when X"8D" => output <= X"B4";
			when X"8E" => output <= X"E6";
			when X"8F" => output <= X"73";
			when X"90" => output <= X"96";
			when X"91" => output <= X"AC";
			when X"92" => output <= X"74";
			when X"93" => output <= X"22";
			when X"94" => output <= X"E7";
			when X"95" => output <= X"AD";
			when X"96" => output <= X"35";
			when X"97" => output <= X"85";
			when X"98" => output <= X"E2";
			when X"99" => output <= X"F9";
			when X"9A" => output <= X"37";
			when X"9B" => output <= X"E8";
			when X"9C" => output <= X"1C";
			when X"9D" => output <= X"75";
			when X"9E" => output <= X"DF";
			when X"9F" => output <= X"6E";
			when X"A0" => output <= X"47";
			when X"A1" => output <= X"F1";
			when X"A2" => output <= X"1A";
			when X"A3" => output <= X"71";
			when X"A4" => output <= X"1D";
			when X"A5" => output <= X"29";
			when X"A6" => output <= X"C5";
			when X"A7" => output <= X"89";
			when X"A8" => output <= X"6F";
			when X"A9" => output <= X"B7";
			when X"AA" => output <= X"62";
			when X"AB" => output <= X"0E";
			when X"AC" => output <= X"AA";
			when X"AD" => output <= X"18";
			when X"AE" => output <= X"BE";
			when X"AF" => output <= X"1B";
			when X"B0" => output <= X"FC";
			when X"B1" => output <= X"56";
			when X"B2" => output <= X"3E";
			when X"B3" => output <= X"4B";
			when X"B4" => output <= X"C6";
			when X"B5" => output <= X"D2";
			when X"B6" => output <= X"79";
			when X"B7" => output <= X"20";
			when X"B8" => output <= X"9A";
			when X"B9" => output <= X"DB";
			when X"BA" => output <= X"C0";
			when X"BB" => output <= X"FE";
			when X"BC" => output <= X"78";
			when X"BD" => output <= X"CD";
			when X"BE" => output <= X"5A";
			when X"BF" => output <= X"F4";
			when X"C0" => output <= X"1F";
			when X"C1" => output <= X"DD";
			when X"C2" => output <= X"A8";
			when X"C3" => output <= X"33";
			when X"C4" => output <= X"88";
			when X"C5" => output <= X"07";
			when X"C6" => output <= X"C7";
			when X"C7" => output <= X"31";
			when X"C8" => output <= X"B1";
			when X"C9" => output <= X"12";
			when X"CA" => output <= X"10";
			when X"CB" => output <= X"59";
			when X"CC" => output <= X"27";
			when X"CD" => output <= X"80";
			when X"CE" => output <= X"EC";
			when X"CF" => output <= X"5F";
			when X"D0" => output <= X"60";
			when X"D1" => output <= X"51";
			when X"D2" => output <= X"7F";
			when X"D3" => output <= X"A9";
			when X"D4" => output <= X"19";
			when X"D5" => output <= X"B5";
			when X"D6" => output <= X"4A";
			when X"D7" => output <= X"0D";
			when X"D8" => output <= X"2D";
			when X"D9" => output <= X"E5";
			when X"DA" => output <= X"7A";
			when X"DB" => output <= X"9F";
			when X"DC" => output <= X"93";
			when X"DD" => output <= X"C9";
			when X"DE" => output <= X"9C";
			when X"DF" => output <= X"EF";
			when X"E0" => output <= X"A0";
			when X"E1" => output <= X"E0";
			when X"E2" => output <= X"3B";
			when X"E3" => output <= X"4D";
			when X"E4" => output <= X"AE";
			when X"E5" => output <= X"2A";
			when X"E6" => output <= X"F5";
			when X"E7" => output <= X"B0";
			when X"E8" => output <= X"C8";
			when X"E9" => output <= X"EB";
			when X"EA" => output <= X"BB";
			when X"EB" => output <= X"3C";
			when X"EC" => output <= X"83";
			when X"ED" => output <= X"53";
			when X"EE" => output <= X"99";
			when X"EF" => output <= X"61";
			when X"F0" => output <= X"17";
			when X"F1" => output <= X"2B";
			when X"F2" => output <= X"04";
			when X"F3" => output <= X"7E";
			when X"F4" => output <= X"BA";
			when X"F5" => output <= X"77";
			when X"F6" => output <= X"D6";
			when X"F7" => output <= X"26";
			when X"F8" => output <= X"E1";
			when X"F9" => output <= X"69";
			when X"FA" => output <= X"14";
			when X"FB" => output <= X"63";
			when X"FC" => output <= X"55";
			when X"FD" => output <= X"21";
			when X"FE" => output <= X"0C";
			when X"FF" => output <= X"7D";
			
			when others => null;
			
		end case;
		
	end process;

end Inv_S_Box_architecture;