/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 10 [ReportingDate]
      ,[LastEntryNo]
      ,[EAN]
      ,[Location Code]
      ,[Stock]
      ,[Puffered]
  FROM [History].[it].[item_lager_live_hist]
  Where ean in ('4008976022305','4008976219644','04008976219644','4008976219644-XZ', '4008976219644-XX') 
  order by [ReportingDate] desc