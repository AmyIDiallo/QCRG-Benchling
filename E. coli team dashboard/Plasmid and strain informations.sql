SELECT 
    a.expressed_protein as "Protein",
    a.id as "Plasmid ID",
    b.id as "Strain",
    a.resistance as "Resistance",
    a.tag as "Tag",
    a.cleavage_site as "Cleavage site",
    b.plasmid_prep as "WB result"
    
from qcrg.plasmid as a
left join (select id, constructs_expressed->>0 as constructs_expressed, plasmid_prep from qcrg.e_coli) as b on a.id = b.constructs_expressed
where a.expression_system = 'E' 
order by a.file_registry_id$ asc
