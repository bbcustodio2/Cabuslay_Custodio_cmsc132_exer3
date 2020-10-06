library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port ( selector: in unsigned (2 downto 0); i0,i1,j0,j1 : in std_logic; 
            k0, k1, c_out : out std_logic        
    );
end alu;

architecture structure of alu is
    --selector std_logic values
    signal sel0, sel1, sel2 : std_logic;
    --one k0, k1, and c_out for each functionality
    signal k1_a, k1_b, k1_c, k1_d, k1_e, k1_f, k1_g, k1_h : std_logic;
    signal k0_a, k0_b, k0_c, k0_d, k0_e, k0_f, k0_g, k0_h : std_logic;
    signal c_out_a, c_out_b, c_out_c, c_out_d, c_out_e, c_out_f, c_out_g, c_out_h : std_logic;
    --selectors_not
    signal sel0_not, sel1_not, sel2_not : std_logic;
    --final checks for each process for final OR Gate
    signal final_a1, final_b1, final_C1, final_d1, final_e1, final_f1, final_g1, final_h1 : std_logic;
    signal final_a2, final_b2, final_C2, final_d2, final_e2, final_f2, final_g2, final_h2 : std_logic;
    signal final_a3, final_b3, final_C3, final_d3, final_e3, final_f3, final_g3, final_h3 : std_logic;
    --component for NOT operator
    component not2 is
        port (a : in std_logic; c : out std_logic);
    end component;

    --bit logical operation components (AND, OR, XOR, NOT) declaration
    component and2bit is
        port (in0, in1, input0, input1 : in std_logic; out0, out1, c_out : out std_logic);
    end component;

    component or2bit is
        port (in0, in1, input0, input1 : in std_logic; out0, out1, c_out : out std_logic);
    end component;
    
    component xor2bit is
        port (in0, in1, input0, input1 : in std_logic; out0, out1, c_out : out std_logic);
    end component;
    
    component not2bit is
        port (in0, in1 : in std_logic; out0, out1, c_out : out std_logic);
    end component;
    
    --2-bit Arithmetic Operations component (ADDITION, 1'S COMPLIMENT, 2'S COMPLIMENT, INCREMENT) declaration
    component addition is
        port (in0, in1, input0, input1 : in std_logic; out0, out1, c_out : out std_logic);
    end component;
    
    component increment is
        port (in0, in1 : in std_logic; out0, out1, c_out : out std_logic);
    end component;

    component subtract1 is
        port (in0, in1, input0, input1 : in std_logic; out0, out1, c_out : out std_logic);
    end component;

    component subtract2 is
        port (in0, in1, input0, input1 : in std_logic; out0, out1, c_out : out std_logic);
    end component;
    
    --compiler component declarations for the ALU
    component four_input_and is
        port (a,b,c,d : in std_logic; e : out std_logic);
    end component;
    
    component final_or_gate is
        port (a,b,c,d,e,f,g,h : in std_logic; i : out std_logic);
    end component;
    --begin process
    begin 
        -- process variables for each functionality (get k0, k1, c_out)
        u1: and2bit port map (i0,i1,j0,j1,k0_a,k1_a,c_out_a);  
        u2: or2bit port map (i0,i1,j0,j1,k0_b,k1_b,c_out_b);  
        u3: xor2bit port map (i0,i1,j0,j1,k0_c,k1_c,c_out_c);  
        u4: not2bit port map (i0,i1,k0_d,k1_d,c_out_d);
        u5: addition port map (i0,i1,j0,j1,k0_e,k1_e,c_out_e);  
        u6: subtract1 port map (i0,i1,j0,j1,k0_f,k1_f,c_out_f);
        u7: subtract2 port map (i0,i1,j0,j1,k0_g,k1_g,c_out_g); 
        u8: increment port map (i0,i1,k0_h,k1_h,c_out_h); 

        --get NOT of Selectors
        u9: not2 port map(sel0, sel0_not);
        u10: not2 port map(sel1, sel1_not);
        u11: not2 port map(sel2, sel2_not);

        -- compile the processes with 4-input AND Gate and 8-input OR Gate
        u12: four_input_and port map(sel0_not, sel1_not, sel2_not, k0_a, final_a1);
        u13: four_input_and port map(sel0_not, sel1_not, sel2, k0_b, final_b1);
        u14: four_input_and port map(sel0_not, sel1, sel2_not, k0_c, final_c1);
        u15: four_input_and port map(sel0_not, sel1, sel2, k0_d, final_d1);
        u16: four_input_and port map(sel0, sel1_not, sel2_not, k0_e, final_e1);
        u17: four_input_and port map(sel0, sel1_not, sel2, k0_f, final_f1);
        u18: four_input_and port map(sel0, sel1, sel2_not, k0_g, final_g1);
        u19: four_input_and port map(sel0, sel1, sel2, k0_h, final_h1);
        -- final OR gate to get 1 or 0
        uFinalk0: final_or_gate port map(final_a1, final_b1, final_c1, final_d1, final_e1, final_f1, final_g1, final_h1, k0);

        u20: four_input_and port map(sel0_not, sel1_not, sel2_not, k1_a, final_a2);
        u21: four_input_and port map(sel0_not, sel1_not, sel2, k1_b, final_b2);
        u22: four_input_and port map(sel0_not, sel1, sel2_not, k1_c, final_c2);
        u23: four_input_and port map(sel0_not, sel1, sel2, k1_d, final_d2);
        u24: four_input_and port map(sel0, sel1_not, sel2_not, k1_e, final_e2);
        u25: four_input_and port map(sel0, sel1_not, sel2, k1_f, final_f2);
        u26: four_input_and port map(sel0, sel1, sel2_not, k1_g, final_g2);
        u27: four_input_and port map(sel0, sel1, sel2, k1_h, final_h2);
         -- final OR gate to get 1 or 0
        uFinalk1: final_or_gate port map(final_a2, final_b2, final_c2, final_d2, final_e2, final_f2, final_g2, final_h2, k1);

        u28: four_input_and port map(sel0_not, sel1_not, sel2_not, c_out_a, final_a3);
        u29: four_input_and port map(sel0_not, sel1_not, sel2, c_out_b, final_b3);
        u30: four_input_and port map(sel0_not, sel1, sel2_not, c_out_c, final_c3);
        u31: four_input_and port map(sel0_not, sel1, sel2, c_out_d, final_d3);
        u32: four_input_and port map(sel0, sel1_not, sel2_not, c_out_e, final_e3);
        u33: four_input_and port map(sel0, sel1_not, sel2, c_out_f, final_f3);
        u34: four_input_and port map(sel0, sel1, sel2_not, c_out_g, final_g3);
        u35: four_input_and port map(sel0, sel1, sel2, c_out_h, final_h3);
        -- final OR gate to get 1 or 0
        uFinal_c_out: final_or_gate port map(final_a3, final_b3, final_c3, final_d3, final_e3, final_f3, final_g3, final_h3, c_out);
        --get individual values from the selector unsigned
        sel0 <= selector(2);
        sel1 <= selector(1);
        sel2 <= selector(0);
        
end structure;