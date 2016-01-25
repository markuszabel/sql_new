/****** offene Debitorenposten Anzahl******/
SELECT COUNT( cl.[Entry No_])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl
 Where cl.[Open] = '1' --and cl.[Posting Date] <= '2014-12-31' 


SELECT CAST( cl.[Posting Date] as Date) as Buchungsdatum, cl.[Entry No_], cl.[External Document No_], cl.[Payment Method Code], cl.[Sell-to Customer No_],cl.[Last Issued Reminder Level], sum(dcl.Amount) as Wert
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl
  JOin [urban_NAV600].[dbo].[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] as dcl
  on cl.[Entry No_] = dcl.[Cust_ Ledger Entry No_]
 Where cl.[Open] = '1' and cl.[Posting Date] <= '2014-12-31' --and cl.[Sell-to Customer No_] = 'D1446499' --and cl.[Entry No_] = '59943999'
 group by  CAST( cl.[Posting Date] as Date),cl.[Entry No_], cl.[External Document No_], cl.[Payment Method Code], cl.[Sell-to Customer No_],cl.[Last Issued Reminder Level]
 order by cl.[Sell-to Customer No_]

/****** offene Debitorenposten nach Paymentcode******/
SELECT cl.[Payment Method Code],

case cl.[Document Type]
	When 0 Then 'Leer'
	When 1 Then 'Zahlung'
	When 2 Then 'Rechnung'
	When 3 Then 'Gutschrift'
	When 4 Then 'Zinsrechnung'
	When 5 Then 'Mahnung'
	When 6 Then 'Erstattung'
	else 'nicht gefunden'
end

, count (cl.[Entry No_])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl
 Where cl.[Open] = '1' --and [Posting Date] <= '2014-12-31'
 Group by cl.[Payment Method Code],cl.[Document Type]
 order by cl.[Payment Method Code],cl.[Document Type]

 
 /****** offene Debitorenposten nach Monat ******/
 SELECT cl.[Payment Method Code], count (cl.[Entry No_]) as Anzahl--, Month(cl.[Posting Date]) as Monat
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl
 Where cl.[Open] = '1' and year(cl.[Posting Date]) = '2014'
 Group by cl.[Payment Method Code]--, Month(cl.[Posting Date])