/****** Script for SelectTopNRows command from SSMS  ******/
SELECT No_
      ,[Buy-from Vendor No_]
      , [Order Date]

  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purchase Header]
  Where No_ like 'STO%'