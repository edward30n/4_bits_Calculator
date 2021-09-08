library verilog;
use verilog.vl_types.all;
entity proyecto1_vlg_check_tst is
    port(
        segmento1       : in     vl_logic_vector(6 downto 0);
        segmento2       : in     vl_logic_vector(6 downto 0);
        segmento3       : in     vl_logic_vector(6 downto 0);
        segmento4       : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end proyecto1_vlg_check_tst;
