`timescale 1ns / 1ps // Định nghĩa đơn vị thời gian: 1 bước = 1ns, độ phân giải 1ps

module tb_rtc_top();

    // 1. Khai báo các tín hiệu kết nối
    // Tín hiệu đưa vào (Input) khai báo là reg
    reg clk_50mhz;
    reg rst;
    
    // Tín hiệu lấy ra (Output) khai báo là wire
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hour;
    wire [3:0] day;

    // 2. Khởi tạo (Instantiate) Design Under Test (DUT)
    rtc_top uut (
        .clk_50mhz(clk_50mhz),
        .rst(rst),
        .sec(sec),
        .min(min),
        .hour(hour),
        .day(day)
    );

    // 3. Tạo xung nhịp 50MHz (Chu kỳ = 20ns, nửa chu kỳ = 10ns)
    always #10 clk_50mhz = ~clk_50mhz;

    // 4. Kịch bản mô phỏng (Stimulus)
    initial begin
        // Khởi tạo trạng thái ban đầu
        clk_50mhz = 0;
        rst = 1; // Kích hoạt reset để xóa sạch rác dữ liệu (thường là X trong sim)
        
        // Theo dõi sự thay đổi trên cửa sổ Transcript (Console) của ModelSim
        // $time in ra thời gian mô phỏng hiện tại
        $monitor("Time=%0t | Day=%d | %02d:%02d:%02d", $time, day, hour, min, sec);

        // Giữ reset trong 100ns (5 chu kỳ clock) để hệ thống ổn định
        #100;
        rst = 0; // Tắt reset, bắt đầu đếm

        // Để hệ thống tự chạy. Bạn có thể tăng giảm số này tùy thuộc vào 
        // việc bạn đã thu nhỏ tỷ lệ chia trong module clk_div hay chưa.
        // Ví dụ: mô phỏng trong 1,000,000 ns
        #1000000; 
        
        // Kết thúc mô phỏng
        $display("Ket thuc mo phong!");
        $stop; 
    end

endmodule
