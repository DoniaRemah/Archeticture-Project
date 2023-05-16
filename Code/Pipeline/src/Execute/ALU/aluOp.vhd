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

    signal not_res_data , inc_res_data , dec_res_data , and_res_data , or_res_data, sub_add_addi_res_data  , final_res_data :  std_logic_vector (15 downto 0);
    signal not_res_flags , inc_res_flags , dec_res_flags ,and_res_flags ,or_res_flags , sub_add_addi_flags  , final_res_flags:  std_logic_vector (2 downto 0);

COMPONENT alumux8x1 is
    generic (
        DATA_WIDTH : integer := 16
        );
        port (
        -- input data and output data are 16 bits 
        dataIn0, dataIn1,dataIn2,dataIn3,dataIn4, dataIn5,dataIn6,dataIn7 : in std_logic_vector(DATA_WIDTH-1 downto 0);
        -- selector is 1 bit
        selector2,selector1, selector0: in std_logic;
        dataOut : out std_logic_vector(DATA_WIDTH -1 downto 0));
end COMPONENT;


component notOp is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    flags : in std_logic_vector (2 downto 0);
    not_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

COMPONENT inc is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    inc_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

component decOp is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    dec_res : out std_logic_vector (15 downto 0);
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

component orOp is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    second_src : in std_logic_vector (15 downto 0); 
    flags : in std_logic_vector (2 downto 0);
    or_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

component add_sub is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    second_src : in std_logic_vector (15 downto 0); 
    flags : in std_logic_vector (2 downto 0);
    add_sub_sel:in std_logic;
    add_sub_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

begin

    nott: notOp PORT MAP ( first_src , flags , not_res_data , not_res_flags );
    incop : inc PORT MAP ( first_src , inc_res_data , inc_res_flags );
    dec : decOp PORT MAP ( first_src , dec_res_data , dec_res_flags );
    anding : andOp PORT MAP ( first_src , second_src, flags , and_res_data , and_res_flags );
    oring : orOp PORT MAP ( first_src , second_src, flags , or_res_data , or_res_flags );
    adder_sub: add_sub PORT MAP ( first_src , second_src, flags ,op_sel(1) ,sub_add_addi_res_data , sub_add_addi_flags );


    data_res_mux81 : alumux8x1 generic map(16) PORT MAP (not_res_data , inc_res_data , dec_res_data , and_res_data , or_res_data, sub_add_addi_res_data , sub_add_addi_res_data , sub_add_addi_res_data , op_sel(2) , op_sel(1) , op_sel(0) ,final_res_data);
    flags_res_mux81 : alumux8x1 generic map(3) PORT MAP ( not_res_flags , inc_res_flags , dec_res_flags ,and_res_flags ,or_res_flags , sub_add_addi_flags ,sub_add_addi_flags ,sub_add_addi_flags , op_sel(2) , op_sel(1) , op_sel(0) ,  final_res_flags);
    aluOp_res <= final_res_data;
    new_flags <= final_res_flags;

end ArchaluOp;