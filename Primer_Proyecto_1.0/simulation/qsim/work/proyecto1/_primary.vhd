library verilog;
use verilog.vl_types.all;
entity proyecto1 is
    port(
        num_1           : in     vl_logic_vector(3 downto 0);
        num_2           : in     vl_logic_vector(3 downto 0);
        select_sum      : in     vl_logic;
        select_mult     : in     vl_logic;
        segmento1       : out    vl_logic_vector(6 downto 0);
        segmento2       : out    vl_logic_vector(6 downto 0);
        segmento3       : out    vl_logic_vector(6 downto 0);
        segmento4       : out    vl_logic_vector(6 downto 0)
    );
end proyecto1;
