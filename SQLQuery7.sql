/****** Script for SelectTopNRows command from SSMS  ******/
SELECT cast([Import At] as date), [T&T-Id]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayParcel]
  Where [Import At] >= '2013-09-01' AND [T&T-Id] like '0034%'