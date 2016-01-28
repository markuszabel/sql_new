DECLARE @line int = '1'; 
DECLARE @j_id varchar(11) = 'Stock_USTER';
DECLARE @j_name_id varchar(3) = 'IMP';
DECLARE @site varchar(3) = 'UST';
DECLARE @warehouse varchar(8) = 'USTER';
DECLARE @date date = '2016-01-01';
DECLARE @location varchar(9) = 'USTER';

with stock_ust as
(Select ROW_NUMBER() OVER (ORDER BY [Item No_]) as Ranking ,[Item No_], sum(Quantity) as Menge
from urban_NAV600.dbo.[Urban-Brand GmbH$Item Ledger Entry] with (NOLOCK)
Where [Location Code] = @location --and [Item No_] = '0027084657968'
Group by [Item No_]
having sum(Quantity) <> '0')

Select 
stock_ust.[Item No_] "ItemId",
@j_id "JournalId",
stock_ust.Ranking "LineNum",
@j_name_id "JournalNameId",
@date "TransDate",
cast(stock_ust.Menge as INT) "Qty",
cast(st.[Unit Cost] as Decimal(18,2)) "CostPrice",
it.Description "Description",
@warehouse "IventLocationId",
@site "InventSiteId"

From stock_ust
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] as st with (Nolock)
on st.[Item No_] = stock_ust.[Item No_] and st.[Location Code] = @location
left join urban_NAV600.dbo.[Urban-Brand GmbH$Item] as it with (Nolock)
on it.No_ = stock_ust.[Item No_]
/*left join urban_NAV600.dbo.[Urban-Brand GmbH$Default Dimension] as dd with (Nolock)
on dd.No_ = it.No_ and dd.[Dimension Code] = 'MARKE'
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$eBayFFItem] as ei with (Nolock)
on ei.[Item No_] = it.No_ */
order by stock_ust.Ranking
FOR XML PATH ('InventJournalEntity')