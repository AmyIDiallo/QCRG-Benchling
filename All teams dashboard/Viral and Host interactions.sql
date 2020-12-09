SELECT 
   a.id as "Viral protein",
   b.id as "Host protein",
   COALESCE(c.id,'') as "Host plasmid",
   COALESCE(d.id,'') as "Strain",
   COALESCE(e.interaction,'') as "Interaction validated"
   
From qcrg.protein as a
inner join (select id, viral_protein ->>0 as viral_protein, name$ from qcrg.protein) as b on a.id = b.viral_protein
left join (select id, expressed_protein ->>0 as expressed_protein from qcrg.plasmid) as c on b.id = c.expressed_protein
left join (select id, constructs_expressed ->>0 as constructs_expressed from qcrg.e_coli) as d on c.id = d.constructs_expressed
left join (select strainhost, interaction from qcrg.ecoli_pull_down_assay) as e on d.id = e.strainhost
where a.covid_or_host = 'COVID-19'
order by a.name$, b.name$
