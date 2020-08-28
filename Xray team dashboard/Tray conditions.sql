SELECT 
    a.id as "Barcode",
    a.date as "Date",
    a.protein as "Protein",
    a.purified_protein_preps as "Protein prep ID",
    a.screen "Screen",
    a.concentration_mgmll as "Concentration (mg/mL)",
    a.temperature as "Temperature",
    b.name as "User"
    
from qcrg.crystal_tray as a
left join user$raw as b on a.creator_id$ = b.id
order by a.date desc
