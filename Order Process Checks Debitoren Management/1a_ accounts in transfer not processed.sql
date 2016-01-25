 SELECT 
 sh.Email, sh.[Entry No_], sh.[Account No], sh.[Created At]
 
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Create_UpdateAccount] as sh with (NOLOCK)
  LEFT Outer JOIN Urban_NAV600.dbo.[Urban-Brand GmbH$AccountResponse] AS sr ON sr.[Entry No_] = sh.[Entry No_]
  Where  sr.[Entry No_] IS NULL
  order by sh.Email