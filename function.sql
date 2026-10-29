--CREATE TABLE PHIEUDATHANG (
--    SoPhieu INT PRIMARY KEY,
--    NgayDat DATE,
--    TenKhachHang NVARCHAR(100)
--);
--CREATE TABLE NOIDUNGDATHANG (
--    MaND INT PRIMARY KEY,
--    SoPhieu INT,
--    TenHang NVARCHAR(100),
--    SoLuong INT,
--    DonGia DECIMAL(10,2),

--    -- Khóa ngoại
--    CONSTRAINT FK_Noidung_Phieu
--    FOREIGN KEY (SoPhieu)
--    REFERENCES PHIEUDATHANG(SoPhieu)
--);

--INSERT INTO PHIEUDATHANG (SoPhieu, NgayDat, TenKhachHang) VALUES
--(1, '2024-01-10', N'Nguyễn Văn A'),
--(2, '2024-02-15', N'Trần Thị B'),
--(3, '2024-03-20', N'Lê Văn C'),
--(4, '2024-04-05', N'Phạm Thị D'),
--(5, '2024-05-12', N'Hoàng Văn E');

--INSERT INTO NOIDUNGDATHANG (MaND, SoPhieu, TenHang, SoLuong, DonGia) VALUES
--(1, 1, N'Mì gói', 10, 3500),
--(2, 1, N'Nước ngọt', 5, 10000),

--(3, 2, N'Bánh mì', 8, 5000),
--(4, 2, N'Sữa', 3, 15000),

--(5, 3, N'Gạo', 2, 200000),
--(6, 3, N'Dầu ăn', 1, 50000),

--(7, 4, N'Trứng', 30, 2500),
--(8, 4, N'Đường', 2, 18000),

--(9, 5, N'Cà phê', 1, 120000),
--(10, 5, N'Trà', 2, 60000);

SELECT 
    p.SoPhieu,
    STRING_AGG(n.TenHang, '; ') AS VeKhoan
FROM PHIEUDATHANG p
JOIN NOIDUNGDATHANG n 
    ON p.SoPhieu = n.SoPhieu
GROUP BY p.SoPhieu;


SELECT 
    p.SoPhieu,
    p.NgayDat,
    p.TenKhachHang,

    -- Tổng tiền
    SUM(n.SoLuong * n.DonGia) AS TongSoTien,

    -- Gộp tên hàng (VeKhoan)
    STUFF((
        SELECT '; ' + n2.TenHang
        FROM NOIDUNGDATHANG n2
        WHERE n2.SoPhieu = p.SoPhieu
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS VeKhoan

FROM PHIEUDATHANG p
JOIN NOIDUNGDATHANG n 
    ON p.SoPhieu = n.SoPhieu

GROUP BY 
    p.SoPhieu, p.NgayDat, p.TenKhachHang;

SELECT 
LTRIM(RTRIM(
    REPLACE(REPLACE(REPLACE(TenKhachHang, '  ', ' '), '  ', ' '), '  ', ' ')
)) AS TenMoi
FROM PHIEUDATHANG

CREATE FUNCTION dbo.DocSo (@number BIGINT)
RETURNS NVARCHAR(1000)
AS
BEGIN
    IF @number = 0 RETURN N'Không'

    DECLARE @result NVARCHAR(1000) = ''

    DECLARE @unit TABLE (num INT, word NVARCHAR(20))
    INSERT INTO @unit VALUES
    (0,N'không'),(1,N'một'),(2,N'hai'),(3,N'ba'),(4,N'bốn'),
    (5,N'năm'),(6,N'sáu'),(7,N'bảy'),(8,N'tám'),(9,N'chín')

    DECLARE @ty BIGINT = @number / 1000000000
    DECLARE @trieu BIGINT = (@number % 1000000000) / 1000000
    DECLARE @nghin BIGINT = (@number % 1000000) / 1000
    DECLARE @tram INT = @number % 1000

    -- Tỷ
    IF @ty > 0
        SET @result += dbo.DocSo(@ty) + N' tỷ '

    -- Triệu
    IF @trieu > 0
        SET @result += dbo.DocSo(@trieu) + N' triệu '

    -- Nghìn
    IF @nghin > 0
        SET @result += dbo.DocSo(@nghin) + N' nghìn '

    -- Đọc 3 số cuối
    IF @tram > 0
    BEGIN
        DECLARE @c INT = @tram / 100
        DECLARE @d INT = (@tram % 100) / 10
        DECLARE @u INT = @tram % 10

        -- Trăm
        IF @c > 0
            SET @result += (SELECT word FROM @unit WHERE num = @c) + N' trăm '

        -- Lẻ
        IF @d = 0 AND @u > 0 AND @c > 0
            SET @result += N'lẻ '

        -- Chục
        IF @d = 1
            SET @result += N'mười '
        ELSE IF @d > 1
            SET @result += (SELECT word FROM @unit WHERE num = @d) + N' mươi '

        -- Đơn vị
        IF @u > 0
        BEGIN
            IF @u = 1 AND @d > 1
                SET @result += N'mốt '
            ELSE IF @u = 5 AND @d > 0
                SET @result += N'lăm '
            ELSE
                SET @result += (SELECT word FROM @unit WHERE num = @u) + N' '
        END
    END

    RETURN RTRIM(@result)
END


SELECT 
    p.SoPhieu,

    -- Tổng tiền số
    SUM(n.SoLuong * n.DonGia) AS TongTien,

    -- Tổng tiền bằng chữ
    UPPER(LEFT(dbo.DocSo(SUM(n.SoLuong * n.DonGia)),1)) +
    SUBSTRING(dbo.DocSo(SUM(n.SoLuong * n.DonGia)),2,1000)
    + N' đồng' AS TongTienBangChu

FROM PHIEUDATHANG p
JOIN NOIDUNGDATHANG n 
    ON p.SoPhieu = n.SoPhieu

GROUP BY p.SoPhieu;

select * from PHIEUDATHANG;

CREATE FUNCTION dbo.ProperCase (@str NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX) = ''
    DECLARE @word NVARCHAR(100)
    
    WHILE LEN(@str) > 0
    BEGIN
        SET @word = LEFT(@str, CHARINDEX(' ', @str + ' ') - 1)

        SET @result = @result + 
            UPPER(LEFT(@word,1)) + LOWER(SUBSTRING(@word,2,LEN(@word))) + ' '

        SET @str = STUFF(@str, 1, LEN(@word) + 1, '')
    END

    RETURN RTRIM(@result)
END


select dbo.ProperCase(N' nguyễn văn a'); 

SELECT 
    p.SoPhieu,
    p.NgayDat,
    dbo.ProperCase(p.TenKhachHang) AS TenKhachHang,
    dbo.DocSo(SUM(n.SoLuong * n.DonGia)) AS TongSoTien
from PHIEUDATHANG p
join NOIDUNGDATHANG n on p.SoPhieu = n.SoPhieu
group by p.SoPhieu, p.NgayDat, p.TenKhachHang;


CREATE FUNCTION dbo.ChuanHoaChuoi
(
    @str NVARCHAR(MAX),       -- Chuỗi đầu vào
    @separator NVARCHAR(10)   -- Ký tự nối: ' ' hoặc ' – '
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX)

    -- B1: thay ký tự "_" thành khoảng trắng (nếu có)
    SET @str = REPLACE(@str, '_', ' ')

    -- B2: xóa khoảng trắng dư
    WHILE CHARINDEX('  ', @str) > 0
        SET @str = REPLACE(@str, '  ', ' ')

    -- B3: xóa khoảng trắng đầu/cuối
    SET @str = LTRIM(RTRIM(@str))

    -- B4: tách và ghép lại với separator
    SELECT @result = STRING_AGG(value, @separator)
    FROM STRING_SPLIT(@str, ' ')
    WHERE value <> ''

    RETURN @result
END

SELECT dbo.ChuanHoaChuoi(N'Cộng_  _ _ Hoà _ Xã', ' ') AS KetQua
select dbo.ChuanHoaChuoi(N'Nguyễn          Văn           A', ' ') AS KetQua2