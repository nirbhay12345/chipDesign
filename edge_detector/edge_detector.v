// Gate level implementation of edge detector
module edge_detector (
    input wire clk, reset,
    input wire level, 
    output reg tick
);

    // signal declaration
    reg delay_reg;

    // delay logic
    always @(posedge clk, posedge reset)
        if(reset)
            delay_reg <= 1'b0;
        else
            delay_reg <= level;
    
    // decoding logic
    assign tick = ~delay_reg & level;

endmodule