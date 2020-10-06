library IEEE;
use IEEE.std_logic_1164.all;

entity final_or_gate is
    port (a,b,c,d,e,f,g,h : in std_logic; i : out std_logic);
end final_or_gate;

-- 8-input OR gate for final output for ALU
architecture behaviour of final_or_gate is
begin
    i <= (a or b or c or d or e or f or g or h);
end behaviour;