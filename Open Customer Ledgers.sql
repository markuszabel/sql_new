/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [Customer No_]
      ,[Posting Date]
      ,[Sales (LCY)]
      ,[Payment Method Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry]
    Where [Open] = '1'                                                                                                                                                                                                                                                              