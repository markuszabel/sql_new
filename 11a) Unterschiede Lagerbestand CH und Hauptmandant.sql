/******Unterschied Lagerbestand LogMan und HauptMan ******/
SELECT ub.[Item No_]
      ,CASt(SUM(ub.Quantity) as Int) 
         - isnull(MAX(uster.menge),0) as 'Diff'
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] (nolock) ub
FULL JOIN
(SELECT [Item No_]
      ,CASt(SUM(Quantity) as Int) as 'menge'
  FROM [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] (nolock)
 
group by [Item No_]) uster
on ub.[Item No_] = uster.[Item No_]
 
where  ub.[Location Code] = 'USTER' 
group by ub.[Item No_]
Having CASt(SUM(ub.Quantity) as Int) - isnull(MAX(uster.menge),0) <> 0
order by ub.[Item No_]