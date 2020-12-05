module ALU 
#(parameter N = 4, M = 4)
(
    input [N-1:0] A, B,
    input [M-1:0] instruction,
    output reg [N-1:0] ALU_out
);
    wire [N-1:0] LU, AU;

    Logical Logic(.A(A), .B(B), .instruction(instruction[M-2:0]), .LU_out(LU));
    Arithematic arith(.A(A), .B(B), .instruction(instruction[M-2:0]), .AU_out(AU));
    
    always @*
        if (instruction[M-1] == 0)
            ALU_out <= AU;
        else
            ALU_out <= LU;

endmodule