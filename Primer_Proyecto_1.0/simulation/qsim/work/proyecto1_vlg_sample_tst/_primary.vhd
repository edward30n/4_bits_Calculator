library verilog;
use verilog.vl_types.all;
entity proyecto1_vlg_sample_tst is
    port(
        num_1           : in     vl_logic_vector(3 downto 0);
        num_2           : in     vl_logic_vector(3 downto 0);
        select_mult     : in     vl_logic;
        select_sum      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end proyecto1_vlg_sample_tst;
