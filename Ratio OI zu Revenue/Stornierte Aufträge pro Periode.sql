/****** Stornierte Aufträge nach Periode ******/

With inSystem as
(	Select [External Document No_]from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (nolock)
	Union
	Select [External Document No_] from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] with (nolock)
)
/****** Komplett Storniert ******/
Select  
COUNT(distinct esh.[External Document No_]) as StornierteAuftrage, 
sum (esl.Quantity * esl.[Unit Price Gross Amount]) as WertStornierung,
ch.FraudInfo,
ch.Wait,
ch.CouponInformation_CouponCode,
esh.[Shop Payment Method Code]

From [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as esh with (nolock)

Left Join inSystem on esh.[External Document No_] = inSystem.[External Document No_]
Left join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesLine] as esl with (nolock) on esh.No_ = esl.[Document No_]
left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as ch with (nolock) on ch.ExternalDocumentNo = esh.[External Document No_]

Where inSystem.[External Document No_] IS NULL 
AND /* month(esh.[Order Date]) = 9 and */ year(esh.[Order Date]) = 2015
AND esh.[Shop Code] = 'WINDELN_DE'

group by esh.[Shop Code],ch.FraudInfo , esh.[Shop Payment Method Code],ch.Wait, ch.CouponInformation_CouponCode
order by sum (esl.Quantity * esl.[Unit Price Gross Amount]) desc