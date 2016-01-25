With inSystem as
(	Select [External Document No_]from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (nolock)
	Union
	Select [External Document No_] from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] with (nolock))

/****** Komplett Storniert ******/
Select esh.[Shop Code],esh.FraudInfo, esh.Payment_Method_WebshopMethod, /*count(fraudLog.ExternalDocumentNo) ,*/COUNT(distinct esh.ExternalDocumentNo), sum (cdl.Quantity * cdl.UnitPrice_Gross) 
From [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as esh with (nolock)
Left Join inSystem on esh.ExternalDocumentNo = inSystem.[External Document No_]
Left join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentLine] as cdl with (nolock)
on esh.[Entry No_] = cdl.[Header Entry No_]
--left join fraudLog on fraudLog.FraudInfo = esh.FraudInfo
Where inSystem.[External Document No_]IS NULL 
AND year(esh.OrderDate) = '2015'
--AND MONTH( esh.[OrderDate]) = MONTH(getdate())-1 
--AND MONTH( fraudLog.[OrderDate]) = MONTH(getdate())-1 
AND esh.[Shop Code] = 'WINDELN_DE' --and esh.FraudInfo <>''
group by esh.[Shop Code],esh.FraudInfo, esh.Payment_Method_WebshopMethod
order by COUNT(distinct esh.ExternalDocumentNo) desc