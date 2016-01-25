
with logSales as
(SELECT sl.No_ as Artikel_Sales,  (sum(sl.Quantity)- sum([Quantity Shipped])) as inSales --, sum(il.Quantity)
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Sales Line] as sl
Where sl.[Posting Group] = 'HANDEL'
--AND sl.No_ = ''
group by sl.No_),
logBest as
(Select
il.[Item No_] as Artikel,  sum(il.Quantity) as Bestand
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il
--Where il.[Item No_] = '8809088141771'
group by il.[Item No_]
),
ubBest as (
Select
il.[Item No_] as Artikel,  sum(il.Quantity) as Bestand
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il
Where [Location Code] = 'BER_FIEGE'
group by il.[Item No_]
),
ubSales as (
SELECT sl.No_ as Artikel_Sales,  (sum(sl.Quantity)- sum([Quantity Shipped])) as inSales --, sum(il.Quantity)
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl
Where sl.[Posting Group] = 'HANDEL' and [Location Code] = 'BER_FIEGE'
group by sl.No_)

Select logBest.Artikel, 
logBest.Bestand,
logSales.inSales, 
ubBest.Bestand,
ubSales.inSales
from logSales
	LEFT join logBest on logSales.Artikel_Sales = logBest.Artikel
	Left join ubSales on ubSales.Artikel_Sales = logSales.Artikel_Sales
	Left join ubBest on ubBest.Artikel = logSales.Artikel_Sales
Where(logBest.Bestand - logSales.inSales) < 0 