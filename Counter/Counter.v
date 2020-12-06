module Counter 
#(parameter N = 8)
(
    input wire clk, count_dir,
    input wire hold,
    output wire [N-1:0] count_out
);
    reg [N-1:0] count = {N{1'b0}};

	assign count_out = count;
	
    always @(posedge clk, negedge hold) begin
        
		if (!hold)
			count = count_out;
		else
			case (count_dir)
                1'b0 : count = count - 8'b00000001;
                1'b1 : count = count + 8'b00000001;
                default : count = count ;
            endcase

	end
    
endmodule