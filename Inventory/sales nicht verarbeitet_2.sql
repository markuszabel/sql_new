  SELECT *
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentLine] as cdl with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
  on cdh.[Entry No_] = cdl.[Header Entry No_]
  Left Outer Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentResponse] as cdr with (NOLOCK)
  on cdr.[Entry No_] = cdh.[Entry No_]
  Where cdr.[Entry No_] IS NULL and cdh.Completed = 1