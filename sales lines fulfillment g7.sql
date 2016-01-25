/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [No_]
      ,Sum ([Outstanding Quantity])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line]
  Where [Document Type] = '11' AND [Location Code] = 'GROUP7' AND [Posting Group] = 'HANDEL' AND [Outstanding Quantity] >'0'
  Group By No_                                                                                                                                                                                                       