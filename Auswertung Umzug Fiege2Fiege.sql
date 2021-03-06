/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Item No_]
      ,[Posting Date]
      ,[Entry Type]
      ,[Source No_]
      ,[Document No_]
      ,[Description]
      ,[Location Code]
      ,[Quantity]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
  Where [Source No_] in ('70611', 'D1364500')
order by [Posting Date] asc;