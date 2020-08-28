SELECT 
    distinct count(*) OVER (PARTITION by b.entity_id, a.box_id) as "Pellets available",
    CAST(a.created_at AS DATE) as "Date",
    c.id as "Request",
    b.entity_id as "Sample",
    a.box_id as "Box"
    
FROM qcrg.container as a
inner JOIN qcrg.container_content as b on a.id = b.container_id
left join (select id, name->>0 as name from qcrg.hek_purification3) as c on b.entity_id = c.name
where a.box_id ='box_IvgBFBBd' or a.box_id ='box_twiFRcRy' or a.box_id ='box_PHt3jcZW' or a.box_id ='box_08ccIeZM' or a.box_id ='box_YpCcjy1k' or a.box_id ='box_qvYsRJis'
order by "Date" desc
