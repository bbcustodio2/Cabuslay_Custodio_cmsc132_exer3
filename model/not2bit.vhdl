library IEEE;
use IEEE.std_logic_1164.all;

entity not2bit is
    port ( in1, in0 : in std_logic; 
            out1, out0, c_out : out std_logic        
    );
end not2bit;
-- 2-bit NOT operation structure
architecture behaviour of not2bit is
    -- NOT gate component declaration
    component not2 is
        port (a : in std_logic; c : out std_logic);
    end component;

    begin
        u1: not2 port map (in0, out0);
        u2: not2 port map (in1, out1);
        c_out <= '0';
end behaviour;