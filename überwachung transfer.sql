/****** Script for SelectTopNRows command from SSMS  ******/
SELECT COUNT(sr.[Entry No_]) as NotPorcessedAccountsinTransfer
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Create_UpdateAccount] as sh
  LEFT Outer JOIN Urban_NAV600.dbo.[Urban-Brand GmbH$AccountResponse] AS sr ON sr.[Entry No_] = sh.[Entry No_]
  Where  sr.[Entry No_] IS NULL
  
  SELECT count (sh.[ExternalDocumentNo] ) as NotPorcessedOrdersinTransfer
      --,cast (sh.[OrderDate] as Date)  
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as sh
  LEFT Outer JOIN Urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentResponse] AS sr ON sr.[Entry No_] = sh.[Entry No_]
  Where  sr.[Entry No_] IS NULL AND sh.Completed = 1
  --Group By cast (sh.[OrderDate] as Date) 