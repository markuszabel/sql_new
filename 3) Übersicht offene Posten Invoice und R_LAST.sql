/****** offene Posten R_Last und Invoice nach Alter  ******/
SELECT year([Posting Date]) as Jahr, month([Posting Date]) as Monat, [Payment Method Code] , count([Entry No_]) as AnzahlOffenePosten
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] with (NOLOCK)
  Where [Open] = 1-- AND [Document Type] = 2 AND [Payment Method Code] in ('R_LAST')
  Group by [Payment Method Code], year([Posting Date]), month([Posting Date])
  order by year([Posting Date]), month([Posting Date]) asc
  
  SELECT year([Posting Date]) as Jahr, month([Posting Date]) as Monat, [Payment Method Code] , count([Entry No_]) as AnzahlOffenePosten
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] with (NOLOCK)
  Where [Open] = 1 AND [Document Type] = 2 AND [Payment Method Code] in ('INVOICE','INVOICE_2','INVOICE_CH')
  Group by [Payment Method Code], year([Posting Date]), month([Posting Date])
  order by year([Posting Date]), month([Posting Date]) asc