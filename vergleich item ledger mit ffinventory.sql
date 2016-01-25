/****** Vergleich Item Ledger mit FFInventory *****/

with fiege as (SELECT [Item No_], [Qty_ (Phys_ Inventory)]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Fulfillment Inventory ]
  Where [Reporting Date] = '2015-01-30'),
  windeln as (
 Select  [Item No_], sum(Quantity) as Menge
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]
  Where [Location Code] = 'BER_FIEGE' and [Posting Date] <= '2015-02-01'
  group by [Item No_])
  
  
  select windeln.[Item No_], windeln.Menge, fiege.[Qty_ (Phys_ Inventory)]--, ((windeln.Menge - fiege.[Qty_ (Phys_ Inventory)])*-1) as Diff
  from windeln
  left join fiege on fiege.[Item No_] = windeln.[Item No_]
  --Where fiege.[Qty_ (Phys_ Inventory)] is NULL
  Where (windeln.Menge - fiege.[Qty_ (Phys_ Inventory)]) <> 0
  