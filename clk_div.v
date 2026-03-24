module clk_div (
    input clk_50mhz,
    input rst,
    output reg clk_1hz
);
    reg [25:0] counter;
    
    always @(posedge clk_50mhz or posedge rst) begin
        if (rst) begin
            counter <= 0;
            clk_1hz <= 0;
        end else begin
            // 50,000,000 Hz / 2 = 25,000,000 để đảo trạng thái
            if (counter == 5 - 1) begin 
                counter <= 0;
                clk_1hz <= ~clk_1hz;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule