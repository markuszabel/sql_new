with neutral as
(
	Select distinct(sl.[Order No_])
	FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Line] as sl with (NOLOCK)
	Where No_ in ('R000000006','R000000003') 
)


Select ep.[Order No_], ep.[T&T-Id], 
	neutral.[Order No_]

FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayParcel] as ep with (NOLOCK)
Left Join neutral on neutral.[Order No_] = ep.[Order No_]
Where ep.[Order No_] in 

(	Select sh.[Order No_]
	FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as sh with (NOLOCK)
	Where sh.[DHL Confirmation Date] between '2014-08-01' and '2014-08-31' AND [Reason Code] = 'WINDELN_DE'
)