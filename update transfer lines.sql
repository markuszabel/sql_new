Update urban_NAV600.dbo.[Urban-Brand GmbH$Transfer Line] set [Transfer-from Bin Code] = 'RW386' Where [Document No_] = 'A9900000562'

/*Select [Document No_], [Item No_], [Transfer-from Bin Code]
From urban_NAV600.dbo.[Urban-Brand GmbH$Transfer Line]
Where [Document No_] = 'A9900000347'*/

Update urban_NAV600.dbo.[Urban-Brand GmbH$Transfer Header] set [Posting Date] = '2015-12-31', [Shipment Date] = '2015-12-31' Where No_ >= 'A9900000551'

/*Select No_, [Posting Date], [Shipment Date]
From urban_NAV600.dbo.[Urban-Brand GmbH$Transfer Header]
Where No_ = 'A9900000487'*/