SELECT 
    distinct count(*) OVER (PARTITION by a.creator_id, type),
    COALESCE(c.name, 'ts_gk8SHbFg') as "Register",
    b.name as "User"
    
FROM qcrg.registry_entity$raw as a
left join user$raw as b on a.creator_id = b.id
left join qcrg.schema as c on c.id = a.schema_id
left JOIN project$raw d on d.id = a.source_id
where not c.name = 'HEK Pellet' and not c.name = 'Crystal'
ORDER BY b.name ASC

/*View as a 'Bar chart' with 'X axis' = User, 'Y axis' = Count, 'Series' =Register*/
