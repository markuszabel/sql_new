DECLARE @lang varchar(2) = 'de'; 
DECLARE @status varchar(1) = 'N';
DECLARE @qty Decimal(18,1) = 1.0;
Declare @pricetag as varchar(4) = 'true' ;
Select 
it.No_ "@no", 
it.[Attribute 2] "ItemCategory",
it.Description "ItemDescription" ,
it.[Description 2] "ItemDescription2" ,
'' "ItemCondition",
it.[Base Unit of Measure] "BaseUnit",
@qty "QuantityPerUnit",
case it.Blocked 
	when '0' then 'false'
	when '1' then 'true'
end
"Blocked",
it.[VAT Prod_ Posting Group] "VATCode",
case it.[BBD Obligation] 
when '0' then 'false'
	when '1' then 'true'
end
"MHD",
'' "ItemTrackingCode",
it.[Purch_ Unit of Measure] "VendorUnit",
st.[Vendor Item No_] "VendorItemNo",
st.[Vendor No_] "VendorNo",
cast(itu.[Qty_ per Unit of Measure] as Decimal (18,1)) "VendorQtyPurchaseUnitOfMeasure",
dd.[Dimension Value Code] "BRAND",
cast(st.[Minimum Order Quantity] as Decimal(18,1)) "ReplenishmentLimit",    
@pricetag "UnitPrice/@IncludedVAT",
cast(it.[Unit Price] as Decimal(18,2))  "UnitPrice",
it.[Inventory Posting Group] "InventoryPostingGroup",
it.[Item Category Code] "ItemCategoryCode",
it.[VAT Prod_ Posting Group] "VATBusPostingGroup",
it.[Gen_ Prod_ Posting Group] "GenProdPostingGroup",
cast(st.[Last Direct Cost] as Decimal(18,2)) "LastDirectCost" ,
'' "Variant",
it.[Tariff No_] "TariffNo",
'' "TariffNoDescription",
it.[Country_Region of Origin Code] "CountryOfOrigin"

From urban_NAV600.dbo.[Urban-Brand GmbH$Item] as it with (Nolock)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] as st with (Nolock)
on st.[Item No_] = it.No_
left join urban_NAV600.dbo.[Urban-Brand GmbH$Item Unit of Measure] as itu with (Nolock)
on itu.[Item No_] = it.No_ and itu.Code = it.[Purch_ Unit of Measure]
left join urban_NAV600.dbo.[Urban-Brand GmbH$Default Dimension] as dd with (Nolock)
on dd.No_ = it.No_ and dd.[Dimension Code] = 'MARKE'
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$eBayFFItem] as ei with (Nolock)
on ei.[Item No_] = it.No_ 
Where 

/** Hier ist die Auswahl der Artikel **/ 
it.No_ in 
-- ('5054411219433','4001742443700','5707109500213','8592946055425')

(
Select  distinct sl.No_
from urban_NAV600.dbo.[Urban-Brand GmbH$eBayFFSalesLine] as sl with (NOLOCK)
Left join urban_NAV600.dbo.[Urban-Brand GmbH$eBayFFSalesHeader] as sh with (NOLOCK)
on sh.No_ = sl.[Document No_]
Where sl.[Document No_] in 
(select No_ from urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header] where [Document Type] = '11' and [Location Code] = 'WDB_FIEGE')
and sl.Type in ('2','15')
and sh.[Entry No_] = '1'
)
FOR XML PATH ('Item'), root('ItemList');