/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [No_]
      ,[Sell-to Customer No_]
      ,[Location Code]
    ,[External Document No_]
    , Cast ([Payment Receipt Date] as Date)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where [Payment Method Code] = 'VORKASSE' and [Document Type] = '1' and [Waiting for payment receipt] = '0'
  AND [Fulfillment Comment] NOT Like '%Bestandsproblem%' AND [Location Code] = 'FIEGE' and Cast ([Payment Receipt Date] as Date) < '2013-03-05'