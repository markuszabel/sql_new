/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
		distinct [Document No_]

  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Return Receipt Line] as rt
	Where rt.[Return Order No_] <> ''
AND rt.[Return Order No_] in 
(Select [Return Order_Credit Memo No_] from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] Where [File No_] like 'RETOURE-%')
