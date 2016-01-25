with nachziehen as (Select
il.[Item No_] as EAN ,CAST( [Remaining Quantity] as int) as RemQ, [Expiration Date]
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il
Join [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item] as it
on il.[Item No_] = it.No_
Where [Remaining Quantity] > 0  and it.[Item Tracking Code] = 'MHD' and cast([Expiration Date] as DATe) = '1753-01-01' )
,
whentry as(Select
[Item No_], [Bin Code], cast(sum(Quantity) as INT) as Menge
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Warehouse Entry] as we
group by [Item No_], [Bin Code]
)

Select *
from nachziehen
left Join whentry on whentry.[Item No_] = nachziehen.EAN

