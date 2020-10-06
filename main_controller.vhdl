library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity main_controller is
    port ( selector, input_bit : in std_logic; 
        out0, out1, carry_out : out std_logic        
    );
end main_controller;

architecture structure of main_controller is
    --signals for the output/input
    signal k0, k1, c_out: std_logic;
    signal sel : unsigned (2 downto 0);
    signal inp : unsigned (3 downto 0);
    signal i0,i1,j0,j1 : std_logic;
    --Component declaration for the ALU operations
    component alu is
        port ( selector: in unsigned (2 downto 0); i0,i1,j0,j1 : in std_logic; 
            k0, k1, c_out : out std_logic        
    );
    end component;
    -- Run component operations
    begin
        uStart: alu port map (sel, i0, i1, j0, j1, k0, k1, c_out);
        
    process
        --variables for test bench
        variable error_count : integer :=0;
        variable test_in : unsigned (2 downto 0);
        variable inp1: unsigned (3 downto 0);
        variable output : std_logic;

    begin 
        --test bench vales and input
        test_in := "000";
        inp1 := "1011";
        i0 <= inp1(3);
        i1 <= inp1(2);
        j0 <= inp1(1);
        j1 <= inp1(0);
        
        -- iterate from '000' to '111' and store it in sel
        for count in 0 to 7 loop
            sel <= test_in;
            wait for 1 ns;
            test_in := test_in + 1;
        end loop;

        wait;
    end process;
end structure;