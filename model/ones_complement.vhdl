library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity subtract1 is
    port ( in0, in1, input0, input1 : in std_logic; 
            out0, out1, c_out : out std_logic        
    );
end subtract1;
-- 2-bit subtraction using 1's complement
architecture structure of subtract1 is
    --signals to be used (declaration)
    signal in1_not, A, A_not, B, C, D, E, F, G, H, I, M, N, P : std_logic;
    -- Gate component delaration
    component xor2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    component xnor2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    component nor2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    component and2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    component nand2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;
    
    component or2 is
        port (a, b : in std_logic; c : out std_logic);
    end component;

    component not2 is
        port (a : in std_logic; c : out std_logic);
    end component;

    -- process to subtract using 1's complement
    begin
        u1: xor2 port map (in1,input1, A);
        
        u2: not2 port map (in1, in1_not);
        u3: and2 port map (input1, in1_not, B);
        u4: xor2 port map (input0, B, C);
        u5: xor2 port map (in0, C, D);

        u6: xnor2 port map (in0, input0, E);
        u7: xor2 port map (in1, input1, F);
        u8: nand2 port map (input1, F, G);
        u9: nand2 port map (G, E, H);
        u10: nor2 port map (input0, E, I);
        u11: xor2 port map (H, I, M);
        u12: xor2 port map (A, M, out1);

        u13: not2 port map (A, A_not);
        u14: and2 port map (A_not, M, N);
        u15: xor2 port map ('0', N, P);

        u16: xor2 port map (P, D, out0);
        c_out <= '0';
end structure;
