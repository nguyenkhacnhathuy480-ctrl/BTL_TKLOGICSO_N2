module mod60_counter(
    input clk,
    input rst,
    input en,
    output reg [5:0] count,
    output cout // Tín hiệu tràn (carry out) để kích hoạt khối tiếp theo
);
    // Xuất tín hiệu tràn khi đếm đến 59 và đang được kích hoạt
    assign cout = (en && count == 6'd59);

    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 6'd0;
        else if (en) begin
            if (count == 6'd59) 
                count <= 6'd0;
            else 
                count <= count + 1;
        end
    end
endmodule