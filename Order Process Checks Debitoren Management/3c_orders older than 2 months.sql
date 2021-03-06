/****** Script for SelectTopNRows command from SSMS  ******/
SELECT count ( distinct sh.No_)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
  Where datediff(day,sh.[Order Date],GETDATE()) > 60 and sh.[Document Type] = 1
 
SELECT sh.[Reason Code], Month(sh.[Order Date]), count ( distinct sh.No_) 
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
  Where datediff(day,sh.[Order Date],GETDATE()) > 60 and sh.[Document Type] = 1
  Group by sh.[Reason Code], Month(sh.[Order Date])
  order by sh.[Reason Code], Month(sh.[Order Date])

  SELECT  sh.No_, cast (sh.[Order Date] as Date) as Datum, sh.[Reason Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
  Where datediff(day,sh.[Order Date],GETDATE()) > 60 and sh.[Document Type] = 1
  order by sh.[Order Date] asc