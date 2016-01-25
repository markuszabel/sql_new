/****** offene Debitorenposten Anzahl******/
SELECT  count (cl.[Entry No_])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl
 Where cl.[Open] = '1'
 

/****** offene Debitorenposten nach Paymentcode******/
SELECT cl.[Payment Method Code], count (cl.[Entry No_])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl
 Where cl.[Open] = '1'
 Group by cl.[Payment Method Code]
 
 /****** offene Debitorenposten nach Monat *****
 SELECT cl.[Payment Method Code], count (cl.[Entry No_]) as Anzahl, Month(cl.[Posting Date]) as Monat
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl
 Where cl.[Open] = '1' and year(cl.[Posting Date]) = '2014'
 Group by cl.[Payment Method Code], Month(cl.[Posting Date])**/