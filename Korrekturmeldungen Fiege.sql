/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      il.[Item No_]
      ,Cast(il.[Posting Date] as Date) as PostingDate
      ,(il.[Quantity] * it.[Unit Cost] ) as LineUnitCost
      ,il.[Return Reason Code]
      , it.[Unit Cost]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it
  on il.[Item No_] = it.No_
  Where il.[Return Reason Code] in ('K05')
  AND il.[Posting Date] between '2013-07-01' and '2013-07-31'