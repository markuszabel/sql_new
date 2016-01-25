with ubSales as
(SELECT sl.No_ as Artikel_Sales,  
(sum(sl.Quantity)- sum(sl.[Quantity Shipped])) as inSales 
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl with (NOLOCK)
Where sl.[Posting Group] = 'HANDEL'
group by sl.No_),
ubBest as
(Select
il.[Item No_] as Artikel,  isnull(sum(il.Quantity),0) as Bestand 
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Where [Location Code] = 'BER_FIEGE'
group by il.[Item No_]
)

Select 
distinct sh.No_, sh.[Payment Method Code], sh.[External Document No_]
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
Where sh.No_ not In(

Select distinct [Document No_]
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] with (NOLOCK)
Where No_ in (
Select ubSales.Artikel_Sales
from ubSales
	LEFT join ubBest on ubSales.Artikel_Sales = ubBest.Artikel
	Where cast(isnull(ubBest.Bestand,0)as INT) - cast(ubSales.inSales as INT) < 0)
	)	
	AND sh.[Document Type] = 1 AND [Reason Code] = 'WINDELN_DE' and sh.[Payment Method Code] <> 'VORKASSE' AND sh.[Waiting for payment receipt] = 0
	Order by sh.No_ asc