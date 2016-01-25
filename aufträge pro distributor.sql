select distinct sh.[Ship-to Address] as "Address"
from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
order by sh.[Ship-to Address] desc;

select distinct top 20 sh.[Ship-to Address] as "Address", sh.[Ship-to City], COUNT(sh.No_) as "Shipments"
from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
where MONTH(sh.[Shipment Date]) >= MONTH (Getdate())-1
group by sh.[Ship-to City],[Ship-to Address],sh.[Ship-to Address 2],sh.[Ship-to Code]
order by COUNT(sh.No_) desc;