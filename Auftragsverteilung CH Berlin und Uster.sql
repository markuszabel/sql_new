Select cast([DHL Reporting Date] as Date) as Übertragungsdatum, count(No_) as AnzahlAufträge_BER
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header] with (NOLOCK)
Where [Location Code] = 'BER_FIEGE' and [Document Type] = '11' and [Reason Code] = 'WINDELN_CH'
group by cast([DHL Reporting Date] as Date)
order by cast([DHL Reporting Date] as Date) desc

Select cast([DHL Reporting Date] as Date) as Übertragungsdatum, count(No_) as AnzahlAufträge_UST
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header] with (NOLOCK)
Where [Location Code] = 'USTER' and [Document Type] = '11' and [Reason Code] = 'WINDELN_CH'
group by cast([DHL Reporting Date] as Date)
order by cast([DHL Reporting Date] as Date) desc

Select [Location Code], count(No_)
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header] with (NOLOCK)
Where [Location Code] in ('USTER','BER_FIEGE') and [Document Type] = '11' and [Reason Code] = 'WINDELN_CH'
group by [Location Code]
order by [Location Code]

Select cast([Posting Date] as Date),[Location Code], count(No_)
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Shipment Header] with (NOLOCK)
Where [Location Code] in ('USTER','BER_FIEGE') and [Posting Date] = cast(getdate() as Date) and [Reason Code] = 'WINDELN_CH'
group by cast([Posting Date] as Date),[Location Code]
order by cast([Posting Date] as Date) desc