
SELECT YEAR( [Posting Date]) as Jahr, sum(Amount)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$G_L Entry] as gl with (NOLOCK)
  Where [G_L Account No_] = '6930' --AND [Bal_ Account No_] NOT IN ('1461','1464') and [Document No_] NOT LIKE 'F%' 
  and [Document No_] NOT in ('2011','2012-JA','2013-JA') and YEAR( [Posting Date]) < 2014
  Group by YEAR( [Posting Date])
  order by YEAR( [Posting Date]) asc
  
  
SELECT  left([Document No_],4), YEAR( [Posting Date]),sum(Amount)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$G_L Entry] as gl with (NOLOCK)
  Where [G_L Account No_] = '6930' --AND [Bal_ Account No_] NOT IN ('1461','1464') and [Document No_] NOT LIKE 'F%'
  Group by left([Document No_],4),YEAR( [Posting Date])
  Order by YEAR( [Posting Date]) , sum(Amount) desc