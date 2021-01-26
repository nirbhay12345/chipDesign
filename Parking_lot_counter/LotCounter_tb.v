module LotCounter_tb();
    reg a,b,clk,reset;
    wire entry,exit;
    wire [7:0] count;

    // instatiate the design
    occupancyCounter OC1(.a(a), 
                        .b(b), 
                        .clk(clk), 
                        .reset(reset), 
                        .entry(entry), 
                        .exit(exit), 
                        .count(count));

    // system tasks

    task initialise;
        begin
           clk = 1'b0;
           a=0;
           b=0;
           reset=0; 
        end
    endtask

    task entry_car;
        begin
            #40 {a,b}=2'b00; 
            #40 {a,b}=2'b10; 
            #40 {a,b}=2'b11; 
            #40 {a,b}=2'b01;
            #40 {a,b}=2'b00;
        end
    endtask

    task exit_car;
        begin
            #40 {a,b}=2'b00; 
            #40 {a,b}=2'b01; 
            #40 {a,b}=2'b11; 
            #40 {a,b}=2'b10;
            #40 {a,b}=2'b00;
        end
    endtask

    task delay;
        begin
           #20; 
        end
    endtask

    task reset_module;
        begin
            reset=1;
            #20 reset=0;
        end
    endtask


    always #10 clk=~clk;

    initial begin
        initialise;
        entry_car;
        delay;
        entry_car;
        delay;
        reset_module;
        exit_car;
        delay;
        entry_car;
        delay;
        entry_car;
        delay;
        $stop;
    end

    initial $monitor("a = %b, b = %b, entry = %b, exit = %b, count = %d", a,b,entry,exit,count);

endmodule

