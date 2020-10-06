library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity subtract2 is
    port ( in0, in1, input0, input1 : in std_logic; 
            out0, out1, c_out : out std_logic        
    );
end subtract2;
-- 2-bit subtraction using 2's complement
architecture structure of subtract2 is
    signal in1_not, A, B : std_logic;
    -- gate component declarations
    component xor2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    component and2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    component not2 is
        port (a : in std_logic; c : out std_logic);
    end component;

    
    begin
        --first bit (most significant)
        u1: not2 port map (in1, in1_not);
        u2: xor2 port map (in1,input1, out1);

        -- second bit 
        u3: and2 port map (input1, in1_not, A);
        u4: xor2 port map (input0, A, B);
        u5: xor2 port map (in0, B, out0);

        c_out <= '0';
end structure;
