SELECT 
      rl.[Location Code]
      ,rl.[Order No_]
      ,rl.[Posting Date]
      ,rl.[Quantity (Base)]
      --,rh.[DHL Confirmation Date]
      , rh.*
      FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Rcpt_ Line] as rl
       join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Rcpt_ Header] as rh
       on rl.[Document No_] = rh.No_
      WHERE rl.[Location Code] = 'BER_FIEGE'
      AND rl.[Posting Date] > '2013-07-14'
      AND rh.No_ = 'EKL-10-78713'
      --GROUP BY rl.[Location Code], rl.[Order No_],rl.[Posting Date]