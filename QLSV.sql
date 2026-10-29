-- Tạo bảng LOPHOC trước vì bảng SINHVIEN có tham chiếu khóa ngoại đến bảng này
CREATE TABLE LOPHOC (
    MaLop VARCHAR(20) PRIMARY KEY,
    TenLop NVARCHAR(100) NOT NULL,
    SiSo INT
);
GO

-- Tạo bảng SINHVIEN
CREATE TABLE SINHVIEN (
    MaSV VARCHAR(20) PRIMARY KEY,
    MaLop VARCHAR(20),
    TenSV NVARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(255),
    
    -- Khai báo khóa ngoại liên kết với bảng LOPHOC
    CONSTRAINT FK_SINHVIEN_LOPHOC FOREIGN KEY (MaLop) REFERENCES LOPHOC(MaLop)
);
GO

--SET DATEFORMAT dmy;

---- 2. Thêm 10 dữ liệu vào bảng LOPHOC
--INSERT INTO LOPHOC (MaLop, TenLop, SiSo) VALUES 
--('LH001', N'Công nghệ thông tin 1', 45),
--('LH002', N'Hệ thống thông tin 2', 40),
--('LH003', N'Kỹ thuật phần mềm 1', 35),
--('LH004', N'An toàn thông tin 3', 30),
--('LH005', N'Khoa học máy tính 2', 42),
--('LH006', N'Quản trị kinh doanh 1', 50),
--('LH007', N'Kế toán kiểm toán 4', 48),
--('LH008', N'Ngôn ngữ Anh 2', 38),
--('LH009', N'Marketing kỹ thuật số 1', 45),
--('LH010', N'Thương mại điện tử 3', 40);

---- 3. Thêm 10 dữ liệu vào bảng SINHVIEN 
---- Lưu ý: MaLop phải tồn tại trong bảng LOPHOC ở trên
--INSERT INTO SINHVIEN (MaSV, MaLop, TenSV, NgaySinh, GioiTinh, DiaChi) VALUES 
--('SV001', 'LH001', N'Nguyễn Văn An', '15-05-2003', N'Nam', N'Hà Nội'),
--('SV002', 'LH001', N'Trần Thị Bình', '20-11-2003', N'Nữ', N'Hải Phòng'),
--('SV003', 'LH002', N'Lê Hoàng Cường', '02-02-2004', N'Nam', N'Đà Nẵng'),
--('SV004', 'LH003', N'Phạm Minh Đức', '12-08-2003', N'Nam', N'TP. Hồ Chí Minh'),
--('SV005', 'LH004', N'Đỗ Phương Anh', '30-04-2004', N'Nữ', N'Cần Thơ'),
--('SV006', 'LH005', N'Vũ Hải Yến', '01-01-2003', N'Nữ', N'Nam Định'),
--('SV007', 'LH006', N'Bùi Tiến Dũng', '19-05-2004', N'Nam', N'Thanh Hóa'),
--('SV008', 'LH007', N'Hoàng Thanh Trúc', '10-10-2003', N'Nữ', N'Quảng Ninh'),
--('SV009', 'LH008', N'Ngô Văn Hùng', '25-12-2004', N'Nam', N'Bình Dương'),
--('SV010', 'LH009', N'Đặng Thu Thảo', '08-03-2003', N'Nữ', N'Huế');

SELECT * FROM LOPHOC;
SELECT * FROM SINHVIEN;

select [MaLop], [TenLop], [SiSo] as [Số lượng sinh viên]
from [dbo].[LOPHOC];


--Đếm tổng số sinh viên của từng lớp
SELECT 
    L.MaLop, 
    L.TenLop, 
    COUNT(S.MaSV) AS SoLuongSV
FROM LOPHOC L
LEFT JOIN SINHVIEN S ON L.MaLop = S.MaLop
GROUP BY 
    L.MaLop, 
    L.TenLop;



--Đếm số lượng sinh viên Nam và Nữ của từng lớp
select l.MaLop, l.TenLop,
           sum(case when s.GioiTinh = N'Nam' then 1 else 0 end) as SoLuongNam,
           sum(case when s.GioiTinh = N'Nữ' then 1 else 0 end) as SoLuongNu
from [dbo].[LOPHOC] as l
left join [dbo].[SINHVIEN] as s on l.MaLop = s.MaLop
group by l.MaLop, l.TenLop;

--Lọc sinh viên có sinh nhật từ ngày 01 đến 05 của tháng 05
SELECT 
    MaSV, 
    TenSV, 
    NgaySinh
FROM SINHVIEN
WHERE 
    MONTH(NgaySinh) = 5 
    AND DAY(NgaySinh) BETWEEN 1 AND 5;
