SELECT 
    distinct count(*) OVER (PARTITION by c.id, b.entity_id, a.box_id ) as "Pellet available",
    c.date_needed as "Request date",
    c.id as "Request",
    c.name as "Protein",
    c.strain as "Strain"

FROM qcrg.container as a
inner JOIN qcrg.container_content as b on a.id = b.container_id
inner JOIN qcrg.e_coli_purification as c on b.entity_id = c.strain
where (a.box_id ='box_SRrtywWj' or a.box_id ='box_t0qjQclb' or a.box_id ='box_A2PXQBWQ' or a.box_id ='box_yNIuQMgD')  and not c.status$ ='COMPLETED'
order by "Request date" desc
