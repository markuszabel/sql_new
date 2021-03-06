	/****** Script for SelectTopNRows command from SSMS  ******/
	/*Übersicht Aufträge (0 -> Wartet auf Ware, 1 -> verschickbar)*/
	SELECT 
	[Reason Code],[Released For Shipment] ,count(No_) as Anzahl
	FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (NOLOCK)
	Where [Reason Code] in ('WINDELBAR','WUNDERLAND') AND [Document Type] <> 5
	group by [Reason Code],[Released For Shipment]
	  
	/*Bereits gepackt*/
	SELECT 
	[Reason Code],count(No_) as Anzahl
	FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (NOLOCK)
	Where [Reason Code] in ('WINDELBAR','WUNDERLAND') AND [Invoice Possible] = 1
	group by [Reason Code]

	/*Anzahl Aufträge auf einer Pickliste*/
	Select
		 count(distinct sl.[Source No_]) as Aufträge_auf_Pickliste, sl.[Location Code]
	from urban_NAV600.dbo.[Urban-Brand GmbH$Warehouse Shipment Line] as sl
	Group by sl.[Location Code]


/*Umsatz nur aus dem Windelbarlager*/
SELECT   cast(sum([Amount Including VAT]) as int)
		,MONTH([Posting Date])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line]
  Where [Location Code] in ('WINDELBAR','WUNDERLAND') and MONTH([Posting Date]) = MONTH (Getdate()) AND YEAR([Posting Date]) = YEAR (Getdate())
  Group By MONTH([Posting Date])
  
/*Umsatz Reasoncode Windelbar und Wunderland*/
 SELECT --sh.No_  ,
		sum(sl.[Amount Including VAT])
		,MONTH(sl.[Posting Date])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sl
 join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sh
  on sl.[Document No_] = sh.No_
  Where sh.[Reason Code] in ('WINDELBAR','WUNDERLAND') 
  --and MONTH(sl.[Posting Date]) = MONTH (Getdate()) AND YEAR(sl.[Posting Date]) = YEAR (Getdate())
  Group By sh.No_,MONTH(sl.[Posting Date])
  --order by sum(sl.[Amount Including VAT]) desc
  

/*Umsatz pro Tag Reasoncode Windelbar und Wunderland*/
   SELECT   cast(sum(sl.[Amount Including VAT]) as int)
		,Cast(sl.[Posting Date] as Date)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sl
 join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sh
  on sl.[Document No_] = sh.No_
  Where sh.[Reason Code] in ('WINDELBAR','WUNDERLAND') and 
  MONTH(sl.[Posting Date]) = MONTH (Getdate()) AND YEAR(sl.[Posting Date]) = YEAR (Getdate()) AND DATEDIFF(Day,sl.[Posting Date],GETDATE()) < 10 
  Group By Cast(sl.[Posting Date] as Date)
  Order by Cast(sl.[Posting Date] as Date)
  

/*Anzahl verschickter Aufträge Windelbar Lager*/
SELECT  [Location Code]  ,count(No_)
	, cast ([Posting Date] as DATE )
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header]
  Where [Location Code] in ('WINDELBAR','WUNDERLAND') And DATEDIFF(Day,[Posting Date],GETDATE()) < 5
  Group by [Location Code], cast ([Posting Date] as DATE )
  Order by [Location Code],  cast ([Posting Date] as DATE )