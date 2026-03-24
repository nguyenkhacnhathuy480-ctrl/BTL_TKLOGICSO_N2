module mod24_counter(
    input clk,
    input rst,
    input en,
    output reg [4:0] count,
    output cout
);
    assign cout = (en && count == 5'd23);

    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 5'd0;
        else if (en) begin
            if (count == 5'd23) 
                count <= 5'd0;
            else 
                count <= count + 1;
        end
    end
endmodule