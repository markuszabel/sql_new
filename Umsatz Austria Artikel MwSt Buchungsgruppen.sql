/****** Script for SelectTopNRows command from SSMS  ******/
SELECT sum([Amount Including VAT]), [Gen_ Prod_ Posting Group]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] with (NOLOCK)
  Where [Posting Group] = 'HANDEL' and 
  [Posting Date] between '2013-10-01' and '2013-10-31' and
 [Gen_ Bus_ Posting Group] = 'AT_NAT'
 group by [Gen_ Prod_ Posting Group]