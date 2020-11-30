module T_FF(q, clk, reset);

    output q;
    input clk, reset;
    wire d;

    D_FF dff0(.q(q), .d(d), .clk(clk), .reset(reset));

    not n1(d, q); // not is a Verilog-provided primitive. case sensitive

endmodule