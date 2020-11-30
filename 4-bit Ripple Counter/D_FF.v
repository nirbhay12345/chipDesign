module D_FF (
    input wire d, clk, reset,
    output reg q
);

    always @(posedge reset or negedge clk) begin
        if(reset)
            q <= 1'b0;
        else
            q <= d;
    end
    
endmodule