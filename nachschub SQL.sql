
with logSales as
(SELECT sl.No_ as Artikel_Sales,(sum(sl.Quantity)- sum([Quantity Shipped])) as inSales
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line]  as sl
Join [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
on sh.No_ = sl.[Document No_]
Where sl.[Posting Group] = 'HANDEL' and sh.[Reason Code] = 'WINDELN_CH' and sl.[Location Code] = 'USTER'
group by sl.No_),
logStock as
(Select
il.[Item No_] as Artikel,  sum(il.Quantity) as Bestand
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il
where il.[Location Code] = 'USTER'
group by il.[Item No_]
),
logBest as 
(Select
pl.[No_] as Artikel,  sum((pl.[Quantity (Base)] - pl.[Qty_ Received (Base)])) as inBest
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Purchase Line] as pl
Where pl.[Location Code] = 'USTER'
group by pl.[No_]
),
logItem as 
(Select
stk.[Item No_] as Artikel,  stk.Klasse
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit] as stk
Where stk.[Location Code] = 'USTER'
),
ubItem as 
(Select
stk.[Item No_] as Artikel,  stk.Klasse
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit] as stk
Where stk.[Location Code] = 'BER_FIEGE'
),
ubBest as 
(Select
pl.[No_] as Artikel,  sum((pl.[Quantity (Base)] - pl.[Qty_ Received (Base)])) as inBest
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Purchase Line] as pl
Where pl.[Location Code] = 'BER_FIEGE'
group by pl.[No_]
),
ubStock as
(Select
il.[Item No_] as Artikel,  sum(il.Quantity) as Stock
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (nolock)
Where il.[Location Code] = 'BER_FIEGE'
group by il.[Item No_]
),
ubSales as
(Select
sl.No_ as Artikel, (sum(sl.Quantity)- sum(sl.[Quantity Shipped])) as inSales
FROM  [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl with (nolock)
Where sl.[Location Code] = 'BER_FIEGE'
group by sl.No_
)


Select 
logSales.Artikel_Sales, 
cast(logSales.inSales as INT) as logSales, 
cast(logStock.Bestand as INT) as logStock,
cast(logBest.inBest as INT) as logInBSest,
cast(ubBest.inBest as INT) as ubInBest, 
cast((ubStock.Stock - ubSales.inSales) as INT) as ubAvailable,
cast((logStock.Bestand-logSales.inSales+logBest.inBest) as INT) as 'L-A+B',
ubItem.Klasse as ubKlasse,
logItem.Klasse as logKlasse

from logSales
	Left join logBest on logSales.Artikel_Sales = logBest.Artikel
	Left join logStock on logStock.Artikel = logSales.Artikel_Sales
	Left join ubItem on ubItem.Artikel = logSales.Artikel_Sales
	Left join ubBest on ubBest.Artikel = logSales.Artikel_Sales
	Left join ubStock on ubStock.Artikel = logSales.Artikel_Sales
	Left join ubSales on ubSales.Artikel = logSales.Artikel_Sales
	Left join logItem on logItem.Artikel = logSales.Artikel_Sales
--Where(logBest.Bestand - logSales.inSales) < 0 