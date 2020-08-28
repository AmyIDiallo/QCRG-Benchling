SELECT 
    coalesce(CAST(c.created_at$ AS DATE),CAST(d.created_at$ AS DATE)) as "Collection date",
    b.entity_id as "Grid ID",
    coalesce(e.purified_protein_prep, e.purified_complex) as "Protein prep ID",
    coalesce(c.entry_id$, d.entry_id$) as "Notebook"
   
FROM qcrg.container as a
inner join (select entity_id, container_id from qcrg.container_content) as b on b.container_id = a.id
left join (select created_at$, entry_id$, grid from qcrg.cryoem_collection_requirefields3) as c on c.grid = b.entity_id
left join (select created_at$, entry_id$, entity from qcrg.cryoem_collection_required) as d on d.entity = b.entity_id
inner join (select id, purified_protein_prep, purified_complex from qcrg.grid_cryoEM) as e on e.id = b.entity_id
where not coalesce(c.entry_id$, d.entry_id$)='null'
order by coalesce(CAST(c.created_at$ AS DATE),CAST(d.created_at$ AS DATE)) desc
