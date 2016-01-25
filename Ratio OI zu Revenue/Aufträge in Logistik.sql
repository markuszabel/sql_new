With 
inLog as
(Select [External Document No_]
	from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (nolock)
	Where [Document Type] = '11' OR [Released For Shipment] = 1
)  

/****** In Logistik ******/ 
Select count (esh3.[External Document No_]) as In_Logistik , esh3.[Shop Code] --, esh.[Order Date], esh.FraudInfo, esh.[Shop Payment Method Code]
From [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as esh3 with (nolock)
Right Join inLog
on esh3.[External Document No_] = inLog.[External Document No_]
Where esh3.[Order Date] between '2014-04-01' and '2014-04-28'
Group by esh3.[Shop Code]
order by esh3.[Shop Code]