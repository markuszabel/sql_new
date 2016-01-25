
with logVerkauf as
(
Select [Item No_], sum(Quantity) as Abverkauf
from [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry]  as il
Where [Entry Type] = 1
--AND [Item No_] = '4015400526995'
Group by [Item No_]
),
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
ubSalesDE as (
SELECT sl.No_ as Artikel_Sales,  (sum(sl.Quantity)- sum([Quantity Shipped])) as inSales --, sum(il.Quantity)
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl
Where sl.[Posting Group] = 'HANDEL' and [Location Code] = 'BER_FIEGE'
group by sl.No_),
ubSalesCH as (
SELECT sl.No_ as Artikel_Sales,  (sum(sl.Quantity)- sum([Quantity Shipped])) as inSales --, sum(il.Quantity)
FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl
Where sl.[Posting Group] = 'HANDEL' and [Location Code] = 'USTER'
group by sl.No_)

SELECT sku.[Item No_], 
sku.[Replenishment System] , 
cast (logVerkauf.Abverkauf  as INT) as Abverkauf, 
cast (sku.[Order Multiple]  as INT) as Losgröße, 
cast (ubBest.Bestand as INT) as ubBEstand, 
cast (ubSalesDE.inSales  as INT) as ubSales,
cast (ubSalesCH.inSales  as INT) as ubSales,
cast (logBest.Bestand  as INT) as logBestand

FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit] as sku
Left join logVerkauf on logVerkauf.[Item No_] = sku.[Item No_]
Left join ubBest on logVerkauf.[Item No_] = ubBest.Artikel
Left join ubSalesDE on logVerkauf.[Item No_] = ubSalesDE.Artikel_Sales
Left join ubSalesCH on logVerkauf.[Item No_] = ubSalesCH.Artikel_Sales
Left Join logBest on logBest.Artikel = logVerkauf.[Item No_]

Where sku.[Location Code] = 'USTER' --AND sku.[Item No_] = '4007923662984'
and sku.[Replenishment System] <> 0 --and sku.[Maximum Inventory] <> 0
order by logVerkauf.Abverkauf desc