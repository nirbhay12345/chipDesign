module Shift_Register (
    input clk,
    input d,
    output q
);

    wire [2:0] q_reg;

    D_FF d0(.d(d), .clk(clk), .q(q_reg[0]));
    D_FF d1(.d(q_reg[0]), .clk(clk), .q(q_reg[1]));
    D_FF d2(.d(q_reg[1]), .clk(clk), .q(q_reg[2]));
    D_FF d3(.d(q_reg[2]), .clk(clk), .q(q));

endmodule
