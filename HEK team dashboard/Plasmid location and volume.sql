SELECT 
    a.expressed_protein as "Protein",
    a.id as "Plasmid ID",
    d.volume_si*1000 as "Volume left (mL)",
    d.box_id as "Box ID",
    concat((d.row_index+1),'_',(d.column_index+1)) as "Row_Column"
    
from qcrg.plasmid as a
inner join (select id, hek_plasmid_prep, plasmid from qcrg.hek_plasmid_prep) as b on a.id = b.plasmid
left join (select entity_id, container_id from qcrg.container_content) as c on b.id = c.entity_id
left join (select id, box_id, volume_si, row_index, column_index from  qcrg.container) as d on c.container_id = d.id
order by d.box_id asc, d.row_index asc, d.column_index asc
