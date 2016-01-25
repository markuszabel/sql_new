/****** Umsätze pro Lagerort und Währung ******/

SELECT  
cast([Posting Date] as DATE) as Versanddatum,
sum (case when 
[User ID] = 'BRAND59_URBAN-BRAND_' then 1 else 0 end)
 as 'BRAND59_URBAN-BRAND_',
 sum (case when 
[User ID] = 'BRAND60_URBAN-BRAND_' then 1 else 0 end)
 as 'BRAND60_URBAN-BRAND_',
sum (case when 
[User ID] = 'BRAND74_URBAN-BRAND_' then 1 else 0 end)
 as 'BRAND74_URBAN-BRAND_',
sum (case when 
[User ID] = 'BRAND75_URBAN-BRAND_' then 1 else 0 end)
 as 'BRAND75_URBAN-BRAND_'
 
 --,count ( No_)

  FROM [urban_NAV600].[dbo].[Windeln CH Logistikmandant$Sales Shipment Header]
  Where [Posting Date] > '2015-04-01'
  group by /*[User ID],*/cast([Posting Date] as DATE)
  order by cast([Posting Date] as DATE)