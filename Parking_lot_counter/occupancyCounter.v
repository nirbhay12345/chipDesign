module occupancyCounter
#(parameter N=8)
(
    input a,b,reset,clk,
    output entry,exit,
    output [N-1:0] count//, lot_count
);

    // counter register required for deciding the counter direction and also hold the value,
    // if specified.
    reg count_dir, hold;

    // Instatiating the Counter
    Counter C1(.clk(clk), .count_dir(count_dir), .hold(hold), .count_out(count));
    
    parameter [1:0] s0=2'b00,
                    s1=2'b01,
                    s2=2'b10,
                    s3=2'b11;

    //registers required 
    reg [1:0] state_reg, state_next, inps;
    reg int_entry, int_exit;

    // state-register with posedge clock and asynchronous reset
    always @(posedge clk) begin
        if(reset)
            state_reg <= 2'b00;
        else
            state_reg <= state_next;
    end

    // next state logic + counter logic
    always @* begin
        // default values
        state_next <= state_reg;
        int_entry <= 1'b0;
        int_exit <= 1'b0;
        hold <= 1'b0;
        count_dir <= 1'b0;
        inps <= {a,b}; 
        case(state_reg)
                s0: begin // a and b both unblocked
                    if(inps==2'b01)
                        state_next <= s2;
                    else if(inps==2'b10)
                        state_next <= s1;
                    else
                        state_next <= s0;
                end
                s1: begin // a blocked b unblocked
                    if(inps==2'b00)
                        state_next <= s0;
                    else if(inps==2'b11)
                        state_next <= s3;
                    else
                        state_next <= s1;
                end
                s2: begin // a unblocked b blocked
                    if(inps==2'b11)
                        state_next <= s3;
                    else if(inps==2'b00)
                        state_next <= s0;
                    else
                        state_next <= s2;
                end
                s3: begin // both blocked
                    if(inps==2'b01)begin
                        state_next <= s2;
                        int_entry <= 1'b1;
                        hold <= 1'b1;
                        count_dir <= 1'b1;
                    end
                    else if(inps==2'b10)begin
                        state_next <= s1;
                        int_exit <= 1'b1;
                        hold <= 1'b1;
                        count_dir <= 1'b0;
                    end    
                    else
                        state_next <= s3;
                end
                default: state_next <= s0;
        endcase
    end

    // output logic
    assign entry = int_entry;
    assign exit = int_exit;

endmodule
