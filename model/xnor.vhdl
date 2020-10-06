library IEEE;
use IEEE.std_logic_1164.all;

entity xnor2 is
    port (a,b : in std_logic; c : out std_logic);
end xnor2;
-- XNOR Gate structure
architecture behaviour of xnor2 is
begin
    c <= (a xnor b);
end behaviour;