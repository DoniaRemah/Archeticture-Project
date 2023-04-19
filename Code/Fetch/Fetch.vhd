LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- entity for dataIn0 4*1 mux
entity Fetch is
        port (

            clk,rst: in std_logic;

            -- Anomalous Address (Input)
            Jumped_call_address,  -- From Branching/ Call
            Memory_returned_address : in std_logic_vector(15 downto 0); -- From ret/rti

            -- Return and RTI signals (Input)
            propagated_ret_rti,
            current_ret_rti, 

            -- Branch and call signals (Input) 
            Branching_sig,
            Call_sig ,

            -- Hazard Detected Signal (Input) 
            Hazard_sig : in std_logic
            
        );
end Fetch;


-- architecture for the 4*1 mux
architecture Fetch_arch of Fetch is
begin
        process ()
        variable selector:std_logic_vector(1 downto 0);
        begin
                
        end process;
end Fetch_arch;

