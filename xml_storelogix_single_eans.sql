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
 
it.No_ in ('4038685236809','4038685236816','4038685234584','4038685229832','4038685235437','4038685235451','4038685235413','4038685236366','4038685236373','4038685236359','4038685235550','4038685235574','4038685235536','4038685235635','4038685235925','4038685235970','4038685235987','4038685235994','4038685236007','4038685236021','4038685236083','4038685236137','4038685236151','4038685236168','4038685236175','4038685236182','4038685236199','4038685203368','4038685234546','4038685234515','4038685234522','4038685234539','4038685234102','4038685234119','4038685234126','4038685234133','4038685234140','4038685234164','4038685234171','4038685234188','4038685234157','4038685234195','4038685234201','4038685234218','4038685234461','4038685234478','4038685234485','4038685234492','4038685234607','4038685234614','4038685234508','4038685234553','4038685235161','4038685235154','4038685235178','4038685234959','4038685234966','4038685234973','4038685234980','4038685234997','4038685235000','4038685235017','4038685235024','4038685235031','4038685235048','4038685235055','4038685235062','4038685235079','4038685235086','4038685235093','4038685235109','4038685235185','4038685235192','4038685235208','4038685235215','4038685235222','4038685235239','4038685235246','4038685235253','4038685235260','4038685235277','4038685235284','4038685235291','4038685235307','4038685235314','4038685235321','4038685235338','4038685234621','4038685234638','4038685234645','4038685234669','4038685234676','4038685234683','4038685234690','4038685234706','4038685234713','4038685234720','4038685234737','4038685234744','4038685234751','4038685234768','4038685234775','4038685234782','4038685234836','4038685234843','4038685234850','4038685234867','4038685234874','4038685234881','4038685234898','4038685234904','4038685234911','4038685234928','4038685234935','4038685234942','4038685234454','4038685234225','4038685234232','4038685234249','4038685234256','4038685234270','4038685234287','4038685234294','4038685234263','4038685234300','4038685234591','4038685233877','4038685233884','4038685233891','4038685233907','4038685233914','4038685233921','4038685233938','4038685233945','4038685233952','4038685233969','4038685233976','4038685233983','4038685236854','4038685234331','4038685234348','4038685234355','4038685234362','4038685234379','4038685234386','4038685234393','4038685234409','4038685234416','4038685234423','4038685234430','4038685234447','7610100062117','7610100062162','7613032274825','7613032296100','7613032391331','7613033621482','7613034107534','7613034266699','7613034350213','7613034350435','7613034350510','7613034350633','7613034391513','7613034622105','7613034907820','7613035032422','7613035033344','7613035033603','7613035033627','7613035034679','7613035034693','7613035074958','7613035149182','7613035149342','7613035149366','7613035155596','7613035155626','7613035188822','7613035269538','7613035269750','7613035269781','7613035269859','7613035269873','7613035269897','7613035273504','7613035313286','7613035314979','7613035334298','7613035348981','7613035575448','8717405009522','4005500083672','8058664058242','4035769035006-XX','9120012135550','9120012135567','9120012136069','9120012137219','9120061091616','7613032274825','56248459223','8717903880678','8888000006145','7611471003952','7611471004010','7611471004027','7611471004034','7611471004058','8717903880678')
FOR XML PATH ('ARTICLE_INFO'), ROOT ('ARTICLE_IMPORT')