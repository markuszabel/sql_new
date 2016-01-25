declare @itemNo as varchar(14) = '4009706883395'; 
with skuB as
(select	[Item No_], [Maximum Inventory] from urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] where [Location Code] = 'BER_FIEGE')
select	i.No_, skuB.[Maximum Inventory] as BER_FIEGE, i.[Maximum Inventory] as ITEM
from urban_NAV600.dbo.[Urban-Brand GmbH$Item] i join skuB on i.No_=skuB.[Item No_]
Where i.No_  = @itemNo

select SUM( Quantity)
from urban_NAV600.dbo.[Urban-Brand GmbH$Item Ledger Entry]
Where [Item No_] = @itemNo and [Posting Date] < '2014-03-31' AND [Location Code] = 'BER_FIEGE'

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ffpl.[Document No_],ffpl.[Document Entry No_],ffph.[File No_],cast(ffpl.[Order Date] as Date) as Bestelldatum
      ,cast( ffpl.[Expected Receipt Date] as Date) as Lieferdatum ,ffpl.[Buy-from Vendor No_] as Kreditor
      ,ffpl.[No_],ffpl.[Description],ffpl.[Description 2]
      ,cast((ffpl.[Quantity] * ffpl.[Qty_ per Unit of Measure])as int) as Menge
      ,cast((ffpl.[Quantity Received]* ffpl.[Qty_ per Unit of Measure]) as int) as Geliefert
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseLine] as ffpl
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseHeader] as ffph
  on ffpl.[Document No_] = ffph.No_
  Where ffpl.No_ = @itemNo And ffpl.[Order Date] >= '2014-01-01' AND ffpl.[Document Entry No_] = ffph.[Entry No_]
  Order by ffpl.[Document No_] Asc