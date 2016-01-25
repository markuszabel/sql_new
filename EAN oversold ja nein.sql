/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ean]
      ,[class]
      ,[within_category_class]
      ,[old_class]
      ,[oversold_allowed]
      ,[Mittlerer_Wochenbedarf_letzte_12_Wochen]
  FROM [Exchange].[dbo].[Oversold]
  Where ean = '4010221044413'