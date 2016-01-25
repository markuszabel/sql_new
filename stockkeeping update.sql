/****** Umstellung Dropshipmentartikel ******/
Select count([Item No_]) as NotDropShipment From urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit]
Where Klasse = 'DS' and [Drop Shipment] <> '2'

--Update urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] set [Drop Shipment] = '2' Where Klasse = 'DS'

/****** Umstellung Umlagerung von ******/
Select count([Item No_]) as ReplenishFrom From urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit]
Where [Location Code] = 'USTER' and [Transfer-from Code] = '' and [Replenishment System] <> '0'

--Update urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] set [Transfer-from Code] = 'BER_FIEGE' Where [Location Code] = 'USTER' and [Transfer-from Code] = '' and [Replenishment System] <> '0'

/****** Umstellung Losgrößenrundungsfaktor bei Umlagerung ******/
Select count([Item No_]) as WrongOrderMultiple from urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit]
Where [Location Code] = 'USTER' and [Replenishment System] = '2' and [Order Multiple] <> '1'

--Update urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] set [Order Multiple] = '1' Where [Location Code] = 'USTER' and [Replenishment System] = '2' and [Order Multiple] <> '1'
