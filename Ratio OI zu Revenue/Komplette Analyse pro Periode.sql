/****** Alle pro Periode erhaltene Aufträge ******/
With inWait as
(Select csh.[External Document No_] as Auftrag	FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as csh with (NOLOCK) Where csh.Status = '0'),
inSales as
(Select sh.[External Document No_] as Auftrag FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK) Where sh.[Document Type] = '1'),
inLog as
(Select sh2.[External Document No_] as Auftrag FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh2 with (NOLOCK) Where sh2.[Document Type] = '11'),
inSent as
(Select si.[External Document No_] as Auftrag FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as si with (NOLOCK)),
cancelled as
(
Select esh.[External Document No_]
From [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as esh with (nolock)
Left Join (	Select [External Document No_]from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (nolock) Union
	Select [External Document No_] from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] with (nolock)
	)as uni on esh.[External Document No_] = uni.[External Document No_]
Where uni.[External Document No_] IS NULL
)

Select ch.[Shop Code] , COUNT( ch.ExternalDocumentNo)as OI, count(inWait.Auftrag) as Warten, count(inSales.Auftrag) as 'WartenWare-VK', count(inLog.Auftrag) as Logistik, count(inSent.Auftrag) as Versendet, count(cancelled.[External Document No_]) as Storniert
From [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as ch with (NOLOCK)
Left Join inWait on inWait.Auftrag = ch.ExternalDocumentNo
Left Join inSales on inSales.Auftrag = ch.ExternalDocumentNo
Left Join inLog on inLog.Auftrag = ch.ExternalDocumentNo
Left Join inSent on inSent.Auftrag = ch.ExternalDocumentNo
left Join cancelled on cancelled.[External Document No_] = ch.ExternalDocumentNo
Where  ch.OrderDate >= '2015-03-01' 
Group by ch.[Shop Code]