/****** Script for SelectTopNRows command from SSMS  ******/
DECLARE @find varchar(30) = '4015400617716'
Declare @findlike varchar(30) = @find + '%'
SELECT TOP 500 [ReportingDate],[LastEntryNo],[EAN],[Location Code],[Stock],[Puffered]
FROM [History].[it].[item_lager_live_hist_2014] with (NOLOCK)
Where EAN like @findlike AND [Location Code] in ( 'FIEGE','USTER') order by ReportingDate desc
SELECT TOP 50 [ean],[class],[within_category_class],[old_class],[oversold_allowed],[date]
FROM [History].[dbo].[Artikel_Klassen_history] with (NOLOCK)
Where EAN = @find order by date desc
SELECT TOP 150 [EAN],[Location_Code],[Min],[Max],[Prognose_7d],[Date]
FROM [History].[dbo].[Disposition_history] 
where EAN = @find order by Date desc