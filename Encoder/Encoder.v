// this is a 8 to 3 decoder => with priority enabled
module priority_encoder(
    input wire[7:0] in, // input given
    input wire enable, //chip enable => active high
    output reg [2:0] y // encoded output
    );
	
	always@ * begin
        if (!enable)
            y[2:0] = 4'h0;
        else
		casez(in)
            8'b1???????: y = 3'b111; // d7
            8'b01??????: y = 3'b110; // d6
            8'b001?????: y = 3'b101; // d5
			8'b0001????: y = 3'b100; // d4
			8'b00001???: y = 3'b011; // d3
			8'b000001??: y = 3'b010; // d2
			8'b0000001?: y = 3'b001; // d1
			8'b00000001: y = 3'b000; // d0
			default: y = 3'b111;     // default is highest priority => d7
			endcase
		end
endmodule

