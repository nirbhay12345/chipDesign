// Stack is useful in cases when CPU needs to store a data which is useful for later reference
// stack is based on the concept of LIFO (last in first out)
// basically two operations can be performed 
// 1. push  2. pop
// there are basically two output status signals -> 1. full 2. empty
// one pointer is initialized to keep reference of the top of the stack which is also called Stack Pointer
// the Stack should not be written to when the full signal is high or stack overflow is caused
// the Stack should not be read from when the empty signal is high or stack underflow is caused

module Stack 
#(parameter W = 8, H = 3)
(
    input wire [W-1:0] data_in,
    input wire clk, clear, en, rw, // rw = 0 => read , rw = 1 => write
    output reg full, empty,
    output reg [W-1:0] data_out
);
    // keeping track of the bottom of the stack
    localparam bottom = 2**H-1;

    // stack memory => 8 bits wide and 8 elements deep
    reg [W-1:0] stack_mem [0:2**H-1];
    reg [H-1:0] sp; // stack pointer

    integer i;

    always @(sp) begin
        if (sp == bottom) begin//write possible
            empty = 1'b1;
            full = 1'b0; 
        end
        else if (!sp) begin // read possible
            empty = 1'b0;
            full = 1'b1;
        end 
        else begin // both read and write possible
            empty = 1'b0;
            full = 1'b0;
        end
    end

    always @(posedge clk) begin
        if(!en);
        else begin
            if(clear)begin // clear the stack
                sp = bottom;
                for (i=0 ; i<2**H; i=i+1) begin
                    stack_mem[i] = 0;
                end
            end
            else begin
               if (full == 1'b0 && rw ==1'b1) begin // write operation
                    stack_mem[sp] = data_in;
                    sp = sp - 1'b1; // move up in the stack
               end 
               else if (empty == 1'b0 && rw == 1'b0) begin // read operation
                    data_out = stack_mem[sp];
                    stack_mem[sp] = 0;
                    sp = sp + 1'b1; // move down in the stack
               end
               else;
            end
        end
    end
    
endmodule






// full = (~&sp)?1:0
// empty =(sp==bottom)?1:0 