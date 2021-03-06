/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ExternalDocumentNo, SalesSummary_GrandTotal_Gros, cast(OrderDate as DATE), Payment_Method_WebshopMethod, [Shop Code], Shipment_Address_Email
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader]
  Where OrderDate between '2013-10-22'and '2013-10-23'   
  AND SalesSummary_GrandTotal_Gros > 49
  AND [Shop Code] in ('WUNDERLAND')