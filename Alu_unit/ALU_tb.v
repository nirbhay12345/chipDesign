module ALU_tb;
    reg clk;
    reg [3:0] a, b;
    reg [3:0] in;
    wire [3:0] out;

	integer i;
    // design block instatiantion
    ALU alu(.clk(clk), .A(a), .B(b), .instruction(in), .ALU_out(out));

    initial clk = 1'b0; //initialize the clk

    // clk of (T = 20ns) given
    always #10 clk = ~clk;

    // control signals that drive the design block
    initial begin
        a = 4'h7;
        b = 4'ha;
        in = 4'h0;
        // for signal generation for the instruction in ALU
        for (i=0;i<=15;i=i+1) begin
            in = in + 8'h01;
            #20;
        end
    end
endmodule
    