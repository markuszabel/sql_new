/****** Umsätze pro Lagerort und Währung ******/

SELECT   cast(sum(sil.[Amount Including VAT]) as int) as Umsatz_Brutto,cast(sum(sil.Amount) as int) as Umsatz_Netto,
		--DAY(sil.[Posting Date]) as Day, 
		MONTH(sil.[Posting Date]) as Month, sih.[Reason Code], sih.[Currency Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sil with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sih with (NOLOCK)
  on sil.[Document No_] = sih.No_
  Where  MONTH(sil.[Posting Date]) = MONTH (Getdate()) AND YEAR(sil.[Posting Date]) = YEAR (Getdate())
  and sil.[Posting Date] < getdate()
  --AND sih.[Reason Code] <> ''
  AND sih.[Customer Posting Group] = 'STANDARD'
  Group By 
  --DAY(sil.[Posting Date]),
  MONTH(sil.[Posting Date]),sih.[Reason Code], sih.[Currency Code]
  Order by 
  --DAY(sil.[Posting Date]),
  MONTH(sil.[Posting Date]),sih.[Reason Code]