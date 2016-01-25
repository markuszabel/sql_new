Select *
from urban_NAV600.dbo.[Urban-Brand GmbH$Requisition Line] with (NOLOCK)
where [Journal Batch Name] = 'MAIK'

Update 
urban_NAV600.dbo.[Urban-Brand GmbH$Requisition Line]
set [Transfer Shipment Date] = cast(getdate() as Date)
where [Journal Batch Name] = 'MAIK'

Select *
From urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit]
Where [Location Code] = 'USTER' and [Replenishment System] = '2' and [Transfer-from Code] = ''

UPDATE urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] 
set [Transfer-from Code] = 'BER_FIEGE'
Where [Location Code] = 'USTER' and [Replenishment System] = '2' and [Transfer-from Code] = ''