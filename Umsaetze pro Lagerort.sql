/****** Umsätze pro Lagerort und Währung ******/

SELECT   cast(sum(sil.Amount) as int) as Umsatz_brutto,
		MONTH(sil.[Posting Date]) as Month, sih.[Reason Code], sih.[Currency Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sil with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sih with (NOLOCK)
  on sil.[Document No_] = sih.No_
  Where MONTH(sil.[Posting Date]) = MONTH (Getdate()) AND YEAR(sil.[Posting Date]) = YEAR (Getdate())
  and sil.[Posting Date] < getdate()
  --AND sih.[Reason Code] <> ''
  AND sih.[Customer Posting Group] = 'STANDARD'
  Group By MONTH(sil.[Posting Date]),sih.[Reason Code], sih.[Currency Code]
  Order by MONTH(sil.[Posting Date]),sih.[Reason Code]