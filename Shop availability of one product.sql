/***** Shop availability of one product *****/
DECLARE @ean varchar(30) = '%4008976219644'; 

with in_sales as(
Select sl.No_,SUM( sl.[Outstanding Quantity]) as InSales
from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl
Where sl.No_ like @ean
Group by sl.No_, sl.[Description], sl.[Description 2]),
in_wait as
(
Select el.No_, sum(el.Quantity) as InWait
from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesLine] as el with (NOLOCK)
Left join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as eh with (NOLOCK)
on el.[Document No_] = eh.No_
Where el.No_ like @ean and eh.[Status] = 0
Group by el.No_
),
in_stock as 
(
Select itl.[Item No_],it.[Description],it.[Description 2],sum(itl.Quantity) as InStock
from [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as itl with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on itl.[Item No_] = it.No_
Where itl.[Item No_] like @ean
Group by itl.[Item No_],it.[Description],it.[Description 2]
)

Select 
in_stock.[Item No_],
in_stock.[Description],
in_stock.[Description 2], 
cast(in_stock.InStock as INT) as InStock, 
cast(ISNULL(in_sales.InSales,0) as INT) as InSales, 
cast(ISNULL(in_wait.InWait,0) as INT) as InWait,
cast((in_stock.InStock - ISNULL(in_sales.InSales,0) - ISNULL(in_wait.InWait,0)) as INT) as Available

from in_stock
Left join in_sales on in_stock.[Item No_]= in_sales.No_
Left Join in_wait on in_stock.[Item No_] = in_wait.No_