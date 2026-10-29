----SELECT * FROM dbo.SinhVien;

----alter table dbo.SinhVien
----drop column QueQuan;

--select * from dbo.SinhVien; 

--alter table dbo.GiangVien
--alter column HocVi nvarchar(50);

--alter table dbo.SinhVien
--add QueQuan nvarchar(50), HocPhi int;

--select * from dbo.SinhVien;
--insert into dbo.SinhVien values
--('SV04', N'Phạm Thị D', '2005-04-04', N'Nữ', 'L02', N'Hà Nội', 1500000);
 --insert into dbo.SinhVien values
 --('SV05', N'Lê Thị E', '2005-05-05', N'Nữ', 'L01', N'Hồ Chí Minh', 1500000);

 --update dbo.SinhVien
 --set HocPhi = 2000000,
 --QueQuan = N'Đà Nẵng'
 --where MaSV = 'SV01';

 --update dbo.SinhVien
 --set HocPhi = 2000000,
 --QueQuan = N'Đà Nẵng'
 --where MaSV = 'SV02';

 -- update dbo.SinhVien
 --set HocPhi = 2000000,
 --QueQuan = N'Hồ Chí Minh'
 --where MaSV = 'SV03';

 -- update dbo.SinhVien
 --set HocPhi = 2000000,
 --QueQuan = N'Hà Nội'
 --where MaSV = 'SV04';

 --select * 
 --from dbo.GiangVien
 --where MaGV = 'GV01';
 
 --delete from dbo.SinhVien
 --where MaSV = 'SV05';

 --if exists 
 --(select * from dbo.SinhVien where MaSV = 'SV05')
 --begin
	--print N'Sinh viên SV05 tồn tại trong bảng SinhVien.'
 --end
 --else
	--insert into dbo.SinhVien values
	--('SV05', N'Lê Thị E', '2005-05-05', N'Nữ', 'L01', N'Hồ Chí Minh', 1500000);

--select * from dbo.SinhVien;

USE QuanLyTruonghoc;
GO

SELECT * FROM SinhVien;



