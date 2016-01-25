/***** CTE um den Umzugsmalus zu berechenne *******/

WITH

leaving_fiege 
AS (
	SELECT [Item No_]
		  ,[Document Line No_]
		  ,[Posting Date]
		  ,[Entry Type]
		  ,[Source No_]
		  ,[Document No_]
		  ,[Description]
		  ,[Location Code]
		  ,[Quantity]
	  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
	  WHERE [Source No_] in ('D1364500')
		--and [Posting Date] between '2013-07-01' and '2013-07-31'
	), 
arriving_ber
AS	(
	SELECT [Item No_]
		  ,[Document Line No_]
		  ,[Posting Date]
		  ,[Entry Type]
		  ,[Source No_]
		  ,[Document No_]
		  ,[Description]
		  ,[Location Code]
		  ,[Quantity]
	  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
	  WHERE [Source No_] in ('70611')
		--and [Posting Date] between '2013-07-01' and '2013-07-31'
	)

--SELECT SUM(case when -datediff(d, ab.[Posting Date],lf.[Posting Date]) > 4 then ab.Quantity else 0 end) as Malus from leaving_fiege lf
--full outer join arriving_ber ab
--on lf.[Item No_]=ab.[Item No_]
--and lf.[Document Line No_]=ab.[Document Line No_]

SELECT	lf.[Item No_], lf.[Document No_],lf.[Document Line No_], lf.[Posting Date] as Auslagerung,/* lf.[Document No_],*/ lf.[Location Code] as "From", lf.Quantity as "Stück Aus", ab.Quantity as "Stück", ab.[Document No_],ab.[Document Line No_], ab.[Posting Date] as "Einlagerung", ab.[Location Code] as "To", 
		SUM(case when -datediff(d, ab.[Posting Date],lf.[Posting Date]) > 4 then ab.Quantity else 0 end) as Malus from leaving_fiege lf
full outer join arriving_ber ab
on lf.[Item No_]=ab.[Item No_]
and lf.[Document Line No_]=ab.[Document Line No_]
--and lf.Quantity=-ab.Quantity
--and lf.[Item No_]='6488480'
where lf.Quantity is null 
or ab.Quantity is null
Group by lf.[Item No_], lf.[Document No_], lf.[Document Line No_], lf.[Posting Date], lf.[Location Code],lf.Quantity, ab.Quantity, ab.[Document No_], ab.[Document Line No_], ab.[Posting Date], ab.[Location Code]
order by lf.[Posting Date], lf.[Item No_] asc


;

--select * from [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
--WHERE [Source No_] in ('D1364500','70611')
--order by [Item No_];




--WITH

--leaving_fiege 
--AS (
--	SELECT [Item No_]
--		  ,[Document Line No_]
--		  ,min([Posting Date]) as [Posting Date]
--		  ,[Entry Type]
--		  ,[Source No_]
--		  --,[Document No_]
--		  ,[Description]
--		  ,[Location Code]
--		  ,sum([Quantity]) as [Quantity]
--	  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
--	  WHERE [Source No_] in ('D1364500')
--		--and [Posting Date] between '2013-07-01' and '2013-07-31'
--	GROUP BY [Item No_], [Document Line No_] , [Entry Type], [Source No_],Description, [Location Code]
--	), 
--arriving_ber
--AS	(
--	SELECT [Item No_]
--		  ,[Document Line No_]
--		  ,min([Posting Date]) as [Posting Date]
--		  ,[Entry Type]
--		  ,[Source No_]
--		  --,[Document No_]
--		  ,[Description]
--		  ,[Location Code]
--		  ,sum([Quantity]) as [Quantity]
--	  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
--	  WHERE [Source No_] in ('70611')
--		--and [Posting Date] between '2013-07-01' and '2013-07-31'
--	GROUP BY [Item No_], [Document Line No_], [Entry Type], [Source No_],Description, [Location Code]