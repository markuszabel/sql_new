/****** Script for SelectTopNRows command from SSMS  ******/
SELECT (No_), cast ([Fully Available from] as Date)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where [Reason Code] in ('WINDELBAR','WUNDERLAND') AND [Fully Available Date] < GETDATE() -3 And [Fully Available Date] <> '1753-01-01' and [Released For Shipment] = 1
  order by cast ([Fully Available from] as Date) asc