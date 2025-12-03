# EduToyRent — Hệ thống cho thuê đồ chơi (Java + JSP/Servlet)

**Mô tả ngắn**: Đây là một ứng dụng web Java (JSP + Servlet) để đăng bán/thuê đồ chơi giáo dục, quản lý đơn hàng, giỏ hàng, thanh toán và gửi email thông báo. Dự án được phát triển bằng NetBeans (Ant-based) và dùng cơ sở dữ liệu Microsoft SQL Server.

**Công nghệ chính**:
- **Ngôn ngữ**: Java (Jakarta Servlet API - khai báo `jakarta.servlet`)
- **Giao diện**: JSP
- **Server**: Apache Tomcat (hỗ trợ Jakarta namespace, khuyến nghị Tomcat 10+)
- **Build**: Ant / NetBeans project (`build.xml`, `nbproject/`)
- **DB**: Microsoft SQL Server (JDBC)
- **Email**: SMTP qua Jakarta Mail (sử dụng `src/java/Util/resetService.java`)

**Cấu trúc chính của dự án (tóm tắt)**:
- `src/java/` : source Java (Controller, DAO, Entity, DB, Util)
- `web/` và `build/web/` : mã JSP + static (frontend)
- `ScriptDB_EduToyRent_MVC.sql` : script tạo database + dữ liệu mẫu
- `nbproject/`, `build.xml` : cấu hình NetBeans/Ant project

Yêu cầu trước khi chạy (local):
- Java JDK 11+ (khuyến nghị 17+)
- Apache Tomcat 10.x (do project dùng Jakarta API), hoặc Tomcat tương thích Jakarta
- Microsoft SQL Server (cài hoặc dùng Docker)
- Microsoft JDBC Driver for SQL Server (đặt file `.jar` vào `WEB-INF/lib` hoặc Tomcat `/lib`)

Hướng dẫn cài đặt và chạy (chi tiết):

1) Thiết lập Cơ sở dữ liệu
- Mở SQL Server Management Studio hoặc công cụ quản lý SQL Server.
- Tạo database mới hoặc dùng script tạo sẵn: chạy `ScriptDB_EduToyRent_MVC.sql` (tập lệnh tạo database `EduToyRend` và dữ liệu mẫu).
- Đảm bảo SQL Server cho phép kết nối TCP (port 1433) và có tài khoản DB tương ứng.

2) Cấu hình kết nối JDBC
- Mở file `src/java/DB/DBUtils.java`.
- Tìm các biến sau và sửa cho phù hợp môi trường của bạn:
  - `DB_Name`, `DB_User_Name`, `DB_Password` và `url`.
  - Ví dụ mặc định trong mã:
    - `DB_User_Name = "sa"`
    - `DB_Password = "12345"`
    - `url = "jdbc:sqlserver://localhost:1433;databaseName=EduToyRend"`
- Nếu bạn muốn sử dụng cấu hình JNDI (DataSource) thay vì hard-code, thay đổi theo `context.xml` và sử dụng lookup trong mã (khuyến nghị cho sản xuất).

3) Thêm Microsoft JDBC driver
- Tải `mssql-jdbc-<version>.jar` từ Microsoft và copy vào `web/WEB-INF/lib/` (hoặc `build/web/WEB-INF/lib/`) hoặc Tomcat `/lib`.

4) Cấu hình SMTP / Email
- File chứa cấu hình gửi email: `src/java/Util/resetService.java`.
- Các giá trị hard-code hiện tại (phải thay nếu chạy local):
  - `from` (email gửi đi), `password` (mật khẩu hoặc app-password), `mail.smtp.host`, `mail.smtp.port`.
- Ví dụ file chứa:
  - `from = "quyenttse170347@fpt.edu.vn"`
  - `password = "h m c v x p q h g v b o b b o r"` (đây có vẻ là app password)
  - `mail.smtp.host = "smtp.gmail.com"`
  - `mail.smtp.port = "587"`
- Đổi `from` và `password` sang thông tin email của bạn (nếu dùng Gmail, tạo App Password và dùng mật khẩu ứng dụng). Hoặc thay đổi host/port nếu dùng dịch vụ SMTP khác.

5) Cấu hình Tomcat / context path
- File `web/META-INF/context.xml` hiện chứa `<Context path="/EduToyRent"/>`.
- Khi deploy vào Tomcat, bạn có thể để mặc định hoặc sửa `path` theo mong muốn. Nếu deploy dưới dạng WAR tên `EduToyRent.war`, Tomcat sẽ map tự động.

6) Mở project bằng NetBeans hoặc build bằng Ant
- Cách nhanh (NetBeans):
  - Mở NetBeans -> `File` -> `Open Project` -> chọn thư mục dự án (thư mục chứa `nbproject`).
  - Chỉnh sửa `DBUtils.java` và `resetService.java` như ở trên rồi `Run` trên Tomcat server đã cấu hình.
- Cách qua Ant (command line):
  - Mở PowerShell, cd vào thư mục dự án.
  - Chạy `ant` (nếu ant được cài). Lệnh build có thể tạo `dist/` hoặc WAR theo cấu hình NetBeans.

Các file bạn cần chỉnh khi pull về (danh sách và chỗ sửa):
- `src/java/DB/DBUtils.java` :
  - Thay `DB_User_Name`, `DB_Password`, và `url` sang thông tin DB của bạn.
- `src/java/Util/resetService.java` :
  - Thay `from` (email gửi), `password` (mật khẩu/app password), `mail.smtp.*` nếu cần.
- `web/META-INF/context.xml` :
  - `path` nếu bạn muốn đổi context path khi deploy (không bắt buộc).
- `nbproject/private/private.properties` :
  - Chứa đường dẫn Tomcat/IDE local của tác giả; không cần commit. (Đã được bỏ vào `.gitignore`)

Các chỗ hard-code khác đã thấy (cần lưu ý khi chạy):
- Trong một số email templates có đường dẫn tĩnh `http://localhost:8084/EduToyRent/` — nếu bạn deploy ở cổng hoặc context khác, sửa lại đường dẫn này trong mã (ví dụ trong `SendEmailPayment`, `SendEmailProductRent`, `testEmail`).
- Có hotline hard-code `0999999999` trong email template (ở `SendEmailProductRent`) nếu cần đổi thông tin liên hệ.

Gợi ý cải tiến bảo mật (không bắt buộc ngay):
- Không lưu mật khẩu DB/SMTP trực tiếp trong source. Thay bằng: environment variables, properties file nằm ngoài repo, hoặc JNDI resource trong Tomcat (context.xml) và lookup trong mã.
- Đặt `nbproject/private/` vào `.gitignore` (đã làm) để tránh commit cấu hình local của IDE.

Gỡ lỗi (tips):
- Lỗi kết nối DB: kiểm tra SQL Server đang chạy, cổng 1433 mở và user/password chính xác; đảm bảo JDBC driver nằm trong classpath.
- Lỗi gửi email: kiểm tra host/port, xác thực, và nếu dùng Gmail cần App Password; kiểm tra logs Tomcat để xem exception từ Jakarta Mail.

# EduToyRent_MVC2
