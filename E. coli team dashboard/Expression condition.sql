SELECT 
    id as "Strain",
    constructs_expressed as "Plasmid",
    protein_expression_verified as "Expression statut",
    resistance as "Resistance",
    temperature_expression as "Temperature",
    soluble as "Soluble",
    time_of_expression as "Time",
    iptg_mm as "IPTG"
    
from qcrg.e_coli
where qcrg.e_coli.protein_expression_verified is not null
order by protein_expression_verified desc, temperature_expression, time_of_expression asc
