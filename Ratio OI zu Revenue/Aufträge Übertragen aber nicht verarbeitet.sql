/****** In Transfer aber nicht in eBayNavCSales ******/
SELECT count(ch.ExternalDocumentNo) as notProcessedInNav, esh.[Shop Code]--, sh.[External Document No_], ch.OrderDate
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as ch with (nolock)
  LEFT Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as esh with (nolock)
  on ch.ExternalDocumentNo = esh.[External Document No_]
  Where 
  esh.[External Document No_] IS NULL AND
  ch.OrderDate between '2014-04-01' and '2014-04-28'
  group by esh.[Shop Code]
  order by esh.[Shop Code]