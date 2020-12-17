module Decoder_tb;
    reg [2:0] din;
    reg enable;
    wire [7:0] dout;

    // instantiate the design block
    Decoder d1(din, enable, dout);

    integer i;

    initial begin
        enable = 1'b1;
        din = 3'b000;
        i = 0;
        #100
        enable = 1'b0;
        for (i = 0; i < 8; i=i+1) begin
            din = din + 3'b001;
            #100;
        end
    end

endmodule