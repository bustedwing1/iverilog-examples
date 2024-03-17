--------------------------------------------------------------------------------
-- File: blinky.vhd
-- Description:
-- This design blinks an LED.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library work;

entity blinky_vhdl is
generic (
  CNT_WIDTH : integer := 27
);
port (
  clk        : in  std_logic;
  rst_n      : in  std_logic;
  led        : out std_logic
);
end entity blinky_vhdl;

architecture rtl of blinky_vhdl is
  signal cnt : unsigned(CNT_WIDTH-1 downto 0);
begin

  process (clk)
  begin
    if rising_edge(clk) then
      if rst_n = '0' then
        led <= '0';
        cnt <= (others => '0');
      else
        led <= cnt(CNT_WIDTH-1);
        cnt <= cnt + 1;
      end if;
    end if;
  end process;

end architecture rtl;

