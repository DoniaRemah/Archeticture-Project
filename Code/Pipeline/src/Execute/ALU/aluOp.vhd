library IEEE;
use IEEE.std_logic_1164.all;

entity aluOp is 
port  (
    op_sel : in std_logic_vector (2 downto 0);
    first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    aluOp_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end aluOp;

Architecture ArchaluOp of aluOp is

    signal inc_res_data , and_res_data :  std_logic_vector (15 downto 0);
    signal inc_res_flags , and_res_flags :  std_logic_vector (2 downto 0);

COMPONENT inc is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    inc_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

component andOp is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    second_src : in std_logic_vector (15 downto 0); 
    flags : in std_logic_vector (2 downto 0);
    and_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

begin

    incop : inc PORT MAP ( first_src , inc_res_data , inc_res_flags );
    anding : andOp PORT MAP ( first_src , second_src, flags , and_res_data , and_res_flags );
    aluOp_res <= inc_res_data when op_sel = "001" else and_res_data;
    new_flags <= inc_res_flags when op_sel = "001" else and_res_flags;

end ArchaluOp;