# Thiết Kế Và Lập Trình Tích Hợp - Dự Án Farming RPG
## 1. TỔNG QUAN VỀ GAME VÀ ĐIỂM ĐỘC ĐÁO CỐT LÕI
### Thế mạnh thiết kế (Điểm hấp dẫn của game)
#### Trải nghiệm chính của game xoay quanh cuộc sống nông trại kết hợp nhập vai. Điểm độc đáo giúp game thu hút người chơi là:
- Thế giới tự nhiên thay đổi liên tục theo thời gian, thời tiết và mùa màng, tạo cảm giác như một thế giới thực tế thu nhỏ.
- Các nhân vật phụ (NPC) có cuộc sống riêng. Họ tự di chuyển đi làm, đi chơi hoặc ở nhà trú mưa tùy thuộc vào thời gian và thời tiết chứ không đứng yên một chỗ.
- Cảm giác tương tác chân thực trên từng ô đất như cuốc đất, gieo hạt, tưới nước và thu hoạch nông sản.
Định hướng lập trình trong Unity
### Để thực hiện các ý tưởng trên một cách mượt mà, lập trình viên sẽ:
- Sử dụng cơ chế truyền tin tự động (Sự kiện - Events). Khi thời gian trong game thay đổi, hệ thống sẽ phát tín hiệu để các phần khác tự động cập nhật theo mà không cần kiểm tra liên tục, giúp game chạy nhẹ và mượt hơn.
- Lưu trữ mọi thông tin chỉ số của cây trồng, vật phẩm thành các tệp dữ liệu riêng biệt. Thiết kế game có thể chỉnh sửa trực tiếp các chỉ số này mà không cần động vào mã nguồn.
## 2. CHI TIẾT CÁC TÍNH NĂNG CHÍNH
### Hệ thống Thời gian và Thời tiết
- Thiết kế (Luật chơi & Trải nghiệm): Thời gian trôi qua liên tục theo chu kỳ giây, phút, giờ, ngày, mùa. Khi trời mưa, đất trồng sẽ tự động được tưới nước, giúp người chơi đỡ tốn công sức dọn dẹp và tưới tắm.
- Lập trình (Cách Unity xử lý): Xây dựng một bộ đếm giờ tổng. Bộ đếm này sẽ phát tín hiệu khi chuyển sang giờ mới hoặc ngày mới. Hệ thống cây trồng và NPC sẽ lắng nghe tín hiệu này để biết khi nào cần lớn lên hoặc thay đổi lịch trình.
Hệ thống Làm nông và Canh tác ô đất
- Thiết kế (Luật chơi & Trải nghiệm): Người chơi dùng cuốc để xới đất, dùng bình tưới để cấp ẩm và gieo hạt giống. Đất được tưới nước sẽ đổi màu tối hơn. Nếu không tưới nước, cây trồng sẽ ngừng phát triển hoặc bị chết.
- Lập trình (Cách Unity xử lý): Chia bản đồ thành một lưới các ô vuông (Grid). Lập trình viên sẽ lưu trữ trạng thái của từng ô đất (ví dụ: ô đất này đã cuốc chưa, đã tưới nước chưa, đang trồng cây gì). Khi sang ngày mới, hệ thống kiểm tra các ô đất có nước để tăng giai đoạn trưởng thành cho cây và đổi hình ảnh cây lớn lên.
### Hệ thống Lịch trình di chuyển của NPC
- Thiết kế (Luật chơi & Trải nghiệm): Người chơi cần tìm NPC ở các vị trí khác nhau trong ngày để giao tiếp, tặng quà hoặc mua bán. Ví dụ: Sáng NPC ở tiệm làm việc, tối ra quán ăn, đêm về nhà ngủ. Khi trời mưa, họ sẽ ở trong nhà thay vì ra công viên.
- Lập trình (Cách Unity xử lý): Thiết lập một bảng thời khóa biểu cho mỗi NPC. Khi bộ đếm giờ báo đến mốc thời gian quy định, NPC sẽ tự động tính toán đường đi tối ưu nhất trên bản đồ để di chuyển tới điểm đích, tránh các chướng ngại vật như cây cối, đá hay nhà cửa.
### Hệ thống Túi đồ và Vật phẩm
- Thiết kế (Luật chơi & Trải nghiệm): Người chơi nhặt nông sản, gỗ, đá và quản lý chúng trong túi đồ. Các vật phẩm giống nhau có thể xếp chồng lên nhau để tiết kiệm diện tích. Người chơi có thể kéo thả để sắp xếp vị trí vật phẩm.
- Lập trình (Cách Unity xử lý): Tạo ra một danh sách lưu trữ thông tin vật phẩm trong túi đồ. Khi người chơi kéo thả trên giao diện UI, hệ thống sẽ hoán đổi vị trí của các vật phẩm đó trong danh sách dữ liệu để đảm bảo hiển thị chính xác.
## 3. LƯU TRỮ VÀ CÂN BẰNG CHỈ SỐ GAME
### Cân bằng chỉ số game
- Thiết kế game sẽ nhập các chỉ số như máu, năng lượng tiêu hao, giá mua bán của nông sản vào một bảng tính trực tuyến.
Lập trình viên sẽ dùng công cụ để chuyển các số liệu này vào game một cách tự động, giúp việc điều chỉnh độ khó của game trở nên cực kỳ nhanh chóng.
- Lưu trữ màn chơi (Save/Load): Game sẽ tự động lưu lại khi người chơi cho nhân vật đi ngủ để kết thúc ngày.
- Lập trình viên sẽ gom toàn bộ thông tin về túi đồ, trạng thái các ô đất, vị trí nhân vật và thời gian hiện tại để ghi lại thành một file lưu trữ trên máy. Khi người chơi mở lại game, file này sẽ được đọc để khôi phục thế giới đúng như lúc lưu.
## 4. QUY TRÌNH PHỐI HỢP VÀ ĐẶT TÊN TÀI NGUYÊN
### Để tránh việc hình ảnh hoặc âm thanh đưa vào game bị lỗi, cả thiết kế game và lập trình viên thống nhất quy tắc đặt tên tài nguyên như sau:

- Mẫu nhân vật và quái vật: Bắt đầu bằng tiền tố Char_ (Ví dụ: Char_NongDan, Char_ThoRen).
- Vật phẩm nhặt được trên đất: Bắt đầu bằng tiền tố Item_ (Ví dụ: Item_HatGiongCaChua, Item_Go).
- Hình ảnh sprite giao diện hoặc vật phẩm: Bắt đầu bằng tiền tố Sprite_ (Ví dụ: Sprite_RiuSat).
- Tất cả hình ảnh 2D khi xuất file phải ở định dạng ảnh sắc nét (Pixel Art) và gom chung lại thành một tấm ảnh lớn để tối ưu hóa hiệu năng hiển thị của game.
