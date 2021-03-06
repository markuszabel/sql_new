/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      count([No_])
	, DATEPART (mm, [DHL Reporting Date])	as Monat
     , DATEPART (dd, [DHL Reporting Date])	as Tag
     , DATEPART (hh, [DHL Reporting Date])	as Uhrzeit
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where [Reason Code] = 'WINDELN_DE' AND [Document Type] = '11'
  Group By  DATEPART (mm, [DHL Reporting Date])
     , DATEPART (dd, [DHL Reporting Date])
     , DATEPART (hh, [DHL Reporting Date])	
  