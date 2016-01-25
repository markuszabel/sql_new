  SELECT  /* cast ([OrderDate] as Date)  as Datum,*/ count ([ExternalDocumentNo] )--, [Shop Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] with (NOLOCK)
  Where OrderDate  between '2013-11-01' and '2013-11-30' AND [Shop Code] in ('WINDELBAR','WUNDERLAND') AND Completed = 1
  --Group By [Shop Code],  cast ([OrderDate] as Date)
  --Order By [Shop Code], cast ([OrderDate] as Date) 
  
    SELECT  sum(SalesSummary_GrandTotal_Gros) as TotalSum, sum(Shipment_Charges_Original_Gros) as ShipmentSum
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] with (NOLOCK)
  Where OrderDate between '2013-11-01' and '2013-11-30' AND [Shop Code] in ('WINDELBAR','WUNDERLAND') AND Completed = 1
  --Group By [Shop Code],  cast ([OrderDate] as Date)
  --Order By [Shop Code], cast ([OrderDate] as Date) 
  
    SELECT  /* cast ([OrderDate] as Date)  as Datum,*/ count (No_ )--, [Shop Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] with (NOLOCK)
  Where [Order Date]  between '2013-11-01' and '2013-11-30' AND [Shop Code] in ('WINDELBAR','WUNDERLAND')
  --Group By [Shop Code],  cast ([OrderDate] as Date)
  --Order By [Shop Code], cast ([OrderDate] as Date) 
  
    SELECT  sum([Total Gross Amount]),  SUM( [Shipment Gross Amount])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] with (NOLOCK)
  Where [Order Date] between '2013-11-01' and '2013-11-30' AND [Shop Code] in ('WINDELBAR','WUNDERLAND')
  --Group By [Shop Code],  cast ([OrderDate] as Date)
  --Order By [Shop Code], cast ([OrderDate] as Date) 