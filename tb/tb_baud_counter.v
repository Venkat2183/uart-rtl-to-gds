
`timescale 1ns/1ps

module tb_baud_counter;

reg clk;
reg rst;
wire [3:0] count;

baud_counter dut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("baud_counter.vcd");
    $dumpvars(0, tb_baud_counter);

    clk = 0;
    rst = 1;

    #12;
    rst = 0;

    #180;
    $finish;
end

initial begin
    $monitor("Time=%0t rst=%b count=%d",
             $time, rst, count);
end

endmodule
