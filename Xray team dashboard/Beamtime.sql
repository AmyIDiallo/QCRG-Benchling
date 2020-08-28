SELECT 
    CAST(a.created_at$ AS DATE) as "Date",
    c.protein as "Protein",
    c.id as "Tray",
    a.entry_id$ as "Notebook",
    b.name as "User",
    a.data as "Data"

FROM qcrg.beamtime as a
left join user$raw as b on a.creator_id$ = b.id
left join qcrg.crystal_tray as c on a.tray = c.crystal_plate_id
order by a.date desc
