create table LOPHOC (
	MaLop varchar(10) primary key,
	TenLop varchar(50) not null
);

create table SINHVIEN (
	MaSV varchar(10) primary key,
	MaLop varchar(10) not null,
	TenSV nvarchar(50) not null,
	NgaySinh date not null,
	DiaChi nvarchar(100) not null,
	foreign key (MaLop) references LOPHOC(MaLop)
);

create table MONHOC (
	MaMon varchar(10) primary key,
	TenMon nvarchar(50) not null
);

create table DIEMTHI (
	MaMon varchar(10),
	MaSV varchar(10),
	Diem float,
	PRIMARY KEY (MaSV, MaMon),
	foreign key (MaSV) references SINHVIEN(MaSV),
	foreign key (MaMon) references MONHOC(MaMon)
);

INSERT INTO LOPHOC VALUES ('L01', 'Cong nghe thong tin'), ('L02', 'Ke toan'), ('L03', 'Quan tri kinh doanh');
INSERT INTO MONHOC VALUES ('M01', 'Toan'), ('M02', 'Ly'), ('M03', 'Hoa');

SET DATEFORMAT dmy;
GO

-- Nhập 20 Sinh Viên (phân bổ ngẫu nhiên vào 3 lớp trên)
INSERT INTO SINHVIEN (MaSV, MaLop, TenSV, NgaySinh, DiaChi) VALUES 
('SV01', 'L01', N'Nguyễn Văn An', '15-05-2003', N'Hà Nội'),
('SV02', 'L01', N'Trần Thị Bình', '20-11-2003', N'Hải Phòng'),
('SV03', 'L01', N'Lê Hoàng Cường', '02-02-2004', N'Đà Nẵng'),
('SV04', 'L01', N'Phạm Minh Đức', '12-08-2003', N'TP. Hồ Chí Minh'),
('SV05', 'L01', N'Đỗ Phương Anh', '30-04-2004', N'Cần Thơ'),
('SV06', 'L01', N'Vũ Hải Yến', '01-01-2003', N'Nam Định'),
('SV07', 'L01', N'Bùi Tiến Dũng', '19-05-2004', N'Thanh Hóa'),
('SV08', 'L02', N'Hoàng Thanh Trúc', '10-10-2003', N'Quảng Ninh'),
('SV09', 'L02', N'Ngô Văn Hùng', '25-12-2004', N'Bình Dương'),
('SV10', 'L02', N'Đặng Thu Thảo', '08-03-2003', N'Huế'),
('SV11', 'L02', N'Lý Hải Hậu', '14-07-2003', N'Hà Tĩnh'),
('SV12', 'L02', N'Trương Mỹ Lan', '22-09-2004', N'Đồng Nai'),
('SV13', 'L02', N'Mai Xuân Bách', '11-11-2003', N'Vĩnh Phúc'),
('SV14', 'L02', N'Chu Hữu Tín', '05-06-2004', N'Nghệ An'),
('SV15', 'L03', N'Đinh Tuấn Vũ', '28-02-2003', N'Hà Nội'),
('SV16', 'L03', N'Trịnh Quang Thái', '17-10-2004', N'Hải Dương'),
('SV17', 'L03', N'Tô Kim Tử', '09-09-2003', N'Bắc Ninh'),
('SV18', 'L03', N'Phan Hồng Lộc', '23-01-2004', N'Long An'),
('SV19', 'L03', N'Dương Khắc Tiệp', '04-04-2003', N'Tiền Giang'),
('SV20', 'L03', N'Đoàn Bảo Châu', '31-12-2004', N'Vũng Tàu');
GO

-- Nhập Điểm Thi: Mỗi sinh viên (20 người) đều thi cả 3 môn (M01, M02, M03) => Tổng cộng 60 dòng điểm
INSERT INTO DIEMTHI (MaSV, MaMon, Diem) VALUES 
-- SV01
('SV01', 'M01', 8.5), ('SV01', 'M02', 7.0), ('SV01', 'M03', 9.0),
-- SV02
('SV02', 'M01', 6.0), ('SV02', 'M02', 8.5), ('SV02', 'M03', 7.5),
-- SV03
('SV03', 'M01', 9.5), ('SV03', 'M02', 9.0), ('SV03', 'M03', 8.0),
-- SV04
('SV04', 'M01', 5.5), ('SV04', 'M02', 6.0), ('SV04', 'M03', 6.5),
-- SV05
('SV05', 'M01', 7.0), ('SV05', 'M02', 7.5), ('SV05', 'M03', 8.5),
-- SV06
('SV06', 'M01', 8.0), ('SV06', 'M02', 9.5), ('SV06', 'M03', 9.0),
-- SV07
('SV07', 'M01', 4.0), ('SV07', 'M02', 5.5), ('SV07', 'M03', 6.0),
-- SV08
('SV08', 'M01', 9.0), ('SV08', 'M02', 8.0), ('SV08', 'M03', 7.0),
-- SV09
('SV09', 'M01', 7.5), ('SV09', 'M02', 6.5), ('SV09', 'M03', 8.0),
-- SV10
('SV10', 'M01', 8.5), ('SV10', 'M02', 8.5), ('SV10', 'M03', 9.0),
-- SV11
('SV11', 'M01', 5.0), ('SV11', 'M02', 6.5), ('SV11', 'M03', 7.0),
-- SV12
('SV12', 'M01', 9.5), ('SV12', 'M02', 9.0), ('SV12', 'M03', 9.5),
-- SV13
('SV13', 'M01', 6.5), ('SV13', 'M02', 7.0), ('SV13', 'M03', 6.0),
-- SV14
('SV14', 'M01', 8.0), ('SV14', 'M02', 7.5), ('SV14', 'M03', 8.0),
-- SV15
('SV15', 'M01', 7.0), ('SV15', 'M02', 8.0), ('SV15', 'M03', 8.5),
-- SV16
('SV16', 'M01', 9.0), ('SV16', 'M02', 9.5), ('SV16', 'M03', 8.0),
-- SV17
('SV17', 'M01', 5.5), ('SV17', 'M02', 5.0), ('SV17', 'M03', 6.5),
-- SV18
('SV18', 'M01', 8.5), ('SV18', 'M02', 7.0), ('SV18', 'M03', 9.0),
-- SV19
('SV19', 'M01', 7.5), ('SV19', 'M02', 8.0), ('SV19', 'M03', 7.5),
-- SV20
('SV20', 'M01', 9.0), ('SV20', 'M02', 8.5), ('SV20', 'M03', 9.5);
GO


DELETE FROM SINHVIEN;
select * from SINHVIEN;



select l.MaLop, l.TenLop, s.MaSV, s.TenSV, convert(varchar,s.NgaySinh, 103) as NgaySinh, s.DiaChi
from [dbo].[LOPHOC] as l
inner join [dbo].[SINHVIEN] as s on l.MaLop = s.MaLop;

select l.MaLop, l.TenLop, s.MaSV, s.TenSV, s.NgaySinh, s.DiaChi
from [dbo].[LOPHOC] as l
left join [dbo].[SINHVIEN] as s on l.MaLop = s.MaLop;

select l.MaLop, l.TenLop, s.MaSV, s.TenSV, s.NgaySinh, s.DiaChi
from [dbo].[LOPHOC] as l
right join [dbo].[SINHVIEN] as s on l.MaLop = s.MaLop;

select top 10 round(avg(Diem), 1) as DiemTB,
	l.MaLop, 
	l.TenLop, 
	s.MaSV, 
	s.TenSV	
from [dbo].[LOPHOC] as l
join [dbo].[SINHVIEN] as s on l.MaLop = s.MaLop
join [dbo].[DIEMTHI] as d on s.MaSV = d.MaSV
group by l.MaLop, l.TenLop, s.MaSV, s.TenSV
order by DiemTB desc;

SELECT TOP 10
    L.MaLop,
    L.TenLop,
    SV.MaSV,
    SV.TenSV,
    round(AVG(d.Diem),1) AS DiemTrungBinh
FROM SINHVIEN SV
JOIN LOPHOC L ON SV.MaLop = L.MaLop
JOIN DIEMTHI d ON SV.MaSV = d.MaSV
GROUP BY 
    L.MaLop, L.TenLop,
    SV.MaSV, SV.TenSV
ORDER BY 
    DiemTrungBinh DESC;


WITH DiemTB AS (
    SELECT 
        L.MaLop,
        L.TenLop,
        SV.MaSV,
        SV.TenSV,
        AVG(DT.Diem) AS DiemTrungBinh
    FROM SINHVIEN SV
    JOIN LOPHOC L ON SV.MaLop = L.MaLop
    JOIN DIEMTHI DT ON SV.MaSV = DT.MaSV
    GROUP BY 
        L.MaLop, L.TenLop,
        SV.MaSV, SV.TenSV
),
XepHang AS (
    SELECT *,
        ROW_NUMBER() OVER (ORDER BY DiemTrungBinh DESC) AS STT,
        COUNT(*) OVER () AS TongSV
    FROM DiemTB
)
SELECT 
    MaLop, TenLop, MaSV, TenSV, DiemTrungBinh
FROM XepHang
WHERE STT BETWEEN (TongSV/2 - 1) AND (TongSV/2 + 2);


-- Phân loại sinh viên dựa trên điểm trung bình
SELECT 
    L.MaLop, L.TenLop,
    SV.MaSV, SV.TenSV,
    round(AVG(DT.Diem),1) AS DiemTrungBinh,
    CASE 
        WHEN AVG(DT.Diem) < 5 THEN N'Yếu'
        WHEN AVG(DT.Diem) < 7 THEN N'Trung bình'
        WHEN AVG(DT.Diem) < 9 THEN N'Khá'
        ELSE N'Giỏi'
    END AS PhanLoai
FROM SINHVIEN SV
JOIN LOPHOC L ON SV.MaLop = L.MaLop
JOIN DIEMTHI DT ON SV.MaSV = DT.MaSV
GROUP BY 
    L.MaLop, L.TenLop,
    SV.MaSV, SV.TenSV;