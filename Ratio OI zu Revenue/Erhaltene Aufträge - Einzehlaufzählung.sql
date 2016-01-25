/****** Alle pro Periode erhaltene Aufträge ******/
with sh as
(
	Select [External Document No_], [Payment Method Code], [Document Type]
	from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] 
	Where [Document Type] in ('1','11')

)

Select ch.[Shop Code],
		ch.ExternalDocumentNo , 
		cast (ch.OrderDate as Date) as Auftragsdatum, 
		ch.Payment_Method_WebshopMethod as ZahlartShop, 
		ch.Wait, ch.FraudInfo, 
		sih.[External Document No_] as InvoiceNr,
		sih.[Payment Method Code] as ZahlartInv,
		sh.[External Document No_] as AuftragNr,
		sh.[Payment Method Code] as ZahlartAuftr,
		sh.[Document Type]
From [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as ch with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sih with (NOLOCK)
on ch.ExternalDocumentNo = sih.[External Document No_]
Left Join sh on sh.[External Document No_] = ch.ExternalDocumentNo
Where  ch.OrderDate between '2014-01-01' and Getdate() and ch.[Shop Code] = 'WINDELN_DE' --and sh.[Document Type] in ('1','11')
--Group by ch.[Shop Code], MONTH ( OrderDate)
--order by ch.[Shop Code], MONTH ( OrderDate)