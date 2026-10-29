--select * from SinhVIen

SELECT 
    CONVERT(VARCHAR, NgaySinh, 103) AS DMY
from 
    dbo.SinhVien

go 
select * 
from dbo.SinhVien
where 
    CONVERT(VARCHAR, NgaySinh, 103) = '01/01/2005'