module Test_encoder_tb;
    reg [7:0] in;
    reg enable;
    wire [7:0] out;

    // initializing the design
    Test_encoder t1(in, enable, out);

    integer i;

    initial enable = 1'b1;

    initial begin
        in = 00000001;
        i = 0;
        #100;
        for (i = 0; i < 8; i=i+1) begin
           in = in<<1;
           #100; 
        end
    end

endmodule