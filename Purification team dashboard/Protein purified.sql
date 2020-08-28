SELECT 
    CAST(a.created_at$ AS DATE) as "Prep date",
    a.id as "Protein prep ID",
    a.protein as "Protein",
    a.expressing_line as "Strain ID",
    a.id as "Notebook",
    a.concentration_mgml as "Concentration (mg/mL)",
    a.buffer as "Buffer",
    b.name
    
from qcrg.purified_protein as a
inner join (select id, name from qcrg.user) as b on a.creator_id$ = b.id
order by created_at$ desc
