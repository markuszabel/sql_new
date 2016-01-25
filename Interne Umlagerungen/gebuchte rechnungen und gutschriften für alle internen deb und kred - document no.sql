/**  Auswertung 1462 - Intern - gebuchte Rechnungen und Gutschriften mit Wert **/
Select distinct pih.No_
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Line] as pil with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Header] as pih on pil.[Document No_] = pih.No_
Where pih.[Buy-from Vendor No_] in ('70311','70321','70367','70611','70833','70851','70854','71279','79141','D1164626','D1173541','D1364500','D1434457','D1563736','D1842898')
and pil.[Posting Date] <= '2014-12-31'
--Group by pil.No_,pih.[Buy-from Vendor No_]

Select distinct pch.No_--, pch.[Buy-from Vendor No_],cast(sum(pcl.Quantity*-1)as INT) as Menge, cast(sum(pcl.Amount*-1) as float) as Wert
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Line] as pcl with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Hdr_] as pch on pcl.[Document No_] = pch.No_
Where pch.[Buy-from Vendor No_] in ('70311','70321','70367','70611','70833','70851','70854','71279','79141','D1164626','D1173541','D1364500','D1434457','D1563736','D1842898')
and pcl.[Posting Date] <= '2014-12-31'
--Group by pcl.No_,pch.[Buy-from Vendor No_]

Select distinct sih.No_--, sih.[Sell-to Customer No_],cast(sum(sil.Quantity*-1)as INT) as Menge, cast(sum(sil.Amount*-1) as float) as Wert
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sil with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sih on sil.[Document No_] = sih.No_
Where sih.[Sell-to Customer No_] in ('70311','70321','70367','70611','70833','70851','70854','71279','79141','D1164626','D1173541','D1364500','D1434457','D1563736','D1842898')
AND sil.[Posting Date] <= '2014-12-31'
--Group by sil.No_,sih.[Sell-to Customer No_]

Select distinct sch.No_--, sch.[Sell-to Customer No_],cast(sum(scl.Quantity)as INT) as Menge, cast(sum(scl.Amount) as float) as Wert
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Cr_Memo Line] as scl with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Cr_Memo Header] as sch on scl.[Document No_] = sch.No_
Where sch.[Sell-to Customer No_] in ('70311','70321','70367','70611','70833','70851','70854','71279','79141','D1164626','D1173541','D1364500','D1434457','D1563736','D1842898')
and scl.[Posting Date] <= '2014-12-31'
--Group by scl.No_,sch.[Sell-to Customer No_]


