module melay_edge_detector (
    input wire clk, reset,
    input wire level,
    output reg tick
);
    // state defination
    localparam [1:0] zero = 2'b00, one = 2'b01;

    //signal declaration
    reg state_reg, state_next;

    // state register
    always @(posedge clk, posedge reset)
        if(reset)
            state_reg <= 0;
        else
            state_reg <= state_next;

    // next state logic and output logic
    always @* begin
        state_next = state_reg; // default value of state_next register
        tick = 1'b0; // default value of output tick
        case (state_reg)
            zero : 
                if(level) begin
                        tick = 1'b1;
                        state_next = one;                       
                    end
            one :
                if(~level)
                    state_next = zero;
            default: state_next = zero;
        endcase
    end 

endmodule