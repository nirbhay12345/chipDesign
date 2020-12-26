module dual_edge_detector (
    input wire clk, reset,
    input wire level,
    output reg tick1, tick2
);
    // all states of the state machine
    localparam [1:0] zero=2'b00, edge1=2'b01, edge2=2'b10, one=2'b11;

    // registered required in the FSM
    reg [1:0] state_next, state_reg;

    // state register
    always @(posedge clk, posedge reset)
        if(reset)
            state_reg <= zero;
        else
            state_reg <= state_next;

    // next state logic and output logic
    always @* begin
        // default values
        state_next = state_reg;
        tick1 = 1'b0;
        tick2 = 1'b0;
        case (state_reg)
            zero : 
                if (level) begin
                    state_next = edge1;
                    tick1 = 1'b1;
                end
                else
                    state_next = zero;
            edge1 :
                if (level)
                    state_next = one;
                else
                    state_next = zero;
            one :
                if (~level) begin
                    state_next = edge2;
                    tick2 = 1'b1;
                end
                else
                    state_next = one;
            edge2 :
                if (level) 
                    state_next = one;
                else
                    state_next = zero;
            default: state_next = zero;
        endcase
    end

    // next state logic



endmodule