SELECT 
    CAST(a.created_at$ AS DATE) as "Date",
    c.protein as "Protein",
    c.id as "Tray",
    count(a.data) as "Crystal tested",
    a.entry_id$ as "Notebook",
    b.name as "User"

FROM qcrg.beamtime as a
left join (select name, id from user$raw) as b on a.creator_id$ = b.id
left join (select protein, id, crystal_plate_id from qcrg.crystal_tray) as c on a.tray = c.crystal_plate_id
group by CAST(a.created_at$ AS DATE), c.protein, c.id,a.entry_id$, b.name
order by CAST(a.created_at$ AS DATE) desc
