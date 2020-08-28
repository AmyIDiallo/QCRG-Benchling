SELECT 
    CAST(c.created_at$ AS DATE) as "Freezing date",
    c.id as "Grid ID",
    c.purified_protein_prep as "Protein prep ID",
    a.box_id as "Grid box ID",
    concat((a.row_index+1),'_',(a.column_index+1)) as "Row_Column"

FROM qcrg.container as a
inner join (select container_id, entity_id from qcrg.container_content) as b on b.container_id = a.id
inner join (select created_at$, id, purified_protein_prep, purified_complex from qcrg.grid_cryoEM) as c on c.id=b.entity_id
where a.schema_id ='consch_tRq18kii' and c.purified_complex is null
order by c.created_at$ desc
