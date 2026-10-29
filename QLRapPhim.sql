CREATE TABLE THANHVIEN (
    MaTV INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgSinh DATE,
    GioiTinh NVARCHAR(10),
    DienThoai VARCHAR(15),
    Quan NVARCHAR(50),
    LoaiTV NVARCHAR(50)
)

CREATE TABLE PHIM (
    MaP INT PRIMARY KEY,
    TenP NVARCHAR(100),
    NamSX INT,
    TheLoai NVARCHAR(50),
    ThoiLuong INT,
    TinhTrang NVARCHAR(50),
    SoLuotXem INT
)

CREATE TABLE RAPPHIM (
    MaRP INT PRIMARY KEY,
    TenRP NVARCHAR(100),
    SLVe INT,
    DiaChi NVARCHAR(200),
    ThanhPho NVARCHAR(50)
)
CREATE TABLE LICHCHIEU (
    MaLC INT PRIMARY KEY,
    MaRP INT,
    MaP INT,
    PhongChieu NVARCHAR(50),
    SuatChieu TIME,
    SucChua INT,
    TuNgay DATE,
    DenNgay DATE,
    FOREIGN KEY (MaRP) REFERENCES RAPPHIM(MaRP),
    FOREIGN KEY (MaP) REFERENCES PHIM(MaP)
)
CREATE TABLE VE (
    MaVe INT PRIMARY KEY,
    MaTV INT,
    MaLC INT,
    NgayMua DATE,
    LoaiVe NVARCHAR(50),
    GiaTien FLOAT,
    FOREIGN KEY (MaTV) REFERENCES THANHVIEN(MaTV),
    FOREIGN KEY (MaLC) REFERENCES LICHCHIEU(MaLC)
)

set dateformat dmy
INSERT INTO THANHVIEN VALUES
(1, N'Nguyễn Văn A', '01-01-2002', N'Nam', '0901234567', N'Quận 1', N'VIP'),
(2, N'Trần Thị B', '10-05-2001', N'Nữ', '0912345678', N'Quận 3', N'Thường'),
(3, N'Lê Văn C', '09-09-1999', N'Nam', '0923456789', N'Quận 5', N'VIP')

INSERT INTO PHIM VALUES
(1, N'Avengers', 2020, N'Hành động', 120, N'Đang chiếu', 1000),
(2, N'Frozen', 2019, N'Hoạt hình', 90, N'Ngừng chiếu', 800),
(3, N'Conan', 2021, N'Trinh thám', 110, N'Đang chiếu', 600)

INSERT INTO RAPPHIM VALUES
(1, N'Galaxy Nguyễn Du', 200, N'116 Nguyễn Du', N'HCM'),
(2, N'Galaxy Tân Bình', 150, N'123 Cộng Hòa', N'HCM')

INSERT INTO LICHCHIEU VALUES
(1, 1, 1, N'Phòng 1', '18:00', 100, '2024-01-01', '2024-12-31'),
(2, 1, 2, N'Phòng 2', '20:00', 80, '2024-01-01', '2024-06-30'),
(3, 2, 3, N'Phòng 1', '19:00', 120, '2024-02-01', '2024-12-31')

INSERT INTO VE VALUES
(1, 1, 1, '2024-03-01', N'Người lớn', 90000),
(2, 2, 2, '2024-03-02', N'Trẻ em', 60000),
(3, 3, 3, '2024-03-03', N'VIP', 120000)


select * from THANHVIEN

--Cho biết thông tin phim (TenP, NamSX) có thể là thể loại Hành động hoặc có thời lượng 120 phút, sắp xếp theo số lượt xem giảm dần.
select [TenP], [NamSX]
from [dbo].[PHIM]
where [TheLoai] = N'Hành động' or [ThoiLuong] = 120
order by [SoLuotXem] desc;

--Cho biết thông tin thành viên (MaTV, HoTen) mua vé vào tháng 11 năm 2021
select t.[MaTV], t.[HoTen]
from [dbo].[THANHVIEN] as t
join [dbo].[VE] as v on t.MaTV = v.MaTV
where month(v.NgayMua) = 03 and year(v.NgayMua) = 2024;


SELECT MaP, TenP
FROM PHIM
WHERE MaP NOT IN (
    SELECT LC.MaP
    FROM LICHCHIEU LC
    JOIN RAPPHIM RP ON LC.MaRP = RP.MaRP
    WHERE RP.TenRP = N'Galaxy Linh Trung'
)

SET DATEFORMAT DMY
INSERT INTO THANHVIEN VALUES
(4, N'Phạm Văn D', '15/02/2000', N'Nam', '0934567890', N'Quận 7', N'VIP'),
(5, N'Hoàng Thị E', '20/03/2002', N'Nữ', '0945678901', N'Quận 10', N'Thường'),
(6, N'Nguyễn Văn F', '01/01/1998', N'Nam', '0956789012', N'Quận 1', N'VIP'),
(7, N'Lê Thị G', '12/12/2001', N'Nữ', '0967890123', N'Quận 3', N'Thường'),
(8, N'Trần Văn H', '05/05/1999', N'Nam', '0978901234', N'Quận 5', N'VIP'),
(9, N'Bùi Thị I', '22/07/2000', N'Nữ', '0989012345', N'Quận 6', N'Thường'),
(10, N'Đặng Văn K', '30/09/1997', N'Nam', '0990123456', N'Quận 2', N'VIP'),
(11, N'Võ Thị L', '11/11/2003', N'Nữ', '0901112223', N'Quận 4', N'Thường'),
(12, N'Phan Văn M', '25/08/2001', N'Nam', '0912223334', N'Quận 8', N'VIP'),
(13, N'Huỳnh Thị N', '14/04/2002', N'Nữ', '0923334445', N'Quận 9', N'Thường')

INSERT INTO PHIM VALUES
(4, N'Titanic', 1997, N'Tình cảm', 180, N'Ngừng chiếu', 2000),
(5, N'Avatar', 2009, N'Khoa học viễn tưởng', 160, N'Đang chiếu', 3000),
(6, N'Joker', 2019, N'Tâm lý', 122, N'Đang chiếu', 1500),
(7, N'Spider Man', 2021, N'Hành động', 130, N'Đang chiếu', 2500),
(8, N'Doraemon', 2020, N'Hoạt hình', 95, N'Ngừng chiếu', 1200),
(9, N'Fast & Furious', 2018, N'Hành động', 140, N'Đang chiếu', 2700),
(10, N'Parasite', 2019, N'Tâm lý', 132, N'Ngừng chiếu', 1800),
(11, N'Inception', 2010, N'Khoa học', 148, N'Đang chiếu', 2200),
(12, N'Interstellar', 2014, N'Khoa học', 169, N'Đang chiếu', 2100),
(13, N'Frozen 2', 2019, N'Hoạt hình', 103, N'Ngừng chiếu', 1700)

INSERT INTO RAPPHIM VALUES
(3, N'Galaxy Linh Trung', 180, N'456 Lý Thường Kiệt', N'HCM'),
(4, N'Galaxy Quận 7', 200, N'789 Nguyễn Thị Thập', N'HCM'),
(5, N'Galaxy Bình Thạnh', 150, N'12 Xô Viết Nghệ Tĩnh', N'HCM'),
(6, N'Galaxy Gò Vấp', 170, N'34 Quang Trung', N'HCM'),
(7, N'Galaxy Thủ Đức', 160, N'56 Võ Văn Ngân', N'HCM'),
(8, N'Galaxy Hà Nội', 220, N'10 Tràng Tiền', N'Hà Nội'),
(9, N'Galaxy Đà Nẵng', 140, N'20 Bạch Đằng', N'Đà Nẵng'),
(10, N'Galaxy Huế', 130, N'30 Hùng Vương', N'Huế'),
(11, N'Galaxy Cần Thơ', 120, N'40 Ninh Kiều', N'Cần Thơ'),
(12, N'Galaxy Hải Phòng', 110, N'50 Lê Lợi', N'Hải Phòng')

INSERT INTO LICHCHIEU VALUES
(4, 3, 4, N'Phòng 1', '18:30', 100, '01/01/2024', '31/12/2024'),
(5, 4, 5, N'Phòng 2', '19:00', 120, '01/02/2024', '31/12/2024'),
(6, 5, 6, N'Phòng 3', '20:00', 80, '01/03/2024', '30/09/2024'),
(7, 6, 7, N'Phòng 1', '17:00', 90, '01/04/2024', '31/12/2024'),
(8, 7, 8, N'Phòng 2', '21:00', 110, '01/05/2024', '31/10/2024'),
(9, 8, 9, N'Phòng 1', '18:00', 150, '01/06/2024', '31/12/2024'),
(10, 9, 10, N'Phòng 2', '20:30', 100, '01/07/2024', '31/12/2024'),
(11, 10, 11, N'Phòng 3', '19:30', 130, '01/08/2024', '31/12/2024'),
(12, 11, 12, N'Phòng 1', '18:15', 120, '01/09/2024', '31/12/2024'),
(13, 12, 13, N'Phòng 2', '20:45', 140, '01/10/2024', '31/12/2024')

INSERT INTO VE VALUES
(4, 4, 4, '05/01/2024', N'Người lớn', 90000),
(5, 5, 5, '10/02/2024', N'Trẻ em', 60000),
(6, 6, 6, '15/03/2024', N'VIP', 120000),
(7, 7, 7, '20/04/2024', N'Người lớn', 90000),
(8, 8, 8, '25/05/2024', N'Trẻ em', 60000),
(9, 9, 9, '30/06/2024', N'VIP', 120000),
(10, 10, 10, '05/07/2024', N'Người lớn', 90000),
(11, 11, 11, '10/08/2024', N'Trẻ em', 60000),
(12, 12, 12, '15/09/2024', N'VIP', 120000),
(13, 13, 13, '20/10/2024', N'Người lớn', 90000)


--Cho biết thành viên (MaTV) đã mua vé xem phim tại cả hai rạp Galaxy Linh Trung và Galaxy Quận 7
select MaTV
from VE v, LICHCHIEU lc, RAPPHIM rp
where v.MaLC = lc.MaLC and lc.MaRP = rp.MaRP and rp.TenRP = N'Galaxy Linh Trung'
intersect --lấy phần giao của 2 tập hợp, chỉ lấy những MaTV xuất hiện ở cả 2 tập hợp
select MaTV
from VE v, LICHCHIEU lc, RAPPHIM rp
where v.MaLC = lc.MaLC and lc.MaRP = rp.MaRP and rp.TenRP = N'Galaxy Quận 7'


select top 1 with ties
    tv.MaTV, 
    tv.HoTen,
    SUM(v.GiaTien) AS TongTien
from [dbo].[THANHVIEN] tv
join [dbo].[VE] v on tv.MaTV = v.MaTV
group by tv.MaTV, tv.HoTen
order by TongTien desc;


SELECT P.MaP, P.TenP
FROM PHIM P
WHERE P.TheLoai = N'Kinh dị'
AND NOT EXISTS (
    SELECT *
    FROM RAPPHIM RP
    WHERE RP.ThanhPho = N'HCM'
    AND NOT EXISTS (
        SELECT *
        FROM LICHCHIEU LC
        WHERE LC.MaP = P.MaP
        AND LC.MaRP = RP.MaRP
    )
)




