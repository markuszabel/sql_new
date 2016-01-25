/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 100
	   [loginame]
      ,[block_orig_loginame] 
      ,[timestamp]
      ,[db]
      ,[table_name]
      ,[index_name]
      ,[start_time]
      ,[waittime]
      ,[lastwaittype]
      ,[spid]
      ,[hostname]
      ,[program_name]
      ,[cmd]
      ,[query_plan]
      ,[status]
      ,[cpu]
      ,[lock_timeout]
      ,[blocked by]
      ,[loginame 2]
      ,[hostname 2]
      ,[program_name 2]
      ,[cmd 2]
      ,[query_plan 2]
      ,[status 2]
      ,[cpu 2]
      ,[block_orig_id]
      
  FROM [urban_NAV600].[dbo].[ssi_BlockCheck_Tab] (nolock)
where day([timestamp]) = DAY(getdate())
and MONTH([timestamp]) = MONTH(getdate())
and YEAR([timestamp]) = YEAR(GETDATE())
and waitresource <> 'NULL'

order by [timestamp] desc