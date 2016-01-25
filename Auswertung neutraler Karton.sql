with neutralBox as
(Select shl.[Order No_]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Line] as shl
  Where shl.No_ = 'R000000006' OR shl.No_ = 'R000000003' )
  
 Select ebp.[Order No_], ebp.[T&T-Id], ebp.[Import At], isnull(neutralBox.[Order No_],'Kein neutraler Karton') as neutralBox
 FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayParcel] as ebp
 left join neutralBox on neutralBox.[Order No_]= ebp.[Order No_]
 join  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as shh
 on shh.[Order No_] = ebp.[Order No_]
 where month(ebp.[Import At]) = '9' and YEAR(ebp.[Import At]) = '2014' and shh.[Reason Code] = 'WINDELN_DE'