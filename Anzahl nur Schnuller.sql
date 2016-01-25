/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Order No_], [T&T-Id], Weight 
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayParcel]
  Where [Import At] <= '2013-06-30' AND [Import At] >= '2013-06-01' AND Weight = 0.11