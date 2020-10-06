library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is
    port (a,b : in std_logic; c : out std_logic);
end and2;

--AND gate structure
architecture behaviour of and2 is
begin
    c <= (a and b);
end behaviour;