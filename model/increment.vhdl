library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity increment is
    port ( in0, in1 : in std_logic; 
    out0, out1, c_out : out std_logic        
);
end increment;
-- Increment input by one bit (xx + 01)
architecture structure of increment is
    signal c_in0, P, G, PC_in, c_in1: std_logic;
    --Gate component declarations
    component xor2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    component and2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;
    
    component or2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;
    
    begin
        --first bit addition
        --Half-adder 
        u1: xor2 port map (in1,'1', out1);
        u3: and2 port map (in1, '1', c_in1);

        --second bit addition
        --full-adder
        u6: xor2 port map ('0',in0,P);
        u7: xor2 port map (c_in1, P, out0);
        u8: and2 port map (in0, '0', G);
        u9: and2 port map (P, c_in1, PC_in);
        u10: or2 port map (G, PC_in, c_out);

end structure;
