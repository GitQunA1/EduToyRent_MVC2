
select * from dbo.[User]
select * from dbo.[Customer]
select * from dbo.Cart



SELECT COALESCE(MAX(UID), 99999999) + 1 AS NextUID FROM [User]


IF EXISTS (SELECT name FROM sys.databases WHERE name = 'EduToyRend')
BEGIN
    USE master;
    ALTER DATABASE EduToyRend SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EduToyRend;
END

CREATE DATABASE EduToyRend;
GO

USE EduToyRend;
GO

CREATE TABLE [User] (
  [UID] integer PRIMARY KEY,
  [Email] nvarchar(255),
  [Phone] nvarchar(255),
  [Password] nvarchar(255),
  [Role] nvarchar(255)
)
GO

CREATE TABLE [Customer] (
  [UID] integer,
  [Avatar] nvarchar(255),
  [Name] nvarchar(255),
  [Sex] nvarchar(255),
  [Birthday] date,
  [Address] text,
  [Membership] nvarchar(255)
)
GO

CREATE TABLE [Staff] (
  [UID] integer,
  [SID] integer,
  [Avatar] nvarchar(255),
  [Name] nvarchar(255),
  [Sex] nvarchar(255),
  [Birthday] date,
  [Office] nvarchar(255)
)
GO

CREATE TABLE [Shop_Owner] (
  [UID] integer,
  [SOID] integer PRIMARY KEY,
  [Avatar] nvarchar(255),
  [Name] nvarchar(255),
  [Citizen_code] nvarchar(255),
  [Warehouse] nvarchar(255),
  [Type] nvarchar(255)
)
GO

CREATE TABLE [Product] (
  [PID] integer PRIMARY KEY,
  [SOID] integer,
  [Image] text,
  [Name] nvarchar(255),
  [Price] float,
  [QSell] integer,
  [QRent] integer,
  [Age] integer,
  [Brand] nvarchar(255),
  [Origin] nvarchar(255),
  [Description] nvarchar(max),
  [Category] nvarchar(255),
  [Status] nvarchar(255)
)
GO

CREATE TABLE [Income] (
  [SOID] integer,
  [PID] integer,
  [IncSell] float,
  [QSell] integer,
  [IncRent] float,
  [QRent] integer,
  [Date] date
)
GO

CREATE TABLE [Cart] (
  [UID] integer,
  [PID] integer,
  [Quantity] integer,
  [Total] float,
  [RentTime] integer
)
GO

CREATE TABLE [Payment] (
  [PAID] integer PRIMARY KEY,
  [OID] integer,
  [Amount] float,
  [Method] nvarchar(255),
  [Date] date
)
GO

CREATE TABLE [PDetail] (
  [PDID] integer PRIMARY KEY,
  [PAID] integer,
  [ODID] integer,
  [Price] float,
  [points] float,
  [Deposit] float,
  [Refund_Shop] float,
  [Refund_Cus] float,
  [platform_fee] float,
  [Date] date,
  [Status] nvarchar(255)
)
GO

CREATE TABLE [Comment] (
  [CID] integer PRIMARY KEY,
  [UID] integer,
  [PID] integer,
  [ODID] integer,
  [Comment] text,
  [Date] date,
  [satisfaction] nvarchar(255),
  [image] nvarchar(255)
)
GO

CREATE TABLE [Reply] (
  [CID] integer,
  [SOID] integer,
  [comment] nvarchar(255),
  [Date] date,
  [image] nvarchar(255)
)
GO

CREATE TABLE [Order] (
  [OID] integer IDENTITY(1,1) PRIMARY KEY,
  [UID] integer,
  [CreationDate] date,
  [Price] float
)
GO

CREATE TABLE [Order_Detail] (
  [ODID] integer PRIMARY KEY,
  [OID] integer,
  [SOID] integer,
  [PID] integer,
  [Quantity] integer,
  [TimeRent] integer,
  [DateStart] date,
  [DateEnd] date,
  [Status] nvarchar(255)
)
GO

CREATE TABLE [Pos_Report] (
  [ODID] integer,
  [Name] nvarchar(255),
  [Quantity] int,
  [Overall] nvarchar(255),
  [External] nvarchar(255),
  [mobile_parts] nvarchar(255),
  [feature] nvarchar(255),
  [accessory] nvarchar(255),
  [image] nvarchar(255),
  [Description] nvarchar(255),
  [NoDamage] integer,
  [HalfDamage] integer,
  [FullDamage] integer,
  [Date] date
)
GO

CREATE TABLE [Pre_Repost] (
  [ODID] integer,
  [Name] nvarchar(255),
  [Quantity] integer,
  [Overall] nvarchar(255),
  [External] nvarchar(255),
  [mobile_parts] nvarchar(255),
  [feature] nvarchar(255),
  [accessory] nvarchar(255),
  [image] nvarchar(255),
  [Description] nvarchar(255),
  [Date_report] date
)
GO

CREATE TABLE [Fee_Policy] (
  [Platform] integer,
  [Week] integer,
  [BiWeek] integer,
  [Month] integer
)
GO

ALTER TABLE [Staff] ADD FOREIGN KEY ([UID]) REFERENCES [User] ([UID])
GO

ALTER TABLE [Customer] ADD FOREIGN KEY ([UID]) REFERENCES [User] ([UID])
GO

ALTER TABLE [Shop_Owner] ADD FOREIGN KEY ([UID]) REFERENCES [User] ([UID])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([SOID]) REFERENCES [Shop_Owner] ([SOID])
GO

ALTER TABLE [Income] ADD FOREIGN KEY ([SOID]) REFERENCES [Shop_Owner] ([SOID])
GO

ALTER TABLE [Income] ADD FOREIGN KEY ([PID]) REFERENCES [Product] ([PID])
GO

ALTER TABLE [Cart] ADD FOREIGN KEY ([UID]) REFERENCES [User] ([UID])
GO

ALTER TABLE [Cart] ADD FOREIGN KEY ([PID]) REFERENCES [Product] ([PID])
GO

ALTER TABLE [Order] ADD FOREIGN KEY ([UID]) REFERENCES [User] ([UID])
GO

ALTER TABLE [Order_Detail] ADD FOREIGN KEY ([OID]) REFERENCES [Order] ([OID])
GO

ALTER TABLE [PDetail] ADD FOREIGN KEY ([ODID]) REFERENCES [Order_Detail] ([ODID])
GO

ALTER TABLE [Payment] ADD FOREIGN KEY ([OID]) REFERENCES [Order] ([OID])
GO

ALTER TABLE [Order_Detail] ADD FOREIGN KEY ([SOID]) REFERENCES [Shop_Owner] ([SOID])
GO

ALTER TABLE [Order_Detail] ADD FOREIGN KEY ([PID]) REFERENCES [Product] ([PID])
GO

ALTER TABLE [Comment] ADD FOREIGN KEY ([UID]) REFERENCES [User] ([UID])
GO

ALTER TABLE [Comment] ADD FOREIGN KEY ([PID]) REFERENCES [Product] ([PID])
GO

ALTER TABLE [Comment] ADD FOREIGN KEY ([ODID]) REFERENCES [Order_Detail] ([ODID])
GO

ALTER TABLE [PDetail] ADD FOREIGN KEY ([PAID]) REFERENCES [Payment] ([PAID])
GO

ALTER TABLE [Pos_Report] ADD FOREIGN KEY ([ODID]) REFERENCES [Order_Detail] ([ODID])
GO

ALTER TABLE [Pre_Repost] ADD FOREIGN KEY ([ODID]) REFERENCES [Order_Detail] ([ODID])
GO

ALTER TABLE [Reply] ADD FOREIGN KEY ([CID]) REFERENCES [Comment] ([CID])
GO

ALTER TABLE [Reply] ADD FOREIGN KEY ([SOID]) REFERENCES [Shop_Owner] ([SOID])
GO



INSERT INTO [User] (UID, Email, Phone, Password, Role) VALUES
(10000001, N'owner1@shop.com', N'0912345678', N'1', N'O'),
(10000002, N'owner2@shop.com', N'0922345678', N'1', N'O'),
(10000003, N'owner3@shop.com', N'0932345678', N'1', N'O'),
(10000004, N'customer1@shop.com', N'0942345678', N'1', N'C'),
(10000005, N'customer2@shop.com', N'0952345678', N'1', N'C'),
(10000006, N'staff1@shop.com', N'0962345678', N'1', N'S');


INSERT INTO [Customer] (UID, Avatar, Name, Sex, Birthday, Address, Membership) VALUES
(10000001, N'avatar_owner1.png', N'Phạm Thị D', N'Female', N'1985-10-20', N'Số 10, Đường Phạm Văn Đồng, Quận Bắc Từ Liêm, Hà Nội', N'0'),
(10000002, N'avatar_owner2.png', N'Hoàng Văn E', N'Male', N'1980-12-05', N'Số 25, Đường Nguyễn Tất Thành, Quận Hải Châu, Đà Nẵng', N'0'),
(10000003, N'avatar_owner3.png', N'Đinh Thị F', N'Female', N'1988-03-15', N'Số 50, Đường Nguyễn Văn Linh, Quận 7, TP. Hồ Chí Minh', N'0'),
(10000004, N'avatar_cust1.png', N'Nguyễn Văn A', N'Male', N'1990-05-15', N'123 Đường Trần Hưng Đạo, Quận 1, TP. Hồ Chí Minh', N'20000'),
(10000005, N'avatar_cust2.png', N'Trần Thị B', N'Female', N'1992-07-10', N'456 Đường Lê Lợi, Quận 3, TP. Hồ Chí Minh', N'0');



INSERT INTO [Staff] (UID, SID, Avatar, Name, Sex, Birthday, Office) VALUES
(10000006, 20000001, N'avatar_staff1.png', N'Lê Văn C', N'Male', N'1985-11-22', N'Văn phòng Hà Nội');


INSERT INTO [Shop_Owner] (UID, SOID, Avatar, Name, Citizen_code, Warehouse, Type) VALUES
(10000001, 30000001, N'avatar_owner1.png', N'Khu Vườn Sáng Tạo', N'0123456789', N'Số 10, Đường Phạm Văn Đồng, Quận Bắc Từ Liêm, Hà Nội', N'cá nhân'),
(10000002, 30000002, N'avatar_owner2.png', N'Vương Quốc Đồ Chơi', N'9876543210', N'Số 25, Đường Nguyễn Tất Thành, Quận Hải Châu, Đà Nẵng', N'công ty'),
(10000003, 30000003, N'avatar_owner3.png', N'Chơi Là Học', N'1234567890', N'Số 50, Đường Nguyễn Văn Linh, Quận 7, TP. Hồ Chí Minh', N'cửa hàng');

INSERT INTO [Product] (PID, SOID, Image, Name, Price, QSell, QRent, Age, Brand, Origin, Description, Category, Status) VALUES
(1000000001, 30000001, N'https://thebookland.vn/contents/1670045337198_Mathlink%20Cubes%20Numberblocks%20%201-10%20(1).jpg', N'Bộ học toán Mathlink Cubes Numberblocks số đếm 1-10', 650000, 20, 30, 3, N'Educational Insights', N'Mỹ', N'Numberblocks là chương trình truyền hình đạt hàng loạt giải thưởng danh giá giúp trẻ nhỏ học toán một cách sinh động và dễ dàng. Mathlink Cubes Numberblocks 1-10 Activity Set dựa trên series nổi tiếng này để sáng tạo nên bộ trò chơi học toán cho trẻ với các khối số đầy màu sắc nhằm giúp trẻ em xây dựng các kỹ năng toán học quan trọng trong những năm đầu đời.', N'Ttoán học', N'Thành công'),
(1000000002, 30000001, N'https://thebookland.vn/images/1689223695931_BrainBolt%20Genius%20(2).jpg', N'Máy chơi luyện trí nhớ và giải đố: BrainBolt® Genius (phiên bản nâng cao)', 702000, 20, 30, 7, N'Educational Insights', N'Mỹ', N'Brainbolt Genius thiết kế như máy chơi game cầm tay với các nút chức năng nằm ở 2 cạnh quanh máy, cùng chế độ 1 người chơi và 2 người chơi. Trò chơi yêu cầu người chơi ghi nhớ chuỗi ánh sáng và lặp lại chúng theo thứ tự để không phá vỡ mô hình.', N'Giải đố', N'Thành công'),
(1000000003, 30000001, N'https://down-vn.img.susercontent.com/file/f6712a6a3922417db99b06295074d8a5.webp', N'Bộ thẻ học thông minh 16 chủ đề 416 thẻ song ngữ Anh Việt cho bé Glen Doman', 70000, 20, 30, 1, N'OEM', N'Việt Nam', N'Bộ 416 thẻ học thông minh song ngữ Việt – Anh cho bé yêu gồm 16 chủ đề phong phú và đa dạng, hứa hẹn không những sẽ khiến trẻ thêm động lực để tìm tòi, học hỏi về thế giới xung quanh mà còn bổ sung thêm vốn từ vựng, giúp bé thêm tự tin trong bộ môn tiếng Anh quan trọng sau này.', N'Ngôn ngữ', N'Thành công'),
(1000000004, 30000001, N'https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-lepg7377ij039f.webp', N'Bảng Vẽ Xếp Hình Nam Châm Thế Hệ Mới.Đồ Chơi Giáo Dục Xếp Hình Nam Châm, Bảng Vẽ Bút Bi Nam Châm Từ Tính Cho Bé', 56000, 20, 30, 3, N'không', N'Việt Nam', N'Bảng vẽ nam châm được làm bằng ABS và thép thân thiện với môi trường, từ trường có đặc tính nhất định, các hạt từ tính, các hạt từ tính sẽ không bị phai hoặc phai màu khỏi từ và độ bền.\nVẽ với các hạt từ tính này có thể kích thích tiềm năng rèn luyện trẻ, cải thiện khả năng và kỹ năng thực tế, đồng thời tạo nền tảng cho nghiên cứu.\n Với các màu sắc khác nhau, trẻ có thể cải thiện nhận thức về màu sắc và màu sắc của chúng khi chúng chơi, kích thích trí tưởng tượng của chúng và tạo ra trí tưởng tượng của chúng.\nSử dụng các từ để vẽ hình dạng, chữ cái và nhiều đồ họa khác nhau trên bề mặt, đơn giản và thú vị.', N'Nghệ thuật', N'Thành công'),
(1000000005, 30000001, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lj6kl43gbytof9.webp', N'Bộ đồ chơi nấu ăn nhà bếp cao cấp cho bé gái bé trai có dùng pin, quà tặng sinh nhật cho bé, đồ chơi thông minh', 180000, 20, 30, 2, N'không', N'Việt Nam', N'Sử dụng chất liệu an toàn sức khỏe, thân thiện với môi trường. - Kích thước các chi tiết phù hợp với tay cầm của trẻ.\nBếp từ sử dụng pin, có 2 chế độ nấu ăn, phát ra âm thanh rất giống với thực tế.\nTăng tinh thần sáng tạo của trẻ.\nThiết kế bo tròn, nhẵn bóng không lo bé bị thương.\nThiết kế thông minh, như trải nghiệm đồ nấu ăn thật.\nMô phỏng bếp từ thông minh với hiệu ứng âm thanh\nNắp nồi áp suất có thể xoay để mở, van an toàn. \nThông qua trò chơi, cho bé trải nghiệm niềm vui nấu nướng thực tế.', N'Mô phỏng', N'Thành công'),
(1000000006, 30000001, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxStI76vRJEMadDamOLDV3VBD8WIrc2xqcsQ&s', N'Tranh ghép hình cho bé bằng gỗ trí tuệ 30 mảnh - đồ chơi xếp hình', 20000, 20, 30, 4, N'không', N'Việt Nam', N'Đồ chơi ghép hình là một trong những món không thể thiếu trong tủ đồ chơi của bé. Chắc hẳn bạn đã biết trong giai đoạn từ 3 đến 6 tuổi là giai đoạn vàng để bé phát triển trí tuệ và các điểm mạnh của bé./nBộ đồ chơi tranh ghép hình 30 miếng ghép được thiết kế với 30 mảnh ghép khớp với nhau để bé ráp các mảnh ghép lại hoàn thiện bức tranh về các chủ đề động vật, hoạt hình...', N'Xếp hình', N'Thành công'),
(1000000007, 30000001, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsxlendswhi120@resize_w450_nl.webp', N'Bảng vẽ tự xóa BABYTREE màn hình LCD thông minh không bụi mịn dễ dàng sử dụng an toàn cho bé', 140000, 20, 30, 3, N'không', N'Việt Nam', N'Màn hình LCD chất lượng cao: Màn hình LCD của Babytree mang lại hình ảnh sắc nét và màu sắc tươi sáng, tạo điều kiện thuận lợi cho việc vẽ và viết của bé.Tính di động và nhẹ nhàng: Với thiết kế nhẹ nhàng và di động, bé có thể dễ dàng mang theo bảng vẽ này bất cứ nơi đâu, từ phòng khách đến xe ô tô hoặc khi đi du lịch.Chức năng tự xóa tiện lợi: Bé có thể dễ dàng xóa bức tranh hoặc thông điệp của mình chỉ bằng cách nhấn nút, giúp tiết kiệm thời gian và giấy. Pin tiết kiệm năng lượng: Sản phẩm được trang bị pin tiết kiệm năng lượng, giúp kéo dài thời gian sử dụng và tiết kiệm chi phí thay pin.Giúp phát triển não phải của bé. Đầu bút mượt, không bụi mịn, nét bút nhiều màu sắc an toàn cho sức khỏe của bé', N'Nghệ thuật', N'Thành công'),
(1000000008, 30000001, N'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lu0evrra1e2sf7@resize_w450_nl.webp', N'WISLEO Đồ chơi xếp hình hiding block Logic xếp khối nhựa theo thẻ bài câu đố logic giúp phát triển trí phát triển trí tuệ của bé', 66000, 20, 30, 3, N'không', N'Trung Quốc', N'Khối xây dựng ẩn này là một hộp màu, vật liệu là nhựa, không phải bằng gỗ và nó chứa 1 hướng dẫn sử dụng (chứa 150 câu hỏi) + 16 khối xây dựng + 1 khay', N'Giải đố', N'Thành công'),
(1000000009, 30000001, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd6x-lve6azjkdfye1d@resize_w450_nl.webp', N'Tranh Đính Đá Mini Nhiều Hình Thủ Công Tự Làm Có Khung Trang Trí', 10000, 20, 30, 6, N'không', N'Việt Nam', N'Chất liệu: Canvas + đá resin\n - Loại đá: Đá đính hình dạng đặc biệt\n- Kích thước sản phẩm: 15cmx15cm\n- Kích thước khung ảnh: 17,5cmx17,5cm', N'Nghệ thuật', N'Thành công'),
(1000000010, 30000001, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljyzknlh90xu82@resize_w450_nl.webp', N'Bộ mỹ phẩm đồ chơi trang điểm 33 món không độc hại thích hợp cho bé', 98000, 20, 30, 4, N'không', N'Việt Nam', N'Bộ trang điểm cho trẻ em bao gồm Son bóng * 6; Phấn mắt * 6; Phấn má hồng* 6; Cọ trang điểm * 3; Sơn móng tay * 3; Son môi * 2; Phụ kiện móng tay * 2; Miếng dán móng tay * 1; Món trang điểm long lanh * 2; Sticker kim cương; Túi vuông nhỏ * 1. Bộ mỹ phẩm này là một ước mơ cho các bé gái, món quà tuyệt vời cho bất kỳ dịp nào và món quà sinh nhật / giáng sinh hoàn hảo cho các bé gái.Chất liệu KHÔNG ĐỘC TỐ, CÓ THỂ LAU CHÙI, AN TOÀN DA BÉ: vui chơi an toàn luôn là mối quan tâm hàng đầu của chúng tôi. Không gây hại và nhẹ nhàng cho làn da mỏng manh của bé gái và có thể dễ dàng làm sạch bằng nước mà không có cặn có thể đáp ứng mọi nhu cầu của cha mẹ', N'Mô phỏng', N'Thành công'),
(1000000011, 30000002, N'https://s.alicdn.com/@sc04/kf/H980bc265c5ae43eca0b4b558db8e2d13o.png_720x720q50.jpg', N'Vật Liệu Montessori Đồ Chơi Giáo Dục Hỗ Trợ Giảng Dạy Cho Địa Lý Thiết Bị Globe-Thế Giới Các Bộ Phận', 585000, 20, 30, 2, N'Adena Montessori', N'Trung Quốc', N'Đường kính 16.5cm\nKích thước 62*47*3.8cm', N'Địa lý', N'Thành công'),
(1000000012, 30000002, N'https://s.alicdn.com/@sc04/kf/H980bc265c5ae43eca0b4b558db8e2d13o.png_720x720q50.jpg', N'Xe cứu hỏa Abrick ECOIFFIER 003290', 529000, 20, 30, 4, N'ECOIFFIER', N'Pháp', N'Xe cứu hỏa Ecoiffier Abrick bao gồm : 1 xe cứu hỏa lớn, 1 xe hơi nhỏ, 3 nhân vật lính cứu hỏa.', N'Mô phỏng', N'Thành công'),
(1000000013, 30000002, N'https://img.lazcdn.com/g/p/4ce91789d630a492ab1fbb7c45a4ba1d.jpg_720x720q80.jpg_.webp', N'Kính Viễn Vọng Ngoài Trời Kính Viễn Vọng Khúc Xạ Thiên Văn Trong Suốt Cao Đồ Chơi Giảng Dạy Khoa Học Với Giá Ba Chân Thị Kính Phóng Đại 20X 30X 40X Cho Trẻ Em', 611000, 20, 30, 5, N'không', 'Việt Nam', N'Kính thiên văn thiên văn cho trẻ em với ống kính quang học nhiều lớp, hình ảnh rõ nét.', N'Thiên văn', N'Thành công'),
(1000000014, 30000002, N'https://www.mykingdom.com.vn/cdn/shop/files/6024397.jpg?v=1721987083&width=1100', N'Bộ cát, dụng cụ và khay chơi cát KINETIC SAND 6024397', 599000, 20, 30, 3, N'KINETIC SAND', N'Thuy Điển', N'Bắt đầu cuộc phiêu lưu vào thế giới cổ tích với Bộ cát, dụng cụ và khay chơi cát.', N'Khoa học', N'Thành công'),
(1000000015, 30000002, N'https://www.mykingdom.com.vn/cdn/shop/products/s-l640_1_0f733a51-5177-47c7-a628-daf3124d9e6d.jpg?v=1684886078&width=990', N'Đồ chơi xe lắp ráp ô tô Lamborghini Roadster tỉ lệ 1:24 MAISTO MT39900', 599000, 20, 30, 6, N'MAISTO', N'Trung Quốc', N'Đồ chơi Maisto xe lắp ráp ô tô Lamborghini Roadster tỉ lệ 1:24.', N'Kĩ thuật', N'Thành công'),
(1000000016, 30000002, N'https://www.mykingdom.com.vn/cdn/shop/products/zj16-pk_1_1.jpg?v=1684995393&width=1100', N'Bảng vẽ thông minh size 10 inch Hồng COOLKIDS ZJ16', 399000, 20, 30, 3, N'COOLKIDS', N'Trung Quốc', N'Sản phẩm có chất liệu an toàn, được thiết kế tỉ mỉ, cẩn thận, không gây hại cho sức khỏe của bé.', N'Khoa học', N'Thành công'),
(1000000017, 30000002, N'https://www.mykingdom.com.vn/cdn/shop/files/DS1059H-03-10_2.jpg?v=1715065631&width=990', N'Xếp hình 3D NASA: Tên lửa vũ trụ Saturn V - Apollo PUZZLES DS1059H', 359000, 20, 30, 8, N'PUZZLES', N'Trung Quốc', 'Đồ chơi trẻ em xếp hình 3D NASA: Tên lửa vũ trụ Saturn V Apollo.', N'xếp hình', N'Thành công'),
(1000000018, 30000002, N'https://www.mykingdom.com.vn/cdn/shop/products/8852rb_1__1.jpg?v=1685096880&width=990', N'Đồ Chơi Rubik 3x3 SPIN GAMES 8852RB', 319000, 20, 30, 8, 'SPIN GAMES', N'Trung Quốc', N'Rubik là một trò chơi trí tuệ giải khối lập phương thú vị và hấp dẫn.', N'Giải đố', N'Thành công'),
(1000000019, 30000002, N'https://www.mykingdom.com.vn/cdn/shop/products/mykingdom-6041518_3.jpg?v=1714013265&width=990', N'Trò chơi rút gỗ SPIN GAMES 6041518', 189000, 20, 30, 6, N'SPIN GAMES', N'Trung Quốc', N'Gồm 48 thanh gỗ chắc chắn, được mài nhẵn không góc nhọn, không bị xước, an toàn cho trẻ nhỏ.', N'Giải đố', N'Thành công'),
(1000000020, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/files/do-choi-robot-devo-thong-thai-dieu-khien-tu-xa-vecto-vt2108_3.jpg?v=1713774609&width=990', N'Đồ chơi Robot DEVO thông thái điều khiển từ xa VECTO VT2108', 899000, 20, 30, 5, N'VECTO', N'Trung Quốc', N'Đồ chơi Robot DEVO thông thái điều khiển từ xa với nhiều chức năng hiện đại.', N'Kĩ thuật', N'Thành công'),
(1000000021, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/products/vtk46_b179c3fb-8388-4898-a80f-d0e8d49abc96.jpg?v=1707221339&width=990', N'Đồ chơi Robot Patrol Man điều khiển từ xa VECTO VTK46', 799000, 20, 30, 3, N'VECTO', N'Trung Quốc', N'Đồ chơi Robot Patrol Man điều khiển từ xa VECTO – Người máy tiên tiến đa chức năng cho bé vừa học vừa chơi, khám phá thế giới công nghệ tương lai cực vui...', N'Kĩ thuật', N'Thành công'),
(1000000022, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/products/BRU02526_1.jpg?v=1684841812&width=990', N'Đồ chơi mô hình tỷ lệ 1:16 xe cảnh sát Jeep và người BRUDER BRU02526', 1699000, 20, 30, 4, N'BRUDER', N'Đức', N'Mô hình xe cảnh sát Jee BRU02526 gồm các đặc điểm và chức năng sau đây:\n+ Mô hình xe công trình này mô phỏng một cách tinh xảo và chính xác dựa trên xe thật theo tỉ lệ 1:16\n+ Chất liệu nhựa và cao su cao cấp, độ bền cao\n + Xe có thể tháo dỡ phần mái, nắp ca-pô, cửa sau và 4 cửa của xe có thể đóng mở được.\n + Chở được 4 người ở hàng ghế phía sau, có thể tháo để có thể tạo thế không gian cho việc chở các linh kiện khác.\n + Nắp ca-pô mở ra, có ngăn đựng nắp ca-pô có thể gập lại để có cái nhìn chi tiết về khối động cơ \n Sản phẩm mang lại các giá trị tuyệt vời dành cho trẻ nhỏ:\n + Phát triển các kỹ năng vận động của trẻ thông qua việc khám phá và sử dụng các chức năng của xe\n + Khuyến khích trẻ tìm hiểu về các ngành nghề liên quan đến các mẫu xe có thật trong đời sống\n Bố mẹ có thể kết hợp các mẫu xe cứu hỏa, xe rác, xe cảnh sát,… để lồng ghép các bài học về kỹ năng sống, ước mơ, các kiến thức cơ bản trong cuộc sống,…', N'Mô phỏng', N'Thành công'),
(1000000023, 30000003, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_213680.jpg', N'Seri Phòng Thí Nghiệm Nhỏ STEM 1007 - Con Tìm Hiểu Hệ Mặt Trời (Vật Lý)', 129000, 20, 30, 6, N'Shenzhen', N'Trung Quốc', N'Seri Phòng Thí Nghiệm Nhỏ STEM 1007 - Con Tìm Hiểu Hệ Mặt Trời (Vật Lý) \nLà bộ đồ chơi khoa học thực hành thú vị dành cho trẻ em giúp bé lắp ráp mô hình của riêng mình về hệ mặt trời.\nHãy để bộ hệ thống năng lượng mặt trời này truyền cảm hứng cho bé.\nBé hãy sơn sản phẩm cũng như thêm các điểm nổi bật để tạo hiệu ứng phát sáng bằng cách sử dụng ánh sáng trong lớp sơn tối và xem các hành tinh phát sáng.\nTừ đó bé có thể tìm hiểu về các hành tinh, ngôi sao và xem cách chúng di chuyển cùng nhau.\nVật liệu có độ bóng mịn và các cạnh bo tròn mềm mại\nSản phẩm sử dụng thành phần nhựa PE, giấy được kiểm định nghiêm ngặt về độ an toàn.\nXây dựng hình dạng ban đầu, số lượng, kỹ năng nhận dạng màu sắc.\nLàm giàu kiến ​​thức thiên văn', N'Thiên văn', N'Thành công'),
(1000000024, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/files/6d57adb11f0f8e09f133ad587b2f7854.jpg?v=1706859146&width=990', N'Đồ chơi máy chiếu Thiên văn học STEAM 1423000801', 799000, 20, 30, 6, N'STEAM', N'Trung Quốc', N'- Đồ chơi khoa học STEAM hàng đầu nước Mỹ của nhãn hàng DISCOVERY\n#MINDBLOWN, hợp tác cùng kênh truyền hình nổi tiếng DISCOVERY, đem lại cho bé những trải nghiệm khoa học ứng dụng vừa học, vừa chơi.\n- Máy chiếu Thiên văn học giúp bé thoải mái khám phá những điều kỳ diệu trong vũ trụ: các Ngôi sao, Hành tinh bí ẩn, Thiên hà rộng lớn hay Tàu không gian siêu đẳng ngay tại phòng khách, phòng ngủ hoặc lớp học.\n- Máy chiếu Thiên văn học là đồ chơi giáo dục hoàn hảo cho bất kỳ bé nào tò mò về khoa học, NASA, tàu vũ trụ, thiên hà, hệ mặt trời, …', N'Thiên văn', N'Thành công'),
(1000000025, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/products/1423001071_1_8e8bf366-fe94-4bae-9892-9d54b69d9ffa.jpg?v=1706986752&width=990', N'Đồ chơi lắp ráp dùng năng lượng mặt trời - Xe và Thuyền STEAM 1423001071', 459000, 20, 30, 6, N'STEAM', N'Trung Quốc',N'Bộ lắp ráp với động cơ và tấm pin năng lượng mặt trời, giúp bé tìm hiểu về kỹ thuật', N'Kĩ thuật', N'Thành công'),
(1000000026, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/files/34100f71fcedc143c1c6d4a448890947.jpg?v=1717669879&width=990', N'Xe đạp trẻ em Royal Baby Flying Bear 12 inch Màu Vàng RB12B-9', 3000000, 20, 30, 2, N'BIKE', N'Trung Quốc', N'Xe đạp trẻ em Royal Baby Flying Bear với thiết kế mạnh mẽ và độ an toàn cao', N'Thể chất', N'Thành công'),
(1000000027, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/products/nt05g2-nentrang_1.jpg?v=1706986368&width=990', N'Xe Scooter 2 bánh Neon Vector Yvolution NT05G2 xanh lá', 1599000, 20, 30, 5, N'SCOOTER', N'Trung Quốc', N'Xe scooter 2 bánh Neon Vector là sản phẩm nổi bật với màu sắc tươi trẻ và tính năng vận động', N'Thể chất', N'Thành công'),
(1000000028, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/files/PAB024_35503aaf-9b58-4eea-8bb8-9ce805cc5a74.jpg?v=1727249941&width=990',N'Xe chòi chân kèm đèn và nhạc cho bé PEEK A BOO PAB024', 999000, 20, 30, 1, N'PEEK A BOO', N'Trung Quốc', N'Xe chòi chân không chỉ là món đồ chơi cần thiết trong quá trình phát triển của bé, mà còn giúp bé tăng cường vận động và thích khám phá về thế giới xung quanh. Từ đó làm nền tảng cho việc phát triển toàn diện các kỹ năng xã hội, vận động và tư duy.', N'Thể chất', N'Thành công'),
(1000000029, 30000003, N'https://giaocumontessori.com/web/image/product.product/174/image_1024/%5B0770100%5D%20Gh%C3%A9p%20h%C3%ACnh%20b%E1%BA%A3n%20%C4%91%E1%BB%93%20th%E1%BA%BF%20gi%E1%BB%9Bi%20v%C3%A0%20b%E1%BB%99%20c%E1%BB%9D%20c%E1%BB%A7a%20c%C3%A1c%20n%C6%B0%E1%BB%9Bc?unique=eb6c920', N'Ghép hình bản đồ thế giới và bộ cờ của các nước', 1339000, 20, 30, 6, N'Không', N'Việt Nam', N'Bản đồ thế giới và cờ các nước giúp bé tìm hiểu về địa lý và vị trí các quốc gia...', N'Địa lý', N'Thành công'),
(1000000030, 30000003, N'https://www.mykingdom.com.vn/cdn/shop/files/do-choi-dan-piano-meo-con-bx1025z.jpg?v=1720779066&width=990', N'Đồ chơi đàn piano mèo con B.BRAND BX1025Z', 1199000, 20, 30, 2, N'B. BRAND', N'Trung Quốc', N'Đàn piano mèo con với thiết kế đáng yêu và nhiều tính năng hiện đại giúp bé phát triển khả năng âm nhạc', N'Nghệ thuật', N'Thành công');
GO
INSERT INTO [Income] (SOID, PID, IncSell, QSell, IncRent, QRent, Date) VALUES
(30000001,1000000002, 702000, 1, 14040, 2, N'2024-10-22'),
(30000001, 1000000006, 80000, 4, 0, 0, N'2024-10-22'),                   
(30000001, 1000000007, 280000, 2, 42000, 1, N'2024-10-22'),
(30000001, 1000000003, 0, 0, 14000, 2, N'2024-10-22'),
(30000001, 1000000010, 98000, 1, 0, 0, N'2024-10-22');
GO
INSERT INTO [Fee_Policy] (Platform, Week, BiWeek, Month)
VALUES (10, 10, 18, 30)
GO
INSERT INTO Cart (UID, PID, Quantity, Total, RentTime) VALUES
(10000004, 1000000001, 2, 1300000, 0),
(10000004, 1000000002, 1, 702000, 0),
(10000004, 1000000003, 3, 210000, 0),
(10000004, 1000000004, 1, 56000, 0),
(10000004, 1000000005, 2, 360000, 0),
(10000004, 1000000006, 4, 800000, 0),
(10000004, 1000000007, 2, 280000, 0),
(10000005, 1000000008, 1, 66000, 0),
(10000005, 1000000009, 3, 30000, 0),
(10000005, 1000000010, 2, 196000, 0),
(10000005, 1000000011, 1, 585000, 0),
(10000005, 1000000012, 1, 529000, 0),
(10000005, 1000000013, 2, 1222000, 0);
GO
INSERT INTO [Income] (SOID, PID, IncSell, QSell, IncRent, QRent, Date) VALUES
(1, 2, 702000, 1, 14040, 2, N'2024-10-22'),
(1, 6, 80000, 4, 0, 0, N'2024-10-22'),
(1,7,  280000, 2, 42000, 1, N'2024-10-22'),
(1,3, 0, 0, 14000, 2, N'2024-10-22'),
(1,10, 98000, 1, 0, 0, N'2024-10-22')
GO
INSERT INTO [Order] ( UID, CreationDate, Price) VALUES
(4, N'2024-10-01', 1300000)