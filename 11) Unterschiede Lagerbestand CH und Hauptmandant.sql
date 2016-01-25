/******Unterschied Lagerbestand LogMan und HauptMan auf Grund von Einkaufslieferungen    ******/
SELECT ub.[Item No_]
      ,CASt(SUM(ub.Quantity) as Int) 
         - isnull(MAX(uster.menge),0) as 'Diff'
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] (nolock) ub
FULL JOIN
(SELECT [Item No_]
      ,CASt(SUM(Quantity) as Int) as 'menge'
  FROM [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] (nolock)
where [Entry Type] = 0
 
group by [Item No_]) uster
on ub.[Item No_] = uster.[Item No_]
 
where ub.[Entry Type] = 0 and ub.[Location Code] = 'USTER' AND ub.[Source No_] <> '70801'
group by ub.[Item No_]
Having CASt(SUM(ub.Quantity) as Int) - isnull(MAX(uster.menge),0) <> 0