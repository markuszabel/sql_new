with mkb_oi as (
SELECT  year(cdh.OrderDate) as Jahr,month(cdh.OrderDate) as Monat, sum (cdl.Quantity * cdl.UnitPrice_Gross) as OrderIntake
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentLine] as cdl with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
  on cdl.[Header Entry No_] = cdh.[Entry No_]
  WHERE cdh.[Shop Code] = 'MKB'
  group by year(cdh.OrderDate),month(cdh.OrderDate)),
mkb_revenue as (
 Select year(sih.[Posting Date]) as Jahr,  month(sih.[Posting Date]) as Monat, SUM( sil.[Amount Including VAT]) as Umsatz
 From [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sil with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sih with (NOLOCK)
  on sil.[Document No_] = sih.No_
  WHERE sih.[Reason Code] = 'MKB'
  group by year(sih.[Posting Date]), month(sih.[Posting Date]))
  
Select mkb_oi.Jahr, mkb_oi.Monat, cast(mkb_oi.OrderIntake as float) as OrderIntake, cast(mkb_revenue.Umsatz as float) as Umsatz
from mkb_oi
Left join mkb_revenue on mkb_oi.Jahr = mkb_revenue.Jahr and mkb_oi.Monat = mkb_revenue.Monat
