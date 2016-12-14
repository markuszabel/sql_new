Select prl.[Order No_],prl.No_, prh.No_ as VendorShipNo,cast(prl.[Posting Date] as Date) as PostDate, cast(prh.[Order Date] as Date) as OrderDate,
prh.[Buy-from Vendor No_],prl.[Line No_],prl.[Location Code],
case prl.[Unit of Measure Code]
	when 'ST' then 'PCS'
	else prl.[Unit of Measure Code]
end as Unit_Of_Measure_Code,
cast(prl.Quantity as INT) as Quantity, cast(prl.[Quantity Invoiced] as INT) as Qty_Invoiced, 
cast((prl.Quantity- prl.[Quantity Invoiced]) as INT) as Qty_to_Deliverd,
cast((prl.Quantity- prl.[Quantity Invoiced])*prl.[Qty_ per Unit of Measure] as INT) as Qty_to_Deliverd_Baseunit
From urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Rcpt_ Line] as prl with (NOLOCK)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Rcpt_ Header] as prh with (NOLOCK)
on prl.[Document No_] = prh.No_
Where (prl.Quantity- prl.[Quantity Invoiced]) <> 0 --and prl.No_ = '4055179072774'
and prl.[Location Code] NOT IN ('GROUP7') and prh.[VAT Bus_ Posting Group] <> 'INTERN'