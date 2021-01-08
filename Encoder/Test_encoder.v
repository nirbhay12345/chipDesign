module Test_encoder (
    input wire[7:0] in, // input given
    input wire enable, //chip enable => active high
    output wire [7:0] out 
);

    wire [2:0] inter;

    priority_encoder e1(.in(in), .enable(enable), .y(inter));

    Decoder d1(.din(inter), .enable(~enable), .dout(out));
    
endmodule
