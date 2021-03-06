/****** Script for SelectTopNRows command from SSMS  ******/
SELECT sh.Completed
      ,sh.[ExternalDocumentNo] 
      ,(cast (sh.[OrderDate] as Date)) as Auftragsdatum
      ,sh.[Entry No_]
      , sr.[Entry No_]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as sh with (NOLOCK)
  LEFT Outer JOIN Urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentResponse] AS sr with (NOLOCK)
  ON sr.[Entry No_] = sh.[Entry No_]
  Where  sr.[Entry No_] IS NULL AND sh.Completed = 1
  order by sh.[Entry No_] asc