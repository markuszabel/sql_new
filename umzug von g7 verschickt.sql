/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Item No_]
      ,Sum([Quantity])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
  Where [Source No_] = 'D1164626' AND [Entry Type] = '1'
  Group by [Item No_]     