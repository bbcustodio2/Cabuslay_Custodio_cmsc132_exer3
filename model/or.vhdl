library IEEE;
use IEEE.std_logic_1164.all;

entity or2 is
    port (a,b : in std_logic; c : out std_logic);
end or2;
-- OR Gate structure
architecture behaviour of or2 is
begin
    c <= (a or b);
end behaviour;