module T_FF(q,d,clk);
    input wire d;
    input wire clk;
    output reg q;

    D_FF d_ff(.q(q), .d(d), .clk(clk));

    not n1(d,q);

endmodule
