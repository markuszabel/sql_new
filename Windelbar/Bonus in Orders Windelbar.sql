/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ch.[External Document No_], cs.[Document No_], cs.No_, cs.Quantity, cs.[Unit Price Gross Amount]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesLine] as cs
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as ch
  on cs.[Document No_] = ch.No_
  where cs.[Document No_] in (
  
  SELECT distinct [Document No_]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cancel Webshop Order]
  Where [Completely Canceled] = 1 AND datediff(day,[Canceled at] , GETDATE()) < 30 AND [Shop Code] in ('WINDELBAR','WUNDERLAND')
  
  ) 
  And cs.No_ like 'R%'