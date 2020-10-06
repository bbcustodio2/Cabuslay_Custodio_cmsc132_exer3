library IEEE;
use IEEE.std_logic_1164.all;

entity xor2 is
    port (a,b : in std_logic; c : out std_logic);
end xor2;
-- XOR Gate structure
architecture behaviour of xor2 is
begin
    c <= (a xor b);
end behaviour;