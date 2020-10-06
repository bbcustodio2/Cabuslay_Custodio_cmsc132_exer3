library IEEE;
use IEEE.std_logic_1164.all;

entity not2 is
    port (a : in std_logic; c : out std_logic);
end not2;
-- NOT Gate structure
architecture behaviour of not2 is
begin
    c <= (not a);
end behaviour;