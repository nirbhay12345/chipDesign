module Shift_Register (
    input clk,
    input d,
    output q
);

    wire q1, q2, q3;

    D_FF d0(.d(d), .clk(clk), .q(q1));
    D_FF d1(.d(q1), .clk(clk), .q(q2));
    D_FF d2(.d(q2), .clk(clk), .q(q3));
    D_FF d3(.d(q3), .clk(clk), .q(q));

endmodule
