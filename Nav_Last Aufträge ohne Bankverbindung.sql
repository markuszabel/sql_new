/****** Script for SelectTopNRows command from SSMS  ******/
SELECT count([Entry No_]), CAST(OrderDate as DATE)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] with (NOLOCK)
  where [Payment_BankTransfer_No] = '' AND Payment_Method_WebshopMethod = 'NAV_LAST' AND OrderDate > '2013-11-01'
  Group by CAST(OrderDate as DATE)