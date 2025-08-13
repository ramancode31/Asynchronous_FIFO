module delayed_and (
    input  a,
    output reg y
);
    always @(*) begin
         y = #5a;
    end
endmodule
