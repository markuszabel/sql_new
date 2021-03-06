/****** Script for SelectTopNRows command from SSMS  ******/
SELECT count ( distinct No_)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where [Fulfillment Comment] != 'Bestandsproblem' 
  AND [Reason Code] in ('WINDELN_DE','WINDELN_CH') 
  AND [Payment Method Code] != 'VORKASSE' 
  AND [Document Type] = 1
  
  SELECT  distinct No_, [Order Date], [External Document No_], [Fulfillment Comment] 
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where [Fulfillment Comment] != 'Bestandsproblem' 
  AND [Reason Code] in ('WINDELN_DE','WINDELN_CH') 
  AND [Payment Method Code] != 'VORKASSE' 
  AND [Document Type] = 1