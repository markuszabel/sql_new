
SELECT distinct  cu.[E-Mail], cu.Name, cl.[External Document No_], 
	CAST( cl.[Posting Date] as Date) as Versanddatum, cast(dcl.[Amount (LCY)] as float), sil.No_, sil.Description, cast(sil.Quantity as INT), cast(sil.[Unit Price] as float)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Customer] as cu with (NOLOCK)
  on cu.No_ = cl.[Customer No_]
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] as dcl with (NOLOCK)
  on dcl.[Cust_ Ledger Entry No_] = cl.[Entry No_]
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sil with (NOLOCK)
  on cl.[Document No_] = sil.[Document No_]
  Where cl.[External Document No_] in 
  ( 
  Select cl.[External Document No_]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl with (NOLOCK)
  Where cl.[Document No_]  = 'ZVK-1257'
)

AND sil.No_ <> ''
AND cl.[Document Type] = 2 and dcl.[Entry Type] = 1 and cl.[External Document No_] like '1%'
order by cl.[External Document No_] asc

  