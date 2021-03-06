/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      
MONTH([Posting Date]),
	[Sell-to Country_Region Code],
	count([No_])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header]
  Where [Posting Date] > '2013-01-01'
  and [Location Code] = 'FIEGE'
  GROUP BY MONTH([Posting Date]), [Sell-to Country_Region Code]
  Order by MONTH([Posting Date])