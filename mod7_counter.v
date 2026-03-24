module mod7_counter(
    input clk,
    input rst,
    input en,
    output reg [3:0] count // SỬA: Tăng lên 4 bit (để chứa được số 8)
);
    // Không cần carry_out vì đây là cấp cao nhất của RTC này
    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 4'd2; // Reset về 2 (Thứ Hai)
        else if (en) begin
            if (count == 4'd8) 
                count <= 4'd2; // Đạt Chủ Nhật (8) thì quay về Thứ Hai (2)
            else 
                count <= count + 4'd1;
        end
    end
endmodule
