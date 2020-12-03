module D_FF_tb;
    reg clk;
    reg d;
    wire q;

    D_FF uut (d, q, clk);

    initial clk = 1'b0;

    always #10 clk = ~clk;

    initial begin
        #10 d=1'b0;
        #50 d=1'b1;
        #25 d=1'b0;
        #20 d=1'b1;
        #30 $finish;
    end

    initial $monitor($time, "Output q = %d ", q);

endmodule