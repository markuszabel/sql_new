Select count(No_), cast( [Posting Date] as Date), [Location Code]
from urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Rcpt_ Header] as ph with (NOLOCK)
Where [Posting Date] >= '2015-05-01'
group by cast( [Posting Date] as Date), [Location Code]
order by cast( [Posting Date] as Date)

Select count( timestamp),/*[Document No_],No_,*/ cast( [Posting Date] as Date), [Location Code]--, Quantity
from urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Rcpt_ Line] with (NOLOCK)
Where [Posting Date] >= '2015-05-01' 
and Quantity <> 0
group by cast( [Posting Date] as Date), [Location Code]
order by cast( [Posting Date] as Date)