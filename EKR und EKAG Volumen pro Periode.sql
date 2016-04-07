Select count(distinct pih.No_) as Anzahl_EKRs, pih.[Shortcut Dimension 2 Code], sum(pil.[Line Amount]) as Volume_EKRs
From urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Inv_ Line] as pil with (NOLOCK)
left Join urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Inv_ Header] as pih with (NOLOCK)
on pil.[Document No_] = pih.No_
Where pih.[Posting Date] between '2016-01-01' and '2016-12-31' and pih.[Vendor Posting Group] in ('STANDARD','MARKANT','BABYPLUS')
and pih.[Buy-from Vendor No_] between '71001' and '78999' and pih.[Shortcut Dimension 2 Code] in ('IT_WIN','CH_WIN','DE_WIN','DE_WDB')
Group by pih.[Shortcut Dimension 2 Code]

Select count(distinct cih.No_) as Anzahl_EKAGs, cih.[Shortcut Dimension 2 Code], sum(cil.[Line Amount]) as Volume_EKAGs
From urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Cr_ Memo Line] as cil with (NOLOCK)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Cr_ Memo Hdr_] as cih with (NOLOCK)
on cil.[Document No_] = cih.No_
Where cih.[Posting Date] between '2016-01-01' and '2016-12-31'  and cih.[Vendor Posting Group] in ('STANDARD','MARKANT','BABYPLUS')
and cih.[Buy-from Vendor No_] between '71001' and '78999' and cih.[Shortcut Dimension 2 Code] in ('IT_WIN','CH_WIN','DE_WIN','DE_WDB')
Group by cih.[Shortcut Dimension 2 Code]