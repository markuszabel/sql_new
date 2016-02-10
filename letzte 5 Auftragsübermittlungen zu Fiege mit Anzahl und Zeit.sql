Select count(ffs.No_) as AnzahlAufträge, ffs.[File No_], cast( pro.[Timestamp Upload_Download] as smalldatetime) as UploadZeit
From [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as ffs with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFProtocol] as pro on ffs.[File No_] = pro.[File No_] 

Where ffs.[File No_] in
(
Select TOP 50 [File No_]
From [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFProtocol]
Where left([File No_],3) in (/*'A1',*/'A60'/*,'A6'*/)
Order by [Timestamp Upload_Download] desc)

Group by ffs.[File No_], pro.[Timestamp Upload_Download]
order by pro.[Timestamp Upload_Download] desc