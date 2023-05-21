library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--AQUI
--AQUI

entity ula is
    Port ( op_ula : in inst_tipo;
           op1 : in bus32;
           op2 : in bus32;
           resultado : out bus32;
           zero : out STD_LOGIC);
end ula;

architecture Behavioral of ula is
    signal sel_ula : bus32;
begin

	resultado <= sel_ula;
    	sel_ula <=
       		op1 - op2 	when	op_ula=SUBU		 else
		op1 and op2	when	op_ula=AAND		 else
		op1 or op2	when  	op_ula=OOR or op_ula=ORI else
		op1 xor op2	when 	op_ula=XXOR		 else
		op1 nor op2 	when	op_ula=NNOR		 else
		op1 + op2;	-- soma como operacao padrao
	zero <= '1' when sel_ula=x"00000000" else '0';

end Behavioral;
