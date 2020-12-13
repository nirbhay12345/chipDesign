module N_bit_adder 
#(parameter N = 8)
(
    input [N-1:0] input1, input2,
    output [N-1:0] answer
);
    wire [N-1:0] carry;
    wire carry_out;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin: generate_N_bit_adder
            if (i == 0)
                half_adder a(input1[0], input2[0], answer[0], carry[0]);
            else
                full_adder a(input1[i], input2[i], carry[i-1], answer[i], carry[i]);
        end

        assign carry_out = carry[N-1];

    endgenerate

endmodule