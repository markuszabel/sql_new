/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
		
		 month([Posting Date]) as Monat
		,left([Ship-to Post Code],2) as PLZ
		
		,COUNT ( No_) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header]
  Where YEAR( [Posting Date]) = 2013
  group by left([Ship-to Post Code],2), month([Posting Date])
  order by month([Posting Date]),left([Ship-to Post Code],2)