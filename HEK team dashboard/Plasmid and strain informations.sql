SELECT 
    a.id as "Plasmid ID",
    a.expressed_protein as "Protein",
    b.id as "Strain ID",
    a.resistance as "Resistance",
    a.tag as "Tag",
    a.cleavage_site as "Cleavage site"

from qcrg.plasmid as a
left join (select id, constructs_expressed->>0 as constructs_expressed from qcrg.mammalian_cell_line) as b on a.id = b.constructs_expressed
where expression_system = 'H'
order by file_registry_id$ asc
