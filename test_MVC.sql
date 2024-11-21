

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
  [UID] integer IDENTITY(1,1) PRIMARY KEY,
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
  [Address] nvarchar(max),
  [Membership] float,
)
GO

CREATE TABLE [Staff] (
  [UID] integer,
  [SID] integer IDENTITY(1,1) PRIMARY KEY,
  [Avatar] nvarchar(255),
  [Name] nvarchar(255),
  [Sex] nvarchar(255),
  [Birthday] date,
  [Office] nvarchar(255)
)
GO

CREATE TABLE [Shop_Owner] (
  [UID] integer,
  [SOID] integer IDENTITY(1,1) PRIMARY KEY,
  [Avatar] nvarchar(255),
  [Name] nvarchar(255),
  [Citizen_code] nvarchar(255),
  [Warehouse] nvarchar(255),
  [Type] integer /*1 là Shop; 2 là cá nhân*/
)
GO

CREATE TABLE [Product] (
  [PID] integer IDENTITY(1,1) PRIMARY KEY,
  [SOID] integer,
  [Image] nvarchar(max),
  [Name] nvarchar(255),
  [Price] float,
  [QSell] integer,
  [QRent] integer,
  [Age] integer,
  [Brand] nvarchar(255),
  [Origin] nvarchar(255),
  [Description] nvarchar(max),
  [Category] nvarchar(255),
  [Type] integer, /*1 là Shop; 2 là cá nhân*/
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
  [CAID] integer IDENTITY(1,1) PRIMARY KEY,
  [UID] integer,
  [PID] integer,
  [Quantity] integer,
  [Total] float,
  [RentTime] integer
)
GO

CREATE TABLE [Payment] (
  [PAID] integer IDENTITY(1,1) PRIMARY KEY,
  [OID] integer,
  [Amount] float,
  [points] float,
  [Method] nvarchar(255),
  [Date] DATETIME 
)
GO

CREATE TABLE [PDetail] (
  [PDID] integer IDENTITY(1,1) PRIMARY KEY,
  [PAID] integer,
  [ODID] integer,
  [Price] float,
  [Deposit] float,
  [Refund_Shop] float,
  [Refund_Cus] float,
  [platform_fee] float,
  [Date] DATETIME,
  [Status] nvarchar(255)
)
GO

CREATE TABLE [Comment] (
  [CID] integer IDENTITY(1,1) PRIMARY KEY,
  [UID] integer,
  [PID] integer,
  [ODID] integer,
  [Comment] nvarchar(max),
  [Date] DATETIME,
  [satisfaction] nvarchar(255),
  [image] nvarchar(255)
)
GO

CREATE TABLE [Reply] (
  [CID] integer,
  [PID] integer,
  [SOID] integer,
  [comment] nvarchar(max),
  [Date] DATETIME,
  [image] nvarchar(255)
)
GO

CREATE TABLE [Order] (
  [OID] integer IDENTITY(1,1) PRIMARY KEY,
  [UID] integer,
  [CreationDate] DATETIME,
  [Price] float
)
GO

CREATE TABLE [Order_Detail] (
  [ODID] integer IDENTITY(1,1) PRIMARY KEY,
  [OID] integer,
  [SOID] integer,
  [PID] integer,
  [Quantity] integer,
  [TimeRent] integer,
  [DateStart] DATETIME,
  [DateEnd] DATETIME,
  [Status] integer
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
  [Date] DATETIME
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
  [Date_report] DATETIME 
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

ALTER TABLE [Reply] ADD FOREIGN KEY ([PID]) REFERENCES [Product] ([PID])



INSERT INTO [User] (Email, Phone, Password, Role) VALUES
(N'owner1@shop.com', N'0912345678', N'1', N'O'),
(N'owner2@shop.com', N'0922345678', N'1', N'O'),
(N'owner3@shop.com', N'0932345678', N'1', N'O'),
(N'quyentrinh040@gmail.com', N'', N'1', N'C'),
(N'quannhqe180121@fpt.edu.vn', N'0952345678', N'1', N'C'),
(N'staff1@shop.com', N'0962345678', N'1', N'S'),
(N'shipper@shop.com', N'0372314523', N'1', N'SH');


INSERT INTO [Customer] (UID, Avatar, Name, Sex, Birthday, Address, Membership) VALUES
(1, N'https://i.pinimg.com/564x/24/21/85/242185eaef43192fc3f9646932fe3b46.jpg', N'Phạm Thị D', N'Female', N'1985-10-20', N'Số 10, Đường Phạm Văn Đồng, Quận Bắc Từ Liêm, Hà Nội', 0),
(2, N'https://cdn-media.sforum.vn/storage/app/media/wp-content/uploads/2023/11/avatar-vo-tri-thumbnail.jpg', N'Hoàng Văn E', N'Male', N'1980-12-05', N'Số 25, Đường Nguyễn Tất Thành, Quận Hải Châu, Đà Nẵng', 0),
(3, N'https://otos.vn/wp-content/uploads/2024/09/anh-avatar-vo-tri-2.jpg', N'Đinh Thị F', N'Female', N'1988-03-15', N'Số 50, Đường Nguyễn Văn Linh, Quận 7, TP. Hồ Chí Minh', 0),
(4, N'https://cdn.tcquoctesaigon.edu.vn/wp-content/uploads/2024/06/anh-avatar-nhom-lop-1.jpg', N'Nguyễn Văn A', N'Male', N'1990-05-15', N'123 Đường Trần Hưng Đạo, Quận 1, TP. Hồ Chí Minh', 20000),
(5, N'https://thebookland.vn/contents/1670045337198_Mathlink%20Cubes%20Numberblocks%20%201-10%20(1).jpg', N'Trần Thị B', N'Female', N'1992-07-10', N'456 Đường Lê Lợi, Quận 3, TP. Hồ Chí Minh', 0);



INSERT INTO [Staff] (UID, Avatar, Name, Sex, Birthday, Office) VALUES
(6, N'https://otos.vn/wp-content/uploads/2024/09/anh-avatar-vo-tri-12.jpg', N'Lê Văn C', N'Male', N'1985-11-22', N'Văn phòng Hà Nội');

INSERT INTO [Shop_Owner] (UID, Avatar, Name, Citizen_code, Warehouse, Type) VALUES /*1 là Shop; 2 là cá nhân*/
(1, N'https://cdn.hpdecor.vn/wp-content/uploads/2022/05/cua-hang-do-choi-tre-em-3-1.jpg', N'Khu Vườn Sáng Tạo', N'0123456789', N'Số 10, Đường Phạm Văn Đồng, Quận Bắc Từ Liêm, Hà Nội', 1),
(2, N'https://anviethouse.vn/wp-content/uploads/2022/01/Thiet-ke-shop-do-choi-tre-em-2-8.jpg', N'Vương Quốc Đồ Chơi', N'9876543210', N'Số 25, Đường Nguyễn Tất Thành, Quận Hải Châu, Đà Nẵng', 2),
(3, N'https://noithatdepgiare.vn/upload/images/thiet-ke-noi-that-cua-hang-do-choi-tre-em.jpg', N'Chơi Là Học', N'1234567890', N'Số 50, Đường Nguyễn Văn Linh, Quận 7, TP. Hồ Chí Minh', 1);


INSERT INTO [Product] (SOID, Image, Name, Price, QSell, QRent, Age, Brand, Origin, Description, Category, Type, Status) VALUES /*1 là Shop; 2 là cá nhân*/
(1, N'https://thebookland.vn/contents/1670045337198_Mathlink%20Cubes%20Numberblocks%20%201-10%20(1).jpg', N'Bộ học toán Mathlink Cubes Numberblocks số đếm 1-10', 650000, 20, 0, 3, N'Educational Insights', N'Mỹ', N'Numberblocks là chương trình truyền hình đạt hàng loạt giải thưởng danh giá giúp trẻ nhỏ học toán một cách sinh động và dễ dàng. Mathlink Cubes Numberblocks 1-10 Activity Set dựa trên series nổi tiếng này để sáng tạo nên bộ trò chơi học toán cho trẻ với các khối số đầy màu sắc nhằm giúp trẻ em xây dựng các kỹ năng toán học quan trọng trong những năm đầu đời.', N'Toán học', 1, N'Thành công'),
(1, N'https://thebookland.vn/images/1689223695931_BrainBolt%20Genius%20(2).jpg', N'Máy chơi luyện trí nhớ và giải đố: BrainBolt® Genius (phiên bản nâng cao)', 702000, 20, 0, 7, N'Educational Insights', N'Mỹ', N'Brainbolt Genius thiết kế như máy chơi game cầm tay với các nút chức năng nằm ở 2 cạnh quanh máy, cùng chế độ 1 người chơi và 2 người chơi. Trò chơi yêu cầu người chơi ghi nhớ chuỗi ánh sáng và lặp lại chúng theo thứ tự để không phá vỡ mô hình.', N'Giải đố', 1, N'Thành công'),
(1, N'https://down-vn.img.susercontent.com/file/f6712a6a3922417db99b06295074d8a5.webp', N'Bộ thẻ học thông minh 16 chủ đề 416 thẻ song ngữ Anh Việt cho bé Glen Doman', 70000, 20, 0, 1, N'OEM', N'Việt Nam', N'Bộ 416 thẻ học thông minh song ngữ Việt – Anh cho bé yêu gồm 16 chủ đề phong phú và đa dạng, hứa hẹn không những sẽ khiến trẻ thêm động lực để tìm tòi, học hỏi về thế giới xung quanh mà còn bổ sung thêm vốn từ vựng, giúp bé thêm tự tin trong bộ môn tiếng Anh quan trọng sau này.', N'Ngôn ngữ', 1, N'Thành công'),
(1, N'https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-lepg7377ij039f.webp', N'Bảng Vẽ Xếp Hình Nam Châm Thế Hệ Mới.Đồ Chơi Giáo Dục Xếp Hình Nam Châm, Bảng Vẽ Bút Bi Nam Châm Từ Tính Cho Bé', 56000, 20, 0, 3, N'không', N'Việt Nam', N'Bảng vẽ nam châm được làm bằng ABS và thép thân thiện với môi trường, từ trường có đặc tính nhất định, các hạt từ tính, các hạt từ tính sẽ không bị phai hoặc phai màu khỏi từ và độ bền. \nVẽ với các hạt từ tính này có thể kích thích tiềm năng rèn luyện trẻ, cải thiện khả năng và kỹ năng thực tế, đồng thời tạo nền tảng cho nghiên cứu. \n Với các màu sắc khác nhau, trẻ có thể cải thiện nhận thức về màu sắc và màu sắc của chúng khi chúng chơi, kích thích trí tưởng tượng của chúng và tạo ra trí tưởng tượng của chúng. \nSử dụng các từ để vẽ hình dạng, chữ cái và nhiều đồ họa khác nhau trên bề mặt, đơn giản và thú vị.', N'Nghệ thuật', 1, N'Thành công'),
(1, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lj6kl43gbytof9.webp', N'Bộ đồ chơi nấu ăn nhà bếp cao cấp cho bé gái bé trai có dùng pin, quà tặng sinh nhật cho bé, đồ chơi thông minh', 180000, 20, 0, 2, N'không', N'Việt Nam', N'Sử dụng chất liệu an toàn sức khỏe, thân thiện với môi trường. - Kích thước các chi tiết phù hợp với tay cầm của trẻ. \nBếp từ sử dụng pin, có 2 chế độ nấu ăn, phát ra âm thanh rất giống với thực tế \nTăng tinh thần sáng tạo của trẻ. \nThiết kế bo tròn, nhẵn bóng không lo bé bị thương. \nThiết kế thông minh, như trải nghiệm đồ nấu ăn thật. \nMô phỏng bếp từ thông minh với hiệu ứng âm thanh \nNắp nồi áp suất có thể xoay để mở, van an toàn. \nThông qua trò chơi, cho bé trải nghiệm niềm vui nấu nướng thực tế.', N'Mô phỏng', 1, N'Thành công'),
(1, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxStI76vRJEMadDamOLDV3VBD8WIrc2xqcsQ&s', N'Tranh ghép hình cho bé bằng gỗ trí tuệ 30 mảnh - đồ chơi xếp hình', 20000, 20, 0, 4, N'không', N'Việt Nam', N'Đồ chơi ghép hình là một trong những món không thể thiếu trong tủ đồ chơi của bé. Chắc hẳn bạn đã biết trong giai đoạn từ 3 đến 6 tuổi là giai đoạn vàng để bé phát triển trí tuệ và các điểm mạnh của bé. /nBộ đồ chơi tranh ghép hình 30 miếng ghép được thiết kế với 30 mảnh ghép khớp với nhau để bé ráp các mảnh ghép lại hoàn thiện bức tranh về các chủ đề động vật, hoạt hình...', N'Xếp hình', 1, N'Thành công'),
(1, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsxlendswhi120@resize_w450_nl.webp', N'Bảng vẽ tự xóa BABYTREE màn hình LCD thông minh không bụi mịn dễ dàng sử dụng an toàn cho bé', 140000, 20, 0, 3, N'không', N'Việt Nam', N'Màn hình LCD chất lượng cao: Màn hình LCD của Babytree mang lại hình ảnh sắc nét và màu sắc tươi sáng, tạo điều kiện thuận lợi cho việc vẽ và viết của bé.Tính di động và nhẹ nhàng: Với thiết kế nhẹ nhàng và di động, bé có thể dễ dàng mang theo bảng vẽ này bất cứ nơi đâu, từ phòng khách đến xe ô tô hoặc khi đi du lịch.Chức năng tự xóa tiện lợi: Bé có thể dễ dàng xóa bức tranh hoặc thông điệp của mình chỉ bằng cách nhấn nút, giúp tiết kiệm thời gian và giấy. Pin tiết kiệm năng lượng: Sản phẩm được trang bị pin tiết kiệm năng lượng, giúp kéo dài thời gian sử dụng và tiết kiệm chi phí thay pin.Giúp phát triển não phải của bé. Đầu bút mượt, không bụi mịn, nét bút nhiều màu sắc an toàn cho sức khỏe của bé', N'Nghệ thuật', 1, N'Thành công'),
(1, N'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lu0evrra1e2sf7@resize_w450_nl.webp', N'WISLEO Đồ chơi xếp hình hiding block Logic xếp khối nhựa theo thẻ bài câu đố logic giúp phát triển trí phát triển trí tuệ của bé', 66000, 20, 0, 3, N'không', N'Trung Quốc', N'Khối xây dựng ẩn này là một hộp màu, vật liệu là nhựa, không phải bằng gỗ và nó chứa 1 hướng dẫn sử dụng (chứa 150 câu hỏi) + 16 khối xây dựng + 1 khay', N'Giải đố', 1, N'Thành công'),
(1, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd6x-lve6azjkdfye1d@resize_w450_nl.webp', N'Tranh Đính Đá Mini Nhiều Hình Thủ Công Tự Làm Có Khung Trang Trí', 10000, 20, 0, 6, N'không', N'Việt Nam', N'Chất liệu: Canvas + đá resin \n - Loại đá: Đá đính hình dạng đặc biệt \n- Kích thước sản phẩm: 15cmx15cm \n- Kích thước khung ảnh: 17,5cmx17,5cm', N'Nghệ thuật', 1, N'Thành công'),
(1, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljyzknlh90xu82@resize_w450_nl.webp', N'Bộ mỹ phẩm đồ chơi trang điểm 33 món không độc hại thích hợp cho bé', 98000, 20, 0, 4, N'không', N'Việt Nam', N'Bộ trang điểm cho trẻ em bao gồm Son bóng * 6; Phấn mắt * 6; Phấn má hồng* 6; Cọ trang điểm * 3; Sơn móng tay * 3; Son môi * 2; Phụ kiện móng tay * 2; Miếng dán móng tay * 1; Món trang điểm long lanh * 2; Sticker kim cương; Túi vuông nhỏ * 1. Bộ mỹ phẩm này là một ước mơ cho các bé gái, món quà tuyệt vời cho bất kỳ dịp nào và món quà sinh nhật / giáng sinh hoàn hảo cho các bé gái.Chất liệu KHÔNG ĐỘC TỐ, CÓ THỂ LAU CHÙI, AN TOÀN DA BÉ: vui chơi an toàn luôn là mối quan tâm hàng đầu của chúng tôi. Không gây hại và nhẹ nhàng cho làn da mỏng manh của bé gái và có thể dễ dàng làm sạch bằng nước mà không có cặn có thể đáp ứng mọi nhu cầu của cha mẹ', N'Mô phỏng', 1, N'Thành công'),
(1, N'https://www.mykingdom.com.vn/cdn/shop/products/1423004781_1.jpg?v=1685026895&width=493', N'Bộ Khảo Cổ Truy Tìm Đá Quý 2Pc STEAM 1423004781', 229000, 20, 0, 6, N'STEAM', N'Trung Quốc', N'Bộ khảo cổ truy tìm đá quý 2pc - 1423004781  là sản phẩm đồ chơi khoa học STEAM hàng đầu của nhãn hàng DISCOVERY #MINDBLOWN thương hiệu bán chạy của Mỹ, hợp tác cùng kênh truyền hình nổi tiếng DISCOVERY, đem lại cho bé những trải nghiệm khoa học ứng dụng vừa học, vừa chơi', N'Khoa học', 1, N'Thành công'),
(1, N'https://www.mykingdom.com.vn/cdn/shop/products/1423005741_1.jpg?v=1685108832&width=493', N'Bộ Khảo cổ truy tìm Cổ Vật 15pc STEAM 1423005741', 579000, 20, 0, 6, N'STEAM', N'Trung Quốc', N'Bộ Khảo cổ truy tìm Cổ Vật 15pc – 1423005741 của thương hiệu DISCOVERY #MINDBLOWN với hơn 15 cổ vật ẩn sâu trong phiến đá đang chờ bé khám phá. Bé sẽ được hóa thân thành những nhà khảo cổ chuyên nghiệp với bộ sưu tập cổ vật đồ sộ. Hãy để Discovery cùng bé thỏa sức đam mê khoa học', N'Khoa học', 1, N'Thành công'),
(1, N'https://www.mykingdom.com.vn/cdn/shop/files/PAB004-3.jpg?v=1727238040&width=493', N'Sách nam châm - Cuộc sống khủng long PEEK A BOO PAB004-3', 249000, 20, 0, 6, N'PEEK A BOO', N'Trung Quốc', N'PEEK A BOO là thương hiệu đồ chơi - đồ dùng trẻ em với mong muốn mang lại tất cả những sản phẩm cần thiết nhất trên từng chặng đường phát triển của bé với chất lượng tốt, an toàn, giá cả phải chăng.', N'Khoa học', 1, N'Thành công'),
(1, N'https://www.mykingdom.com.vn/cdn/shop/files/PAB028.jpg?v=1727250500&width=493', N'Đồ chơi STEAM-Bộ xếp hình nam châm 72 chi tiết PEEK A BOO PAB028', 699000, 20, 0, 6, N'PEEK A BOO', N'TRUNG QUỐC', N'Ba mẹ muốn bé phát triển được tư duy Logic, sự sáng tạo và tinh thần học hỏi. Tất cả đã có trong bộ đồ chơi của nhà Peek A Boo.', N'Mô phỏng', 1, N'Thành công'),
(1, N'https://www.mykingdom.com.vn/cdn/shop/files/10329_4f1dddb6-dd5e-42eb-85fb-d31b8f9f33cd.jpg?v=1725519603&width=493', N'Đồ Chơi Lắp Ráp Bộ Sưu Tập Hoa Xương Rồng LEGO BOTANICALS 10329 (758 chi tiết)', 1639000, 20, 0, 6, N'LEGO BOTANICALS', N'TRUNG QUỐC', N'Không cần hạt giống, không cần tốn công chăm sóc cầu kỳ, bạn vẫn có những chậu cây đất nung nhỏ xinh với LEGO Icons 10329 Đồ chơi lắp ráp Bộ sưu tập Hoa xương rồng, hãy tận hưởng thời gian lắp ghép, tạo nên 9 loại cây xương rồng, và bạn cũng có thể trưng bày ở nhà hoặc góc làm việc trong văn phòng của bạn', N'Kĩ thuật', 1, N'Thành công'),
(1, N'https://www.mykingdom.com.vn/cdn/shop/files/10311_c83d120f-940e-450a-8885-89e330bfcb5f.jpg?v=1725529824&width=493', N'Đồ Chơi Lắp Ráp Hoa Lan Lego LEGO BOTANICALS 10311 (608 chi tiết)', 1599000, 20, 0, 6, N'LEGO BOTANICALS', N'Trung Quốc', N'Nâng tầm ngôi nhà, văn phòng của bạn với bộ mô hình Hoa lan LEGO® xinh đẹp này. Hãy dành thời gian thư giãn để tạo ra tất cả các chi tiết của những bông hoa trắng và hồng, cùng với chiếc bình màu xanh lam', N'Mô phỏng', 1, N'Thành công'),
(1, N'https://www.mykingdom.com.vn/cdn/shop/products/505457c3euc_copy_0.jpg?v=1718180157&width=493', N'Banh Miniverse Chủ Đề Valentine MINIVERSE 505457-EUC', 289000, 20, 0, 6, N'MINIVERSE', N'TRUNG QUỐC', N'Gói gọn yêu thương trong Miniverse! Tất cả các món ăn Make It Mini Foods được làm theo chủ đề Ngày lễ tình nhân DIY. Mỗi quả bóng đều đi kèm với các "nguyên liệu" và phụ kiện nhỏ theo chủ đề Lễ tình nhân để bạn tạo ra bản sao của các món ăn được thần Cupid yêu thích. Mỗi gói đều là một BẤT NGỜ nên bạn sẽ không biết mình có bản mini nào cho đến khi mở hộp!', N'Thể chất', 1, N'Thành công'),
(1, N'https://www.mykingdom.com.vn/cdn/shop/files/do-choi-banh-chu-de-may-pha-che-miniverse-505600-euc_28.jpg?v=1718180248&width=493', N'Đồ Chơi Banh Chủ Đề Máy Pha Chế MINIVERSE 505600-EUC', 449000, 20, 0, 6, N'MINIVERSE', N'Trung Quốc', N'Miniverse là dòng đồ chơi DIY lấy cảm hứng từ thế giới tí hon nhỏ bé. Mỗi trái banh của Miniverse là ẩn chứa một công thức gia công khác nhau tùy vào chủ đề của bộ sưu tập. Sản phẩm được nghiên cứu và phát triển bời MGA - một trong những công ty đồ chơi hàng đầu tại Hoa Kỳ. Mọi sản phẩm và công thức chế biến của Miniverse đều có bản quyền sỡ hữu trí tuệ và hình ảnh.', N'Mô Phỏng', 1, N'Thành công'),

(2, N'https://s.alicdn.com/@sc04/kf/H980bc265c5ae43eca0b4b558db8e2d13o.png_720x720q50.jpg', N'Vật Liệu Montessori Đồ Chơi Giáo Dục Hỗ Trợ Giảng Dạy Cho Địa Lý Thiết Bị Globe-Thế Giới Các Bộ Phận', 585000, 1, 0, 2, N'Adena Montessori', N'Trung Quốc', N'Đường kính 16.5cm \nKích thước 62*47*3.8cm', N'Địa lý', 2, N'Thành công'),
(2, N'https://s.alicdn.com/@sc04/kf/H980bc265c5ae43eca0b4b558db8e2d13o.png_720x720q50.jpg', N'Xe cứu hỏa Abrick ECOIFFIER 003290', 529000, 0, 1, 4, N'ECOIFFIER', N'Pháp', N'Xe cứu hỏa Ecoiffier Abrick bao gồm : 1 xe cứu hỏa lớn, 1 xe hơi nhỏ, 3 nhân vật lính cứu hỏa.', N'Mô phỏng', 2, N'Thành công'),
(2, N'https://img.lazcdn.com/g/p/4ce91789d630a492ab1fbb7c45a4ba1d.jpg_720x720q80.jpg_.webp', N'Kính Viễn Vọng Ngoài Trời Kính Viễn Vọng Khúc Xạ Thiên Văn Trong Suốt Cao Đồ Chơi Giảng Dạy Khoa Học Với Giá Ba Chân Thị Kính Phóng Đại 20X 30X 40X Cho Trẻ Em', 611000, 1, 0, 5, N'không', N'Việt Nam', N'Kính thiên văn thiên văn cho trẻ em với ống kính quang học nhiều lớp, hình ảnh rõ nét.', N'Thiên văn', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/6024397.jpg?v=1721987083&width=1100', N'Bộ cát, dụng cụ và khay chơi cát KINETIC SAND 6024397', 599000, 0, 1, 3, N'KINETIC SAND', N'Thuy Điển', N'Bắt đầu cuộc phiêu lưu vào thế giới cổ tích với Bộ cát, dụng cụ và khay chơi cát.', N'Khoa học', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/products/s-l640_1_0f733a51-5177-47c7-a628-daf3124d9e6d.jpg?v=1684886078&width=990', N'Đồ chơi xe lắp ráp ô tô Lamborghini Roadster tỉ lệ 1:24 MAISTO MT39900', 599000, 1, 0, 6, N'MAISTO', N'Trung Quốc', N'Đồ chơi Maisto xe lắp ráp ô tô Lamborghini Roadster tỉ lệ 1:24.', N'Kĩ thuật', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/products/zj16-pk_1_1.jpg?v=1684995393&width=1100', N'Bảng vẽ thông minh size 10 inch Hồng COOLKIDS ZJ16', 399000, 0, 1, 3, N'COOLKIDS', N'Trung Quốc', N'Sản phẩm có chất liệu an toàn, được thiết kế tỉ mỉ, cẩn thận, không gây hại cho sức khỏe của bé.', N'Khoa học', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/DS1059H-03-10_2.jpg?v=1715065631&width=990', N'Xếp hình 3D NASA: Tên lửa vũ trụ Saturn V - Apollo PUZZLES DS1059H', 359000, 1, 0, 8, N'PUZZLES', N'Trung Quốc', N'Đồ chơi trẻ em xếp hình 3D NASA: Tên lửa vũ trụ Saturn V Apollo.', N'xếp hình', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/products/8852rb_1__1.jpg?v=1685096880&width=990', N'Đồ Chơi Rubik 3x3 SPIN GAMES 8852RB', 319000, 0, 1, 8, 'SPIN GAMES', N'Trung Quốc', N'Rubik là một trò chơi trí tuệ giải khối lập phương thú vị và hấp dẫn.', N'Giải đố', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/products/mykingdom-6041518_3.jpg?v=1714013265&width=990', N'Trò chơi rút gỗ SPIN GAMES 6041518', 189000, 1, 0, 6, N'SPIN GAMES', N'Trung Quốc', N'Gồm 48 thanh gỗ chắc chắn, được mài nhẵn không góc nhọn, không bị xước, an toàn cho trẻ nhỏ.', N'Giải đố', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/do-choi-robot-devo-thong-thai-dieu-khien-tu-xa-vecto-vt2108_3.jpg?v=1713774609&width=990', N'Đồ chơi Robot DEVO thông thái điều khiển từ xa VECTO VT2108', 899000, 0, 1, 5, N'VECTO', N'Trung Quốc', N'Đồ chơi Robot DEVO thông thái điều khiển từ xa với nhiều chức năng hiện đại.', N'Kĩ thuật', 2, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/vtk46_b179c3fb-8388-4898-a80f-d0e8d49abc96.jpg?v=1707221339&width=990', N'Đồ chơi Robot Patrol Man điều khiển từ xa VECTO VTK46', 799000, 20, 0, 3, N'VECTO', N'Trung Quốc', N'Đồ chơi Robot Patrol Man điều khiển từ xa VECTO – Người máy tiên tiến đa chức năng cho bé vừa học vừa chơi, khám phá thế giới công nghệ tương lai cực vui...', N'Kĩ thuật', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/BRU02526_1.jpg?v=1684841812&width=990', N'Đồ chơi mô hình tỷ lệ 1:16 xe cảnh sát Jeep và người BRUDER BRU02526', 1699000, 20, 0, 4, N'BRUDER', N'Đức', N'Mô hình xe cảnh sát Jee BRU02526 gồm các đặc điểm và chức năng sau đây: \n + Mô hình xe công trình này mô phỏng một cách tinh xảo và chính xác dựa trên xe thật theo tỉ lệ 1:16 \n+ Chất liệu nhựa và cao su cao cấp, độ bền cao \n+ Xe có thể tháo dỡ phần mái, nắp ca-pô, cửa sau và 4 cửa của xe có thể đóng mở được. \n+ Chở được 4 người ở hàng ghế phía sau, có thể tháo để có thể tạo thế không gian cho việc chở các linh kiện khác. \n+ Nắp ca-pô mở ra, có ngăn đựng nắp ca-pô có thể gập lại để có cái nhìn chi tiết về khối động cơ \nSản phẩm mang lại các giá trị tuyệt vời dành cho trẻ nhỏ: \n+ Phát triển các kỹ năng vận động của trẻ thông qua việc khám phá và sử dụng các chức năng của xe \n+ Khuyến khích trẻ tìm hiểu về các ngành nghề liên quan đến các mẫu xe có thật trong đời sống \bn Bố mẹ có thể kết hợp các mẫu xe cứu hỏa, xe rác, xe cảnh sát,… để lồng ghép các bài học về kỹ năng sống, ước mơ, các kiến thức cơ bản trong cuộc sống,…', N'Mô phỏng', 1, N'Thành công'),
(3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_213680.jpg', N'Seri Phòng Thí Nghiệm Nhỏ STEM 1007 - Con Tìm Hiểu Hệ Mặt Trời (Vật Lý)', 129000, 20, 0, 6, N'Shenzhen', N'Trung Quốc', N'Seri Phòng Thí Nghiệm Nhỏ STEM 1007 - Con Tìm Hiểu Hệ Mặt Trời (Vật Lý) \nLà bộ đồ chơi khoa học thực hành thú vị dành cho trẻ em giúp bé lắp ráp mô hình của riêng mình về hệ mặt trời. \nHãy để bộ hệ thống năng lượng mặt trời này truyền cảm hứng cho bé. \nBé hãy sơn sản phẩm cũng như thêm các điểm nổi bật để tạo hiệu ứng phát sáng bằng cách sử dụng ánh sáng trong lớp sơn tối và xem các hành tinh phát sáng. \nTừ đó bé có thể tìm hiểu về các hành tinh, ngôi sao và xem cách chúng di chuyển cùng nhau. \nVật liệu có độ bóng mịn và các cạnh bo tròn mềm mại \nSản phẩm sử dụng thành phần nhựa PE, giấy được kiểm định nghiêm ngặt về độ an toàn. \nXây dựng hình dạng ban đầu, số lượng, kỹ năng nhận dạng màu sắc. \nLàm giàu kiến ​​thức thiên văn', N'Thiên văn', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/6d57adb11f0f8e09f133ad587b2f7854.jpg?v=1706859146&width=990', N'Đồ chơi máy chiếu Thiên văn học STEAM 1423000801', 799000, 20, 0, 6, N'STEAM', N'Trung Quốc', N'- Đồ chơi khoa học STEAM hàng đầu nước Mỹ của nhãn hàng DISCOVERY \n#MINDBLOWN, hợp tác cùng kênh truyền hình nổi tiếng DISCOVERY, đem lại cho bé những trải nghiệm khoa học ứng dụng vừa học, vừa chơi. \n- Máy chiếu Thiên văn học giúp bé thoải mái khám phá những điều kỳ diệu trong vũ trụ: các Ngôi sao, Hành tinh bí ẩn, Thiên hà rộng lớn hay Tàu không gian siêu đẳng ngay tại phòng khách, phòng ngủ hoặc lớp học. \n- Máy chiếu Thiên văn học là đồ chơi giáo dục hoàn hảo cho bất kỳ bé nào tò mò về khoa học, NASA, tàu vũ trụ, thiên hà, hệ mặt trời, …', N'Thiên văn', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/1423001071_1_8e8bf366-fe94-4bae-9892-9d54b69d9ffa.jpg?v=1706986752&width=990', N'Đồ chơi lắp ráp dùng năng lượng mặt trời - Xe và Thuyền STEAM 1423001071', 459000, 20, 0, 6, N'STEAM', N'Trung Quốc',N'Bộ lắp ráp với động cơ và tấm pin năng lượng mặt trời, giúp bé tìm hiểu về kỹ thuật', N'Kĩ thuật', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/34100f71fcedc143c1c6d4a448890947.jpg?v=1717669879&width=990', N'Xe đạp trẻ em Royal Baby Flying Bear 12 inch Màu Vàng RB12B-9', 3000000, 20, 0, 2, N'BIKE', N'Trung Quốc', N'Xe đạp trẻ em Royal Baby Flying Bear với thiết kế mạnh mẽ và độ an toàn cao', N'Thể chất', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/nt05g2-nentrang_1.jpg?v=1706986368&width=990', N'Xe Scooter 2 bánh Neon Vector Yvolution NT05G2 xanh lá', 1599000, 20, 0, 5, N'SCOOTER', N'Trung Quốc', N'Xe scooter 2 bánh Neon Vector là sản phẩm nổi bật với màu sắc tươi trẻ và tính năng vận động', N'Thể chất', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/PAB024_35503aaf-9b58-4eea-8bb8-9ce805cc5a74.jpg?v=1727249941&width=990',N'Xe chòi chân kèm đèn và nhạc cho bé PEEK A BOO PAB024', 999000, 20, 0, 1, N'PEEK A BOO', N'Trung Quốc', N'Xe chòi chân không chỉ là món đồ chơi cần thiết trong quá trình phát triển của bé, mà còn giúp bé tăng cường vận động và thích khám phá về thế giới xung quanh. Từ đó làm nền tảng cho việc phát triển toàn diện các kỹ năng xã hội, vận động và tư duy.', N'Thể chất', 1, N'Thành công'),
(3, N'https://giaocumontessori.com/web/image/product.product/174/image_1024/%5B0770100%5D%20Gh%C3%A9p%20h%C3%ACnh%20b%E1%BA%A3n%20%C4%91%E1%BB%93%20th%E1%BA%BF%20gi%E1%BB%9Bi%20v%C3%A0%20b%E1%BB%99%20c%E1%BB%9D%20c%E1%BB%A7a%20c%C3%A1c%20n%C6%B0%E1%BB%9Bc?unique=eb6c920', N'Ghép hình bản đồ thế giới và bộ cờ của các nước', 1339000, 20, 0, 6, N'Không', N'Việt Nam', N'Bản đồ thế giới và cờ các nước giúp bé tìm hiểu về địa lý và vị trí các quốc gia...', N'Địa lý', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/do-choi-dan-piano-meo-con-bx1025z.jpg?v=1720779066&width=990', N'Đồ chơi đàn piano mèo con B.BRAND BX1025Z', 1199000, 20, 0, 2, N'B. BRAND', N'Trung Quốc', N'Đàn piano mèo con với thiết kế đáng yêu và nhiều tính năng hiện đại giúp bé phát triển khả năng âm nhạc', N'Nghệ thuật', 1, N'Thành công'),
(3, N'https://bizweb.dktcdn.net/100/317/763/products/9bea5069c32825767c39.jpg?v=1575446807270', N'Hộp Đồ Chơi Cờ Tỷ Phú Việt Nam Cho Bé Vừa Chơi Vừa Học Làm Giàu', 115000, 20, 0, 3, N'Local', N'Việt Nam', N'- Khoa học đã chứng minh được rằng việc kể chuyện hàng đêm cho bé có ý nghĩa vô cùng lớn trong việc vun đắp nhận thức và nhân cách tốt đẹp cho bé sau này- Truyện đọc cho bé trước giờ đi ngủ tập hợp những câu chuyện ý nghĩa, những trò chơi câu đố thú vị, bài học phong phú kích thích trí tuệ cho trẻ nhỏ, thực sự là một cẩm nang bổ ích cho các ông bố bà mẹ.- Truyện kể cho bé với chữ in to rõ ràng, hình ảnh minh họa đáng yêu, ngộ nghĩnh- Truyện đọc cho bé trước giờ đi ngủ là quyển sách gối đầu giường nên có của các bạn nhỏ. Bé sẽ có những giấc mơ đẹp sau khi được bố mẹ kể những câu chuyện hay, truyền cảm trước khi ngủ', N'Mô phỏng', 1, N'Thành Công'),
(3, N'https://bizweb.dktcdn.net/100/317/763/products/634546cf1fbb14c2a8abc986dba3da6e-dim2-18052022-1010-3a140a.jpg?v=1677557788747', N'Sách Vải Tương Tác - Đoán Đuôi Kích Thích Khả Năng Quan Sát Cho Bé', 1339000, 20, 0, 3, N'Local', N'Việt Nam ', N'Sách vải cho bé đoán đuôi con vật được trình bày bằng hai ngôn ngữ ANH - VIỆT với chất liệu vải an toàn, bền đẹp bé có thể thoải mái chơi mà không lo bị va đập, rách, hỏng.', N'Ngôn Ngữ ', 1, N'Thành công'),
(3, N'https://bizweb.dktcdn.net/100/317/763/products/a6ec877c9925567b0f34.jpg?v=1684891428723', N'Đồ Chơi Giải Trí Trò Chơi Dân Gian Hấp Dẫn Ô Ăn Quan Hàng Việt Nam Phù Hợp Với Mọi Lứa Tuổi', 140000, 20, 0, 3, N'Local', N'Việt Nam', N' Đồ Chơi giáo dục Việt Benrikids - Cờ giáo dục - Trò chơi dân gian - Ô Ăn Quan  là một trò chơi truyền thống đã có từ lâu đời, rất hấp dẫn đối với lứa tuổi nhi đồng và thanh thiếu niên. Trò chơi có tính giải trí rất cao và mang đến rất nhiều điều hấp dẫn, thú vị. Nhưng hơn hết, thông qua quá trình chơi, để là người chiến thắng, bé phải liên tục quan sát và phán đoán, từ khả năng tư duy logic của bé sẽ càng trở nên nhanh nhạy hơn.',N'Giải đố', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/do-choi-may-doc-the-thong-minh-cho-be-leapf-80-616803_1.png?v=1729572952&width=493', N'Đồ Chơi Máy Đọc Thẻ Thông Minh Cho Bé LEAPFROG 80-616803', 1299000, 20, 0, 3, N'LEAPFROG', N'Trung quốc', N'Chơi và tương tác', N'Ngôn ngữ', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/80-607803.jpg?v=1726931922&width=493', N'Máy Phát Nhạc Đa Năng Cho Bé LEAPFROG 80-607803', 749000, 20, 0, 3, N'LEAPFROG', N'Trung Quốc', N'Chơi và tương tác', N'Nghệ thuật', 1, N'Thành công'),
(3, N'https://bizweb.dktcdn.net/100/317/763/products/vn-11134207-7r98o-lqeczr5r0jbmfb.jpg?v=1706928699773', N'Set 5 Vòng Vận Động Kèm Quả Bóng Vải Cho Bé Tập Nhảy Lò Cò', 109000, 20, 0, 3, N'Local', N'Việt Nam', N'Chào mừng đến với Vòng Vận Động Cho Trẻ Mầm Non - sản phẩm hoàn hảo để khuyến khích sự vận động, sáng tạo, và tương tác xã hội cho bé yêu của bạn. Thiết kế đa dạng của chúng mang đến một loạt các trò chơi ngoại ô, giúp bé phát triển toàn diện.', N'Thể Chất', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/do-choi-tho-con-cau-vong-curlimals-3723CUR_1.jpg?v=1723604927&width=493', N'Đồ Chơi Thỏ Con Cầu Vồng Curlimals', 499000, 20, 0, 3, N'CURLIMALS', N'Trung Quốc', N'Curlimals là thương hiệu đồ chơi thú bông có tương tác xuất xứ từ Anh Quốc', N'Khoa học', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/vt28312-bl-30.12.jpg?v=1685135701&width=493', N'Đồ chơi Robot khủng long vui nhộn điều khiển từ xa (đen) VECTO VT28312', 599000, 20, 0, 3, N'VECTO', N'Trung Quốc', N'VECTO là thương hiệu đồ chơi dành riêng cho các bé trai, với các dòng đồ chơi trải dài từ đồ chơi điều khiển từ xa cho đến các dòng đồ chơi lắp ráp. Với mong muốn giúp các bé trai có một sự phát triển toàn diện từ trí não đến thể chất, Vecto đã phát triển đa dạng các loại đồ chơi để đem đến cho bé nhiều lựa chọn nhất có thể,', N'Kĩ thuật', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/vt8192-30.12.jpg?v=1685135915&width=493', N'Đồ chơi lắp ráp Robot số từ 5 đến 9 và dấu toán học VECTO VT8192', 299000, 20, 0, 6, N'VECTO', N'Trung Quốc', N'VECTO là thương hiệu đồ chơi dành riêng cho các bé trai, với các dòng đồ chơi trải dài từ đồ chơi điều khiển từ xa cho đến các dòng đồ chơi lắp ráp. Với mong muốn giúp các bé trai có một sự phát triển toàn diện từ trí não đến thể chất, Vecto đã phát triển đa dạng các loại đồ chơi để đem đến cho bé nhiều lựa chọn nhất có thể', N'Toán học ', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/do-choi-lap-rap-robot-so-hoc-tu-0-4-vecto-vt188-1_1_4bf4bc26-c176-490b-812c-1b59fe1742d3.jpg?v=1725005063&width=493', N'Đồ Chơi Lắp Ráp Robot Số Học Từ 0-4 VECTO VT188-1', 499000, 20, 0, 6, N'VECTO', N'Trung Quốc', N'VECTO là thương hiệu đồ chơi dành riêng cho các bé trai, với các dòng đồ chơi trải dài từ điều khiển từ xa đến lắp ráp. Với mong muốn giúp các bé trai có sự phát triển toàn diện từ trí não đến thể chất, Vecto đã phát triển đa dạng các loại đồ chơi nhằm mang đến cho bé nhiều lựa chọn nhất có thể, một số dòng đồ chơi nổi bật', N'Toán học', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/vt1072_1.jpg?v=1684960012&width=493', N'Bộ đồ chơi lắp ráp Vecto DIY 3 trong 1 - Xe cứu hỏa VECTO VT1072', 399000, 20, 0, 6, N'VECTO', N'Trung Quốc', N'VECTO là thương hiệu đồ chơi dành riêng cho các bé trai, với các dòng đồ chơi trải dài từ đồ chơi mô hình cho đến các đồ chơi điều khiển từ xa. Với mong muốn giúp các bé trai có một sự phát triển toàn diện từ trí não đến thể chất, Vecto đã phát triển đa dạng các loại đồ chơi để đem đến cho bé nhiều lựa chọn nhất có thể', N'Kĩ thuật', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/nat-geo-nuoi-trong-tinh-the-phat-sang-trong-dem-steam-rtnggidcrystal_2.jpg?v=1726803627&width=493', N'Nat Geo Nuôi Trồng Tinh Thể - Phát Sáng Trong Đêm STEAM RTNGGIDCRYSTAL', 279000, 20, 0, 6, N'STEAM', N'Trung Quốc', N'Đồ chơi thí nghiệm, khảo cổ, sinh học National Geographic chính hãng - Cùng với bé sẵn sàng khám phá vô vàn kiến thức khoa học với trải nghiệm an toàn‼️', N'Khoa học', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/1423011200_1.jpg?v=1718620232&width=493', N'Bộ Thí Nghiệm Làm Tuyết STEAM 1423011200', 279000, 20, 0, 6, N'STEAM', N'TRUNG QUỐC', N'Bộ thí nghiệm làm tuyết – 1423011200 của thương hiệu DISCOVERY. Bé hóa thân thành nhà hóa học siêu xịn', N'Khoa học', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/1423011180_copy_3.jpg?v=1685149528&width=493', N'Bộ Thí Nghiệm Hóa Học Kỳ Thú Có 14 Chi Tiết STEAM 1423011180', 389000, 20, 0, 6, N'STEAM', N'Trung Quốc', N'Đồ chơi khoa học STEAM hàng đầu nước Mỹ của nhãn hàng DISCOVERY hợp tác cùng kênh truyền hình nổi tiếng DISCOVERY, đem lại cho bé những trải nghiệm khoa học ứng dụng vừa học, vừa chơi', N'Khoa học', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/13059_1.jpg?v=1695198604&width=493', N'Thí Nghiệm 26 Trải Nghiệm Hóa Học Kỳ Diệu STEAM 13059', 449000, 20, 0, 6, N'STEAM', N'Ấn Độ', N'Que thử độ pH; Bột ngô; Natri alginat ; Canxi clorua; Kẹo cao su; Axit citric; Bột nở ; Kính bảo hộ; Găng tay bảo hộ; Chai rỗng lớn; Chai rỗng nhỏ; Thìa nhựa; Thìa gỗ; Phễu; cốc đong lớn, Cốc đo nhỏ, que nhỏ giọt; Màu thực phẩm đỏ, vàng, xanh; Hộp đựng lớn; Bát nhựa; Bóng bay; Dây giày; sách hướng dẫn chi tiết', N'Khoa học', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/1423005861_1__1.jpg?v=1685056996&width=493', N'Bộ thí nghiệm nuôi trồng tinh thể STEAM 1423005861', 599000, 20, 0, 6, N'STEAM', N'Mỹ', N' Sản phẩm dành cho các bé 8+. Đây là độ tuổi các bé luôn tò mò và muốn được khám phá thế giới.', N'Khoa học', 1, N'Thành công'),
(3, N'https://bizweb.dktcdn.net/100/317/763/products/22d65b97a1520e0c57436.jpg?v=1712375733780', N'Đồ Chơi Cờ Tướng Siêu To, Bộ Cờ Tướng Bằng Nhựa Cao Cấp Gấp Gọn Tiện Lợi', 242000, 20, 0, 6, N'Local', N'Việt Nam', N'1.Đồ chơi cờ tướng được làm từ chất liệu cao cấp, thân thiện với môi trường, và đặc biệt là an toàn tuyệt đối với trẻ khi tiếp xúc. 2.Bề mặt của bàn cờ và các quân cờ được thiết kế nhẵn mịn không góc cạnh, bé sẽ có những khoảng thời gian vui chơi an toàn mà không lo bị sản phẩm làm trầy xước làn da nhạy cảm của bé. 3.Các quân cờ và bàn cờ được khắc tỉ mỉ, cẩn thận đến từng chi tiết, giúp bé dễ dàng nhận biết từng quân cờ khi mới bắt đầu chơi.', N'Giải Đố', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/EU881240_1_b57a6945-6729-4807-bd53-adc12ba9280c.jpg?v=1706973593&width=493', N'Xe chạy tự động - Ếch Crash REVANDROLL EU881240', 349000, 20, 0, 6, N'REVANDROLL', N'TRUNG QUỐC', N'Rev and roll là bộ phim hoạt hình có nội dung vô cùng độc đáo- kể về chuyến phiêu lưu mạo hiểm của những bạn nhỏ và chiếc siêu xe thú cưng của mình.', N'Kĩ thuật', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/6061225_4_ef14eec4-4d4f-4eb9-a4c2-f8b6e46a6d1f.jpg?v=1718706530&width=493', N'Đồ chơi Xe cứu hộ mô tô Skye PAW PATROL 6061225', 579000, 20, 0, 6, N'PAW PATROL', N'Trung Quốc', N'Đồ chơi Xe cứu hộ mô tô Skye – 6061225 – Tăng tốc trong những pha giải cứu nguy hiểm cùng chú chó cứu hộ Skye !! Mang đến cho bé sự phấn khích và thú vị ngay tại nhà với bộ đồ chơi Xe mô tô cứu hộ Skye, đến từ bộ phim hoạt hình nổi tiếng Paw Patrol mùa 7 phần 2: Đội giải cứu mô tô siêu đẳng.', N'Mô phỏng', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/files/4684012fa5e89ee0c33375466edf2575.jpg?v=1718707070&width=493', N'Đồ Chơi Xe Cứu Hộ The Movie 2 Skye PAW PATROL 6067506', 559000, 20, 0, 6, N'PAW PATROL', N'Việt Nam', N'Đội chó cứu hộ Paw Patrol đã trở lại siêu hoành tráng với phim chiếu rạp “Siêu Đẳng” ra mắt trên hệ thống rạp chiếu phim toàn quốc từ 29/09/2023', N'Mô phỏng', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/vt28021_1.jpg?v=1685074371&width=493', N'Đồ chơi xe cứu hỏa thang xoay phun nước điều khiển từ xa VECTO VT28021', 729000, 20, 0, 6, N'VECTO', N'Trung Quốc', N'Đồ chơi xe cứu hỏa thang xoay phun nước điều khiển từ xa mô phỏng lại hình ảnh xe cứu hỏa ngoài đời thực. Với các chức năng độc đáo có thể ', N'Mô phỏng', 1, N'Thành công'),
(3, N'https://www.mykingdom.com.vn/cdn/shop/products/1423004871_1.jpg?v=1685027159&width=493', N'Bộ khảo cổ truy tìm xương Khủng long - T.Rex STEAM 1423004871', 399000, 20, 0, 6, N'STEAM', N'Trung Quốc', N'Đồ chơi khoa học STEAM hàng đầu nước Mỹ của nhãn hàng DISCOVERY #MINDBLOWN, hợp tác cùng kênh truyền hình nổi tiếng DISCOVERY, đem lại cho bé những trải nghiệm khoa học ứng dụng vừa học, vừa chơi.', N'Khoa học', 1, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/bo-thiet-ke-vong-tay-don-gian-1202mir.jpg?v=1719374642&width=493', N'Bộ Thiết Kế Vòng Tay Đơn Giản MAKE IT REAL 1202MIR', 139000, 0, 1, 6, N'MAKE IT REAL', N'TRUNG QUỐC', N'Các nhà thiết kế vòng tay vừa chớm nở có thể bắt đầu với bộ vòng tay quyến rũ DIY này. Trộn và kết hợp các loại hạt và bùa để tạo thành 3 vòng đeo tay đẹp. Cũng bao gồm đầy đủ hình xăm với hình xăm để phù hợp với vòng đeo tay!', N'Kĩ thuật', 2, N'Thành công'),
(2, N'https://bizweb.dktcdn.net/100/317/763/products/6c8cc73a6f73902dc962.jpg?v=1598185020190', N'Xếp Hình Vijago Kết Hợp Chữ Cái Thường Giúp Bé Vừa Học Vừa Chơi', 115000, 0, 1, 6, N'Local', N'Việt Nam', N'Tên gọi: Xếp hình công trình vijago 40 chi tiết kèm chữ cái. Kích thước: 29x19x4cm. Xuất xứ: Việt Nam. Sản phẩm dành cho bé 18 tháng trở lên ', N'Giải Đố', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/11038_d43ac4a9-c2ad-4181-ab9c-6ae204b7a27f.jpg?v=1725606139&width=493', N'Đồ chơi lắp ráp Thùng gạch sáng tạo sống động 850 chi tiết LEGO CLASSIC 11038', 1559000, 1, 0, 6, N'LEGO CLASSIC', N'Trung Quốc', N'Xây dựng một con ngựa, xe tải cà rốt, quả anh đào, cối xay gió, ván trượt, đám mây, con bướm, con gà và cây đàn guitar. Trộn các viên gạch một lần nữa để chuyển đổi màu sắc, hình dạng và kích thước cũng như hoán đổi cửa sổ, bánh xe, cây cối, mắt và các vật trong suốt để tạo thành mô hình độc đáo của riêng bạn và trưng bày chúng trên tấm đế 16x16 để mọi người cùng chiêm ngưỡng!', N'Kĩ thuật', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/a4bf02ce5f2868372c64d9cb3278ab79.jpg?v=1706801430&width=493', N'Xe đạp trẻ em Royal Baby Freestyle 18 inch Màu Đỏ RB18B-6', 3367000, 1, 0, 6, N'BIKE', N'Trung Quốc', N'RoyalBaby là thương hiệu xe đạp trẻ em được yêu thích nhất khu vực Bắc Âu và bán chạy trên Amazon trong nhiều năm liền. Khung xe làm bằng thép cường lực, lắp ráp bằng robot, tải trọng 2 người lớn đảm bảo an toàn tuyệt đối cho bé.', N'Thể chất', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/5658ab0585b4695aa7e205b2108be7a8.jpg?v=1706801326&width=493', N'Xe đạp trẻ em Royal Baby Freestyle 16 inch Màu Hồng RB16B-6', 3131000, 0, 1, 6, N'BIKE', N'Trung Quốc', N'RoyalBaby là thương hiệu xe đạp trẻ em được yêu thích nhất khu vực Bắc Âu và bán chạy trên Amazon trong nhiều năm liền. Khung xe làm bằng thép cường lực, lắp ráp bằng robot, tải trọng 2 người lớn đảm bảo an toàn tuyệt đối cho bé.', N'Thể chất', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/tro-choi-tri-tue-uno-no-mercy-mattel-game-HWV18_1.jpg?v=1722962636&width=493', N'Trò chơi trí tuệ UNO NO MERCY HWV18', 279000, 0, 1, 6, N'MATTEL GAMES', N'Trung Quốc', N'Trò chơi trí tệ UNO NO MERCY là phiên bản UNO “tàn bạo” nhất trong các phiên bản UNO. Trong phiên bản này, thương hiệu đã bổ sung nhiều thẻ bài tính năng mới, nâng tổng số lên 164 thẻ. Đáng chú ý nhất là thẻ đổi màu yêu cầu người tiếp theo phải lấy thêm 6 và 10 lá bài. Với các quy tắc mới đầy thách thức, người chơi sẽ phải xếp chồng, trao đổi và rút thẻ nhiều hơn bao giờ hết', N'Kĩ thuật', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/files/43535.jpg?v=1722392264&width=493', N'Trò chơi trí tuệ UNO STACKO MATTEL GAMES 43535', 789000, 1, 0, 6, N'MATTEL GAMES', N'Trung Quốc', N'UNO® STACKO® kết hợp kỹ năng xếp chồng với UNO cards. Đây là là trò chơi giải trí gia đình tuyệt vời, kéo các khối ra theo màu, số hoặc lệnh! Có thể kết hợp chơi với UNO cards.', N' Kĩ thuật', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/products/t6088___bl_1.jpg?v=1715050791&width=493', N'Robot tương lai (xanh) VECTO T6088', 699000, 1, 0, 6, N'VECTO', N'Trung Quốc', N'Bằng sự phối hợp nhịp nhàng giữa những đường cắt và đường dập nổi, khiển cho vẻ ngoài của Robot tương lai trở nên vô cùng bắt mắt và cuốn hút', N'Mô phỏng', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/products/vt2028109-red.jpg?v=1685003314&width=493', N'Robot lăn lộn (đỏ) VECTO VT2028109', 369000, 0, 1, 6, N'VECTO', N'Trung Quốc', N'Chú Robot lăn lộn có ba màu sắc đỏ, cam  và trắng có thể chơi cùng 1 lúc hứa hẹn những trận chạm trán nảy lửa và sẽ mang đến cho bé những phút giây vui chơi hào hứng tràn đầy niềm vui.', N'Kĩ thuật', 2, N'Thành công'),
(2, N'https://www.mykingdom.com.vn/cdn/shop/products/591825c3_mgas_miniverse_make_it_mini_foods_diner_in_pdq_series_2a_fp_pkg_0001.jpg?v=1718179507&width=493', N'Đồ Ăn Phiên Bản Mini MINIVERSE 591825-EUC', 289000, 0, 1, 6, N'MINIVERSE', N'TRUNG QUỐC', N'Cùng đón chào sự tham gia của những món ăn bé nhỏ vào bộ sưu tập mini của thế giới MINIVERSE thôi nào! Với bao bì dạng bí ẩn quen thuộc, nhưng ruột bên trong lại hoàn toàn mới, bộ sưu tập Đồ Ăn Phiên Bản Mini chắc chắn sẽ là vừa lòng những fan trung thành của thế giới tí hon. Sản phẩm có độ chi tiết cao, tặng kèm keo resin kết dính siêu đỉnh, khô ngay trong vòng 5 phút dưới ánh nắng hoặc đèn tia UV. Bộ sản phẩm có 18 món ăn đang chờ bạn khám phá!', N'Mô phỏng', 2, N'Thành công');
GO

INSERT INTO [Fee_Policy] (Platform, Week, BiWeek, Month)
VALUES (10, 10, 18, 30)

INSERT INTO [Income] (SOID, PID, IncSell, QSell, IncRent, QRent, Date) VALUES
(1, 2, 702000, 1, 0, 0, N'2024-11-20'),
(1, 6, 80000, 4, 0, 0, N'2024-11-20'),
(1, 7, 280000, 2, 0, 0, N'2024-10-22'),
(1, 3, 350000, 5, 0, 0, N'2024-10-22'),
(1, 10, 98000, 1, 0, 0, N'2024-10-22'),
(2, 19, 585000, 1, 0, 0, N'2024-10-22'),
(2, 20, 0, 0, 529000, 1, N'2024-10-22')




update [Product] set Status = N'Thất bại' where PID >= 5 and PID <=8

update [Product] set Status = N'Đang chờ' where PID >= 9 and PID <=12

update [Product] set Status = N'Đóng băng' where PID >= 13 and PID <=16

update [Product] set Status = N'Đóng băng' where PID >= 13 and PID <=16

update [Product] set Status = N'Còn ít' where PID >= 17 and PID <=18
update [Product] set QSell = 7 where PID = 17
update [Product] set QSell = 5 where PID = 18

select * from [Product]

select * from [Payment]
select * from [PDetail]
select * from [Order]
select * from [Order_Detail]
select * from [Income]


UPDATE Order_Detail SET DateEnd = '2024-11-22 23:59:59' WHERE ODID = 1;
UPDATE Order_Detail SET DateEnd = '2024-11-21 23:59:59' WHERE ODID = 2;
UPDATE Order_Detail SET DateEnd = '2024-11-22 23:59:59' WHERE ODID = 3;


SELECT *
FROM Order_Detail
WHERE TimeRent > 0
  AND DATEDIFF(DAY, GETDATE(), DateEnd) <= 2
  AND DATEDIFF(DAY, GETDATE(), DateEnd) >= 0;

  SELECT  *FROM [Order] WHERE OID IN (1, 2)