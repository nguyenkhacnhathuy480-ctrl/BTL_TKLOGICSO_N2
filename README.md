# BTL_TKLOGICSO_N2

##  Project Information
**Course:** Thiết kế Logic số  
**Project Name:** Thiết kế và mô tả đồng hồ thời gian thực (Ngày trong tuần-Giờ-Phút-Giây) bằng Verilog theo hướng Module hóa

##  Team Members
| Name                    | Student ID   |
|-------------------------|-------------|
| Nguyễn Khắc Nhật Huy    | B23DCDT123  |
| Nguyễn Minh Ánh         | B23DCDT023  |
| Nhữ Đào Hải Đăng        | B23DCDT047  |
| Dương Thế Huy           | B23DCDT119  |

##  Description
Đề tài tập trung vào việc thiết kế hệ thống đồng hồ thời gian thực (RTC) sử dụng Verilog HDL theo phương pháp module hóa, trong đó mỗi thành phần như giây, phút, giờ và ngày trong tuần được xây dựng thành các module riêng biệt. Hệ thống có chức năng đếm và hiển thị thời gian theo định dạng Ngày – Giờ – Phút – Giây, đảm bảo hoạt động chính xác theo chu kỳ thời gian thực và phù hợp để triển khai trên FPGA.

##  Technologies Used
- Verilog HDL
- Quartus / ModelSim

##  How to Run
1. Mở Quartus, tạo project
2. Add các file code vào project
3. Set as Top-level Entity cho file rtc_top.v
4. Compile project
5. Chạy mô phỏng bằng ModelSim 

##  Project structure

Dự án được thiết kế theo hướng **module hóa**, trong đó mỗi chức năng được xây dựng thành một module riêng biệt nhằm tăng tính dễ hiểu, dễ bảo trì và mở rộng.

###  Các file mã nguồn

- **`clk_div.v`**  
  Module chia tần số clock  
  → Tạo xung **1Hz** từ clock hệ thống để phục vụ việc đếm thời gian thực  

- **`mod60_counter.v`**  
  Module bộ đếm mod-60  
  → Sử dụng cho:
  - Giây (0–59)  
  - Phút (0–59)  

- **`mod24_counter.v`**  
  Module bộ đếm giờ  
  → Đếm trong khoảng **0 đến 23**  

- **`mod7_counter.v`**  
  Module bộ đếm ngày trong tuần  
  → Đếm trong khoảng **1 đến 7**  

- **`rtc_top.v`**  
  Module tổng của hệ thống  
  → Kết nối các module con  
  → Điều phối luồng tín hiệu giữa các khối  

---

###  Mô phỏng

- **`tb_rtc_top.v`**  
  Testbench của hệ thống  
  → Dùng để kiểm tra hoạt động của toàn bộ thiết kế trên ModelSim  
  → Mô phỏng tín hiệu clock, reset và quan sát output  

---

##  Đặc điểm thiết kế

- Thiết kế theo hướng **module hóa (Modular Design)**  
- Kiến trúc **phân cấp (Hierarchical Design)**  
- Hệ thống **đồng bộ theo xung clock (Synchronous System)**  
- Cơ chế đếm dạng **truyền carry (Cascade Counter)**:
  - Giây → Phút → Giờ → Ngày  
