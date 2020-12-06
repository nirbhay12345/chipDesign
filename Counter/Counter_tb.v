module Counter_tb;
    reg clk;
    reg up_down;
    reg hold;
    wire [7:0] out;

    Counter count(.clk(clk), .count_dir(up_down), .hold(hold), .count_out(out));

    initial clk = 1'b0; // initialize the clock

    // toggle every 10 nanosecs => 20ns time period clk
    always #20 clk = ~clk;

    initial begin
        hold = 1;
        up_down = 1;
        #500;
        hold = 0;
        #60;
        hold = 1;
        up_down = 0;
        #500;
        $finish;
    end

endmodule