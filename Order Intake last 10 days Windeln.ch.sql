  SELECT   cast ([OrderDate] as Date)  as Datum, count ([ExternalDocumentNo] ), [Shop Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] with (NOLOCK)
  Where DATEDIFF(day, cast ([OrderDate] as Date), GETDATE())< 10 AND [Shop Code] in ('WINDELN_CH') AND Completed = 1
  Group By [Shop Code],  cast ([OrderDate] as Date)
  Order By [Shop Code], cast ([OrderDate] as Date) 