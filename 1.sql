select [ProductID], [ProductName], [UnitsInStock]
from [dbo].[Products]
where [UnitsInStock] < 50 or [UnitsInStock] >100;

select *
from [dbo].[Orders]
where [ShipCountry] = 'Brazil' and [RequiredDate]<[ShippedDate];

