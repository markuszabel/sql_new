/*
Query to determine OTRS Tickets in the Queues
- Retouren
- Warenausgang 
- Wareneingang

with Status
- Warten auf Lager
- Lager Intern

Create Age Groups
*/

select	q.name
		, ts.name
		, t.tn
		, u.full_name
		, t.change_time
		, t.create_time
		, t.title
		, case 
			when t.[Days since last change] <= 2 then '2 >= x'
			when t.[Days since last change] <= 3 then '2 < x <= 3'
			when t.[Days since last change] <= 4 then '3 < x <= 4'
			when t.[Days since last change] > 4 then '4 <= x'
		end as Altersgruppe
		
from OTRS_Staging.dbo.OTRS_ticket t

	join OTRS_Staging.dbo.OTRS_queue q
		on t.queue_id = q.id

	join OTRS_Staging.dbo.OTRS_ticket_state ts
		on ts.id = t.ticket_state_id

	join OTRS_Staging.dbo.OTRS_users u
		on t.change_by = u.id

where t.queue_id in (18, 22, 23) -- Retouren, Warenausgang, Wareneingang
	--and t.[Days since last change] > 4 -- 48 Std war vereinbarung
	and t.ticket_state_id in (11, 12) -- Lager Intern, Warten auf Lager // 1, 4, (new and open)

order by q.name asc, t.change_time asc