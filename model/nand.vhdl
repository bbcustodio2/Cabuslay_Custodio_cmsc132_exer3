library IEEE;
use IEEE.std_logic_1164.all;

entity nand2 is
    port (a,b : in std_logic; c : out std_logic);
end nand2;
-- NAND Gate structure
architecture structure of nand2 is
begin
    c <= (a nand b);
end structure;