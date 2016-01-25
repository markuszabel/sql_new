/****** Script for SelectTopNRows command from SSMS  ******/
SELECT cast([Posting Date] as Date), COUNT(No_)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header]
  Where [Reason Code] in ('WINDELBAR','WUNDERLAND')
  Group by cast([Posting Date] as Date)
  order by cast([Posting Date] as Date) desc