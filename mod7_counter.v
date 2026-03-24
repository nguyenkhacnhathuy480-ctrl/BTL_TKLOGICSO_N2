module mod7_counter(
    input clk,
    input rst,
    input en,
    output reg [2:0] count
);
    // Không cần cout vì đây là cấp cao nhất của RTC này
    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 3'd1; // Reset về 1 (Thứ Hai)
        else if (en) begin
            if (count == 3'd7) 
                count <= 3'd1; // Đạt Chủ Nhật thì quay về Thứ Hai
            else 
                count <= count + 1;
        end
    end
endmodule