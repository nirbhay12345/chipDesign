module N_bit_adder_tb;
    // parameter N = 8;
    reg [7:0] i1, i2;
    wire [7:0] answer;

    // initialization of the design block
    N_bit_adder uut(.input1(i1), .input2(i2), .answer(answer));

    initial begin
        i1 = 230;
        i2 = 10;
        #100;
        i1 = 256;
        i2 = 1;
        #100;
        i1 = -1;
        i2 = -3;
        #100;
        i1 = 100;
        i2 = 200;
        #100;
        i1 = 30;
        i2 = 70;
        #100;
        i1 = 2;
        i2 = -255;
        #100;
    end 

endmodule