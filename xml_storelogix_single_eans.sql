DECLARE @lang varchar(2) = 'de'; 
DECLARE @status varchar(1) = 'N';
Select 
@status "STATUS",
it.No_ "ARTICLE_NR", 
st.[Vendor Item No_] "MANUFACTOR_NR",
dd.[Dimension Value Code] "BRAND",
it.[Alternative Item No_]  "PICTURE_PATH",
Case it.[BBD Obligation] 
	when 1 then 'Y'
	when 0 then 'N'   
end 	"BBD_TYPE",
it.[Base Unit of Measure] "ARTICLE_UNIT/UNIT_TYPE",
it.No_ "ARTICLE_UNIT/EAN13",
cast(itu.Length as INT) "ARTICLE_UNIT/UNIT_LENGTH",
cast(itu.Width as INT) "ARTICLE_UNIT/UNIT_WIDTH",
cast(itu.Height as INT) "ARTICLE_UNIT/UNIT_HEIGH",
cast(it.[Net Weight]*1000 as INT) "ARTICLE_UNIT/UNIT_WEIGHT_NET",
cast(it.[Gross Weight]*1000 as INT) "ARTICLE_UNIT/UNIT_WEIGHT_GROSS",
it.[Alternative Item No_]    "ARTICLE_UNIT/UNIT_SIZE",
it.[Alternative Item No_]    "ARTICLE_UNIT/UNIT_COLOR",
Case it.Versandart
	when '1' then 'Y'
	when '2' then 'Y'
	when '3' then 'Y'
	else 'N'
end "ARTICLE_UNIT/UNIT_READY_TO_SEND",
Case it.Versandart
	when '1' then 'Y'
	when '2' then 'Y'
	when '3' then 'Y'
	else 'N'
end "ARTICLE_UNIT/BULKY",
@lang "ARTICLE_TEXT/LANGUAGE",
it.Description + ' ' + it.[Description 2] "ARTICLE_TEXT/ARTICLE_DESCRIPTION" 

From urban_NAV600.dbo.[Urban-Brand GmbH$Item] as it with (Nolock)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] as st with (Nolock)
on st.[Item No_] = it.No_
left join urban_NAV600.dbo.[Urban-Brand GmbH$Item Unit of Measure] as itu with (Nolock)
on itu.[Item No_] = it.No_ and itu.Code = 'ST'
left join urban_NAV600.dbo.[Urban-Brand GmbH$Default Dimension] as dd with (Nolock)
on dd.No_ = it.No_ and dd.[Dimension Code] = 'MARKE'
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$eBayFFItem] as ei with (Nolock)
on ei.[Item No_] = it.No_ 
Where 
 
it.No_ in ('8717903880678','4038685236274','4038685236267','4038685236045','4038685236069','4038685236052','4038685236090','4038685236120')
FOR XML PATH ('ARTICLE_INFO'), ROOT ('ARTICLE_IMPORT')