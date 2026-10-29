--select CompanyName as "Công Ty", PostalCode as "Mã Bưu Điện", City as "Thành Phố"
--from Customers;

--select top 15 o.*
--from [dbo].[Orders] as o;

--select top 5 p.ProductName as "Tên Sản Phẩm",
--p.SupplierID as "Mã Nhà Cung Cấp",
--p.CategoryID as "Mã Loại Hàng"
--from [dbo].[Products] as p;

--select min(UnitPrice) as "Giá Thấp Nhất"			
--from [dbo].[Products];

--select COUNT([CustomerID]) as "Số Lượng Khách Hàng"
--from [dbo].[Customers];

--select sum(Freight) as "Tổng Cước Vận Chuyển"
--from [dbo].[Orders];

--SELECT OrderID, CustomerID, OrderDate, Freight 
--FROM Orders;
--SELECT SUM(Freight) AS TotalFreight 
--FROM Orders;

