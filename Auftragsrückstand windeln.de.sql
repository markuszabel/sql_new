/****** Script for SelectTopNRows command from SSMS  ******/
SELECT   left(ff.[File No_],2) as "Lager", cast(sh.[DHL Reporting Date] as Date), count (ff.No_) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as ff
	Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
	on ff.No_ = sh.No_
  Where ff.Type = 0 
	And cast(sh.[DHL Reporting Date] as Date) > CONVERT(date, GETDATE()-30) 
	AND ff.[Reason Code] = 'WINDELN_DE' 
	And ff.[Processing Status] = 0
	AND LEFT(sh.No_,2) not like 'A9'
	
  Group by left(ff.[File No_],2), cast(sh.[DHL Reporting Date] as Date)
  order by left(ff.[File No_],2), cast(sh.[DHL Reporting Date] as Date)