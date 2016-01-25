with logSales as
(SELECT sl.No_ as Artikel_Sales,  
(sum(sl.Quantity)- sum(sl.[Quantity Shipped])) as inSales --, sum(il.Quantity)
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl
Where sl.[Posting Group] = 'HANDEL' and sl.[Location Code] = 'BER_FIEGE'
group by sl.No_),

logBest as
(Select
il.[Item No_] as Artikel,  isnull(sum(il.Quantity),0) as Bestand
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il
Where il.[Location Code] = 'BER_FIEGE'
group by il.[Item No_]
)

Select 
distinct sh.No_, sh.[Payment Method Code], sh.[External Document No_], sh.[Shipping Agent Code], sh.[Released For Shipment]
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
Where  sh.[Reason Code] = 'WINDELN_DE' and [Document Type] = 1 and sh.No_ not In(

Select distinct [Document No_] 
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line]
Where No_ in (
Select logSales.Artikel_Sales
from logSales
	LEFT join logBest on logSales.Artikel_Sales = logBest.Artikel
	Where cast(isnull(logBest.Bestand,0)as INT) - cast(logSales.inSales as INT) < 0) and [Location Code] = 'BER_FIEGE'
	)