LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity Control_Unit is
    Port (opcode : in std_logic_vector(5 downto 0);
          alu_enable : out std_logic;
          branch_enable : out std_logic;
          part_selector : out std_logic_vector(1 downto 0);
          op_selector : out std_logic_vector(2 downto 0);
          call_operation : out std_logic;
          read_addr_selector : out std_logic;
          write_addr_selector : out std_logic;
          data_written_selector : out std_logic;
          mem_op : out std_logic;
          mem_read : out std_logic;
          mem_write :out std_logic;
          data_bus_selector : out std_logic;
          data_selector : out std_logic;
          flag_selector : out std_logic;
          in_data_selector: out std_logic;
          reg_file_enable : out std_logic;
          flag_enable : out std_logic);
end Control_Unit;

architecture Behavioral of Control_Unit is
begin
    alu_enable <= not opcode(5);
    branch_enable <= not (opcode(5) or opcode(4) or opcode(3));
    part_selector <= opcode(4 downto 3);
    op_selector <= opcode(2 downto 0);
    call_operation <= '1' when opcode = "111111" else '0';
    read_addr_selector <= (opcode(5) and opcode(4));
    write_addr_selector <= (opcode(5) and opcode(4));
    data_written_selector <= opcode(0);
    mem_op <= (opcode(5) and (opcode(4) or  opcode(3)));
    mem_read <=((opcode(5) xnor opcode(4) xnor opcode(3) xnor opcode(2) xnor opcode(1) xnor opcode(0)) and mem_op);
    mem_write<=((opcode(5) xor opcode(4) xor opcode(3) xor opcode(2) xor opcode(1) xor opcode(0)) and mem_op);
    data_bus_selector <= opcode(5) and opcode(4) and opcode(3) and opcode(2) and opcode(1) and opcode(0);
    data_selector <= opcode(5);
    flag_selector <= opcode(5);
    in_data_selector<= 1 when (opcode="100001");
    reg_file_enable <= 1 when (opcode(5 downto 3) = "010" or opcode(5 downto 3) = "011" or opcode = "100001");
    flag_enable <= 1 when (opcode = "000000" or opcode = "000001" or opcode(5 downto 3) = "011");
end Behavioral;