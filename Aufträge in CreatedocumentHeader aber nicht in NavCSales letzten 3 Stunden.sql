Select count(cdh.ExternalDocumentNo) as ErhalteneAufträge3Std, cdh.[Shop Code]
From urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
Where OrderDate > '2015-03-19' and cdh.[Order Created At] > dateadd(hour,-3,getdate()) 
group by cdh.[Shop Code]



Select count(cdh.ExternalDocumentNo) as NichtVerarbeiteteAufträge3Std, cdh.[Shop Code]
From urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
Left Outer Join urban_NAV600.dbo.[Urban-Brand GmbH$eBayNavCSalesHeader] as navc with (NOLOCK)
on cdh.ExternalDocumentNo = navc.[External Document No_]
Where OrderDate > '2015-03-19' and cdh.[Order Created At] > dateadd(hour,-3,getdate()) and navc.[External Document No_] Is NULL
group by cdh.[Shop Code]