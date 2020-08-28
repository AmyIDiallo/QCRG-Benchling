SELECT 
    a.id as "Protein",
    count(distinct(case when b.expression_system = 'E' then b.id end)) as "E.coli Plasmid",
    count(distinct(c.id)) as "Verified E.coli strain",
    count(distinct(case when b.expression_system = 'H' then b.id end)) as "HEK Plasmid",
    count(distinct(d.file_registry_id$)) as "Nbr of prep",
    f.protein1_viral as "Viral protein",
    count(distinct(f.id)) as "Nbr complex prep",
    count(distinct(e.id)) as "Crystal tray",
    count(distinct(g.id)) as "Beam data",
    count(distinct(h.id)) as "Nbr grids",
    count(distinct(i.id))+count(distinct(j.id)) as "EM data collection"
    
FROM qcrg.protein as a
left join (select id, expression_system, expressed_protein->>0 as expressed_protein from qcrg.plasmid) as b on a.id = b.expressed_protein
left join (select id, constructs_expressed->>0 as constructs_expressed from qcrg.e_coli) as c on b.id = c.constructs_expressed
left join (select protein, file_registry_id$, id from qcrg.purified_protein) as d on a.id = d.protein
left join (select protein1_viral, protein2_host, id from qcrg.purified_complex) as f on a.id = f.protein2_host
left join (select purified_protein_preps->>0 as purified_protein_preps, id, crystal_plate_id from qcrg.crystal_tray) as e on d.id = e.purified_protein_preps
left join (select id, tray from qcrg.beamtime) as g on e.crystal_plate_id = g.tray
left join (select id, purified_protein_prep, purified_complex from qcrg.grid_cryoem) as h on d.id = h.purified_protein_prep or f.id = h.purified_complex
left join (select id, grid from qcrg.cryoem_collection_requirefields3) as i on h.id = i.grid
left join (select id, entity from qcrg.cryoem_collection_required) as j on h.id = j.entity 
where b.expression_system ='E' or b.expression_system ='H'
group by a.id, f.protein1_viral
order by count(distinct(g.id)) desc, count(distinct(e.id)) desc, coalesce(count(i.id),count(j.id)) desc, count(distinct(h.id)) desc, count(distinct(d.id)) desc, count(distinct(f.id)) desc, count(distinct(c.id)) desc
