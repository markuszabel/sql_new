/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Item No_]
      ,Sum ([Quantity])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
  WHERE [Source No_] = '70311'
  Group By [Item No_]                              