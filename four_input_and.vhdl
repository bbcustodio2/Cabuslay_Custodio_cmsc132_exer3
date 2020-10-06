library IEEE;
use IEEE.std_logic_1164.all;

entity four_input_and is
    port (a,b,c,d : in std_logic; e : out std_logic);
end four_input_and;

-- 4-input AND gate for each ALU operation
architecture behaviour of four_input_and is
begin
    e <= (a and b and c and d);
end behaviour;