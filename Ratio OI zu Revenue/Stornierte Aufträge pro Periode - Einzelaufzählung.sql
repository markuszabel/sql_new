With inSystem as
(	Select [External Document No_]from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (nolock)
	Union
	Select [External Document No_] from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] with (nolock)
)



/****** Komplett Storniert ******/
Select esh.[Shop Code],esh.[External Document No_], MONTH (esh.[Order Date]) as Monat, ch.FraudInfo, ch.CouponInformation_CouponCode
From [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as esh with (nolock)
Left Join inSystem
on esh.[External Document No_] = inSystem.[External Document No_]
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as ch
on ch.ExternalDocumentNo = esh.[External Document No_]
Where inSystem.[External Document No_] IS NULL AND esh.[Order Date] between '2015-10-01' 
and GETDATE() and esh.[Shop Code] = 'WINDELN_DE'
--and ch.CouponInformation_CouponCode = 'LETSFAMILY'
--and esh.FraudInfo = ''
--and esh.[Shop Payment Method Code] = 'alipay'
--group by esh.[Shop Code], MONTH (esh.[Order Date])
--order by esh.[Shop Code], MONTH (esh.[Order Date])