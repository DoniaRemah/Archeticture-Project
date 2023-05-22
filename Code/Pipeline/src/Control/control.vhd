LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity Control_Unit is
    Port (opcode : in std_logic_vector(5 downto 0);
        load_INS:out std_logic;
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
          wb_data_selector : out std_logic;
          wb_flag_selector : out std_logic;
          in_port_data_selector: out std_logic;
          reg_file_enable : out std_logic;
          flag_enable : out std_logic;
          propagated_ret_rti : out std_logic;
          current_ret_rti : out std_logic;
          outport_ins : out std_logic
          );
end Control_Unit;

architecture Behavioral of Control_Unit is

begin
    alu_enable <= '0' when opcode = "111001" else not opcode(5);
    branch_enable <= '0' when opcode = "111001" else not (opcode(5) or opcode(4) or opcode(3));
    part_selector <= opcode(4 downto 3);
    op_selector <= opcode(2 downto 0);
    call_operation <= '0' when opcode = "111001" else '1' when opcode = "111000" else '0';
    read_addr_selector <= '0' when opcode = "111001" else (opcode(5) and opcode(4));
    write_addr_selector <= '0' when opcode = "111001" else (opcode(5) and opcode(4));
    data_written_selector <= '0' when opcode = "111001" else opcode(0);
    mem_op <= '0' when opcode = "111001" else (opcode(5) and (opcode(4) or opcode(3)));
    mem_read <= '0' when opcode = "111001" else ((opcode(5) xnor opcode(4) xnor opcode(3) xnor opcode(2) xnor opcode(1) xnor opcode(0)));
    mem_write<= '0' when opcode = "111001" else ((opcode(5) xor opcode(4) xor opcode(3) xor opcode(2) xor opcode(1) xor opcode(0)));
    data_bus_selector <= '0' when opcode = "111001" else (opcode(5) and opcode(4) and opcode(3) and opcode(2) and opcode(1) and opcode(0));
    wb_data_selector <= '0' when opcode = "111001" else opcode(5);
    wb_flag_selector <= '0' when opcode = "111001" else opcode(5);
    in_port_data_selector<='1' when (opcode="100001") else '0';
    reg_file_enable <= '1' when (opcode(5 downto 3) = "010" or opcode(5 downto 3) = "011" or opcode = "100001" or opcode = "101000" or opcode = "110000") else '0';
    flag_enable <= '1' when (opcode = "000000" or opcode = "000001" or opcode = "111111" or opcode(5 downto 3) = "011" or opcode(5 downto 3) = "001") else '0';
    propagated_ret_rti <= '0' when (opcode = "111001" or opcode="111110") else (opcode(5) and opcode(4) and  opcode(3) and opcode(2));
    current_ret_rti <= '1' when opcode = "111001" else '0' when opcode="111110" else (opcode(5) and opcode(4) and  opcode(3) and opcode(2));
    outport_ins <= '1' when opcode = "100010" else '0';
    load_INS <= '1' when opcode="110000" or opcode="101000" else '0';
end Behavioral;