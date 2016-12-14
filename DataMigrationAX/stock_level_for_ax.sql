DECLARE @line int = '1'; 
DECLARE @j_id varchar(20) = 'Stock_TEST_100416';
DECLARE @j_name_id varchar(3) = 'IMP';
/** Hier das Lager aus AX eintragen (Site und Warehouse) **/
DECLARE @site varchar(3) = 'ABE';
DECLARE @warehouse varchar(8) = 'WDB_AB';
/** Datum nur für Testzwecke **/
DECLARE @date date = '2016-01-01';
/** Hier das Lager für Navision eintragen, aus dem die Daten geholt werden **/
DECLARE @location_nav varchar(9) = 'WDB_AB';
DECLARE @offset_ledger varchar(6) = '930000';
DECLARE @sep varchar(1) = '-';

with stock_ust as
(Select ROW_NUMBER() OVER (ORDER BY [Item No_]) as Ranking ,[Item No_],
left([Global Dimension 1 Code],3) as CostCenter,[Global Dimension 2 Code] as BusinessUnit, [Remaining Quantity] as Menge,
cast([Posting Date] as Date) as PostDate
from urban_NAV600.dbo.[Urban-Brand GmbH$Item Ledger Entry] with (NOLOCK)
Where [Location Code] = @location_nav --and [Item No_] = '0027084657968'
--Group by [Item No_],[Global Dimension 2 Code],left([Global Dimension 1 Code],3),
--cast([Posting Date] as Date)
and [Remaining Quantity] > '0'),

ve as
(Select [Item No_],sum([Cost Amount (Actual)]) as Buchwert, sum([Item Ledger Entry Quantity]) as Menge,(sum([Cost Amount (Actual)])/ sum([Item Ledger Entry Quantity])) as UnitCost
from urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] with (NOLOCK)
Where [Location Code] = @location_nav
--and [Item No_] = '4062300001510'
Group by [Item No_]
Having sum([Item Ledger Entry Quantity]) <> 0)

Select 
stock_ust.[Item No_] "ItemId",
@j_id "JournalId",
stock_ust.Ranking "LineNum",
@j_name_id "JournalNameId",
/** Datum muss im finalen Export auf das PostDate umgestellt werden. Aktuell für Tests **/
stock_ust.PostDate,
--@date "TransDate",
cast(stock_ust.Menge as INT) "Qty",
cast(ve.UnitCost as Decimal(18,2)) "CostPrice",
it.Description "Description",
@warehouse "IventLocationId",
@site "InventSiteId",
stock_ust.BusinessUnit + @sep + @sep + stock_ust.CostCenter "DefaultDimensionStr",
@offset_ledger "OffsetLedgerAccount"

From stock_ust
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] as st with (Nolock)
on st.[Item No_] = stock_ust.[Item No_] and st.[Location Code] = @location_nav
left join urban_NAV600.dbo.[Urban-Brand GmbH$Item] as it with (Nolock)
on it.No_ = stock_ust.[Item No_]
left join ve on ve.[Item No_] = stock_ust.[Item No_]
/*left join urban_NAV600.dbo.[Urban-Brand GmbH$Default Dimension] as dd with (Nolock)
on dd.No_ = it.No_ and dd.[Dimension Code] = 'MARKE'
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$eBayFFItem] as ei with (Nolock)
on ei.[Item No_] = it.No_ */
order by stock_ust.Ranking
FOR XML PATH ('InventJournalEntity'), root('Document');