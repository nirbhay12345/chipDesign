module Stack_tb#(parameter W = 8, H = 3)();
    reg [W-1:0] data_in;
    reg clk, clear, en, rw;
    wire full, empty;
    wire [W-1:0] data_out;

    integer i,j;

    // instantiating the design under test
    Stack DUT(.data_in(data_in), 
            .clk(clk), 
            .clear(clear), 
            .en(en), 
            .rw(rw), 
            .full(full),
            .empty(empty),
            .data_out(data_out));


    // defining the clock
    initial clk = 1'b0;

    always #20 clk = ~clk;

    // System task for the Stack
    task initialize;
        begin
            en <= 1'b1;
            rw <= 1'b1;
            clear <= 1'b1;
            #20 clear <= 1'b0;
        end
    endtask

    task push_data(input [W-1:0] a);
        begin
            @(negedge clk)
            rw <= 1'b1;
            #10 data_in <= a;
        end
    endtask

    task pop_data();
        begin
            @(negedge clk)
            rw <= 1'b0;
        end
    endtask

    initial begin
        initialize;
        j=1;
        for(i=0;i<8;i=i+1) begin
            j=j<<1;
            push_data(j);
        end
        j=1;
        for (i = 0; i<8; i=i+1) begin
            pop_data();
        end
        pop_data();
    end

    initial $monitor("The stack is as follows %b,%b,%b,%b,%b,%b,%b,%b", 
                    DUT.stack_mem[0],
                    DUT.stack_mem[1],
                    DUT.stack_mem[2],
                    DUT.stack_mem[3],
                    DUT.stack_mem[4],
                    DUT.stack_mem[5],
                    DUT.stack_mem[6],
                    DUT.stack_mem[7], "  the data out is : %b", data_out);

    // initial $monitor(");

endmodule

