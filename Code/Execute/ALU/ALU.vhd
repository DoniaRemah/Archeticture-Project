library IEEE;
use IEEE.std_logic_1164.all;

entity ALU is 
port  (
    alu_enable:in std_logic;
    part_sel: in std_logic_vector (1 downto 0);
    op_sel : in std_logic_vector (2 downto 0);
	first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    branching_res : out std_logic;
	alu_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end ALU;

Architecture ArchALU of ALU is

    component mux2x1 is
        generic (
        DATA_WIDTH : integer := 16
        );
        port (
        -- input data and output data are generic width
        dataIn0, dataIn1 : in std_logic_vector(DATA_WIDTH-1 downto 0);
        -- selector is 1 bit
        selector : in std_logic;
        dataOut : out std_logic_vector(DATA_WIDTH-1 downto 0)
        );
end component;

    component mux4x1 is
        generic (
            DATA_WIDTH : integer := 16
            );
            port (
            -- input data and output data are 16 bits 
            dataIn0, dataIn1,dataIn2,dataIn3 : in std_logic_vector(DATA_WIDTH-1 downto 0);
            -- selector is 1 bit
            selector0, selector1: in std_logic;
            dataOut : out std_logic_vector(DATA_WIDTH -1 downto 0));
    end component;

    component branchingOp is 
port  (

    op_sel : in std_logic_vector (2 downto 0);
	flags : in std_logic_vector (2 downto 0); 
    branching_res : out std_logic;
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

component carryOp is 
port  (

    op_sel : in std_logic_vector (2 downto 0);
	flags : in std_logic_vector (2 downto 0); 
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

component movOp is 
port  (
    op_sel : in std_logic_vector (2 downto 0);
    first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    movOp_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

component aluOp is 
port  (
    op_sel : in std_logic_vector (2 downto 0);
    first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    aluOp_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;

    signal movOp_res_data , aluOp_res_data , final_res_data : std_logic_vector (15 downto 0);
    signal branchingOp_res_flags , carryOp_res_flags , movOp_res_flags , aluOp_res_flags ,  final_res_flags : std_logic_vector (2 downto 0);
    signal branch_cond : std_logic;

begin
    branching : branchingOp PORT MAP ( op_sel , flags , branch_cond , branchingOp_res_flags);
    carry : carryOp PORT MAP ( op_sel , flags ,  carryOp_res_flags);
    mov : movOp PORT MAP ( op_sel , first_src , second_src, flags , movOp_res_data, movOp_res_flags);
    aluoperation : aluOp PORT MAP ( op_sel , first_src , second_src, flags , aluOp_res_data, aluOp_res_flags);

    data_res_mux21 : mux2x1 generic map(16) PORT MAP (movOp_res_data , aluOp_res_data , part_sel(0) , final_res_data);
    flags_res_mux41 : mux4x1 generic map(3) PORT MAP ( branchingOp_res_flags , carryOp_res_flags , movOp_res_flags , aluOp_res_flags , part_sel(1), part_sel(0) ,  final_res_flags);
	
    branching_res <= branch_cond when (part_sel = "00"  and alu_enable = '1') else '0';
    alu_res <= final_res_data when alu_enable = '1' else (others => '0');
    new_flags <= final_res_flags when alu_enable = '1' else flags;

end ArchALU;