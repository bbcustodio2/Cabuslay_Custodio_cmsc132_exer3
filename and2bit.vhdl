library IEEE;
use IEEE.std_logic_1164.all;

entity and2bit is
    port ( in1, in0, input1, input0 : in std_logic; 
            out1, out0, c_out : out std_logic        
    );
end and2bit;

--AND operation with 2 bits
architecture behaviour of and2bit is
    -- AND gate compoent declaration
    component and2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    begin
        u1: and2 port map (in0,input0, out0);
        u2: and2 port map (in1,input1, out1);
        c_out <= '0';
end behaviour;