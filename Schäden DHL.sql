/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Distinct il.[Item No_]
      ,Cast(il.[Posting Date] as DATE) as ReturnDate
      ,il.[Document No_]
      ,il.[Location Code]
      ,cast(il.[Quantity] as INT)
      ,il.[External Document No_]
    ,il.[Return Reason Code]
    , item.[Unit Cost]
    ,sh.No_
    , cast(sh.[Order Date] as Date) as OrderDate
    , LEFT( sh.[File No_],2)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as item
  on il.[Item No_] = item.No_ 
  join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as sh
  on il.[External Document No_] = sh.[External Document No_]
  

  Where il.[Posting Date] <= '2013-08-31' AND il.[Posting Date] >= '2013-04-01'
  And il.[Return Reason Code] in ('P9', 'R9', 'R4')
  AND il.[Location Code] in ('FIEGE_RMA')
  AND sh.[Payment Method Code] <> 'KULANZ'
  AND sh.Type = 0