/****** Script for SelectTopNRows command from SSMS  ******/
SELECT sl.No_
	, sh.[Order Date]
	,sl.Quantity
	, sh.[External Document No_]

  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesLine] as sl
  join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as sh
  on sl.[Document No_] = sh.No_
  Where sl.No_ like '4048523013875%' and sh.[Order Date] > '2014-07-29'