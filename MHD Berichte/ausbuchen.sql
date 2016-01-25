with ausbuchen as (Select
il.[Item No_] as EAN , cast([Remaining Quantity]as int) as RemQ, [Expiration Date]
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il
Join [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item] as it
on il.[Item No_] = it.No_
Where [Remaining Quantity] > 0  and it.[Item Tracking Code] = 'MHD' and cast([Expiration Date] as DATe) <> '1753-01-01' and DATEDIFF(day,[Expiration Date] , GETDATE()) > -28)
,
whentry as(
Select
[Item No_], [Bin Code], cast(sum(Quantity)as int) as Menge
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Warehouse Entry] as we
Group by [Item No_], [Bin Code]
)

Select *
from ausbuchen
left Join whentry on whentry.[Item No_] = ausbuchen.EAN and ausbuchen.RemQ = whentry.Menge

