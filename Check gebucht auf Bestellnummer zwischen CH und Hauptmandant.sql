with ub_rec as 
(Select ub_rl.No_, sum(ub_rl.Quantity) as ubMenge
From [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Rcpt_ Line] as ub_rl with (NOLOCK)
Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Rcpt_ Header] as ub_rh with (NOLOCK)
on ub_rl.[Document No_] = ub_rh.No_
Where ub_rl.[Location Code] = 'USTER' and  ub_rh.[Buy-from Vendor No_] <> '70801'
group by ub_rl.No_),
 
log_rec as(
Select log_rl.No_, sum(log_rl.Quantity) as logMenge
From [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Purch_ Rcpt_ Line] as log_rl with (NOLOCK)
Join [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Purch_ Rcpt_ Header] as log_rh with (NOLOCK)
on log_rl.[Document No_] = log_rh.No_
group by log_rl.No_),
ub_best as
(Select ub_il.[Item No_], sum(ub_il.Quantity) as ub_Quan
from [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as ub_il with (NOLOCK)
Where ub_il.[Location Code] = 'USTER'
Group by ub_il.[Item No_]
),
log_best as
(Select log_il.[Item No_], sum(log_il.Quantity) as log_Quan
from [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as log_il with (NOLOCK)
Group by log_il.[Item No_]
)

Select it.No_,
cast(isnull(log_rec.logMenge,0) as int) as LogRecQuan, 
cast(isnull(ub_rec.ubMenge,0) as int) as UbRecQuan, 
cast(isnull(log_best.log_Quan,0) as int) as LogBestQuan,
cast(isnull(ub_best.ub_Quan,0) as int) as UbBestQuan

from [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item] as it
left join ub_rec on it.No_ = ub_rec.No_
left join log_rec on it.No_ = log_rec.No_
left join ub_best on it.No_ = ub_best.[Item No_]
left join log_best on it.No_ = log_best.[Item No_]
Where isnull(log_rec.logMenge,0) <> isnull(ub_rec.ubMenge,0) or isnull(ub_best.ub_Quan,0) <> isnull(log_best.log_Quan,0)