
SELECT esl.No_, sum(esl.Quantity), esh.[Shop Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesLine] as esl with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as esh with (NOLOCK)
  on esl.[Document No_] = esh.No_
  Where esh.Status = 0
  Group by esl.No_,esh.[Shop Code]