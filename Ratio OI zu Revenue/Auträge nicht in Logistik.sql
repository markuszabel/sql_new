With inSales as
(Select [External Document No_]
	from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (nolock)
	Where [Document Type] = '1' AND [Released For Shipment] = 0
	--AND [Reason Code] NOT in ('WINDELBAR','WUNDERLAND')
	)

/****** In Sales ******/ 
Select esh2.[Shop Code],count( esh2.[External Document No_]) as In_Sales --, esh.[Order Date], esh.FraudInfo, esh.[Shop Payment Method Code]
From [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as esh2 with (nolock)
Right Join inSales
on esh2.[External Document No_] = inSales.[External Document No_]
Where esh2.[Order Date] between '2014-04-01' and '2014-04-28'
group by esh2.[Shop Code]
order by esh2.[Shop Code]