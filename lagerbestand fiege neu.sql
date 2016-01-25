/**** Flow for Aufträge between Apfelstädt and Großbeeren *****/

--declare @fromdate date = '2013-07-30'

--select No_, left([File No_],2), [Status Fulfillment] from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader]
--where ([File No_] like ('%A6%') or [File No_] like ('%A3%'))
--and [Order Date]> @fromdate;


--declare @date as date
--set @date = '2013-06-01'
--/**/

--/*select No_, cast([Order Date] as DATE) as "Order Date", Cast([Shipment Date] as DATE) as "Shipment Date" from urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header]
--where No_ like ('%A3%') or No_ like('%A6%')*/;


--select No_, cast([Order Date] as DATE) as "Order Date", Cast([Shipment Date] as DATE) as "Shipment Date" 
--from urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header]
--where [Order Date]>=@date;

----SELECT NO_, [FILE NO_], CAST([ORDER DATE] AS DATE) AS "ORDER DATE" FROM URBAN_NAV600.DBO.[URBAN-BRAND GMBH$EBAYFFSALESHEADER]
----WHERE [ORDER DATE] >= @DATE
----AND [FILE NO_] LIKE ('%A3%') OR [FILE NO_] LIKE ('%A6');

-- delcare variables
declare @todate date = '2013-06-01'

-- 
--select a.Lager,count(a.[Order Date]) as "Sales Header", count(ssh.[Order Date]) as "Shipment Header" 
--from (select esh.No_ as No_, LEFT(esh.[File No_],2) as Lager, sh.[Order Date] as "Order Date"
--from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as esh
--left join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
--on sh.No_ = esh.No_
--where esh.[Order Date]>= @todate
--and esh.[File No_] like ('%A6%') or esh.[File No_] like ('%A3%')) a
--left join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as ssh
--on a.No_=ssh.[Order No_]
--group by a.Lager;

--select LEFT(esh.[File No_],2) as Lager, count(ssh.[DHL Reporting Date]) as "Shipment Header" 
--from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as esh
--left join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as ssh
--on esh.No_=ssh.[Order No_]
--where cast(esh.[DHL Reporting Date] as DATE)>= @todate
--and esh.[File No_] like ('%A6%') or esh.[File No_] like ('%A3%')
--group by LEFT(esh.[File No_],2);


--select LEFT(esh.[File No_],2) as Lager, count(esh.No_)
--from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as esh
--where cast(esh.[DHL Reporting Date] as DATE)<= @todate
--and esh.[File No_] like ('%A6%')or esh.[File No_] like ('%A3%')
--group by LEFT(esh.[File No_],2);

select * from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader]
where [DHL Reporting Date]>= '2013-07-01'
and ([File No_] like ('%A6%')or [File No_] like ('%A3%'));