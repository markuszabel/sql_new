/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000

	it.No_, dd.[Dimension Value Code], dd.[Dimension Code]

  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Default Dimension] as dd
  on it.No_ = dd.No_
  
  Where dd.[Dimension Code] = 'MARKE'
