module D_FF(d,q,clk);

input wire clk;
input wire d;
output reg q;

always @ (posedge clk) 
    q <= d;

endmodule
