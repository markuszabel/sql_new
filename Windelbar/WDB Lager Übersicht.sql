/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
sh.[Released For Shipment]
,count(sh.No_)
  FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
 Where [Reason Code] = 'WINDELBAR' AND sh.[Document Type] <> 5
  group by sh.[Released For Shipment]

Select						
count(distinct [Source No_])
from urban_NAV600.dbo.[Urban-Brand GmbH$Warehouse Shipment Line]

SELECT   cast(sum([Amount Including VAT]) as int)
		,MONTH([Posting Date])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line]
  Where [Location Code] = 'WINDELBAR' and MONTH([Posting Date]) = MONTH (Getdate()) AND YEAR([Posting Date]) = YEAR (Getdate())
  Group By MONTH([Posting Date])
  
 SELECT   cast(sum(sl.[Amount Including VAT]) as int)
		,MONTH(sl.[Posting Date])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sl
 join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sh
  on sl.[Document No_] = sh.No_
  Where sh.[Reason Code] = 'WINDELBAR' and 
  MONTH(sl.[Posting Date]) = MONTH (Getdate()) AND YEAR(sl.[Posting Date]) = YEAR (Getdate())
  Group By MONTH(sl.[Posting Date])
  
  
   SELECT   cast(sum(sl.[Amount Including VAT]) as int)
		,Cast(sl.[Posting Date] as Date)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sl
 join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sh
  on sl.[Document No_] = sh.No_
  Where sh.[Reason Code] = 'WINDELBAR' and 
  MONTH(sl.[Posting Date]) = MONTH (Getdate()) AND YEAR(sl.[Posting Date]) = YEAR (Getdate()) AND DATEDIFF(Day,sl.[Posting Date],GETDATE()) < 10 
  Group By Cast(sl.[Posting Date] as Date)
  Order by Cast(sl.[Posting Date] as Date)
  
	
SELECT   count(No_)
	, cast ([Posting Date] as DATE )
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header]
  Where [Location Code] = 'WINDELBAR' And DATEDIFF(Day,[Posting Date],GETDATE()) < 10
  Group by cast ([Posting Date] as DATE )
  Order by cast ([Posting Date] as DATE )