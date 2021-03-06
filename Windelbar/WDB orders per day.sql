/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
		cast ([OrderDate] as Date), [Shop Code]
		,count([ExternalDocumentNo] )
      
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader]
  Where [Shop Code] in ('WINDELBAR'/*,'WUNDERLAND'*/) AND DATEDIFF(DAY,OrderDate,GETDATE()) <= 30 and Completed = 1
  Group By  [Shop Code],cast ([OrderDate] as Date)
  Order by  [Shop Code] ,cast ([OrderDate] as Date)