/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader]
--where [External Document No_] = '310069230'
Where No_ between 'SVKA-0000924100' AND 'SVKA-0000929000'
AND [Order Date] > '2013-08-05'