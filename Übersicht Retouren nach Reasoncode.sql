/****** Script for SelectTopNRows command from SSMS  ******/
SELECT sh.[Reason Code]
,count(sh.No_)

  FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
 Where sh.[Document Type] = '5'
  group by sh.[Reason Code]