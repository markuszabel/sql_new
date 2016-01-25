/****** Stornierte Aufträge nach Fraudinfo ********/

With inSystem as
(	
	Select	[External Document No_]
	from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (nolock)
	Union
	Select	[External Document No_] 
	from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] with (nolock)
)
, fraudlog as
(
	Select 	FraudInfo
			, isnull(count(ExternalDocumentNo),0) as Anzahl  
	from [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] with (nolock)
	Where Wait = 1 
		and year(OrderDate) = 2014
	Group by FraudInfo
)
, dataset as 
(
/****** Komplett Storniert ******/
Select	esh.[Shop Code] as ShopCode
		, esh.FraudInfo as FraudInfo
		, isnull(COUNT(distinct esh.ExternalDocumentNo),0) as Anzahl_Aufträge
		, sum (cdl.Quantity * cdl.UnitPrice_Gross) as Betrag
From [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as esh with (nolock)
Left Join inSystem 
	on esh.ExternalDocumentNo = inSystem.[External Document No_]
Left join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentLine] as cdl with (nolock)
	on esh.[Entry No_] = cdl.[Header Entry No_]
Where inSystem.[External Document No_] IS NULL 
	AND year(esh.[OrderDate]) = 2014
--AND MONTH( fraudLog.[OrderDate]) = MONTH(getdate())-1 
	AND esh.[Shop Code] = 'WINDELN_DE' --and esh.FraudInfo <>''

group by esh.[Shop Code]
		, esh.FraudInfo
)

select	dataset.ShopCode
		, dataset.FraudInfo
		, fraudlog.Anzahl as Anzahl_OI
		, dataset.Anzahl_Aufträge as Storniert
		, cast(dataset.Anzahl_Aufträge / (fraudlog.Anzahl * 1.0) as decimal(5,4)) as Regel_Effektivität
		, dataset.Betrag
From dataset
left join fraudlog
	on dataset.FraudInfo = fraudlog.FraudInfo
order by dataset.Anzahl_Aufträge desc