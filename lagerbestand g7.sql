/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Item No_],[Location Code], Sum ([Quantity])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
  WHERE [Posting Date] <= '2014-12-31'
  Group By [Item No_],[Location Code]
  having Sum ([Quantity]) < 0
  order by [Location Code]
  
  SELECT [Item No_], Sum ([Quantity])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
  WHERE [Posting Date] <= '2014-12-31' and [Location Code] = 'GROUP7'
  Group By [Item No_]
  having Sum ([Quantity]) <> 0