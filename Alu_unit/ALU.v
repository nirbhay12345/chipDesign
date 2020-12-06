module ALU 
#(parameter N = 4, M = 4)
(
    input clk,
    input [N-1:0] A, B,
    input [M-1:0] instruction,
    output reg [N-1:0] ALU_out
);
    wire [N-1:0] LU, AU;

    // initialize the sub blocks
    Logical Logic(.clk(clk), .A(A), .B(B), .instruction(instruction[M-2:0]), .LU_out(LU));
    Arithematic arith(.clk(clk), .A(A), .B(B), .instruction(instruction[M-2:0]), .AU_out(AU));
    
    always @*
        ALU_out <= (instruction[M-1]==1) ? LU : AU;

endmodule