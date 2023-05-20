library IEEE;
use IEEE.std_logic_1164.all;

entity movOp is 
port  (
    op_sel : in std_logic_vector (2 downto 0);
    first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    movOp_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end movOp;

Architecture ArchmovOp of movOp is

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

signal final_res_data : std_logic_vector (15 downto 0);

begin

    resmux21: mux2x1 generic map(16) PORT MAP (first_src  , second_src , op_sel(0) , final_res_data);
    movOp_res <= final_res_data;
    new_flags <= flags;

end ArchmovOp;