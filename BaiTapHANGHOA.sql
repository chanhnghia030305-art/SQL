--Hiển thị danh sách hàng hóa kèm tên nhóm hàng
--SELECT hh.MaHang, hh.TenHang, nh.TenNhomHang
--FROM HANGHOA as hh
--INNER JOIN NHOMHANG as nh
--ON hh.MaNH = nh.MaNH;

--Hiển thị danh sách phiếu nhập kho kèm tên hàng hóa, số lượng và đơn giá
--SELECT pnk.SoPhieu, pnk.NgayNhap, hh.TenHang, nd.SoLuong, nd.DonGia
--FROM PHIEUNHAPKHO as pnk
--INNER JOIN NOIDUNGPHIEUNHAP as nd ON pnk.SoPhieu = nd.SoPhieu
--INNER JOIN HANGHOA as hh ON nd.MaHang = hh.MaHang;

--Hiển thị danh sách phiếu nhập kho có ngày nhập trong năm 2024
--select pnk.NgayNhap
--from PHIEUNHAPKHO as pnk
--where pnk.NgayNhap >= '2024-01-01' and pnk.NgayNhap <= '2024-12-31';

--Hiển thị các phiếu nhập trong tháng 3/2026
--SELECT *
--FROM PHIEUNHAPKHO
--WHERE MONTH(NgayNhap) = 3 AND YEAR(NgayNhap) = 2026;

--Tính thành tiền từng dòng (SoLuong * DonGia)
--SELECT SoPhieu, MaHang, SoLuong, DonGia,
--       SoLuong * DonGia AS ThanhTien
--FROM NOIDUNGPHIEUNHAP;

--Tính tổng tiền của mỗi phiếu nhập
--SELECT SoPhieu, SUM(SoLuong * DonGia) AS TongTien
--FROM NOIDUNGPHIEUNHAP
--GROUP BY SoPhieu;

--Đếm số lượng hàng hóa theo từng nhóm
--SELECT MaNH, COUNT(*) AS SoLuongHang  
--FROM HANGHOA  
--GROUP BY MaNH;

--select pnk.SoPhieu, hh.TenHang, nd.SoLuong, nd.DonGia
--from NOIDUNGPHIEUNHAP as nd
--inner join PHIEUNHAPKHO as pnk on nd.SoPhieu = pnk.SoPhieu
--inner join HANGHOA as hh on nd.MaHang = hh.MaHang
--where nd.DonGia > 100000;


--Tìm hàng hóa có đơn giá cao nhất
--SELECT TOP 1 *
--FROM NOIDUNGPHIEUNHAP
--ORDER BY DonGia DESC;

--select top 5 *
--from NOIDUNGPHIEUNHAP
--order by DonGia asc;


--Hiển thị tên hàng và tổng số lượng đã nhập
--SELECT hh.TenHang, SUM(nd.SoLuong) AS TongSoLuong
--FROM NOIDUNGPHIEUNHAP nd
--INNER JOIN HANGHOA hh ON nd.MaHang = hh.MaHang
--GROUP BY hh.TenHang;


--select top 1 *
--from (
--	select pnk.SoPhieu, (nd.SoLuong * nd.DonGia) as ThanhTien
--	from NOIDUNGPHIEUNHAP as nd
--	INNER JOIN PHIEUNHAPKHO as pnk ON nd.SoPhieu = pnk.SoPhieu
--) as TongTienTheoPhieu
--order by ThanhTien desc;


--Hiển thị phiếu nhập có tổng tiền lớn nhất
--SELECT TOP 1 SoPhieu, SUM(SoLuong * DonGia) AS TongTien
--FROM NOIDUNGPHIEUNHAP
--GROUP BY SoPhieu
--ORDER BY TongTien DESC;

--SELECT hh.TenHang, SUM(nd.SoLuong) AS TongSoLuong
--FROM NOIDUNGPHIEUNHAP nd
--INNER JOIN HANGHOA hh ON nd.MaHang = hh.MaHang
--GROUP BY hh.TenHang;

