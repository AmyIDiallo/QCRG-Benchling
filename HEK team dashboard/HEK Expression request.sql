SELECT 
    id as "Request",
    date_needed as "Date request",
    protein as "Protein",
    plasmid as "Plasmid ID",
    status$ as "Status"
    
from qcrg.expression
where source_id = 'src_Ba3Twg2u'
order by date_needed desc, status$ asc
