Select cast([DHL Reporting Date] as Date) as Übertragungsdatum, count(No_) as AnzahlAufträge
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header] with (NOLOCK)
Where [Location Code] = 'WDB_MACHTL' and [Document Type] = '11'
group by cast([DHL Reporting Date] as Date)
order by cast([DHL Reporting Date] as Date) desc

Select cast([DHL Reporting Date] as Date) as Übertragungsdatum, count(No_) as AnzahlAufträge
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header] with (NOLOCK)
Where [Location Code] = 'WDB_AB' and [Document Type] = '11'
group by cast([DHL Reporting Date] as Date)
order by cast([DHL Reporting Date] as Date) desc

Select [Location Code], count(No_)
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header] with (NOLOCK)
Where [Location Code] in ('WDB_MACHTL','WDB_AB') and [Document Type] = '11'
group by [Location Code]
order by [Location Code]

Select cast([Posting Date] as Date),[Location Code], count(No_)
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Shipment Header] with (NOLOCK)
Where [Location Code] in ('WDB_MACHTL','WDB_AB') and [Posting Date] = cast(getdate()-1 as Date)
group by cast([Posting Date] as Date),[Location Code]
order by cast([Posting Date] as Date) desc