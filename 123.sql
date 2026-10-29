select [ProductID], [ProductName], ([UnitsInStock] - [UnitsOnOrder]) as [StockRemaining], [UnitsInStock], [UnitsOnOrder]
from [dbo].[Products];

select [OrderID], [ProductID], [UnitPrice], [Quantity],  ([UnitPrice] * [Quantity]) as [OrderDetailsValue]
from [dbo].[Order Details];

select avg([Freight])/max([Freight]) as [FreightRatio]
from [dbo].[Orders];

select [ProductID], [ProductName], ([UnitPrice] * 90 / 100) as [DiscountedPrice]
from [dbo].[Products];

select  [ProductID], [ProductName], cast([UnitPrice] * 0.9 as float) as [DiscountedPrice]
from [dbo].[Products];