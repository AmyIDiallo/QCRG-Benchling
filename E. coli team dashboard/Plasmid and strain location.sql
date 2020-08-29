SELECT 
    a.expressed_protein as "Protein",
    a.id as "Plasmid ID",
    b.id as "Strain",
    e.box_id as "Box",
    concat((e.row_index+1),'_',(e.column_index+1)) as "Row_Column"
    
from qcrg.plasmid as a
left join (select id, constructs_expressed->>0 as constructs_expressed, plasmid_prep from qcrg.e_coli) as b on a.id = b.constructs_expressed
left join (select id, plasmid from qcrg.plasmid_prep) as c on a.id = c.plasmid
left join (select entity_id, container_id from qcrg.container_content) as d on c.id = d.entity_id
left join (select id, row_index, column_index, box_id from qcrg.container) as e on d.container_id = e.id
where a.expression_system = 'E' and (e.box_id = 'box_DoNyNYur' or e.box_id = 'box_wIJMHHNj' or e.box_id = 'box_5AQDXlaT')
order by a.file_registry_id$ asc
