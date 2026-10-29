CREATE TABLE BENHNHAN (
    MABN INT PRIMARY KEY,
    HOTEN NVARCHAR(100),
    NGSINH DATE,
    CMND VARCHAR(12),
    DIACHI NVARCHAR(200),
    DOITUONG NVARCHAR(50),
    SLPT INT
);

CREATE TABLE KHAMBENH (
    MAKB INT PRIMARY KEY,
    MABN INT,
    BENH NVARCHAR(100),
    BENHKT NVARCHAR(100),
    BATDAU DATE,
    KETTHUC DATE,
    KETLUAN NVARCHAR(200),
    TAIKHAM DATE,
    FOREIGN KEY (MABN) REFERENCES BENHNHAN(MABN)
);

CREATE TABLE PHAUTHUAT (
    MAPT INT PRIMARY KEY,
    MAKB INT,
    BOPHANPT NVARCHAR(100),
    LOAIPT NVARCHAR(100),
    KETQUA NVARCHAR(100),
    FOREIGN KEY (MAKB) REFERENCES KHAMBENH(MAKB)
);

CREATE TABLE BACSI (
    MABS INT PRIMARY KEY,
    HOTEN NVARCHAR(100),
    NAMSINH DATE,
    CHUYENMON NVARCHAR(100),
    KHOA NVARCHAR(100),
    BENHVIEN NVARCHAR(100)
);

CREATE TABLE PHUTRACH (
    MABS INT,
    MAKB INT,
    BATDAUPT DATE,
    KETTHUCPT DATE,
    PRIMARY KEY (MABS, MAKB),
    FOREIGN KEY (MABS) REFERENCES BACSI(MABS),
    FOREIGN KEY (MAKB) REFERENCES KHAMBENH(MAKB)
);

set dateformat dmy;
INSERT INTO BENHNHAN VALUES
(1,N'Nguyễn Văn A','01/01/2000','123456001',N'Hà Nội',N'BHYT',1),
(2,N'Trần Văn B','02/02/2001','123456002',N'HCM',N'Viện phí',0),
(3,N'Lê Văn C','03/03/2002','123456003',N'Đà Nẵng',N'BHYT',2),
(4,N'Phạm Văn D','04/04/2000','123456004',N'Huế',N'BHYT',1),
(5,N'Hoàng Văn E','05/05/2001','123456005',N'Cần Thơ',N'Viện phí',0),
(6,N'Đỗ Văn F','06/06/2002','123456006',N'Hải Phòng',N'BHYT',1),
(7,N'Bùi Văn G','07/07/2000','123456007',N'Nghệ An',N'BHYT',2),
(8,N'Vũ Văn H','08/08/2001','123456008',N'Bắc Ninh',N'Viện phí',0),
(9,N'Ngô Văn I','09/09/2002','123456009',N'Nam Định',N'BHYT',1),
(10,N'Dương Văn K','10/10/2000','123456010',N'Hà Nam',N'BHYT',0),
(11,N'Nguyễn Văn L','11/11/2001','123456011',N'Hà Nội',N'BHYT',1),
(12,N'Trần Văn M','12/12/2002','123456012',N'HCM',N'Viện phí',0),
(13,N'Lê Văn N','13/01/2000','123456013',N'Đà Nẵng',N'BHYT',2),
(14,N'Phạm Văn O','14/02/2001','123456014',N'Huế',N'BHYT',1),
(15,N'Hoàng Văn P','15/03/2002','123456015',N'Cần Thơ',N'Viện phí',0),
(16,N'Đỗ Văn Q','16/04/2000','123456016',N'Hải Phòng',N'BHYT',1),
(17,N'Bùi Văn R','17/05/2001','123456017',N'Nghệ An',N'BHYT',2),
(18,N'Vũ Văn S','18/06/2002','123456018',N'Bắc Ninh',N'Viện phí',0),
(19,N'Ngô Văn T','19/07/2000','123456019',N'Nam Định',N'BHYT',1),
(20,N'Dương Văn U','20/08/2001','123456020',N'Hà Nam',N'BHYT',0),
(21,N'Nguyễn Văn V','21/09/2002','123456021',N'Hà Nội',N'BHYT',1),
(22,N'Trần Văn W','22/10/2000','123456022',N'HCM',N'Viện phí',0),
(23,N'Lê Văn X','23/11/2001','123456023',N'Đà Nẵng',N'BHYT',2),
(24,N'Phạm Văn Y','24/12/2002','123456024',N'Huế',N'BHYT',1),
(25,N'Hoàng Văn Z','25/01/2000','123456025',N'Cần Thơ',N'Viện phí',0),
(26,N'Đỗ Văn AA','26/02/2001','123456026',N'Hải Phòng',N'BHYT',1),
(27,N'Bùi Văn AB','27/03/2002','123456027',N'Nghệ An',N'BHYT',2),
(28,N'Vũ Văn AC','28/04/2000','123456028',N'Bắc Ninh',N'Viện phí',0),
(29,N'Ngô Văn AD','29/05/2001','123456029',N'Nam Định',N'BHYT',1),
(30,N'Dương Văn AE','30/06/2002','123456030',N'Hà Nam',N'BHYT',0);


INSERT INTO KHAMBENH VALUES
(1,1,N'Cảm cúm',N'Nhẹ','01/01/2024','05/01/2024',N'Khỏi','10/01/2024'),
(2,2,N'Sốt',N'Trung bình','02/01/2024','06/01/2024',N'Ổn','11/01/2024'),
(3,3,N'Đau dạ dày',N'Nặng','03/01/2024','10/01/2024',N'Khỏi','20/01/2024'),
(4,4,N'Viêm họng',N'Nhẹ','04/01/2024','08/01/2024',N'Khỏi','15/01/2024'),
(5,5,N'Viêm phổi',N'Nặng','05/01/2024','15/01/2024',N'Ổn','25/01/2024'),
(6,6,N'Đau đầu',N'Nhẹ','06/01/2024','07/01/2024',N'Khỏi','12/01/2024'),
(7,7,N'Cao huyết áp',N'Trung bình','07/01/2024','14/01/2024',N'Ổn','22/01/2024'),
(8,8,N'Tiểu đường',N'Nặng','08/01/2024','18/01/2024',N'Ổn','28/01/2024'),
(9,9,N'Viêm gan',N'Nặng','09/01/2024','20/01/2024',N'Ổn','30/01/2024'),
(10,10,N'Đau lưng',N'Nhẹ','10/01/2024','12/01/2024',N'Khỏi','18/01/2024'),
(11,11,N'Cảm cúm',N'Nhẹ','11/01/2024','15/01/2024',N'Khỏi','20/01/2024'),
(12,12,N'Sốt xuất huyết',N'Nặng','12/01/2024','22/01/2024',N'Ổn','05/02/2024'),
(13,13,N'Viêm tai',N'Nhẹ','13/01/2024','17/01/2024',N'Khỏi','25/01/2024'),
(14,14,N'Đau dạ dày',N'Trung bình','14/01/2024','20/01/2024',N'Ổn','28/01/2024'),
(15,15,N'Viêm xoang',N'Nhẹ','15/01/2024','18/01/2024',N'Khỏi','25/01/2024'),
(16,16,N'Viêm phế quản',N'Trung bình','16/01/2024','25/01/2024',N'Ổn','05/02/2024'),
(17,17,N'Tim mạch',N'Nặng','17/01/2024','30/01/2024',N'Ổn','10/02/2024'),
(18,18,N'Đau khớp',N'Trung bình','18/01/2024','25/01/2024',N'Khỏi','05/02/2024'),
(19,19,N'Viêm da',N'Nhẹ','19/01/2024','23/01/2024',N'Khỏi','01/02/2024'),
(20,20,N'Suy nhược',N'Trung bình','20/01/2024','28/01/2024',N'Ổn','10/02/2024'),
(21,21,N'Viêm họng',N'Nhẹ','21/01/2024','25/01/2024',N'Khỏi','02/02/2024'),
(22,22,N'Cảm lạnh',N'Nhẹ','22/01/2024','26/01/2024',N'Khỏi','03/02/2024'),
(23,23,N'Đau bụng',N'Trung bình','23/01/2024','29/01/2024',N'Ổn','07/02/2024'),
(24,24,N'Viêm phổi',N'Nặng','24/01/2024','05/02/2024',N'Ổn','15/02/2024'),
(25,25,N'Viêm gan',N'Nặng','25/01/2024','06/02/2024',N'Ổn','16/02/2024'),
(26,26,N'Đau đầu',N'Nhẹ','26/01/2024','28/01/2024',N'Khỏi','05/02/2024'),
(27,27,N'Cao huyết áp',N'Trung bình','27/01/2024','05/02/2024',N'Ổn','15/02/2024'),
(28,28,N'Tiểu đường',N'Nặng','28/01/2024','10/02/2024',N'Ổn','20/02/2024'),
(29,29,N'Viêm xoang',N'Nhẹ','29/01/2024','02/02/2024',N'Khỏi','10/02/2024'),
(30,30,N'Viêm họng',N'Nhẹ','30/01/2024','03/02/2024',N'Khỏi','10/02/2024');


INSERT INTO BACSI VALUES
(1,N'Bs Nguyễn A','01/01/1980',N'Nội',N'Nội tổng hợp',N'BV Bạch Mai'),
(2,N'Bs Trần B','02/02/1981',N'Ngoại',N'Ngoại tổng hợp',N'BV Chợ Rẫy'),
(3,N'Bs Lê C','03/03/1982',N'Tim mạch',N'Tim mạch',N'BV Tim'),
(4,N'Bs Phạm D','04/04/1983',N'Tai mũi họng',N'TMH',N'BV Tai Mũi Họng'),
(5,N'Bs Hoàng E','05/05/1984',N'Hô hấp',N'Hô hấp',N'BV Phổi'),
(6,N'Bs Đỗ F','06/06/1985',N'Thần kinh',N'Thần kinh',N'BV 108'),
(7,N'Bs Bùi G','07/07/1980',N'Tim mạch',N'Tim mạch',N'BV Tim'),
(8,N'Bs Vũ H','08/08/1981',N'Nội tiết',N'Nội tiết',N'BV Nội tiết'),
(9,N'Bs Ngô I','09/09/1982',N'Gan mật',N'Gan mật',N'BV 103'),
(10,N'Bs Dương K','10/10/1983',N'Cơ xương',N'Cơ xương',N'BV Việt Đức'),
(11,N'Bs Nguyễn L','11/11/1984',N'Nội',N'Nội tổng hợp',N'BV Bạch Mai'),
(12,N'Bs Trần M','12/12/1985',N'Truyền nhiễm',N'Truyền nhiễm',N'BV Nhiệt đới'),
(13,N'Bs Lê N','13/01/1980',N'Tai',N'TMH',N'BV Tai Mũi Họng'),
(14,N'Bs Phạm O','14/02/1981',N'Tiêu hóa',N'Tiêu hóa',N'BV 108'),
(15,N'Bs Hoàng P','15/03/1982',N'Hô hấp',N'Hô hấp',N'BV Phổi'),
(16,N'Bs Đỗ Q','16/04/1983',N'Phế quản',N'Hô hấp',N'BV Phổi'),
(17,N'Bs Bùi R','17/05/1984',N'Tim',N'Tim mạch',N'BV Tim'),
(18,N'Bs Vũ S','18/06/1985',N'Cơ xương',N'Cơ xương',N'BV Việt Đức'),
(19,N'Bs Ngô T','19/07/1980',N'Da liễu',N'Da liễu',N'BV Da liễu'),
(20,N'Bs Dương U','20/08/1981',N'Dinh dưỡng',N'Dinh dưỡng',N'BV 103'),
(21,N'Bs Nguyễn V','21/09/1982',N'TMH',N'TMH',N'BV Tai Mũi Họng'),
(22,N'Bs Trần W','22/10/1983',N'Nội',N'Nội tổng hợp',N'BV Bạch Mai'),
(23,N'Bs Lê X','23/11/1984',N'Tiêu hóa',N'Tiêu hóa',N'BV 108'),
(24,N'Bs Phạm Y','24/12/1985',N'Hô hấp',N'Hô hấp',N'BV Phổi'),
(25,N'Bs Hoàng Z','25/01/1980',N'Gan',N'Gan mật',N'BV 103'),
(26,N'Bs Đỗ AA','26/02/1981',N'Thần kinh',N'Thần kinh',N'BV 108'),
(27,N'Bs Bùi AB','27/03/1982',N'Tim',N'Tim mạch',N'BV Tim'),
(28,N'Bs Vũ AC','28/04/1983',N'Nội tiết',N'Nội tiết',N'BV Nội tiết'),
(29,N'Bs Ngô AD','29/05/1984',N'TMH',N'TMH',N'BV Tai Mũi Họng'),
(30,N'Bs Dương AE','30/06/1985',N'Nhi',N'Nhi',N'BV Nhi');


INSERT INTO PHAUTHUAT VALUES
(1,1,N'Tim',N'Mổ hở',N'Thành công'),
(2,2,N'Dạ dày',N'Nội soi',N'Tốt'),
(3,3,N'Dạ dày',N'Mổ',N'Thành công'),
(4,4,N'Họng',N'Tiểu phẫu',N'Tốt'),
(5,5,N'Phổi',N'Mổ lớn',N'Ổn'),
(6,6,N'Não',N'Tiểu phẫu',N'Tốt'),
(7,7,N'Tim',N'Mổ',N'Ổn'),
(8,8,N'Tuyến tụy',N'Mổ',N'Ổn'),
(9,9,N'Gan',N'Mổ',N'Ổn'),
(10,10,N'Cột sống',N'Tiểu phẫu',N'Tốt'),
(11,11,N'Mũi',N'Tiểu phẫu',N'Tốt'),
(12,12,N'Máu',N'Mổ',N'Ổn'),
(13,13,N'Tai',N'Tiểu phẫu',N'Tốt'),
(14,14,N'Dạ dày',N'Nội soi',N'Tốt'),
(15,15,N'Mũi',N'Tiểu phẫu',N'Tốt'),
(16,16,N'Phế quản',N'Mổ',N'Ổn'),
(17,17,N'Tim',N'Mổ lớn',N'Ổn'),
(18,18,N'Khớp',N'Mổ',N'Tốt'),
(19,19,N'Da',N'Tiểu phẫu',N'Tốt'),
(20,20,N'Thể lực',N'Điều trị',N'Ổn'),
(21,21,N'Họng',N'Tiểu phẫu',N'Tốt'),
(22,22,N'Mũi',N'Tiểu phẫu',N'Tốt'),
(23,23,N'Ruột',N'Mổ',N'Ổn'),
(24,24,N'Phổi',N'Mổ lớn',N'Ổn'),
(25,25,N'Gan',N'Mổ',N'Ổn'),
(26,26,N'Não',N'Tiểu phẫu',N'Tốt'),
(27,27,N'Tim',N'Mổ',N'Ổn'),
(28,28,N'Tuyến tụy',N'Mổ',N'Ổn'),
(29,29,N'Mũi',N'Tiểu phẫu',N'Tốt'),
(30,30,N'Họng',N'Tiểu phẫu',N'Thành công');


INSERT INTO PHUTRACH VALUES
(1,1,'01/01/2024','05/01/2024'),
(2,2,'02/01/2024','06/01/2024'),
(3,3,'03/01/2024','10/01/2024'),
(4,4,'04/01/2024','08/01/2024'),
(5,5,'05/01/2024','15/01/2024'),
(6,6,'06/01/2024','07/01/2024'),
(7,7,'07/01/2024','14/01/2024'),
(8,8,'08/01/2024','18/01/2024'),
(9,9,'09/01/2024','20/01/2024'),
(10,10,'10/01/2024','12/01/2024'),
(11,11,'11/01/2024','15/01/2024'),
(12,12,'12/01/2024','22/01/2024'),
(13,13,'13/01/2024','17/01/2024'),
(14,14,'14/01/2024','20/01/2024'),
(15,15,'15/01/2024','18/01/2024'),
(16,16,'16/01/2024','25/01/2024'),
(17,17,'17/01/2024','30/01/2024'),
(18,18,'18/01/2024','25/01/2024'),
(19,19,'19/01/2024','23/01/2024'),
(20,20,'20/01/2024','28/01/2024'),
(21,21,'21/01/2024','25/01/2024'),
(22,22,'22/01/2024','26/01/2024'),
(23,23,'23/01/2024','29/01/2024'),
(24,24,'24/01/2024','05/02/2024'),
(25,25,'25/01/2024','06/02/2024'),
(26,26,'26/01/2024','28/01/2024'),
(27,27,'27/01/2024','05/02/2024'),
(28,28,'28/01/2024','10/02/2024'),
(29,29,'29/01/2024','02/02/2024'),
(30,30,'30/01/2024','03/02/2024');


select [HOTEN], [CMND]
from [dbo].[BENHNHAN]
where [DOITUONG] = N'BHYT' or [DIACHI] = N'Đồng Nai'
order by [SLPT] asc;


select kb.[MAKB], kb.[MABN], bn.[HOTEN]
from [dbo].[KHAMBENH] kb
join [dbo].[BENHNHAN] bn on kb.[MABN] = bn.[MABN]
where year(bn.[NGSINH]) >2020 and [BENH] = N'Tim mạch'; 

select bn.[MABN], bn.[HOTEN], count(kb.[MAKB]) as [SoLanKham]
from [dbo].[BENHNHAN] bn
left join [dbo].[KHAMBENH] kb on bn.[MABN] = kb.[MABN]
where year(kb.[BATDAU]) = 2020
group by bn.[MABN], bn.[HOTEN];


select [MABS], [HOTEN]
from [dbo].[BACSI]
where [CHUYENMON] = N'Tai mũi họng' 
and not exists (
            select *
            from [dbo].[PHUTRACH] pt
            join [dbo].[KHAMBENH] kb on pt.[MAKB] = kb.[MAKB]
            where [BATDAUPT] between '01/01/2020' and '31/12/2020' and pt.[MABS] = [dbo].[BACSI].[MABS])

select MABS, HOTEN
from BACSI 
where CHUYENMON = N'Tai mũi họng'
except
select b.MABS, b.HOTEN
from BACSI b
join PHUTRACH p on b.MABS = p.MABS
join KHAMBENH k on p.MAKB = k.MAKB
where p.BATDAUPT between '01/01/2020' and '31/12/2020';

select top 1 with ties 
b.MABS, b.HOTEN, count(p.MAKB) as SoLanPhauThuat
from BACSI b
join PHUTRACH p on b.MABS = p.MABS
group by b.MABS, b.HOTEN
order by SoLanPhauThuat desc;


