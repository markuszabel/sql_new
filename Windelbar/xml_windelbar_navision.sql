create view total_item as
SELECT
	[Urban-Brand GmbH$Sales Header].No_ as Auftrag,
	SUM (
		[Urban-Brand GmbH$Sales Line].Quantity
	) / COUNT (distinct(Mag_bi_import.dbo.[Collis].[SITEMS_IDENTCODE])) AS anzahl,
	[Urban-Brand GmbH$Sales Header].[Sell-to Customer No_] AS Cust_no,
	COUNT (distinct(Mag_bi_import.dbo.[Collis].[SITEMS_IDENTCODE])) as Anz_Colli
FROM
	Term18.urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header],Term18.urban_NAV600.dbo.[Urban-Brand GmbH$Sales Line], mag_BI_Import.dbo.[Collis]
where [Urban-Brand GmbH$Sales Header].No_ = [Urban-Brand GmbH$Sales Line].[Document No_]
And [Urban-Brand GmbH$Sales Header].No_ = mag_BI_Import.dbo.[Collis].[SITEMS_ORDERNUMBER] collate Latin1_General_100_CS_AS
AND [Reason Code] = 'WINDELBAR'
AND [Urban-Brand GmbH$Sales Line].[Document Type] = '11'
--AND urban_NAV600_Staging.dbo.[Sales Header].[Fully Available Date] >= '2012-06-13'
/*and urban_NAV600_Staging.dbo.[Sales Header].[External Document No_] not in ('300000600',
'300000667')*/

--And MAG_BI_Import.dbo.Collis.SOWNER_CLOSEDATE = '2012-07-13'
GROUP BY
	[Urban-Brand GmbH$Sales Header].No_,
	[Urban-Brand GmbH$Sales Header].[Sell-to Customer No_],
	[Urban-Brand GmbH$Sales Line].[Posting Group]
HAVING
	[Urban-Brand GmbH$Sales Line].[Posting Group] = 'HANDEL';
go

select 
				total_item.Auftrag as 'Head/HeadOrderNumber',
				[Bill-to Customer No_] as 'Head/CustomerNoInvoice',
				'0' as 'Head/Group7Reference',
				'DHL' as 'Head/Method',
				'EUR' as 'Head/CurrencyCode',
				cast(getDate() as date) as 'Head/ShippingDate',
				cast(DATEADD(D,2,SYSDATETIME()) as date) as 'Head/DeliveryDate',
				cast(anzahl as int) as 'Head/TotalItems',
				cast(Anz_Colli as int) as 'Head/TotalColli',
				'0' as 'Head/TotalWeight',

				
				(select
				[Urban-Brand GmbH$Sales Line].[Line No_] as 'LineDeliveryNote', 
				[Urban-Brand GmbH$Sales Line].[Document No_] as 'LineOrderNumber',
				[Urban-Brand GmbH$Sales Line].[Line No_] as 'LineNo',
				[Urban-Brand GmbH$Sales Line].No_ as 'ItemNo',
				'true' as 'InventoryEffective',
				cast(Quantity as numeric(18, 1)) as 'QuantityOrdered',
				cast(Quantity as numeric(18, 1)) as 'QuantityShipped',
				case when [Unit of Measure] = 'ST' THEN 'St�ck' else [Unit of Measure] end 'unit'

from term18.urban_NAV600.dbo.[Urban-Brand GmbH$Sales Line]
where [Document No_] = total_item.Auftrag and [Location Code] = 'WINDELBAR'
--group by [Document No_]

FOR XML PATH ('Line'), type, root('Lines')),

			 (select
				  total_item.Auftrag as 'OrderNumber',
				 '0' as 'ShippmentNo',
				 '1' as 'PacketNo',
				 '0' as 'PacketWeight',
				 SITEMS_IDENTCODE as 'PacketID'

from Collis
where dbo.Collis.SITEMS_ORDERNUMBER = total_item.Auftrag collate Latin1_General_100_CS_AS
--and [Collis].[SITEMS_DATE] >= '2012-05-21'
--group by OrderNumber
FOR XML PATH ('Colli'), type, root('Collis'))

from total_item inner join Term18.urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header]
on total_item.Auftrag = [Urban-Brand GmbH$Sales Header].No_ 

--where total_item.No_  = 'A0000165428'	
			
FOR XML PATH ('SalesOrder'), type, root('FulfillOrderResponse');

drop view total_item;                                                                                                                                                                                                                                                                                                                                                                                                          