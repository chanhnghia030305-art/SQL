--CREATE TABLE Lop (
--    MaLop VARCHAR(10) PRIMARY KEY,
--    TenLop NVARCHAR(50),
--    KhoaHoc INT
--);

--CREATE TABLE SinhVien (
--    MaSV VARCHAR(10) PRIMARY KEY,
--    TenSV NVARCHAR(50),
--    NgaySinh DATE,
--    GioiTinh NVARCHAR(10),
--    MaLop VARCHAR(10),
    
--    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop)
--);

--CREATE TABLE GiangVien (
--    MaGV VARCHAR(10) PRIMARY KEY,
--    TenGV NVARCHAR(50),
--    HocVi NVARCHAR(50)
--);

--CREATE TABLE PhanCong (
--    MaGV VARCHAR(10),
--    MaLop VARCHAR(10),
--    MonHoc NVARCHAR(50),

--    PRIMARY KEY (MaGV, MaLop, MonHoc),

--    FOREIGN KEY (MaGV) REFERENCES GiangVien(MaGV),
--    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop)
--);

--INSERT INTO dbo.Lop VALUES 
--('L01', N'CNTT1', 2024),
--('L02', N'CNTT2', 2024);

--INSERT INTO dbo.SinhVien VALUES 
--('SV01', N'Nguyễn Văn A', '2005-01-01', N'Nam', 'L01'),
--('SV02', N'Trần Thị B', '2005-02-02', N'Nữ', 'L01'),
--('SV03', N'Lê Văn C', '2005-03-03', N'Nam', 'L02');

--INSERT INTO dbo.GiangVien VALUES 
--('GV01', N'Nguyễn Văn Thầy', N'Thạc sĩ'),
--('GV02', N'Trần Văn Cô', N'Tiến sĩ');

--INSERT INTO dbo.PhanCong VALUES 
--('GV01', 'L01', N'Cơ sở dữ liệu'),
--('GV02', 'L01', N'Lập trình'),
--('GV01', 'L02', N'Cấu trúc dữ liệu'
--);

--SELECT * FROM dbo.SinhVien;
--select * from dbo.SinhVien where MaLop = 'L01';

--update dbo.SinhVien
--set MaLop = 'L02'
--where MaSV = 'SV01';

--select * from dbo.SinhVien where MaLop = 'L02';

--alter table dbo.SinhVien
--add QueQuan nvarchar(50);

--insert into dbo.SinhVien 
--values ('SV04', N'Phạm Thị D', '2005-04-04', N'Nữ', 'L01', N'Hà Nội');

--UPDATE SinhVien
--SET QueQuan = N'Hồ Chí Minh'
--WHERE MaSV = 'SV01';

--UPDATE SinhVien
--SET QueQuan = N'Hồ Chí Minh'
--WHERE MaSV = 'SV02';

--UPDATE SinhVien
--SET QueQuan = N'Hồ Chí Minh'
--WHERE MaSV = 'SV03';

--SELECT * FROM dbo.SinhVien;

--if exists 
--(select * from dbo.SinhVien where MaSV = 'SV01' and QueQuan = N'Hồ Chí Minh')
--begin
--    print N'Đã tồn tại sinh viên'
--end

--select MaLop as l
--from dbo.SinhVen

--SELECT TenSV AS TenSinhVien
--FROM SinhVien;

--SELECT sv.TenSV, l.TenLop
--FROM SinhVien AS sv
--INNER JOIN Lop AS l
--ON sv.MaLop = l.MaLop;
