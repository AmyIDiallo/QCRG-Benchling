SELECT 
    count(a.id) as "Total plasmid",
    count(case when a.expression_system = 'E' then 1 end) as "E.coli plasmid",
    count(b.id) as "E.coli plasmid prep",
    count(case when a.expression_system = 'H' then 1 end) as "HEK plasmid",
    count(c.id) as "HEK plasmid prep"
FROM qcrg.plasmid as a
left join (select id, plasmid from qcrg.plasmid_prep) as b on a.id = b.plasmid
left join (select id, plasmid from qcrg.hek_plasmid_prep) as c on a.id = c.plasmid
