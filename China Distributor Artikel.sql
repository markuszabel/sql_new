select Month(sh.[Posting Date]) as Monat, sl.No_, cast(sum(sl.Quantity) as INT) as Menge, sl.Description, sl.[Description 2]

from dbo.[Urban-Brand GmbH$Sales Invoice Header] as sh
Join dbo.[Urban-Brand GmbH$Sales Invoice Line] as sl
on sl.[Document No_] = sh.No_
where [Ship-to City] = 'Bietigheim' and [Ship-to Address] like 'Langgewann%' AND sl.[Posting Group] = 'HANDEL' and Month(sh.[Posting Date]) between 10 and 11
Group by Month(sh.[Posting Date]), sl.No_, sl.Description, sl.[Description 2]
order by Month(sh.[Posting Date]), sl.No_
