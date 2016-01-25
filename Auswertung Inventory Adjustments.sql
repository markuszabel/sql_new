Select [Item No_], cast(Quantity as INT) as AnzahlVerarbeitet, [Return Reason Code] 
		
from urban_NAV600.dbo.[Urban-Brand GmbH$Fulfillment Adjustment]
Where [Fulfillment Setup Code] = 'FIEGE' 
		AND [Generated at] between  '2013-08-01' and '2013-08-31'  
		AND Processed = 1
			
Select [Item No_], cast(Quantity as INT) as AnzahlNichtVerarbeitet, [Return Reason Code] 
		
from urban_NAV600.dbo.[Urban-Brand GmbH$Fulfillment Adjustment]
Where [Fulfillment Setup Code] = 'FIEGE' 
		AND [Generated at] between '2013-08-01' and '2013-08-31'
		AND Processed = 0