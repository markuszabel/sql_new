/********* nicht erfüllbare Aufträge in CH Logistik Mandant  **********/

with logSales as
(SELECT sl.No_ as Artikel_Sales,  
(sum(sl.Quantity)- sum(sl.[Quantity Shipped])) as inSales --, sum(il.Quantity)
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Sales Line] as sl
Where sl.[Posting Group] = 'HANDEL'
group by sl.No_),

logBest as
(Select
il.[Item No_] as Artikel,  isnull(sum(il.Quantity),0) as Bestand
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il
--Where il.[Item No_] = '8809088141771'
group by il.[Item No_]
)

Select distinct [Document No_]
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Sales Line]
Where No_ in (
Select logSales.Artikel_Sales
from logSales
	LEFT join logBest on logSales.Artikel_Sales = logBest.Artikel
	Where cast(isnull(logBest.Bestand,0)as INT) - cast(logSales.inSales as INT) < 0) and [Document Type] <> 5