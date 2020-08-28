SELECT 
    CAST(created_at$ AS DATE) as "Prep date",
    id as "FSEC ID",
    protein_aa as "Protein",
    fsec_verified as "FSEC status",
    plasmid_id as "Host plasmid",
    viral_plasmid as "Viral plasmid"
    
From qcrg.fsec
order by created_at$ asc
