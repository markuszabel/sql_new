/*Retourenauswertung Sperrlager*/
with ub_ret as 
(SELECT [Item No_],[Location Code],CASt(SUM(Quantity) as Int) as ubMenge
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as ub_rl (nolock)
where [Document Type] = 3 and [Location Code] in ('USTER','USTER_RMA')
group by [Item No_],[Location Code]),
 
log_ret as(
SELECT [Item No_],[Location Code], cast([Posting Date] as DATE) as logDate,CASt(SUM(Quantity) as Int) as logMenge
FROM [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as ub_rl (nolock)
where [Document Type] = 3 
group by [Item No_],[Location Code],[Posting Date])

Select *
FROM ub_ret
Left join log_ret on ub_ret.[Item No_] = log_ret.[Item No_]
order by ub_ret.[Item No_]
