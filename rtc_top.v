module rtc_top(
    input clk_50mhz, // Xung nhịp hệ thống
    input rst,       // Tín hiệu reset (Active High)
    output [5:0] sec,
    output [5:0] min,
    output [4:0] hour,
    output [2:0] day
);
    wire clk_1hz;
    wire carry_sec, carry_min, carry_hour;

    // Khởi tạo bộ chia tần
    clk_div div_inst (
        .clk_50mhz(clk_50mhz),
        .rst(rst),
        .clk_1hz(clk_1hz)
    );

    // Khởi tạo đếm Giây (en luôn bằng 1 vì 1Hz nhịp liên tục)
    mod60_counter sec_inst (
        .clk(clk_1hz),
        .rst(rst),
        .en(1'b1), 
        .count(sec),
        .cout(carry_sec)
    );

    // Khởi tạo đếm Phút
    mod60_counter min_inst (
        .clk(clk_1hz),
        .rst(rst),
        .en(carry_sec), // Chỉ tăng khi Giây tràn
        .count(min),
        .cout(carry_min)
    );

    // Khởi tạo đếm Giờ
    mod24_counter hour_inst (
        .clk(clk_1hz),
        .rst(rst),
        .en(carry_min), // Chỉ tăng khi Phút tràn
        .count(hour),
        .cout(carry_hour)
    );

    // Khởi tạo đếm Ngày trong tuần
    mod7_counter day_inst (
        .clk(clk_1hz),
        .rst(rst),
        .en(carry_hour), // Chỉ tăng khi Giờ tràn (đạt 23:59:59)
        .count(day)
    );

endmodule