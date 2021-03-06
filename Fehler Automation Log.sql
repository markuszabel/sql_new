/****** Script for SelectTopNRows command from SSMS  ******/
with lasterror as (
SELECT alog.[Action], act.Description, alog.Error,max(alog.[Action conduct at]) as MaxDate
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayAutomationLog] as alog with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayAutomationAction] as act with (NOLOCK)
  on act.Code = alog.Action
  Where alog.Action  in (Select distinct Action from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayAutomation] where Cleared = 0)
	Group by alog.Action, act.Description, alog.Error),
comment as (
Select
 alog.[Action], alog.Error,alog.[Action conduct at],alog.Comment
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayAutomationLog] as alog with (NOLOCK)
)
  

Select lasterror.Action, lasterror.Description, lasterror.Error, lasterror.MaxDate, comment.Comment
from lasterror
Left Join comment 
on lasterror.Action = comment.Action and lasterror.Error = comment.Error and lasterror.MaxDate = comment.[Action conduct at]
order by lasterror.Action, lasterror.Error desc