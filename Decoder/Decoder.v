module Decoder ( // 3 to 8 decoder
    input [2:0] din, // input signal
    input enable, // chip enable signal => active low
    output reg [7:0] dout // selected output
);

    // main logic
    always @* begin
        if (enable)
            dout[7:0] <= 8'h00;
        else
            case (din[2:0])
                3'b000 : dout[7:0] <= 8'h01;
                3'b001 : dout[7:0] <= 8'h02;
                3'b010 : dout[7:0] <= 8'h04;
                3'b011 : dout[7:0] <= 8'h08;
                3'b100 : dout[7:0] <= 8'h10;
                3'b101 : dout[7:0] <= 8'h20;
                3'b110 : dout[7:0] <= 8'h40;
                3'b111 : dout[7:0] <= 8'h80;
                default: dout[7:0] <= 8'h00; // default is necessary to avoid any latchs
            endcase
    end

endmodule