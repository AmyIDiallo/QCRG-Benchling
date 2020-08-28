SELECT 
    CAST(created_at$ AS DATE) as "Prep date",
    id as "Protein prep ID",
    protein as "Protein",
    expressing_line as "Strain ID",
    concentration_mgml as "Concentration (mg/mL)",
    buffer as "Buffer"
    
from qcrg.purified_protein
order by created_at$ desc
