module tb_pl_led;

reg sys_clk;
reg rst_n;
wire [3:0] pl_led;

pl_led uut(
    .sys_clk(sys_clk),
    .rst_n(rst_n),
    .pl_led(pl_led)
);

// create clock
always #10 sys_clk = ~sys_clk;

initial begin
    sys_clk = 0;
    rst_n = 0;
    #1000;
    rst_n = 1;
end


endmodule