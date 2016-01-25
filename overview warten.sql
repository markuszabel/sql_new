select [Shop Code]
--, CAST([Order Date] as Date)
--, FraudInfo 
,COUNT(No_) as Anzahl
from urban_NAV600.dbo.[Urban-Brand GmbH$eBayNavCSalesHeader]
Where Status = 0
group by [Shop Code]
--, CAST([Order Date] as Date)
--, FraudInfo
order by COUNT(No_)