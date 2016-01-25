
SELECT No_,[Return Reason Code], sum(Quantity) as Menge_Inv, sum(Amount) as Wert_Inv
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Line] 
  Where [Buy-from Vendor No_] in ('70748') and [Posting Group] = 'HANDEL'
  Group By No_,[Return Reason Code]

SELECT No_,[Return Reason Code], sum(Quantity*-1) as Menge_Cr, sum(Amount*-1) as Wert_Cr
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Line] 
  Where [Buy-from Vendor No_] in ('70748')  and [Posting Group] = 'HANDEL'
  Group By No_,[Return Reason Code]
  
  SELECT No_,[Return Reason Code], sum(Quantity) as Menge_Inv, sum(Amount) as Wert_Inv
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Line] 
  Where [Buy-from Vendor No_] in ('70619') and [Posting Group] = 'HANDEL'
  Group By No_,[Return Reason Code]

SELECT No_,[Return Reason Code], sum(Quantity*-1) as Menge_Cr, sum(Amount*-1) as Wert_Cr
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Line] 
  Where [Buy-from Vendor No_] in ('70619')  and [Posting Group] = 'HANDEL'
  Group By No_,[Return Reason Code]
  
    SELECT No_,[Return Reason Code], sum(Quantity) as Menge_Inv, sum(Amount) as Wert_Inv
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Line] 
  Where [Buy-from Vendor No_] in ('70313') and [Posting Group] = 'HANDEL'
  Group By No_,[Return Reason Code]

SELECT No_,[Return Reason Code], sum(Quantity*-1) as Menge_Cr, sum(Amount*-1) as Wert_Cr
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Line] 
  Where [Buy-from Vendor No_] in ('70313')  and [Posting Group] = 'HANDEL'
  Group By No_,[Return Reason Code]
