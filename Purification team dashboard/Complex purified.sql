SELECT 
    id as "Complex prep ID",
    protein1_viral as "Viral protein",
    expressing_line as "Viral strain ID",
    protein2_host as "Host protein",
    expressing_line2 as "Host strain ID",
    CAST(created_at$ AS DATE) as "Prep date",
    concentration_mgml as "Concentration (mg/mL)",
    buffer_field as "Buffer"
    
from qcrg.purified_complex
order by created_at$ desc
