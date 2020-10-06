library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
    port ( selector, input_bit : in std_logic; 
        out0, out1, carry_out : out std_logic        
    );
end alu_tb;

architecture structure of alu_tb is
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
        variable inp1: unsigned (3 downto 0);
        variable test_in : unsigned (2 downto 0);
        variable one, zero : std_logic;

    begin 
        --test bench vales and input
        test_in := "000";
        inp1 := "1011";
        --iterates through all the values of 4-bits
        --for test in 0 to 15 loop
        i0 <= inp1(3);
        i1 <= inp1(2);
        j0 <= inp1(1);
        j1 <= inp1(0);
        --checkers for expected output of the operation
        one := '1';
        zero := '0';

        -- iterate from '000' to '111' and store it in sel
        for count in 0 to 7 loop
            sel <= test_in;
            wait for 10 ns;
            test_in := test_in + 1;

            --checks what operation is done on the current iteration
            if(sel = "000") then 
                --check if output os "100"
                -- if not, increment error_count
                assert(k0 = one and k1 = zero and c_out = zero) 
                report "Operation error" severity error;
                if not(k0 = one and k1 = zero and c_out = zero) then
                    error_count := error_count + 1;
                    end if;
            elsif (sel = "001") then
                --check if output os "110"
                -- if not, increment error_count
                assert(k0 = one and k1 = one and c_out = zero) 
                report "Operation error" severity error;
                if not(k0 = one and k1 = one and c_out = zero) then
                    error_count := error_count + 1;
                    end if;
            elsif (sel = "010") then
                --check if output os "010"
                -- if not, increment error_count
                assert(k0 = zero and k1 = one and c_out = zero) 
                report "Operation error" severity error;
                if not(k0 = zero and k1 = one and c_out = zero) then
                    error_count := error_count + 1;
                    end if;
            elsif (sel = "011") then
                --check if output os "010"
                -- if not, increment error_count
                assert(k0 = zero and k1 = one and c_out = zero) 
                report "Operation error" severity error;
                if not(k0 = zero and k1 = one and c_out = zero) then
                    error_count := error_count + 1;
                    end if;
            elsif (sel = "100") then
                --check if output os "011"
                -- if not, increment error_count
                assert(k0 = zero and k1 = one and c_out = one) 
                report "Operation error" severity error;
                if not(k0 = zero and k1 = one and c_out = one) then
                    error_count := error_count + 1;
                    end if;
            elsif (sel = "101") then
                --check if output os "100"
                -- if not, increment error_count
                assert(k0 = one and k1 = zero and c_out = zero) 
                report "Operation error" severity error;
                if not(k0 = one and k1 = zero and c_out = zero) then
                    error_count := error_count + 1;
                    end if;
            elsif (sel = "110") then
                --check if output os "110"
                -- if not, increment error_count
                assert(k0 = one and k1 = one and c_out = zero) 
                report "Operation error" severity error;
                if not(k0 = one and k1 = one and c_out = zero) then
                    error_count := error_count + 1;
                    end if;
            elsif (sel = "111") then
                --check if output os "110"
                -- if not, increment error_count
                assert(k0 = one and k1 = one and c_out = zero) report "Operation error" severity error;
                if not(k0 = one and k1 = one and c_out = zero) then
                    error_count := error_count + 1;
                    end if;

            end if;     

        end loop;
        --increment, inp++
        inp1 := inp1 + 1;
        --end loop;

        report "Done with test. there were " & integer'image(error_count) & " error/s";

        wait;
    end process;
end structure;