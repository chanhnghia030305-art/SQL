----CREATE DATABASE QuanLyNhapKho;
----GO

----USE QuanLyNhapKho;
----GO

------ Bảng NHOMHANG
----CREATE TABLE NHOMHANG (
----    MaNH INT PRIMARY KEY,
----    TenNhomHang NVARCHAR(100)
----);

------ Bảng HANGHOA
----CREATE TABLE HANGHOA (
----    MaHang INT PRIMARY KEY,
----    MaNH INT,
----    TenHang NVARCHAR(100),
----    DonViTinh NVARCHAR(50),
----    FOREIGN KEY (MaNH) REFERENCES NHOMHANG(MaNH)
----);

------ Bảng PHIEUNHAPKHO
----CREATE TABLE PHIEUNHAPKHO (
----    SoPhieu INT PRIMARY KEY,
----    NgayNhap DATE
----);

----CREATE TABLE NOIDUNGPHIEUNHAP (
----    SoPhieu INT,
----    MaHang INT,
----    SoLuong INT,
----    DonGia DECIMAL(10,2),
----    PRIMARY KEY (SoPhieu, MaHang),
----    FOREIGN KEY (SoPhieu) REFERENCES PHIEUNHAPKHO(SoPhieu),
----    FOREIGN KEY (MaHang) REFERENCES HANGHOA(MaHang)
----);

----INSERT INTO NHOMHANG VALUES
----(1, N'Đồ uống'),
----(2, N'Bánh kẹo'),
----(3, N'Thực phẩm khô'),
----(4, N'Gia vị'),
----(5, N'Đồ đông lạnh'),
----(6, N'Rau củ'),
----(7, N'Trái cây'),
----(8, N'Đồ hộp'),
----(9, N'Sữa'),
----(10, N'Đồ gia dụng');

----INSERT INTO HANGHOA VALUES
----(101, 1, N'Nước ngọt Coca', N'Chai'),
----(102, 1, N'Nước suối', N'Chai'),
----(103, 2, N'Bánh Oreo', N'Gói'),
----(104, 2, N'Kẹo dẻo', N'Gói'),
----(105, 3, N'Mì tôm', N'Gói'),
----(106, 4, N'Nước mắm', N'Chai'),
----(107, 5, N'Cá viên', N'Kg'),
----(108, 6, N'Cà rốt', N'Kg'),
----(109, 7, N'Táo', N'Kg'),
----(110, 9, N'Sữa Vinamilk', N'Hộp');

----INSERT INTO PHIEUNHAPKHO VALUES
----(1001, '2026-03-01'),
----(1002, '2026-03-02'),
----(1003, '2026-03-03'),
----(1004, '2026-03-04'),
----(1005, '2026-03-05'),
----(1006, '2026-03-06'),
----(1007, '2026-03-07'),
----(1008, '2026-03-08'),
----(1009, '2026-03-09'),
----(1010, '2026-03-10');

----INSERT INTO NOIDUNGPHIEUNHAP VALUES
----(1001, 101, 50, 10000),
----(1001, 103, 30, 15000),
----(1002, 102, 40, 5000),
----(1002, 104, 25, 12000),
----(1003, 105, 100, 3500),
----(1004, 106, 20, 20000),
----(1005, 107, 15, 80000),
----(1006, 108, 60, 7000),
----(1007, 109, 45, 25000),
----(1008, 110, 35, 18000);


----select * from dbo.NOIDUNGPHIEUNHAP

----alter table dbo.NOIDUNGPHIEUNHAP
----add ID int identity(1,1);

----ALTER TABLE NOIDUNGPHIEUNHAP
----DROP CONSTRAINT PK_NOIDUNGPHIEUNHAP;
----DROP TABLE NOIDUNGPHIEUNHAP;
 
---- CREATE TABLE NOIDUNGPHIEUNHAP (
----    ID INT IDENTITY(1,1) PRIMARY KEY,
----    SoPhieu INT NOT NULL,
----    MaHang INT NOT NULL,
----    SoLuong INT,
----    DonGia DECIMAL(10,2),

----    -- Khóa ngoại
----    FOREIGN KEY (SoPhieu) REFERENCES PHIEUNHAPKHO(SoPhieu),
----    FOREIGN KEY (MaHang) REFERENCES HANGHOA(MaHang),

----    -- Không cho trùng hàng trong cùng phiếu
----    CONSTRAINT UQ_Phieu_Hang UNIQUE (SoPhieu, MaHang)
----);
---- thêm dữ liệu vào bảng(Vì có IDENTITY nên KHÔNG cần nhập ID)
----INSERT INTO NOIDUNGPHIEUNHAP (SoPhieu, MaHang, SoLuong, DonGia) VALUES
----(1001, 101, 50, 10000),
----(1001, 103, 30, 15000),
----(1002, 102, 40, 5000),
----(1002, 104, 25, 12000),
----(1003, 105, 100, 3500),
----(1004, 106, 20, 20000),
----(1005, 107, 15, 80000),
----(1006, 108, 60, 7000),
----(1007, 109, 45, 25000),
----(1008, 110, 35, 18000);

----select * from dbo.NOIDUNGPHIEUNHAP

--INSERT INTO NHOMHANG VALUES
--(11, N'Đồ điện tử'),
--(12, N'Văn phòng phẩm'),
--(13, N'Đồ chơi'),
--(14, N'Mỹ phẩm'),
--(15, N'Quần áo'),
--(16, N'Giày dép'),
--(17, N'Thể thao'),
--(18, N'Thức ăn nhanh'),
--(19, N'Đồ uống có cồn'),
--(20, N'Hải sản');

--INSERT INTO HANGHOA VALUES
--(111, 11, N'Tai nghe', N'Cái'),
--(112, 12, N'Bút bi', N'Cây'),
--(113, 13, N'Ô tô đồ chơi', N'Cái'),
--(114, 14, N'Son môi', N'Thỏi'),
--(115, 15, N'Áo thun', N'Cái'),
--(116, 16, N'Giày sneaker', N'Đôi'),
--(117, 17, N'Bóng đá', N'Quả'),
--(118, 18, N'Gà rán', N'Phần'),
--(119, 19, N'Bia Heineken', N'Lon'),
--(120, 20, N'Tôm', N'Kg');

--INSERT INTO PHIEUNHAPKHO VALUES
--(1011, '2026-03-11'),
--(1012, '2026-03-12'),
--(1013, '2026-03-13'),
--(1014, '2026-03-14'),
--(1015, '2026-03-15'),
--(1016, '2026-03-16'),
--(1017, '2026-03-17'),
--(1018, '2026-03-18'),
--(1019, '2026-03-19'),
--(1020, '2026-03-20');

--INSERT INTO NOIDUNGPHIEUNHAP (SoPhieu, MaHang, SoLuong, DonGia) VALUES
--(1011, 111, 20, 200000),
--(1012, 112, 100, 3000),
--(1013, 113, 15, 150000),
--(1014, 114, 50, 120000),
--(1015, 115, 40, 90000),
--(1016, 116, 25, 500000),
--(1017, 117, 30, 250000),
--(1018, 118, 60, 50000),
--(1019, 119, 80, 20000),
--(1020, 120, 35, 180000);

--select * from dbo.NOIDUNGPHIEUNHAP


