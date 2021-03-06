/****** Script for SelectTopNRows command from SSMS  ******/
with bestUB as(
SELECT il.[Item No_]
      ,sum(il.[Quantity]) as bestandUB
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
  WHERE il.[Location Code] in ('USTER') and il.[Item No_] like '%-%'
  group by il.[Item No_]
  Having sum(il.[Quantity]) <> 0
  ), bestLog as(
  
SELECT il.[Item No_]
      ,sum(il.[Quantity]) as bestandLog
  FROM [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il with (NOLOCK)
  WHERE il.[Location Code] in ('USTER') and il.[Item No_] like '%-%'
  group by il.[Item No_]
  Having sum(il.[Quantity]) <> 0
  )
 
 Select bestUB.[Item No_], bestUB.bestandUB, bestLog.bestandLog
 
 from bestUB
 Left Join bestLog on bestUB.[Item No_] = bestLog.[Item No_]
  



