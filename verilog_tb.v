`timescale 1ns/1ps

module tb_delayed_and;

    reg a;
    wire y;

    // Instantiate the module
    delayed_and uut (
        .a(a),
        .y(y)
    );

    initial begin
$dumpfile("wave.vcd");
$dumpvars(0, tb_delayed_and);
        $monitor("Time=%0t | a=%b => y=%b", $time, a, y);

        // Initial values
        a = 1;

        // a changes at time 2
        //#1 b = 1;
        #1 a = 0; 
        #1 a = 1;   // a changes at time 3
        // y = a & b is evaluated at time 5 with a=1, b=1

        #20 $finish;
    end

endmodule
