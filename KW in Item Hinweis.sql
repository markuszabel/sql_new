select No_ as "Artikel No.", Klasse, Description, [Description 2], [Attribute 5] 
from dbo.[Urban-Brand GmbH$Item]
where [Attribute 5] like '%kw%' or [Attribute 5] like '%KW%';