library IEEE;
use IEEE.std_logic_1164.all;

entity or2bit is
    port ( in1, in0, input1, input0 : in std_logic; 
            out1, out0, c_out : out std_logic        
    );
end or2bit;
-- 2-bit OR operation structure
architecture behaviour of or2bit is
    component or2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    begin
        u1: or2 port map (in0,input0, out0);
        u2: or2 port map (in1,input1, out1);
        c_out <= '0';
end behaviour;