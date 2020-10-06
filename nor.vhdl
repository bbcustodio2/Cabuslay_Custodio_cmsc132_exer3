library IEEE;
use IEEE.std_logic_1164.all;

entity nor2 is
    port (a,b : in std_logic; c : out std_logic);
end nor2;
-- NOR Gate structure
architecture structure of nor2 is
begin
    c <= (a nor b);
end structure;