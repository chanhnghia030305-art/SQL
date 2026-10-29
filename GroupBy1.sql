select *
from [dbo].[Orders]
where [ShipCountry] in ('Germany', 'UK', 'Brazil');


select *
from [dbo].[Orders]
where [ShipCountry] not in ('Germany', 'UK', 'Brazil');

select *
from [dbo].[Customers]
where [CompanyName] is null;

select *
from [dbo].[Orders]
where [ShippedDate] is null and [ShipRegion] is not null;

select [CustomerID], count([OrderID]) as [TotalOrders]
from [dbo].[Orders]
group by [CustomerID];

select [SupplierID], avg([UnitPrice]) as [AverageUnitPrice]
from [dbo].[Products]
group by [SupplierID];


select [CategoryID], sum([UnitsInStock]) as [TotalUnitsInStock]
from [dbo].[Products]
group by [CategoryID];

select [ShipCity], [ShipCountry], min([Freight]) as [MinFreight], max([Freight]) as [MaxFreight], avg([Freight]) as [AvgFreight]
from [dbo].[Orders]
group by [ShipCity], [ShipCountry]
order by [ShipCountry] asc, [ShipCity] asc;

select [Country], count([EmployeeID]) as [TotalEmployees]
from [dbo].[Employees]
group by [Country];

select [EmployeeID], [Country]
from [dbo].[Employees];


--Tính số lượng đơn đặt hàng trong nam 1997 của từng khách hàng
select [CustomerID], count([OrderID]) as [TotalOrders], YEAR([OrderDate]) as [OrderYear]
from [dbo].[Orders]
where year([OrderDate]) = 1997
group by [CustomerID], YEAR([OrderDate]);


--Hãy đếm các đơn hàng được đặt hàng vào tháng 5 năm 1997
select [CustomerID], count([OrderID]) as [TotalOrders]
from [dbo].[Orders]
where year([OrderDate]) = 1997 and month([OrderDate]) = 5
group by [CustomerID];

select *
from [dbo].[Orders]
where year([OrderDate]) = 1997 and month([OrderDate]) = 5;
