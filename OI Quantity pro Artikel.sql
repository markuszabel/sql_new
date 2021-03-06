/****** Script for SelectTopNRows command from SSMS  ******/
SELECT cast(ch.OrderDate as DATE), sum(cast(cl.Quantity as INT)), cl.Identifier, cl.UnitPrice_Gross, ch.[Shop Code]
		
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentLine] as cl
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as ch
  on cl.[Header Entry No_] = ch.[Entry No_]
  Where cl.Identifier like '4062300001541%' and ch.OrderDate >= '2015-11-30' <and ch.[Shop Code] = 'WINDELN_DE'
  Group By ch.OrderDate, cl.Identifier, cl.UnitPrice_Gross, ch.[Shop Code]
  Order by ch.OrderDate, cast(ch.OrderDate as DATE)
  