SELECT 
    a.protein_name as "Name",
    a.id as "Plasmid ID",
    a.resistance as "Resistance",
    a.tag as "Tag",
    name$
    
from qcrg.plasmid as a
left join (select constructs_expressed->>0 as constructs_expressed from qcrg.e_coli) as b on a.id = b.constructs_expressed
where a.expression_system = 'E' and b.constructs_expressed isnull
order by a.file_registry_id$ asc
